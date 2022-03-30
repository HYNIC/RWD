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
				
				<label>댓글</label>
				<input type="text" name="reply">
				<button id="replyBtn">댓글등록</button>
					
			</c:if>
			
			<!-- 댓글목록 -->
			<div class="reply-container">
				<ul id="reply">
					<li>
						<div>
						
							<div>
								<strong>댓글작성자</strong>
								<small>댓글작성일</small>
							</div>
							
							<div>
								<p>댓글내용</p>
								<small><a>수정</a></small>
							</div>
							
						</div>
					</li>
				</ul>
				
			</div>
			
			
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

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="/js/discuss.js"></script>
<%@include file="../../includes/footer.jsp" %>