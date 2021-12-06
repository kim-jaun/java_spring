package com.ch.hello;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class TestContoller {
	@RequestMapping("addrForm")
	public String addrForm() {
		return "addrForm";
	}
	@RequestMapping("addr")
	public String addr(HttpServletRequest request, Model model) {
		// addrForm에서 데이터 받기
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		// jsp로 보내기
		model.addAttribute("name", name);
		model.addAttribute("addr", addr);
		return "addr";
	}
	@RequestMapping("addr2")
	public String addr2(String name, String addr, Model model) {
		model.addAttribute("name", name);
		model.addAttribute("addr", addr);
		return "addr";
	}
	@RequestMapping("addr3")
	public String addr3(Person person, Model model) {
		model.addAttribute("person", person);
		return "addr3";
	}
	@RequestMapping("memberForm")
	public String memberForm() {
		return "memberForm";
	}
	@RequestMapping("member")
	public String member(Member member, Model model) {
		model.addAttribute("member", member);
		return "member";
	}
}