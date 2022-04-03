<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../includes/header.jsp" %>

<div class="body-wrapper">
	<div class="record-board-wrapper record-view">	
		<h2>${user.username}의 독서기록</h2> 
		<hr>
		
		<div class="record-view-top">
			<div class="record-view-left">	
				<!-- 이미지 -->
				<c:if test="${empty record.img}">
					<img id="record-img" src="../../../img/NoImage.svg" />
				</c:if>
				<c:if test="${not empty record.img}">
					<img id="record-img" src="../../../img/${record.img}" />
				</c:if>
			</div><!-- record-view-left 끝 -->
			
			<div class="record-view-right">
				<!-- 책이름 -->		
				<h3>${record.btitle}</h3>
				
				<!-- 평점 -->
				<div>
					<label>평점</label>				
					<p>
						<c:forEach var="rate" items="${rateList}">
							<c:if test="${record.rate eq rate.key}">${rate.value}</c:if>
						</c:forEach>
					</p>
				</div><!-- 평점 끝 -->
				
				<!-- 한줄감상 -->
				<div>
					<label>한줄 감상</label>
					<p>${record.one_line}</p>
				</div>
			</div> <!-- .record-view-right 끝 -->
		</div> <!-- .record-view-top 끝 -->
		
		<div class="record-view-bottom">			
			<!-- 기록 -->
			<div>
				<hr><label>나의 기록</label><hr>
				<textarea name="content" readonly>${record.content}</textarea>
				<hr>
			</div>
		</div>
		
		<!-- 등록버튼 -->
		<div class="record-view-button">
			<button id="listBtn">목록</button>
			<button id="modifyBtn">수정</button>
		</div> 
		
		<form id="operForm" action="modify" method="get">
			<input type="hidden" name="num" value="${record.rec_num}">
			<input type="hidden" id="page" name="page" value="${cri.page}">
		</form>

	</div>
</div>

<script src="/js/record.js"></script>
<%@include file="../../includes/footer.jsp" %>