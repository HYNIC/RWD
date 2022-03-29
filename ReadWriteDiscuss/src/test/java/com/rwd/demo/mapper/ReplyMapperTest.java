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
	void testMapper() {
		assertNotNull(mapper);
	}
	
	@Test
	void testRegist() {
		ReplyVO vo = new ReplyVO();
		vo.setDis_num(57L);
		vo.setReply("매퍼 테스트중");
		vo.setReplyer("admin@rwd.com");
		assertEquals(1, mapper.regist(vo));
	}
	
	@Test
	void testGetList() {
		assertNotNull(mapper.getList(new PageCriteria(), 54L));
	}

}
