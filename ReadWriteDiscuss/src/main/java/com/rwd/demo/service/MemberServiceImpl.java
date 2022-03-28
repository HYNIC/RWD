package com.rwd.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rwd.demo.domain.MemberVO;
import com.rwd.demo.mapper.IMemberMapper;

@Service
public class MemberServiceImpl implements IMemberService {
	
	@Autowired
	IMemberMapper mapper;
	
	@Override
	public MemberVO getMember(MemberVO vo) {
		return mapper.getMember(vo);
	}

	@Override
	public boolean doLogin(MemberVO vo) {
		if (getMember(vo) != null) {
			if (vo.getUser_pw().equals(getMember(vo).getUser_pw())) {
				return true;
			}
		} 
		
		return false;	
	
	}

	@Override
	public int regist(MemberVO vo) {
		return mapper.regist(vo);
	}

	@Override
	public int checkEmail(String email) {
		int result = mapper.checkEmail(email);
		
		return result; // 1이면 중복o, 0이면 중복x
	}
	
	

}
