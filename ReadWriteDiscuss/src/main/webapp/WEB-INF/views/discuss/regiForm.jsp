<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>
<div class="body-wrapper">
	<div class="body-wrapper-discuss">
		<div class="discuss-board-wrapper discuss-view">

			<h2>DISCUSS 게시글 등록</h2>
			<hr>
			<form action="regi" method="post" class="discuss-form">
				<div class="discuss-form-top">
					<div>
						<label>말머리</label>
						<input type="text" name="subject" placeholder="이곳에 말머리를 입력하세요">
					</div>
					<hr>
					
					<div>
						<label>글제목</label>
						<input type="text" name="title" placeholder="이곳에 게시글 제목을 입력하세요">
					</div>
					<hr>
				</div>
				
				<div class="discuss-form-bottom">
					<div>
						<label>내용</label><hr>
						<textarea name="content" placeholder="이곳에 내용을 입력하세요"></textarea><hr>
					</div>
					
					<div class="discuss-view-button">
						<button>등록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>




<%@include file="../../includes/footer.jsp" %>