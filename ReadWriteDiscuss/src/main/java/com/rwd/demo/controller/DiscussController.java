package com.rwd.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rwd.demo.domain.DiscussVO;
import com.rwd.demo.domain.MemberVO;
import com.rwd.demo.service.IDiscussService;
import com.rwd.demo.service.IMemberService;

@Controller
@RequestMapping("/discuss/*")
public class DiscussController {

	@Autowired
	IDiscussService service;
	
	@Autowired
	IMemberService mservice;
	
	
	@GetMapping("")
	public String getBoard(Model model, HttpSession session) {
		model.addAttribute("board", service.getList());
		
		return "discuss/board";
	}
	
	@GetMapping("/regi")
	public String registForm(HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user"); // 로그인 사용자 정보 찾기.
		
		if (user != null) {
			return "discuss/regiForm";
		} else {
			return "redirect:/member/login";
		}
		
	
	}
	
	@PostMapping("/regi")
	public String doRegist(DiscussVO dis, HttpSession session) {
		MemberVO mem = (MemberVO) session.getAttribute("user");
		service.regist(dis, mem);
		
		return "redirect:/discuss/";
	}
	
	@GetMapping({"/get", "/modify"})
	public void getDiscuss(@RequestParam("num") Long num, Model model) {
		model.addAttribute("discuss", service.getDiscuss(num));
	}
	
	@PostMapping("/modify")
	public String doModify(DiscussVO vo) {
		service.modify(vo);
		return "redirect:/discuss/get?num=" + vo.getDis_num();
	}
	
	@PostMapping("/remove")
	public String doRemove(DiscussVO vo) {
		service.remove(vo);
		return "redirect:/discuss/";
	}
	
	
	
}
