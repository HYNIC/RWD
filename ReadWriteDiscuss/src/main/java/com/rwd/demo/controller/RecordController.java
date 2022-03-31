package com.rwd.demo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
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

	// 기본 목록 
	@GetMapping("")
	public String getRecordList(PageCriteria cri, Model model, HttpSession session, HttpServletResponse response) {
		
		MemberVO mem = (MemberVO) session.getAttribute("user");
		
		// 이용자 로그인 확인 
		if (mem == null) {
			
			response.setContentType("text/html;charset=utf-8");
			
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('로그인이 필요한 게시판입니다');location.href='/member/login';</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return null;
		} else {
			
			// 로그인 된 상태라면 게시판 보여주기.
			cri.setAmount(5);		
			model.addAttribute("recList", service.getList(cri, mem)); // 리스트 가져오기 
			
			int total = service.getTotal(mem);
			model.addAttribute("total", total);
			model.addAttribute("pageMaker", new PageDTO(cri, total)); // 페이지 메이커
			
			return "record/board";
		}
		
	}
	
	// 페이징 처리
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
	
	// 게시글 등록
	@GetMapping("/regi")
	public String regist(Model model) {
		model.addAttribute("rateList", service.rateMap());
		return "record/regiForm";
	}
	
	// 게시글 등록 처리
	@PostMapping("/regi")
	public String doRegist(RecordVO record, RedirectAttributes rttr, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user"); // 로그인한 사용자 정보 찾기.
		record.setWriter(user.getEmail());
		service.regist(record);
		
		rttr.addFlashAttribute("result", record.getBtitle()); // 나중에 ~ 책에 대한 기록이 작성되었습니다.라는 얼럿창? 모달창? 띄우기
		
		System.out.println("record : " + record.toString());
		
		return "redirect:/record/";
	}
	
	// 상세조회/수정/삭제 페이지
	@GetMapping("/get")
	public void getRecord(@RequestParam("num") Long num, @ModelAttribute("cri") PageCriteria cri, Model model) {
		model.addAttribute("rateList", service.rateMap());
		model.addAttribute("record", service.getRecord(num));
	}
	
	@GetMapping("/modify")
	public String modifyForm (@RequestParam("num") Long num, @ModelAttribute("cri") PageCriteria cri, Model model) {
		
		model.addAttribute("rateList", service.rateMap());
		model.addAttribute("record", service.getRecord(num));
		return "record/modify";
	}
	
	// 수정 처리
	@PostMapping("/modify")
	public String doModify(RecordVO vo, @ModelAttribute("cri") PageCriteria cri) {
		service.modify(vo);
		return "redirect:/record/get?num=" + vo.getRec_num();
	}
	
	// 삭제 처리
	@PostMapping("/remove")
	public String doRemove(RecordVO vo, @ModelAttribute("cri") PageCriteria cri) {
		service.remove(vo);
		return "redirect:/record/";
	}
	
}
