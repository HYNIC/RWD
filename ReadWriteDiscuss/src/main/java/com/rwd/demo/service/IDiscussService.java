package com.rwd.demo.service;

import java.util.List;

import com.rwd.demo.domain.DiscussVO;
import com.rwd.demo.domain.MemberVO;
import com.rwd.demo.domain.PageCriteria;

public interface IDiscussService {

	public int regist(DiscussVO dis, MemberVO mem);
	
	public List<DiscussVO> getList(PageCriteria cri);
	
	public DiscussVO getDiscuss(Long num);
	
	public int modify(DiscussVO dis);
	
	public int remove(DiscussVO dis);
	
	public int getTotal(PageCriteria cri);
}
