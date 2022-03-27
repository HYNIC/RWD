package com.rwd.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.rwd.demo.domain.MemberVO;
import com.rwd.demo.domain.PageCriteria;
import com.rwd.demo.domain.RecordVO;

@Mapper
public interface IRecordMapper {

	public int regist(RecordVO vo);
	
	public List<RecordVO> getList();
	
	public List<RecordVO> getListWithPaging(PageCriteria cri, String email);
	
	public int getTotal();
	
	public RecordVO getRecord(Long rec_num);
	
	public int modify(RecordVO vo);
	
	public int remove(RecordVO vo);
}
