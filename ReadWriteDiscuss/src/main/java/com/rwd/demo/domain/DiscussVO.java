package com.rwd.demo.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class DiscussVO {
	private Long dis_num;
	private String subject;
	private String title;
	private String writer; // 작성자 이메일
	private String username; // 작성자 이름
	private String content;
	private Date regdate;
	private Date update_date;
}
