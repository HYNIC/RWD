<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>

<div class="body-wrapper">
	
	
	<div class="body-wrapper-discuss">
		<div class="discuss-board-wrapper">
			

		<div class="discuss-board-top">
			<h2>DISCUSS</h2>
			<button onclick="location.href='regi'">게시글 등록</button>
		</div>
		
		<!-- 글목록 -->
		<table class="discuss-board-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>말머리</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>댓글</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty board}">
					<tr>
						<td colspan="6">게시물을 작성해 주세요</td>
					</tr>
				</c:if>
				<c:forEach var="board" items="${board}">
					<tr>
						<td>${board.dis_num}</td>
						<td class="discuss-subject">${board.subject}</td>
						<td class="discuss-title"><a class="get" href="${board.dis_num}">${board.title}</a></td>
						<td>${board.username}</td>
						<td class="replyCnt" data-dnum="${board.dis_num}">0</td>
						<td class="discuss-date">${board.regdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		
		</table>
		<!-- 글목록 끝 -->
		
		<div class="discuss-board-bottom">
		
			<!-- 검색 -->
			<div>
				<form id="searchForm" action="board" method="get">
					<input type="hidden" name="page" value="${pageMaker.cri.page}">
					
					<select id="type" name="type">
						<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}" />>--분류--</option>
						<option value="S" <c:out value="${pageMaker.cri.type == 'S' ? 'selected' : ''}" />>말머리</option><!-- subject -->
						<option value="T" <c:out value="${pageMaker.cri.type == 'T' ? 'selected' : ''}" />>글제목</option><!-- title -->
						<option value="W" <c:out value="${pageMaker.cri.type == 'W' ? 'selected' : ''}" />>작성자</option><!-- writer(username) -->
					</select>
					
					<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}" />'>
					
					<button id="searchBtn">검색</button>
				</form>
			</div>
			<!-- 검색 끝 -->
			
			<!-- 페이지 번호 -->
			<div class="discuss-board-paging">
				<ul>
					<c:if test="${pageMaker.prev}">
						<li class="paginate-button"><a href="${pageMaker.startPage - 1}"><</a></li>
					</c:if>
					
					<c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate-button ${pageMaker.cri.page == pageNum ? 'page-active' : ''}"><a href="${pageNum}">${pageNum}</a></li>
					</c:forEach>
					
					<c:if test="${pageMaker.next}">
						<li class="paginate-button"><a href="${pageMaker.endPage + 1}">></a></li>
					</c:if>
				</ul>
			</div>
			<!-- 페이지번호 끝 -->
		</div>
		
		
		<form id="operForm" method="post">
			<input type="hidden" id="page" name="page" value="${pageMaker.cri.page}" >
			<input type="hidden" name="type" value="${pageMaker.cri.type}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
		
		</div>
	</div>

</div>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="/js/replyService.js"></script>
<script src="/js/discuss.js"></script>
<%@include file="../../includes/footer.jsp" %>