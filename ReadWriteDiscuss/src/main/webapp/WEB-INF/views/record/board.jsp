<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../includes/header.jsp" %>

<div class="body-wrapper">

<div class="body-wrapper-record">

	<c:if test="${total > 5}">
		<!-- 페이징 -->
		<div class="record-paging">
			<button data-oper="prev">◀</button>
		</div>
	</c:if>

	
	<div class="record-board-wrapper">
		<div>
			<h2>${user.username}의 독서기록</h2> 
			<button onclick='location.href="regi";'>기록하기</button>
		</div>
			
		<c:if test="${empty recList}">
			
			<div class="record-container">
				<img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iNzUycHQiIGhlaWdodD0iNzUycHQiIHZlcnNpb249IjEuMSIgdmlld0JveD0iMCAwIDc1MiA3NTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiA8Zz4KICA8cGF0aCBkPSJtNTcyLjA5IDQxNi43Yy05LjM4MjgtOS4zNzg5LTIwLjc2Ni0xNi41MTItMzMuMzAxLTIwLjg2N3YtMTUzLjAyYzAtMTEuNzc3LTQuNjc1OC0yMy4wNy0xMy4wMDQtMzEuMzk1LTguMzI0Mi04LjMyODEtMTkuNjE3LTEzLjAwNC0zMS4zOTEtMTMuMDA0aC0yOTUuOTljLTExLjc3NyAwLTIzLjA3IDQuNjc1OC0zMS4zOTUgMTMuMDA0LTguMzI4MSA4LjMyNDItMTMuMDA0IDE5LjYxNy0xMy4wMDQgMzEuMzk1djIwNy4xOWMtMC4wMTk1MzEgNi4wMTU2IDEuMjQyMiAxMS45NjkgMy42OTkyIDE3LjQ2MXYwLjg5MDYyYzMuNTQzIDcuODA0NyA5LjI3MzQgMTQuNDIyIDE2LjQ5NiAxOS4wNDMgNy4yMjI3IDQuNjIxMSAxNS42MjkgNy4wNTQ3IDI0LjIwMyA3LjAwMzloMjIzLjMyYzMuNjE3MiAyMS41NDcgMTUuMDUxIDQxLjAwOCAzMi4xMTMgNTQuNjU2IDE3LjA2MiAxMy42NDUgMzguNTYyIDIwLjUyMyA2MC4zNzkgMTkuMzEyIDIxLjgxNi0xLjIxMDkgNDIuNDIyLTEwLjQyMiA1Ny44NzEtMjUuODcxIDE2LjcxOS0xNi42NjQgMjYuMTE3LTM5LjI5NyAyNi4xMTctNjIuODk4IDAtMjMuNjA1LTkuMzk4NC00Ni4yMzgtMjYuMTE3LTYyLjg5OHptLTExMy44MSA5Mi40OTZjLTYuNjc5Ny0xMS4yOTMtOS40MTQxLTI0LjQ4NC03Ljc4MTItMzcuNTA0IDEuNjMyOC0xMy4wMiA3LjU0NjktMjUuMTI5IDE2LjgwOS0zNC40MjIgMTEuMTg0LTEwLjkzNCAyNi4yNDItMTcgNDEuODgzLTE2Ljg3MSA0LjA4MiAwLjAyNzM0MyA4LjE0ODQgMC40NzI2NiAxMi4xMzcgMS4zMzIgNi4zNzExIDEuMjY5NSAxMi40NzcgMy42MjUgMTguMDU1IDYuOTU3em0tMTAwLjkzLTExMy45Ni01OS4xOTktNzMuOTk2aDAuMDAzOTA2Yy0yLjg3NS0yLjkzMzYtNi44NDM4LTQuNTQzLTEwLjk1My00LjQzNzUtNC4zNTE2LTAuMDgyMDMyLTguNTE5NSAxLjc1NzgtMTEuMzk1IDUuMDMxMmwtOTIuMTk5IDEwNC4zNHYtMTgzLjM2YzAtMy45MjU4IDEuNTU4Ni03LjY5MTQgNC4zMzU5LTEwLjQ2NSAyLjc3MzQtMi43NzczIDYuNTM5MS00LjMzNTkgMTAuNDY1LTQuMzM1OWgyOTUuOTljMy45MjE5IDAgNy42ODc1IDEuNTU4NiAxMC40NjUgNC4zMzU5IDIuNzczNCAyLjc3MzQgNC4zMzIgNi41MzkxIDQuMzMyIDEwLjQ2NXYxNDcuOTljLTkuMDM5MS0wLjAxNTYyNS0xOC4wMjcgMS4zODI4LTI2LjYzNyA0LjE0NDVsLTUyLjUzOS00NC4zOThjLTIuNjc5Ny0yLjI5My02LjA5MzgtMy41NTQ3LTkuNjIxMS0zLjU1NDctMy41MjczIDAtNi45Mzc1IDEuMjYxNy05LjYxNzIgMy41NTQ3em0xOTMuNzIgMTI1LjhoMC4wMDM5MDZjLTkuMzA4NiA5LjIzODMtMjEuNDI2IDE1LjEyNS0zNC40NDUgMTYuNzM0LTEzLjAyIDEuNjA1NS0yNi4yMDMtMS4xNTYyLTM3LjQ4LTcuODU1NWw4MC45NTMtNzkuOTE0YzYuNTcwMyAxMS4yNDYgOS4yNDYxIDI0LjM0OCA3LjYxMzMgMzcuMjctMS42MzI4IDEyLjkyNi03LjQ4MDUgMjQuOTQ5LTE2LjY0MSAzNC4yMTF6Ii8+CiAgPHBhdGggZD0ibTQwNS42IDI4Ny4yYzAgMTYuMzQ4LTEzLjI1NCAyOS42MDItMjkuNjAyIDI5LjYwMi0xNi4zNDQgMC0yOS41OTgtMTMuMjU0LTI5LjU5OC0yOS42MDIgMC0xNi4zNDQgMTMuMjU0LTI5LjU5OCAyOS41OTgtMjkuNTk4IDE2LjM0OCAwIDI5LjYwMiAxMy4yNTQgMjkuNjAyIDI5LjU5OCIvPgogPC9nPgo8L3N2Zz4K" />
				
				<div>
					<label>새로운 기록을 시작하세요.</label>
				</div>
				
			</div>
			
		</c:if>	
			
		<c:forEach var="list" items="${recList}">
			
			<div class="record-container">
				
				<c:if test="${empty list.img}">
					<img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iNzUycHQiIGhlaWdodD0iNzUycHQiIHZlcnNpb249IjEuMSIgdmlld0JveD0iMCAwIDc1MiA3NTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiA8Zz4KICA8cGF0aCBkPSJtNTcyLjA5IDQxNi43Yy05LjM4MjgtOS4zNzg5LTIwLjc2Ni0xNi41MTItMzMuMzAxLTIwLjg2N3YtMTUzLjAyYzAtMTEuNzc3LTQuNjc1OC0yMy4wNy0xMy4wMDQtMzEuMzk1LTguMzI0Mi04LjMyODEtMTkuNjE3LTEzLjAwNC0zMS4zOTEtMTMuMDA0aC0yOTUuOTljLTExLjc3NyAwLTIzLjA3IDQuNjc1OC0zMS4zOTUgMTMuMDA0LTguMzI4MSA4LjMyNDItMTMuMDA0IDE5LjYxNy0xMy4wMDQgMzEuMzk1djIwNy4xOWMtMC4wMTk1MzEgNi4wMTU2IDEuMjQyMiAxMS45NjkgMy42OTkyIDE3LjQ2MXYwLjg5MDYyYzMuNTQzIDcuODA0NyA5LjI3MzQgMTQuNDIyIDE2LjQ5NiAxOS4wNDMgNy4yMjI3IDQuNjIxMSAxNS42MjkgNy4wNTQ3IDI0LjIwMyA3LjAwMzloMjIzLjMyYzMuNjE3MiAyMS41NDcgMTUuMDUxIDQxLjAwOCAzMi4xMTMgNTQuNjU2IDE3LjA2MiAxMy42NDUgMzguNTYyIDIwLjUyMyA2MC4zNzkgMTkuMzEyIDIxLjgxNi0xLjIxMDkgNDIuNDIyLTEwLjQyMiA1Ny44NzEtMjUuODcxIDE2LjcxOS0xNi42NjQgMjYuMTE3LTM5LjI5NyAyNi4xMTctNjIuODk4IDAtMjMuNjA1LTkuMzk4NC00Ni4yMzgtMjYuMTE3LTYyLjg5OHptLTExMy44MSA5Mi40OTZjLTYuNjc5Ny0xMS4yOTMtOS40MTQxLTI0LjQ4NC03Ljc4MTItMzcuNTA0IDEuNjMyOC0xMy4wMiA3LjU0NjktMjUuMTI5IDE2LjgwOS0zNC40MjIgMTEuMTg0LTEwLjkzNCAyNi4yNDItMTcgNDEuODgzLTE2Ljg3MSA0LjA4MiAwLjAyNzM0MyA4LjE0ODQgMC40NzI2NiAxMi4xMzcgMS4zMzIgNi4zNzExIDEuMjY5NSAxMi40NzcgMy42MjUgMTguMDU1IDYuOTU3em0tMTAwLjkzLTExMy45Ni01OS4xOTktNzMuOTk2aDAuMDAzOTA2Yy0yLjg3NS0yLjkzMzYtNi44NDM4LTQuNTQzLTEwLjk1My00LjQzNzUtNC4zNTE2LTAuMDgyMDMyLTguNTE5NSAxLjc1NzgtMTEuMzk1IDUuMDMxMmwtOTIuMTk5IDEwNC4zNHYtMTgzLjM2YzAtMy45MjU4IDEuNTU4Ni03LjY5MTQgNC4zMzU5LTEwLjQ2NSAyLjc3MzQtMi43NzczIDYuNTM5MS00LjMzNTkgMTAuNDY1LTQuMzM1OWgyOTUuOTljMy45MjE5IDAgNy42ODc1IDEuNTU4NiAxMC40NjUgNC4zMzU5IDIuNzczNCAyLjc3MzQgNC4zMzIgNi41MzkxIDQuMzMyIDEwLjQ2NXYxNDcuOTljLTkuMDM5MS0wLjAxNTYyNS0xOC4wMjcgMS4zODI4LTI2LjYzNyA0LjE0NDVsLTUyLjUzOS00NC4zOThjLTIuNjc5Ny0yLjI5My02LjA5MzgtMy41NTQ3LTkuNjIxMS0zLjU1NDctMy41MjczIDAtNi45Mzc1IDEuMjYxNy05LjYxNzIgMy41NTQ3em0xOTMuNzIgMTI1LjhoMC4wMDM5MDZjLTkuMzA4NiA5LjIzODMtMjEuNDI2IDE1LjEyNS0zNC40NDUgMTYuNzM0LTEzLjAyIDEuNjA1NS0yNi4yMDMtMS4xNTYyLTM3LjQ4LTcuODU1NWw4MC45NTMtNzkuOTE0YzYuNTcwMyAxMS4yNDYgOS4yNDYxIDI0LjM0OCA3LjYxMzMgMzcuMjctMS42MzI4IDEyLjkyNi03LjQ4MDUgMjQuOTQ5LTE2LjY0MSAzNC4yMTF6Ii8+CiAgPHBhdGggZD0ibTQwNS42IDI4Ny4yYzAgMTYuMzQ4LTEzLjI1NCAyOS42MDItMjkuNjAyIDI5LjYwMi0xNi4zNDQgMC0yOS41OTgtMTMuMjU0LTI5LjU5OC0yOS42MDIgMC0xNi4zNDQgMTMuMjU0LTI5LjU5OCAyOS41OTgtMjkuNTk4IDE2LjM0OCAwIDI5LjYwMiAxMy4yNTQgMjkuNjAyIDI5LjU5OCIvPgogPC9nPgo8L3N2Zz4K" />
				</c:if>
				<c:if test="${not empty list.img}">
					<img src="${list.img}">
				</c:if>
				
				<div>
					<label>${list.rec_num}번째 기록</label>
					<h3><a class="get" href="${list.rec_num}">${list.btitle}</a></h3>	
					<span>${list.regdate}</span>
					<p>${list.one_line}</p>
				</div>
		
			</div>
			
		</c:forEach>
		
		<!-- hidden action form -->
		<form id="operForm" action="post" hidden>
			<input type="hidden" id="page" name="page" value="${pageMaker.cri.page}" >
			<input type="hidden" id="endPage" name="page" value="${pageMaker.realEnd}"> 
		</form>
		
	</div>
	
	<c:if test="${total > 5}">
		<!-- 페이징 -->
		<div class="record-paging">
			<button data-oper="next">▶</button>
		</div>
	</c:if>
</div> 
	
</div>



<script src="/js/record.js"></script>
<%@include file="../../includes/footer.jsp" %>