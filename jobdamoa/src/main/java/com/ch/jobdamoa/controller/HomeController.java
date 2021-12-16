package com.ch.jobdamoa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.jobdamoa.model.ScrapJson;
import com.ch.jobdamoa.service.ScrapService;

@Controller
public class HomeController {

	@Autowired
	private ScrapService ss;

	// 메인화면을 보여주는 컨트롤러
	@RequestMapping("home")
	public String home(Model model) {
		
		String prfileName = "scrap_result_programmers.json";
		String srfileName = "scrap_result_saramin.json";
		
		List<ScrapJson> prList = ss.scrapProgrammers(prfileName); // 우선 데이터를 긁어옴
		List<ScrapJson> saList = ss.scrapSaramin(srfileName);
		// 최근 5가지만 우선 저장하여 보내줌
		List<ScrapJson> prRecentList = new ArrayList<>();
		List<ScrapJson> saRecentList = new ArrayList<>();
		if (prList != null)
			for (int i = 0; i < prList.size(); i++) {
				if (i >= 5)
					break;
				prRecentList.add(prList.get(i));
				saRecentList.add(saList.get(i));
			}

		model.addAttribute("prRecentList", prRecentList);
		model.addAttribute("saRecentList", saRecentList);

		return "home/home";
	}
}
