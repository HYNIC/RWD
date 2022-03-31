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
	
	public List<ReplyVO> getListWithPaging(@Param("cri") PageCriteria cri, @Param("num") Long num);
	
	public int getReplyCnt(Long num); // dis_num에 따라 댓글 수 세는 메서드
	
	public ReplyVO getReply(@Param("re_num") Long re_num);
	
	public int update(ReplyVO reply);
	
	public int delete(@Param("re_num") Long re_num);
}
