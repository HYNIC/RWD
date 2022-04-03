package com.rwd.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rwd.demo.domain.DiscussVO;
import com.rwd.demo.domain.MemberVO;
import com.rwd.demo.domain.PageCriteria;
import com.rwd.demo.domain.PageDTO;
import com.rwd.demo.service.IDiscussService;
import com.rwd.demo.service.IMemberService;

@Controller
@RequestMapping("/discuss/*")
public class DiscussController {

	@Autowired
	IDiscussService service;
	
	@Autowired
	IMemberService mservice;
	
	
	@GetMapping({"", "/board"})
	public String getBoard(PageCriteria cri, Model model, HttpSession session) {
		
		// 게시글 10개씩 보여주기
		cri.setAmount(10);
		model.addAttribute("board", service.getList(cri));
		
		// 페이지 번호 부여
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "discuss/board";
	}
	
	@PostMapping("/board")
	public String movePage(@RequestParam("page") int page, RedirectAttributes rttr) {
		rttr.addAttribute("page", page);
		return "redirect:/discuss/board";
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
		dis.setWriter(mem.getEmail());
		System.out.println(mem.toString());
		System.out.println(dis.toString());
		service.regist(dis);
		
		return "redirect:/discuss/";
	}
	
	@GetMapping({"/get", "/modify"})
	public void getDiscuss(@RequestParam("num") Long num, @ModelAttribute("cri") PageCriteria cri, Model model) {
		DiscussVO dis = service.getDiscuss(num);
		System.out.println(dis.toString());
		model.addAttribute("discuss", service.getDiscuss(num));
	}
	
	@PostMapping("/modify")
	public String doModify(DiscussVO vo, @ModelAttribute("cri") PageCriteria cri) {
		service.modify(vo);
		
		return "redirect:/discuss/get" + cri.getListLink() + "&num=" + vo.getDis_num();
	}
	
	@PostMapping("/remove")
	public String doRemove(DiscussVO vo, @ModelAttribute("cri") PageCriteria cri) {
		service.remove(vo);
		
		return "redirect:/discuss/board" + cri.getListLink();
	}
	
	
	
}
