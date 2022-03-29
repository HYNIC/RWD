package com.rwd.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rwd.demo.domain.DiscussVO;
import com.rwd.demo.domain.MemberVO;
import com.rwd.demo.domain.PageCriteria;
import com.rwd.demo.mapper.IDiscussMapper;

@Service
public class DiscussServiceImpl implements IDiscussService {

	@Autowired
	IDiscussMapper mapper;
	
	@Override
	public int regist(DiscussVO dis, MemberVO mem) {
		return mapper.regist(dis, mem);
	}

	@Override
	public List<DiscussVO> getList(PageCriteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public DiscussVO getDiscuss(Long num) {
		return mapper.getDiscuss(num);
	}

	@Override
	public int modify(DiscussVO dis) {
		return mapper.modify(dis);
	}

	@Override
	public int remove(DiscussVO dis) {
		return mapper.remove(dis);
	}

	@Override
	public int getTotal(PageCriteria cri) {
		return mapper.getTotal(cri);
	}
	
	
	
}
