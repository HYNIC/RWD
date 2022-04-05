<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../includes/header.jsp" %>
<div class="body-wrapper">
	<div class="body-wrapper-discuss">
		<div class="discuss-board-wrapper discuss-view">
			<h2>DISCUSS</h2>
			<hr>
			<div class="discuss-view-top">
				<div>
					<label>말머리</label>
					<p class="discuss-view-title subject">${discuss.subject}</p>
				</div>
			</div>
			<hr>
			
			<!-- 게시글 내용 -->
			<div class="discuss-view-top">
				<div>
					<label>글제목</label>				
					<p class="discuss-view-title">${discuss.title}</p>
				</div>
				
				<div>
					<label>작성자</label>
					<p>${discuss.username}</p>
				</div>
				
				<div>
					<label>${discuss.update_date}</label>
				</div>
				
			</div>
			
			<hr>
			
			<div class="discuss-view-bottom discuss-form-bottom">
				<div>
					<label>내용</label><hr>
					<textarea class="discuss-view-content" readonly>${discuss.content}</textarea>
				</div>
			
				<div class="discuss-view-button">
					<button id="listBtn">목록</button>
					<c:if test="${discuss.writer eq user.email}">
						<button id="modBtn">수정</button>
					</c:if>
				</div>
				<hr>
			</div>
			<!-- 댓글기능 -->
			<div class="discuss-view-reply">
			
				<!-- 로그인 안되어있을 경우 -->
				<c:if test="${empty user}">
					<label id="reply-no-user">댓글을 등록할 권한이 없습니다.</label>
				</c:if>
				
				<!-- 댓글작성폼 -->
				<c:if test="${not empty user}">
					<label>댓글</label>
					<input type="text" name="reply" placeholder="댓글 입력">
					<button id="replyBtn">댓글등록</button>
				</c:if>
				<hr>
				<!-- 댓글목록 -->
				<div class="reply-container">
					<ul id="reply">
					</ul>
					
				</div> <!-- reply-container 끝 -->
				
				<!-- 댓글 페이지 처리 -->
				<div id="reply-page"></div>
				
				
			</div>
			
			<!-- 페이지 처리를 위한 히든폼 -->
			<form id="operForm" action="modify" method="get">
				<input type="hidden" id="num" name="num" value="${discuss.dis_num}">
				<input type="hidden" id="page" name="page" value="${cri.page}">
				<input type="hidden" id="type" name="type" value="${cri.type}">
				<input type="hidden" name="keyword" value="${cri.keyword}">
			</form>
		</div>
	</div>
	
	<input type="hidden" id="replyer" value="${user.email}">
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="/js/replyService.js"></script>
<script src="/js/discuss.js"></script>
<%@include file="../../includes/footer.jsp" %>