package com.rwd.demo.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class MemberVO {
	private String email;
	private String username;
	private String user_pw;
	private String phone;
	private String gender;
	private Date regdate;
	private Date update_date;
	
	public MemberVO() {
		
	}
}
