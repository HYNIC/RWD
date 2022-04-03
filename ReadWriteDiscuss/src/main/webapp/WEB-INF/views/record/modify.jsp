<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../includes/header.jsp" %>

<div class="body-wrapper">
	<div class="record-board-wrapper record-view">	
		<h2>기록 수정</h2>
		<hr>
		
		<form id="operForm"  class="record-form" method="post" action="modify" enctype="multipart/form-data">
			<div class="record-view-top">
				
				<!-- 이미지 삽입 -->
		 		<div class="record-view-left">
					<c:if test="${empty record.img}">
						<img id="record-img" src="../../../img/NoImage.svg" />
					</c:if>
					<c:if test="${not empty record.img}">
						<img id="record-img" src="../../../img/${record.img}" />
					</c:if>
					
				</div>
				
				<div class="record-view-right record-regi-right">
					<div>
						<label>이미지 수정</label>
						<input type="file" name="uploadImg">
						<hr>
					</div>
					
					<!-- 책제목 -->
					<div>
						<label>책제목</label>
						<input type="text" name="btitle" value="${record.btitle}">
						<hr>
					</div>
					
					<!-- 평점 -->
					<div>
						<label>평점</label>
						<select name="rate">
							<c:forEach var="rate" items="${rateList}">
								<option value="${rate.key}" <c:if test="${record.rate eq rate.key}">selected</c:if>>${rate.value}</option>
							</c:forEach>
						</select>
						<hr>
					</div>
					
					<!-- 한줄감상 -->
					<div>
						<label>한줄 감상</label>
						<input type="text" name="one_line" value="${record.one_line}">
					</div>
				</div>
			
			</div>
	
			
			<!-- 기록 -->
			<div class="record-view-bottom record-modify">
				<div>
					<hr><label>나의 기록</label><hr>
					<textarea name="content">${record.content}</textarea>
					<hr>
				</div>
			</div>
			
			<!-- 등록버튼 -->
			<div class="record-view-button">
				<button id="listBtn">목록</button>
				<button id="modBtn">수정</button>
				<button id="removeBtn">삭제</button>
			</div> 
		
		
			<input type="hidden" name="rec_num" value="${record.rec_num}">
			<input type="hidden" id="page" name="page" value="${cri.page}">
		</form> 

	</div>
</div>

<script src="/js/record.js"></script>
<%@include file="../../includes/footer.jsp" %>