package com.rwd.demo.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class RecordVO {
	private Long rec_num;
	private String btitle;
	private String rate;
	private String writer;
	private String one_line;
	private String content;
	private Date regdate;
	private Date update_date;
	private String img;
}
