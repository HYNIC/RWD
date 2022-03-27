package com.rwd.demo.mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.rwd.demo.domain.MemberVO;
import com.rwd.demo.service.IMemberService;

@SpringBootTest
class MemberMapperTest {
	
	@Autowired
	IMemberMapper mapper;
	
	@Autowired
	IMemberService service;
	
	@Test
	void testLogin() {
		MemberVO vo = new MemberVO();
		vo.setEmail("green@green.com");
		vo.setUser_pw("greengreen");
		
		assertEquals(true, service.doLogin(vo));
	}
	
	
	@Test
	void testGetMember() {
		MemberVO vo = new MemberVO();
		vo.setEmail("admin@rwd.com");
		
		assertEquals("admin", mapper.getMember(vo).getUsername());
		System.out.println(mapper.getMember(vo).toString());
		
	}
	
//	@Test
//	void testRegist() {
//		MemberVO vo = new MemberVO("test@test.com", "test", "test", "test", "female", null, null);
//		assertEquals(1, mapper.regist(vo));
//	}
	
	@Test
	void testCheckEmail() {
		String email = "admin@rwd.com";
		assertEquals(1, mapper.checkEmail(email));
	}

}
