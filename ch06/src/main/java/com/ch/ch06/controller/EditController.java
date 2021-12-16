package com.ch.ch06.controller;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ch.ch06.model.Customer;
import com.ch.ch06.service.CustomerService;
@Controller
// 클래스에 @RequestMapping을 사용하면 이 클래스에 모든 메서드는 앞에 공통으로 있는 것으로 간주
@RequestMapping("/customer/{id}")
// 이 session이 있는 컨트롤러에서 editCustomer라는 이름으로 저장하여 같이 사용
@SessionAttributes("editCustomer")
public class EditController {
	@Autowired
	private CustomerService cs;
	@RequestMapping("/edit")   // /customer/{id}/edit와 같다
	public String edit(@PathVariable int id, Model model) {
		Customer customer = cs.select(id);
		// editCustomer이름으로 jsp에 전달
		model.addAttribute("editCustomer", customer);
//	redirect:enter 	@RequestMapping("/customer/{id}/enter")
//	redirect:/enter	@RequestMapping("/enter")
		return "redirect:enter";
	}
	@RequestMapping(value = "/enter", method = RequestMethod.GET)
// 	@ModelAttribute("editCustomer")는 세션에 있는 객체 editCustomer데이터를 customer에 저장	
	public String enter(@ModelAttribute("editCustomer") Customer customer) {
		return "/customer/edit/enter";
	}
	@RequestMapping(value = "/enter",params = "event_process")
// Customer DTO에 있는 에러를 체크하고 에러가 있으면 errros에 저장하여 jsp에 보낸다	
	public String review(@Valid @ModelAttribute("editCustomer") Customer customer,
			Errors errors) {
		if (errors.hasErrors()) return "/customer/edit/enter";
		else return "/customer/edit/review";
	}
	@RequestMapping(value = "review", params = "event_confirm")
	public String edir(@ModelAttribute("editCustomer") Customer customer, 
			SessionStatus ss) 	{
		cs.update(customer);		
	// session 메모리에 있던 editCustomer데이터를 삭제
		ss.setComplete();
		// /가 있으면 위에 있는  /customer/{id}는 제외한다는 의미
		return "redirect:/customer";
	}
	@RequestMapping(value = "review", params = "event_cancel")
	public String cancel() {
		return "redirect:enter";
	}
}