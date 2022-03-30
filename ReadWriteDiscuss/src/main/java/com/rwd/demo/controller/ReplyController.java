package com.rwd.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@PostMapping("/regi")
	public int regist(@RequestBody ReplyVO vo, HttpSession session) {
		MemberVO mem = (MemberVO) session.getAttribute("user");
		vo.setReplyer(mem.getEmail());
		int result = service.regist(vo);
		return result;
	}

	
	@GetMapping("/{num}/{page}")
	public List<ReplyVO> getList(@PathVariable("page") int page, @PathVariable("num") Long num) {
		PageCriteria cri = new PageCriteria(page, 10); // 댓글 페이지 처리 할 때 사용
		
		return service.getList(cri, num);
	}
	
	@GetMapping("/{re_num}")
	public ReplyVO getReply(@PathVariable("re_num") Long re_num) {
		return service.getReply(re_num);
	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{re_num}")
	public int modify(@RequestBody ReplyVO vo, @PathVariable("re_num") Long re_num) {
		vo.setRe_num(re_num);
		
		return service.update(vo);
	}
	
	@DeleteMapping("/{re_num}")
	public int remove(@PathVariable("re_num") Long re_num) {
		return service.delete(re_num);
	}
	
	
}
