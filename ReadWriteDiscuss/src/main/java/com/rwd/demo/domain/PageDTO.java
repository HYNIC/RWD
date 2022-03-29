package com.rwd.demo.domain;

import lombok.Data;

@Data
public class PageDTO {

	private PageCriteria cri;
	private int total; // 전체 데이터 개수
	
	private int startPage;
	private int endPage; //버튼이 표시되는 페이지 중에서 마지막 페이지
	private int realEnd; // 데이터가 있는 마지막 페이지
	private boolean prev, next;
	
	
	public PageDTO(PageCriteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPage() / 5.0)) * 5; // 10은 한번에 표시될 페이지 번호
		this.startPage = this.endPage - 4;
		
		this.realEnd= (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if (realEnd < this.endPage) {
			this.endPage = this.realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < this.realEnd;
	}
	
}
