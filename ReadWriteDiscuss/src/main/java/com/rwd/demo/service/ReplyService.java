package com.rwd.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rwd.demo.domain.PageCriteria;
import com.rwd.demo.domain.ReplyVO;
import com.rwd.demo.mapper.IReplyMapper;

@Service
public class ReplyService implements IReplyService {
	
	@Autowired
	IReplyMapper mapper;
	
	@Override
	public int regist(ReplyVO vo) {
		return mapper.regist(vo);
	}

	@Override
	public List<ReplyVO> getList(PageCriteria cri, Long num) {
		return mapper.getList(cri, num);
	}

	@Override
	public ReplyVO getReply(Long re_num) {
		return mapper.getReply(re_num);
	}

	@Override
	public int update(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int delete(Long re_num) {
		return mapper.delete(re_num);
	}

}