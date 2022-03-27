package com.rwd.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rwd.demo.domain.PageCriteria;
import com.rwd.demo.domain.PageDTO;
import com.rwd.demo.service.IRecordService;

@Controller("/")
public class MyController {

	
	@RequestMapping("/")
	public String root() throws Exception {
		return "index";
	}
	

	
}
