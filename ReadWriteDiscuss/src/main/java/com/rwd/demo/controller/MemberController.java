package com.rwd.demo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rwd.demo.domain.MemberVO;
import com.rwd.demo.service.IMemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	IMemberService service;

	// 로그인 
	@GetMapping("/login")
	public String loginForm() {
		return "/member/loginForm";
	}
	
	// 로그인 처리
	@PostMapping("/login")
	public String doLogin(MemberVO vo, RedirectAttributes rttr, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		boolean result = service.doLogin(vo);
		System.out.println(result);
		
		if (result) {
			MemberVO member = service.getMember(vo);
			session.setAttribute("user", member);
			System.out.println(member.getUsername());
			return "redirect:/";
		} else {
			try {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('아이디/비밀번호를 확인해주세요');history.go(-1);</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return null;
		}
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String doLogout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}
	
	// 이메일 중복확인
	@RequestMapping("/checkEmail")
	public @ResponseBody int checkEmail(HttpServletRequest request) {
		String email = request.getParameter("email");
		int result = service.checkEmail(email);
		return result;
	}
	
	// 회원가입
	@GetMapping("/join")
	public String joinForm() {		
		return "/member/joinForm";
	}
	
	// 회원등록처리
	@PostMapping("/join")
	public String regist(MemberVO vo) {
		
		int result = service.regist(vo);
		
		if (result> 0) {
			return "redirect:login";
		} 
		return "redirect:join";
	}
	
}
