package com.rwd.demo.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long re_num; // 댓글 번호
	private Long dis_num; // 토론 게시글 번호
	
	private String reply; // 댓글
	private String replyer; // 댓글 작성자
	private Date replyDate;
	private Date update_date;
}
