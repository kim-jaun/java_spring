package com.ch.tiger.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.tiger.model.Carpool;
import com.ch.tiger.model.Member;
import com.ch.tiger.model.Report;
import com.ch.tiger.model.Reservation;
import com.ch.tiger.service.CarpoolService;
import com.ch.tiger.service.MemberService;
import com.ch.tiger.service.PagingBean;
import com.ch.tiger.service.ReportService;
import com.ch.tiger.service.ReservationService;


@Controller
public class CarpoolController {
	
	@Autowired
	private CarpoolService cps;

	@Autowired
	private ReportService rps;
	
	@Autowired
	private MemberService mbs;
	
	@Autowired
	private ReservationService rvs;
	
	// 타세요 리스트
	@RequestMapping("cpList")
	public String cpList(Carpool carpool, String pageNum, Model model) {
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 6; // 한 화면에 보여주는 게시글 갯수
		int total = cps.getTotal(carpool);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		carpool.setStartRow(startRow);
		carpool.setEndRow(endRow);
		List<Carpool> cpList = cps.cpList(carpool);
		int CP_num = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		model.addAttribute("CP_num", CP_num);
		model.addAttribute("carpool", carpool);
		model.addAttribute("pb", pb);
		model.addAttribute("cpList", cpList);
		return "carpool/cpList";
	}
	
	// 타세요 작성폼
	@RequestMapping("cpWriteForm")
	public String cpWriteForm(int CP_num, Member member, String pageNum, Model model, HttpSession session){
		String MB_id = (String)session.getAttribute("MB_id");
		member = mbs.select(MB_id);
		// 출발일 설정시 현재날짜보다 이전날짜 설정 못하게 막기
		Calendar now_date1 = Calendar.getInstance(); // 현재 날짜
		Calendar now_time1 = Calendar.getInstance(); // 현재 시간
		// 출발일이 오늘이면서 출발시간이 현재시간 이전으로 설정 못하게 막기
		// now_time을 현재시간 +1함으로써 매칭 출발시간에 최소 1시간 여유가 생김
		now_time1.set(Calendar.HOUR_OF_DAY, now_time1.get(Calendar.HOUR_OF_DAY)+1);
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식 설정
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm"); // 시간 형식 설정
		Date now_date = now_date1.getTime();
		Date now_time = now_time1.getTime();
		model.addAttribute("now_date", sdf1.format(now_date));
		model.addAttribute("now_time", sdf2.format(now_time));
		model.addAttribute("member", member);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpWriteForm";
	}
	
	// 타세요 작성폼 결과 안내
	@RequestMapping("cpWriteResult")
	public String cpWriteResult(Carpool carpool, String pageNum, Model model){
		int number = cps.getMaxNum(); // 타세요 글번호 생성
		carpool.setCP_num(number);
		int result = cps.insert(carpool);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpWriteResult";
	}
	
	// 타세요 리스트 상세보기
	@RequestMapping("cpView")
	public String cpView(int CP_num, String pageNum, Model model, HttpSession session) {
		Reservation reservation = new Reservation();
		reservation.setCP_num(CP_num);
		List<Reservation> reservationList = rvs.reservationList(reservation); // reservation 테이블 정보 list로 보여줌
		String MB_id = (String)session.getAttribute("MB_id");// 로그인한 회원의 정보
		Member member = mbs.select(MB_id); // 로그인한 회원의 정보
		Carpool carpool = cps.select(CP_num); // 타세요 작성자 MB_num 조회
		Member memberDB = null; // 타세요 작성한 회원 닉네임 같이 보여주기
		memberDB = mbs.selectNum(carpool.getMB_num());
		
		//신청취소 버튼용
		Reservation reservation2 = new Reservation();
		reservation2.setCP_num(CP_num);
		reservation2.setMB_num(member.getMB_num()); // 세션으로 받아온 MB_num으로 조회
		reservation2 = rvs.selectRv(reservation2);
		model.addAttribute("reservation2", reservation2);
		
		model.addAttribute("memberDB", memberDB);
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("member", member);
		model.addAttribute("carpool", carpool);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpView";
	}
	
	// 타세요 신고하기 폼
	@RequestMapping("cpReportForm")
	public String cpReportForm(Report report, String pageNum, Model model) {
		model.addAttribute("report", report);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpReportForm";
	}
	
	// 타세요 신고하기 결과 안내
	@RequestMapping("cpReportResult")
	public String cpReportResult(Report report, String pageNum, Model model) {
		int number = rps.getMaxNum(); // 1. 신고 글번호 생성
		report.setRP_num(number); // 2. report table의  RP_num(max번호 +1) 설정
		int result = rps.RPinsert(report);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpReportResult";
	}
	
