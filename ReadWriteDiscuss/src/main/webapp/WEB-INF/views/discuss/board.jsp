<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>

<div class="body-wrapper">
	<h2>DISCUSS</h2>
	
	<div id="discuss-board">
		<div>
			<button onclick="location.href='regi'">게시글 등록</button>
			
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
		</div>
		
		<!-- 글목록 -->
		<table border="1px">
			<thead>
				<tr>
					<th>번호</th>
					<th>말머리</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>댓글수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${board}">
					<tr>
						<td>${board.dis_num}</td>
						<td>${board.subject}</td>
						<td><a class="get" href="${board.dis_num}">${board.title}</a></td>
						<td>${board.username}</td>
						<td>0</td>
						<td>${board.regdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		
		</table>
		<!-- 글목록 끝 -->
		
		<!-- 페이지 번호 -->
		<div>
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
		
		<form id="operForm" method="post" hidden>
			<input type="hidden" id="page" name="page" value="${pageMaker.cri.page}" >
			<input type="hidden" name="type" value="${pageMaker.cri.type}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
	
	</div>

</div>

<script src="/js/script_discuss.js"></script>
<%@include file="../../includes/footer.jsp" %>