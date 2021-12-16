package com.ch.ch08.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ch.ch08.model.Emp;
import com.ch.ch08.service.EmpService;
@Controller
public class EmpController {
	@Autowired
	private EmpService es;
}