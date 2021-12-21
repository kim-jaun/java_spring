package com.ch.shooping2.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
// implements Controller 없어도 Controller역할 수행
// 메서드를 여러개 사용 가능(하나의 contoller로 여러개 요청 처리 가능)
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.shooping2.model.Item;
import com.ch.shooping2.service.ItemService;
@Controller
public class FruitController {
	@Autowired
	private ItemService is;
//	@GetMapping @PostMapping
	@RequestMapping("fruitList")
	public String fruitList(Model model) {
		List<Item> list = is.list();
		model.addAttribute("list", list);
		return "fruitList";
	}
	@RequestMapping("fruitDetail")
	public String fruitDetail(int itemId, Model model) {
		Item item = is.select(itemId);
		model.addAttribute("item", item);
		return "fruitDetail";
	}
}