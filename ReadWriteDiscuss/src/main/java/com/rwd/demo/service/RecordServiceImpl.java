package com.rwd.demo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rwd.demo.domain.MemberVO;
import com.rwd.demo.domain.PageCriteria;
import com.rwd.demo.domain.RecordVO;
import com.rwd.demo.mapper.IRecordMapper;

@Service
public class RecordServiceImpl implements IRecordService {

	@Autowired
	IRecordMapper mapper;
		
	@Override
	public int regist(RecordVO vo) {
		return mapper.regist(vo);
	}

	@Override
	public List<RecordVO> getList(PageCriteria cri, MemberVO mem) {
		return mapper.getListWithPaging(cri, mem.getEmail());
	}
	
	@Override
	public int getTotal(MemberVO mem) {
		return mapper.getTotal(mem);
	}

	@Override
	public RecordVO getRecord(Long rec_num) {
		return mapper.getRecord(rec_num);
	}

	@Override
	public int modify(RecordVO vo) {
		return mapper.modify(vo);
	}

	@Override
	public int remove(RecordVO vo) {
		return mapper.remove(vo);
	}

	@Override
	public HashMap<Integer, String> rateMap() {
		HashMap<Integer, String> map = new HashMap<Integer, String>();
		
		for (int i = 0; i <= 5; i++) {
			map.put(i,  "★".repeat(i) + "☆".repeat(5-i));
		}
		
		return map;
	}

}
