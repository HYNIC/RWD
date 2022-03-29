package com.rwd.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.rwd.demo.domain.PageCriteria;
import com.rwd.demo.domain.ReplyVO;

@Mapper
public interface IReplyMapper {

	public int regist(ReplyVO vo);
	
	public List<ReplyVO> getList(@Param("cri") PageCriteria cri, @Param("num") Long num);	
	
}
