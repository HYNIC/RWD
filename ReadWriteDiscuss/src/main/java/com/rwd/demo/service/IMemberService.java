package com.rwd.demo.service;

import com.rwd.demo.domain.MemberVO;

public interface IMemberService {
	
	public MemberVO getMember(MemberVO vo);
	
	public boolean doLogin(MemberVO vo);
	
	public int regist(MemberVO vo);
	
	public int checkEmail(String email);
	
}
