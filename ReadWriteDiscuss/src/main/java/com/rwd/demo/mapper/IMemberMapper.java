package com.rwd.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.rwd.demo.domain.MemberVO;

@Mapper
public interface IMemberMapper {
	
	public MemberVO getMember(MemberVO vo);
	
	public int regist(MemberVO vo);
	
	public int checkEmail(String email);
	
}
