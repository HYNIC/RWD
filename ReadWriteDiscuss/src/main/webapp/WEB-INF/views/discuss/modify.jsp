<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../includes/header.jsp" %>
<div class="body-wrapper">
	<div class="body-wrapper-discuss">
		<div class="discuss-board-wrapper discuss-view">
			<h2>DISCUSS 게시글 수정</h2>
			<hr>
			
			<form id="operForm" action="modify" method="post" class="discuss-form">
				<div class="discuss-form-top">
					<div>
						<label>말머리</label>
						<input type="text" name="subject" value="${discuss.subject}">
					</div>
					<hr>
					
					<div>
						<label>글제목</label>
						<input type="text" name="title" value="${discuss.title}">
					</div>
					<hr>
				</div>
				
				<div class="discuss-form-bottom">
					<div>	
						<label>내용</label><hr>
						<textarea name="content">${discuss.content}</textarea>
					</div>
					<hr>
					<div class="discuss-view-button">
						<button id="listBtn">목록</button>
						<c:if test="${user.email eq discuss.writer}">
							<button id="modBtn">수정</button>
							<button id="removeBtn">삭제</button>
						</c:if>
					</div>
				</div>
				
				<input type="hidden" name="dis_num" value="${discuss.dis_num}">
				<input type="hidden" name="page" value="${cri.page}">
				<input type="hidden" name="type" value="${cri.type}">
				<input type="hidden" name="keyword" value="${cri.keyword}">
			</form>
		</div>
	</div>
</div>

<script src="/js/discuss.js"></script>
<%@include file="../../includes/footer.jsp" %>