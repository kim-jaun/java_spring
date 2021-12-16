package com.ch.ch10.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch10.model.Board;
import com.ch.ch10.model.ReplyBoard;
import com.ch.ch10.service.BoardService;
import com.ch.ch10.service.ReplyBoardService;
@Controller
public class ReplyBoardController {
	@Autowired
	private BoardService bs;
	@Autowired
	private ReplyBoardService rbs;
	@RequestMapping("/rUpdate")
	public String rUpdate(ReplyBoard rb) {
		rbs.update(rb);
		return "redirect:/replyList/bno/"+rb.getBno();
	}
	@RequestMapping("/rDelete")
	public String rDelete(ReplyBoard rb) {
		rbs.delete(rb);
		return "redirect:/replyList/bno/"+rb.getBno();
	}
	@RequestMapping("/rInsert")
	public String rInsert(ReplyBoard rb) {
		rbs.insert(rb);
//	결과를 jsp로 보내지 않고 controller내에서 찾을 때 : redirect 또는 forward	
		return "redirect:/replyList/bno/"+rb.getBno();
	}
	// bno는 현재 화면의 게시판 번호
	@RequestMapping("/replyList/bno/{bno}")
	public String replyList(@PathVariable int bno, Model model) {
		Board board = bs.select(bno);
		List<ReplyBoard> rbdList = rbs.list(bno);
		model.addAttribute("board", board);
		model.addAttribute("rbdList", rbdList);
		return "replyList";
	}
}