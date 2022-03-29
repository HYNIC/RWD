package com.rwd.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.rwd.demo.domain.MemberVO;
import com.rwd.demo.domain.PageCriteria;
import com.rwd.demo.domain.ReplyVO;
import com.rwd.demo.service.IReplyService;

@RequestMapping("/replies/*")
@RestController
public class ReplyController {

	@Autowired
	IReplyService service;
	
	@PostMapping(value = "/new", produces = "application/json")
	public ResponseEntity<String> regist(ReplyVO vo, HttpSession session) {
		MemberVO mem = (MemberVO) session.getAttribute("user");
		vo.setReplyer(mem.getEmail());
		int result = service.regist(vo);
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/{num}")
	public ResponseEntity<List<ReplyVO>> getList(@PathVariable("num") Long num) {
		PageCriteria cri = new PageCriteria(); // 댓글 페이지 처리 할 때 사용
		
		return new ResponseEntity<>(service.getList(cri, num), HttpStatus.OK);
	}
	
}
