<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../includes/header.jsp" %>

<div class="body-wrapper">
	<div class="form record-form">	
		<!-- 이 제목 나중에 .form밖으로 빼기. -->
		<h3>${record.btitle}수정페이지</h3>
		
		<form id="operForm" method="post" action="modify">
			<!-- 이미지 삽입 -->
	<!-- 	<div>
				<div id="record-img"></div>
				<button>이미지 선택</button>
			</div>
			 -->
			<!-- 책제목 -->
			<!-- <div>
				<label>책제목</label>
				<input type="text" name="btitle" readonly>
			</div> -->
			
			<!-- 평점 -->
			<div>
				<label>평점</label>
				<select name="rate">
					<c:forEach var="rate" items="${rateList}">
						<option value="${rate.key}" <c:if test="${record.rate eq rate.key}">selected</c:if>>${rate.value}</option>
					</c:forEach>
					
				</select>
			</div>
			
			<!-- 한줄감상 -->
			<div>
				<label>한줄 감상</label>
				<input type="text" name="one_line" value="${record.one_line}">
			</div>
			
	
			
			<!-- 기록 -->
			<div>
				<label>나의 기록</label>
				<textarea name="content">${record.content}</textarea>
			</div>
			
			<!-- 등록버튼 -->
			<div>
				<button id="listBtn">목록</button>
				<button id="modBtn">수정</button>
				<button id="removeBtn">삭제</button>
			</div> 
		
		
			<input type="hidden" name="rec_num" value="${record.rec_num}">
			<input type="hidden" id="page" name="page" value="${cri.page}">
		</form> 

	</div>
</div>

<script src="/js/record.js"></script>
<%@include file="../../includes/footer.jsp" %>