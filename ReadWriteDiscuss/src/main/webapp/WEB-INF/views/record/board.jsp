<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../includes/header.jsp" %>

<div class="body-wrapper body-wrapper-record">

	<!-- 페이징 -->
	<div class="record-paging">
		<button data-oper="prev">◀</button>
	</div>
	
	<div class="record-board-wrapper">
		<div>
			<h2>${user.username}의 독서기록</h2> 
			<button onclick='location.href="regi";'>기록하기</button>
		</div>
			
		<c:forEach var="list" items="${recList}">
			
			<div class="record-container">
				
				<img src="${list.img}">
				
				<div>
					<label>${list.rec_num}번째 기록</label>
					<h3><a class="get" href="${list.rec_num}">${list.btitle}</a></h3>	
					<span>${list.regdate}</span>
					<p>${list.one_line}</p>
				</div>
		
			</div>
			
		</c:forEach>
		

		
<%-- 		<c:if test="${!pageMaker.ended}">
			<p class="record-paging" style="cursor: pointer">▼더보기</p>
		</c:if>
		
		<c:if test="${pageMaker.ended}">
			<p class="record-paging-end" style="cursor: default;">마지막 기록입니다.</p>
		</c:if> --%>
		
		
		<!-- hidden action form -->
		<form id="operForm" action="post" hidden>
			<input type="hidden" id="page" name="page" value="${pageMaker.cri.page}" >
			<input type="hidden" id="endPage" name="page" value="${pageMaker.realEnd}"> 
		</form>
		
	</div>
	
	<!-- 페이징 -->
	<div class="record-paging">
		<button data-oper="next">▶</button>
	</div>
	
</div>



<script src="/js/script_record.js"></script>
<%@include file="../../includes/footer.jsp" %>