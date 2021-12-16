package com.ch.ch09.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch09.model.Board;
import com.ch.ch09.service.BoardService;
import com.ch.ch09.service.PageBean;
@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	@RequestMapping("insertForm")
	public String insertForm(int num, String pageNum, Model model) {
		// ref 답변글끼리 뭉칠 때, re_level 들여쓰기, re_step 답변글 순서
		int ref = 0, re_level = 0, re_step = 0;
		if (num != 0) {  // 답변글
			Board board = bs.select(num);
			ref = board.getRef();
			re_step = board.getRe_step();
			re_level = board.getRe_level();
		}
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("ref", ref);
		model.addAttribute("re_level", re_level);
		model.addAttribute("re_step", re_step);
		return "insertForm";
	}
	@RequestMapping("insert")
	public String insert(Board board, String pageNum, Model model, 
			HttpServletRequest request) {
		// ip를 추적할 필요가 있을 때, 비회원 게시판
		board.setIp(request.getRemoteAddr());
		int number = bs.maxNum(); // 새 게시글 번호 생성
		if (board.getNum() != 0) { // 답변글
			// 글을 일고 ref가 같고 re_step이 읽은 글의 re_step보다 크면 그글의 re_step + 1
			bs.updateStep(board);
			// re_step과 re_level은 읽은 값 더하기 1
			board.setRe_level(board.getRe_level() + 1);
			board.setRe_step(board.getRe_step() + 1);
		} else board.setRef(number); // 답변글이 아닐 때는 num과 ref는 둘 다 number
		board.setNum(number);
		int result = bs.insert(board);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		return "insert";
	}
	@RequestMapping("insertBoard")
	public String insertBoard(HttpServletRequest request) {
		String ip = request.getRemoteAddr();
		for (int i =0; i < 456; i++) {
			Board board = new Board();
			board.setContent("날씨좋다 "+i);
			board.setEmail("k"+i+"@k.com");
			board.setIp(ip);
			board.setPassword("1");
			board.setSubject("허걱"+i);
			board.setWriter("보검"+i);
			bs.insert(board);
		}
		return "insertBoard";
	}
	@RequestMapping("view")
	public String view(Board board, String pageNum, Model model) {
		bs.updateReadcount(board.getNum());      // 조회수 증가
		Board board2 = bs.select(board.getNum()); // 조회
		model.addAttribute("pageNum", pageNum);		
		board2.setSearch(board.getSearch());
		board2.setKeyword(board.getKeyword());
		model.addAttribute("board", board2);
		return "view";
	}
	@RequestMapping("updateForm")
	public String updateForm(int num, String pageNum, Model model) {
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		return "updateForm";
	}
	@RequestMapping("update")
	public String update(Board board, String pageNum, Model model) {
		int result = 0; // 수정 실패
		Board board2 = bs.select(board.getNum());
		if (board2.getPassword().equals(board.getPassword())) {
			result = bs.update(board);
		} else result = -1; // 입력한 암호와 저장된 암호가 다르다
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "update";
	}
	@RequestMapping("deleteForm")
	public String deleteForm(int num, String pageNum, Model model) {
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		return "deleteForm";
	}
	@RequestMapping("delete")
	public String delete(int num, String password, String pageNum, Model model) {
		int result = 0; // 수정 실패		
		Board board2 = bs.select(num);
		if (board2.getPassword().equals(password)) {
			result = bs.delete(num);
		} else result = -1; // 입력한 암호와 저장된 암호가 다르다
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "delete";
	}
	@RequestMapping("list")
	public String list(Board board, String pageNum, Model model) {
		int  rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
//		int total = bs.getTotal();
		int total = bs.getTotal(board);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		// List<Board> list = bs.list(startRow, endRow);
		List<Board> list = bs.list(board);
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		// 답변글로 인한 번호를 보기좋게 다시 설정
		int no = total - startRow + 1;
		String[] title = {"작성자","제목","내용","제목+내용"};
		
//		model.addAttribute("board", board); // 생략 가능
		model.addAttribute("title", title);
		model.addAttribute("no", no);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		return "list";
	}
}