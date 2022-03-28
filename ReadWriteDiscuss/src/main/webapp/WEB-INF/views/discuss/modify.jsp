<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<button id="modBtn">수정</button>
			<button id="removeBtn">삭제</button>
		</div>
		
		<input type="hidden" name="dis_num" value="${discuss.dis_num}">
	</form>
</div>

<script src="/js/script_discuss.js"></script>
<%@include file="../../includes/footer.jsp" %>