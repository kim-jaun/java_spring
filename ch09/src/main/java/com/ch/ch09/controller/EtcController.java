package com.ch.ch09.controller;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ch.ch09.model.Email;
@Controller
public class EtcController {
	@Autowired
	private JavaMailSenderImpl jsi;
	@RequestMapping("mailForm")
	public String mailForm() {
		return "/etc/mailForm";
	}
	@RequestMapping("email")
	public String email(Email email, Model model) {
		MimeMessage mm = jsi.createMimeMessage();		
		try {
			MimeMessageHelper mmh = new MimeMessageHelper(mm, true,"utf-8");
			mmh.setSubject(email.getTitle());
			mmh.setText(email.getContent());
			mmh.setTo(email.getEmail());
			mmh.setFrom("kbj010@naver.com");
			jsi.send(mm);
			model.addAttribute("msg", "메일 전송 성공");
		}catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("msg","메일보내기 실패");
		}
		return "/etc/email";
	}
	@RequestMapping("json")
	public String json() {
		return "etc/json";
	}
}