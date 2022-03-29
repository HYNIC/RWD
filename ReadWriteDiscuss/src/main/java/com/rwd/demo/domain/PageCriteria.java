package com.rwd.demo.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PageCriteria {

	private int page; // 현재 페이지 번호
	private int amount; // 한 페이지에 출력할 데이터 개수
	
	private String type;
	private String keyword;
	
	public PageCriteria() {
		this(1, 10);
	}
	
	public PageCriteria (int page, int amount) {
		this.page = page;
		this.amount = amount;
	}
	
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("page", this.getPage())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}
}
