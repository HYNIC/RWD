package com.rwd.demo.service;

import java.util.List;

import com.rwd.demo.domain.PageCriteria;
import com.rwd.demo.domain.ReplyVO;

public interface IReplyService {
	
	public int regist(ReplyVO vo);
	
	public List<ReplyVO> getList(PageCriteria cri, Long num);
	
}
