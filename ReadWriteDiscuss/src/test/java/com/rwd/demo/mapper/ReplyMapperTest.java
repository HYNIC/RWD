package com.rwd.demo.mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.rwd.demo.domain.PageCriteria;
import com.rwd.demo.domain.ReplyVO;

@SpringBootTest
class ReplyMapperTest {
	
	@Autowired
	IReplyMapper mapper;
	
	@Test
	void testRegist() {
		ReplyVO vo = new ReplyVO();
		vo.setDis_num(58L);
		vo.setReply("파일이 날아가서 슬프다");
		vo.setReplyer("admin@rwd.com");
		
		int result = mapper.regist(vo);
		assertEquals(1, result);
		
	}
	
	@Test
	void testGetList() {
		PageCriteria cri = new PageCriteria();
		assertNotNull(mapper.getList(cri, 58L));
	}
	
	@Test 
	void testGetListWithPaging() {
		PageCriteria cri = new PageCriteria(1, 10);
		
		assertNotNull(mapper.getListWithPaging(cri, 54L));
	}
	
	@Test
	void testGetReplyCnt() {
		assertEquals(12, mapper.getReplyCnt(54L));
	}
	
	@Test
	void testGetReply() {
		assertNotNull(mapper.getReply(55L));
	}
	
//	@Test
//	void testUpdate() {
//		ReplyVO vo = new ReplyVO();
//		vo.setRe_num(88L);
//		vo.setReply("제이유닛 매퍼 수정 테스트..");
//		
//		assertEquals(1, mapper.update(vo));
//	}
//	
//	@Test
//	void testDelete() {
//		assertEquals(1, mapper.delete(79L));
//	}

}
