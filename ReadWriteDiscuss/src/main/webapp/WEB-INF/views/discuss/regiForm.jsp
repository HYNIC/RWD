<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>
토론 게시글 등록 폼

<div class="discuss-form">
	<h2>게시글 등록</h2>
	
	<form action="regi" method="post">
		<div>
			<label>말머리</label>
			<input type="text" name="subject">
		</div>
		
		<div>
			<label>글제목</label>
			<input type="text" name="title">
		</div>
		
		<div>
			<textarea name="content" placeholder="내용을 입력하세요"></textarea>
		</div>
		
		<div>
			<button>등록</button>
		</div>
	</form>
</div>




<%@include file="../../includes/footer.jsp" %>