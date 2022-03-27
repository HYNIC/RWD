<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../includes/header.jsp" %>

<div class="body-wrapper">
	<div class="form record-form">	
		<!-- 이 제목 나중에 .form밖으로 빼기. -->
		<h3>${record.btitle}</h3>
		
		<!-- 이미지 삽입 -->
<!-- 		<div>
			<div id="record-img"></div>
			<button>이미지 선택</button>
		</div> -->

		<!-- 책제목 -->
		<!-- <div>
			<label>책제목</label>
			<input type="text" name="btitle" readonly>
		</div> -->
		
		<!-- 평점 -->
		<div>
			<label>평점</label>				
			<label>${record.rate}</label>
		</div>
		
		<!-- 한줄감상 -->
		<div>
			<label>한줄 감상</label>
			<p>${record.one_line}</p>
		</div>
		
		<!-- 기록 -->
		<div>
			<label>나의 기록</label>
			<textarea name="content" readonly>${record.content}</textarea>
		</div>
		
		<!-- 등록버튼 -->
		<div>
			<button id="listBtn">목록</button>
			<button id="modifyBtn">수정</button>
		</div> 
		
		<form id="operForm" action="modify" method="get">
			<input type="hidden" name="num" value="${record.rec_num}">
		</form>

	</div>
</div>

<script src="/js/script_record.js"></script>
<%@include file="../../includes/footer.jsp" %>