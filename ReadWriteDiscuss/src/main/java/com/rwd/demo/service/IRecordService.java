package com.rwd.demo.service;

import java.util.List;

import com.rwd.demo.domain.MemberVO;
import com.rwd.demo.domain.PageCriteria;
import com.rwd.demo.domain.RecordVO;

public interface IRecordService {

	public int regist(RecordVO vo);
	
	public List<RecordVO> getList(PageCriteria cri, MemberVO mem);
	
	public int getTotal();
	
	public RecordVO getRecord(Long rec_num);
	
	public int modify(RecordVO vo);
	
	public int remove(RecordVO vo);
	
}
