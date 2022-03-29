<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>
<div class="body-wrapper">
	<div>
		<h2>DISCUSS</h2>
		<!-- 게시글 내용 -->
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
		
		<!-- 댓글기능 -->
		<div>
			<!-- 댓글작성폼 -->
			<c:if test="${not empty user}">
				<form id="replyForm" action="/replies/new" method="post">
					<label>댓글</label>
					<input type="hidden" name="dis_num" value="${discuss.dis_num}">
					<input type="text" name="reply">
					<button id="replyBtn">댓글등록</button>
				</form>		
			</c:if>
			
			<!-- 댓글목록 -->
			<div>
				
				
			</div>
			
			
		</div>
		
		<!-- 페이지 처리를 위한 히든폼 -->
		<form id="operForm" action="modify" method="get">
			<input type="hidden" name="num" value="${discuss.dis_num}">
			<input type="hidden" id="page" name="page" value="${cri.page}">
			<input type="hidden" id="type" name="type" value="${cri.type}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
		</form>
	</div>
	
</div>

<script src="/js/script_discuss.js"></script>
<%@include file="../../includes/footer.jsp" %>