<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../includes/header.jsp" %>
토론 수정페이지

<div class="discuss-form">
	<h2>게시글 등록</h2>
	
	<form id="operForm" action="modify" method="post">
		<div>
			<label>말머리</label>
			<input type="text" name="subject" value="${discuss.subject}">
		</div>
		
		<div>
			<label>글제목</label>
			<input type="text" name="title" value="${discuss.title}">
		</div>
		
		<div>
			<textarea name="content">${discuss.content}</textarea>
		</div>
		
		<div>
			<button id="listBtn">목록</button>
			<c:if test="${user.email eq discuss.writer}">
				<button id="modBtn">수정</button>
				<button id="removeBtn">삭제</button>
			</c:if>
		</div>
		
		<input type="hidden" name="dis_num" value="${discuss.dis_num}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="type" value="${cri.type}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
	</form>
</div>

<script src="/js/discuss.js"></script>
<%@include file="../../includes/footer.jsp" %>