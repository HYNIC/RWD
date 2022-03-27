package com.rwd.demo.domain;

import lombok.Data;

@Data
public class PageCriteria {

	private int page; // 현재 페이지 번호
	private int amount; // 한 페이지에 출력할 데이터 개수
	
	public PageCriteria() {
		this(1, 10);
	}
	
	public PageCriteria (int page, int amount) {
		this.page = page;
		this.amount = amount;
	}
}
