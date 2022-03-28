<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>

<div class="body-wrapper">
	<h2>DISCUSS</h2>
	
	<div>
		<button onclick="location.href='regi'">게시글 등록</button>
		<table id="discuss-board" border="1px">
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
		
		<form id="operForm" action="post" hidden>
		</form>
	
	</div>

</div>

<script src="/js/script_discuss.js"></script>
<%@include file="../../includes/footer.jsp" %>