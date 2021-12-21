package com.ch.shopping1.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.ch.shopping1.model.Item;
import com.ch.shopping1.service.ItemService;
// Controller 구현. 실체화하며 handleRequest method를 재정의
public class FruitController implements Controller {
	@Autowired
	private ItemService is;
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<Item> list = is.list();
		mav.addObject("list", list); // jsp에 전달
		mav.setViewName("/WEB-INF/views/fruitList.jsp"); // 보여줄 화면명
		return mav;
	}
}