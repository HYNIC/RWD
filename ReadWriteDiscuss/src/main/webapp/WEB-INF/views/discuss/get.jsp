<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>
<div class="body-wrapper">
	<div>
		<h2>DISCUSS</h2>
		
		<div>
			<label>글제목</label>				
			<label>${discuss.title}</label>
			<label>${discuss.update_date}</label>
		</div>
		
		<div>
			<label>작성자</label>
			<p>${discuss.username}</p>
		</div>
		
		<div>
			<label>내용</label>
			<div>${discuss.content}</div>
		</div>
		
		<div>
			<button id="listBtn">목록</button>
			<button id="modBtn">수정</button>
		</div>
		
		<form id="operForm" action="modify" method="get">
			<input type="hidden" name="num" value="${discuss.dis_num}">
		</form>
	</div>
	
</div>

<script src="/js/script_discuss.js"></script>
<%@include file="../../includes/footer.jsp" %>