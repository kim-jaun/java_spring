package com.ch.ch06.controller;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ch.ch06.model.Customer;
import com.ch.ch06.service.CustomerService;
@Controller
public class CustomerController {
	@Autowired
	private CustomerService cs;
	@RequestMapping("/")
	public String init() {
		// forward 또는 redirect인 경우에는 jsp로 가는 것이 아니라 COntroller내에 다른 메서드 호출
		return "forward:/customer";
	}
	// method = RequestMethod.GET get방식으로 요청
	@RequestMapping(value = "/customer", method = RequestMethod.GET)
	public String list(Model model) {
		Collection<Customer> customers = cs.list();
		model.addAttribute("customers", customers);
		return "/customer/list";
	}
	@RequestMapping("/customer/{id}")
	// @PathVariable는 {}에 있는 변수값을 읽을 서 처리할 때 사용
	public String detail(@PathVariable int id, Model model) {
		Customer customer = cs.select(id);
		model.addAttribute("customer", customer);
		return "/customer/detail";
	}
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		cs.delete(id);
		return "/customer/delete";
	}
}