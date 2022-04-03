package com.rwd.demo.mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.rwd.demo.domain.DiscussVO;
import com.rwd.demo.domain.MemberVO;
import com.rwd.demo.domain.PageCriteria;

@SpringBootTest
class DiscussMapperTest {
	
	@Autowired
	IDiscussMapper mapper;

	@Test
	void testRegist() {
		DiscussVO dis = new DiscussVO();
		dis.setSubject("마음에 없는 소리");
		dis.setTitle("현대인의 질병, 마음에 없는 소리 하기");
//		dis.setWriter("admin@rwd.com");
		dis.setContent("저는 지금 졸리지 않습니다.");
		
		MemberVO mem = new MemberVO();
		mem.setEmail("admin@rwd.com");
		
		assertEquals(1, mapper.regist(dis));

	}
	
	@Test
	void testGetList() {
		assertNotNull(mapper.getList());
	}
	
	@Test
	void testGetDiscuss() {
		assertNotNull(mapper.getDiscuss(12L));
	}
	
	@Test
	void testModify() {
		DiscussVO dis = new DiscussVO();
		dis.setSubject("저주토끼");
		dis.setContent("힘드렁");
		dis.setTitle("수정테스트중입니다.");
		dis.setDis_num(12L);
		assertEquals(1, mapper.modify(dis));
	}
	
//	@Test
//	void testRemove() {
//		DiscussVO dis = new DiscussVO();
//		dis.setDis_num(7L);
//		assertEquals(1, mapper.remove(dis));
//	}
	
//	@Test
//	void testGetTotal() {
//		assertEquals(18, mapper.getTotal());
//	}
	
	@Test
	void testGetListWithPaging() {
		PageCriteria cri = new PageCriteria();
		assertNotNull(mapper.getListWithPaging(cri));
	}

}
