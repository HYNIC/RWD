<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../includes/header.jsp" %>

<div class="body-wrapper">

<div class="body-wrapper-record">

	<c:if test="${total > 5}">
		<!-- 페이징 -->
		<div class="record-paging">
			<button data-oper="prev">◀</button>
		</div>
	</c:if>

	
	<div class="record-board-wrapper">
		<div id="record-board-header">
			<h2>${user.username}의 독서기록</h2> 
			<button onclick='location.href="regi";'>기록하기</button>
		</div>
			
			<c:if test="${empty recList}">
				
				<div class="record-container">
					<img src="../../../img/NoImage.svg" />
					
					<div>
						<label>새로운 기록을 시작하세요.</label>
					</div>
					
				</div>
				
			</c:if>	
			
		<c:forEach var="list" items="${recList}">
			
			<div class="record-container">
				
				<c:if test="${empty list.img}">
					<img src="../../../img/NoImage.svg" />
				</c:if>
				<c:if test="${not empty list.img}">
					<img id="record-board-img" src="../../../img/${list.img}" />
				</c:if>
				
				<div>
					<h3><a class="get" href="${list.rec_num}">${list.btitle}</a></h3>	
					<span>${list.rec_num}번째 기록 / ${list.regdate}</span>
					<p>${list.one_line}</p>
				</div>
		
			</div>
			
		</c:forEach>
		
		<!-- hidden action form -->
		<form id="operForm" action="post">
			<input type="hidden" id="page" name="page" value="${pageMaker.cri.page}" >
			<input type="hidden" id="endPage" name="page" value="${pageMaker.realEnd}"> 
		</form>
		
	</div>
	
	<c:if test="${total > 5}">
		<!-- 페이징 -->
		<div class="record-paging">
			<button data-oper="next">▶</button>
		</div>
	</c:if>
</div> 
	
</div>



<script src="/js/record.js"></script>
<%@include file="../../includes/footer.jsp" %>