	// 타세요 게시글 수정(작성한 회원만 가능)
	@RequestMapping("cpUpdateForm")
	public String cpUpdateForm(int CP_num, String pageNum, Model model, HttpSession session) {
		String MB_id = (String)session.getAttribute("MB_id"); // session에 저장된 MB_id를 통해 MB_num 정보 받기
		Member member = mbs.select(MB_id);
		Carpool carpool = cps.select(CP_num);
		// 출발일 설정시 현재날짜보다 이전날짜 설정 못하게 막기
		Calendar now_date1 = Calendar.getInstance(); // 현재 날짜
		Calendar now_time1 = Calendar.getInstance(); // 현재 시간
		// 출발일이 오늘이면서 출발시간이 현재시간 이전으로 설정 못하게 막기
		// now_time을 현재시간 +1함으로써 매칭 출발시간에 최소 1시간 여유가 생김
		now_time1.set(Calendar.HOUR_OF_DAY, now_time1.get(Calendar.HOUR_OF_DAY)+1);
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식 설정
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm"); // 시간 형식 설정
		Date now_date = now_date1.getTime();
		Date now_time = now_time1.getTime();
		model.addAttribute("now_date", sdf1.format(now_date));
		model.addAttribute("now_time", sdf2.format(now_time));
		model.addAttribute("member", member);
		model.addAttribute("carpool", carpool);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpUpdateForm";
	}
	
	// 타세요 게시글 수정 결과 안내
	@RequestMapping("cpUpdateResult")
	public String cpUpdateResult(Carpool carpool, String pageNum, Model model) {
		int result = cps.update(carpool);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpUpdateResult";
	}
	
	// 타세요 게시글 삭제
	@RequestMapping("cpDeleteForm")
	public String cpDeleteForm(int CP_num, String pageNum, Model model, HttpSession session) {
		String MB_id = (String)session.getAttribute("MB_id"); // session에 저장된 MB_id를 통해 MB_pw 정보 받기
		Member member = mbs.select(MB_id);
		Carpool carpool = cps.select(CP_num);
		model.addAttribute("member", member); // 게시글 삭제시 회원 비밀번호 검사 후 삭제
		model.addAttribute("carpool", carpool);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpDeleteForm";
	}
	
	// 타세요 게시글 삭제 결과 안내
	@RequestMapping("cpDeleteResult")
	public String cpDeleteResult(int CP_num, String pageNum, Model model) {
		int result = cps.delete(CP_num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpDeleteResult";
	}
	
	// 타세요 신청버튼 클릭시
	@RequestMapping("cpRequestResult")
	public String cpRequestList(int CP_num, int MB_num, String pageNum, Model model) {
		int result = 0;
		Reservation reservation = new Reservation(); // reservation에 CP_num과 MB_num값 저장 
		reservation.setCP_num(CP_num);
		reservation.setMB_num(MB_num);
		// 신청버튼 중복 클릭 방지
		Reservation reservation2 = rvs.selectRv(reservation);
		if (reservation2 != null) {
			result = -1; // 신청한 정보가 이미 있음
		} else {
			result = rvs.insert(reservation); // 신청 성공/실패
		}
		model.addAttribute("CP_num", CP_num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "carpool/cpRequestResult";
	}
	
	//타세요 신청취소 버튼
	@RequestMapping("cpCancelRequestResult")
	public String cpCancelRequestResult(int CP_num, int MB_num, String pageNum, Model model) {
		Reservation reservation = new Reservation();
		reservation.setCP_num(CP_num);
		reservation.setMB_num(MB_num);
		int result = rvs.delete(reservation);
		model.addAttribute("result", result);
		model.addAttribute("CP_num", CP_num);
		return "carpool/cpCancelRequestResult";
	}
	
	// 타세요 드라이버 로그인 >> 매칭 여부 컬럼 "수락" 버튼 클릭시
	@RequestMapping("cpAcceptResult")
	public String cpAcceptResult(int CP_num, int MB_num, Model model) {
		Reservation reservation = new Reservation();
		reservation.setCP_num(CP_num);
		reservation.setMB_num(MB_num);
		int result = rvs.updateAccept(reservation);
		int addNumResult = cps.updatePassNumNow(CP_num); // 드라이버가 수락을해서 신청한 회원이 매칭완료상태가될때마다 CP_passNumNow에 +1 해줌
		// 게시글 매칭완료시 기존에 신청된 수락버튼 거절로 변환(매칭완료된 좌석수가 총 좌석수와 일치할때 '매칭대기'였던 상태를 '거절'로 바꿔줌)
		Carpool carpool = cps.select(CP_num);
		if (carpool.getCP_passNumNow() == carpool.getCP_passNum()) {
			int allDeny = rvs.updateAllDeny(CP_num);
		}
		model.addAttribute("result", result);
		model.addAttribute("CP_num", CP_num);
		return "carpool/cpAcceptResult";
	}
	
	// 타세요 드라이버 로그인 >> 매칭 여부 컬럼 "거절" 버튼 클릭시
	@RequestMapping("cpDenialResult")
	public String cpDenialResult(int CP_num, int MB_num, Model model) {
		Reservation reservation = new Reservation();
		reservation.setCP_num(CP_num);
		reservation.setMB_num(MB_num);
		int result = rvs.updateDenial(reservation);
		model.addAttribute("result", result);
		model.addAttribute("CP_num", CP_num);
		return "carpool/cpDenialResult";
	}

}
