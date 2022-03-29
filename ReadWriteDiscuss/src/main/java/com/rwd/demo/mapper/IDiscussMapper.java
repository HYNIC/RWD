package com.rwd.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.rwd.demo.domain.DiscussVO;
import com.rwd.demo.domain.MemberVO;
import com.rwd.demo.domain.PageCriteria;

@Mapper
public interface IDiscussMapper {
	
	public int regist(DiscussVO dis, MemberVO mem);
	
	public List<DiscussVO> getList();
	
	public List<DiscussVO> getListWithPaging(PageCriteria cri);
	
	public DiscussVO getDiscuss(Long num);
	
	public int modify(DiscussVO dis);
	
	public int remove(DiscussVO dis);
	
	public int getTotal(PageCriteria cri);
	
}
