package com.rwd.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rwd.demo.domain.MemberVO;
import com.rwd.demo.domain.PageCriteria;
import com.rwd.demo.domain.PageDTO;
import com.rwd.demo.domain.RecordVO;
import com.rwd.demo.service.IRecordService;

@Controller
@RequestMapping("/record/*")
public class RecordController {
	
	@Autowired
	IRecordService service;


	@GetMapping("")
	public String getRecordList(PageCriteria cri, Model model, HttpSession session) {
		
		MemberVO mem = (MemberVO) session.getAttribute("user");
		System.out.println(mem.toString());
		
		cri.setAmount(5);		
		model.addAttribute("recList", service.getList(cri, mem)); // 리스트 가져오기 
		
		int total = service.getTotal();		
		model.addAttribute("pageMaker", new PageDTO(cri, total)); // 페이지 메이커
		
		return "record/board";
	}
	
	@PostMapping("/board")
	public String getMore(@RequestParam("page") int page, RedirectAttributes rttr) {
		rttr.addAttribute("page", page);		
		return "redirect:/record/board";
	}
	
//	@RequestMapping(value = "/{page}")
//	public @ResponseBody List<RecordVO> getMore(HttpServletRequest request) {
//		int page = Integer.parseInt(request.getParameter("page")); 
//		final int AMOUNT = 10;
//		PageCriteria cri = new PageCriteria(page, AMOUNT);
//		
//		return service.getList(cri);
//	}
	
	@GetMapping("/regi")
	public String regist() {
		
		return "record/regiForm";
	}
	
	@PostMapping("/regi")
	public String doRegist(RecordVO record, RedirectAttributes rttr, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user"); // 로그인한 사용자 정보 찾기.
		record.setWriter(user.getEmail());
		service.regist(record);
		
		rttr.addFlashAttribute("result", record.getBtitle()); // 나중에 ~ 책에 대한 기록이 작성되었습니다.라는 얼럿창? 모달창? 띄우기
		
		System.out.println("record : " + record.toString());
		
		return "redirect:/record/";
	}
	
	@GetMapping({"/get","/modify"})
	public void getRecord(@RequestParam("num") Long num, Model model) {
		model.addAttribute("record", service.getRecord(num));
	}
	
	@PostMapping("/modify")
	public String doModify(RecordVO vo) {
		service.modify(vo);
		return "redirect:/record/get?num=" + vo.getRec_num();
	}
	
	@PostMapping("/remove")
	public String doRemove(RecordVO vo) {
		service.remove(vo);
		return "redirect:/record/";
	}
	
}
