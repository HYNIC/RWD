package com.rwd.demo.service;

import java.util.List;

import com.rwd.demo.domain.DiscussVO;
import com.rwd.demo.domain.MemberVO;

public interface IDiscussService {

	public int regist(DiscussVO dis, MemberVO mem);
	
	public List<DiscussVO> getList();
	
	public DiscussVO getDiscuss(Long num);
	
	public int modify(DiscussVO dis);
	
	public int remove(DiscussVO dis);
	
}
