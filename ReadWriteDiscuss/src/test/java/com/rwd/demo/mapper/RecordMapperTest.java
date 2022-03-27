package com.rwd.demo.mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.rwd.demo.domain.PageCriteria;
import com.rwd.demo.domain.RecordVO;

@SpringBootTest
class RecordMapperTest {
	
	@Autowired
	IRecordMapper mapper;
		
	@Test
	void testRegist() {
		RecordVO vo = new RecordVO();
		vo.setBtitle("junit test");
		vo.setRate("★★★★☆");
		vo.setOne_line("한줄평test");
		vo.setContent("짱짱짱");
		
		assertEquals(1, mapper.regist(vo));
	}
	
//	@Test
//	void testGetList() {
//		assertNotNull(mapper.getList());
//	}
//	
//	@Test
//	void testGetRecord() {
//		
//		assertNotNull(mapper.getRecord(55L));
//	}
//	
//	@Test
//	void testModify() {
//		RecordVO vo = mapper.getRecord(59L);
//		vo.setBtitle("수정합니당 테스트");
//		
//		assertEquals(1, mapper.modify(vo));
//	}
//	
//	@Test
//	void testRemove() {
//		RecordVO vo = mapper.getRecord(67L);
//		
//		assertEquals(1, mapper.remove(vo));
//	}
	
//	@Test
//	void testGetListWithPaging() {
//		PageCriteria cri = new PageCriteria();
//		assertNotNull(mapper.getListWithPaging(cri));
//	}
//	

}
