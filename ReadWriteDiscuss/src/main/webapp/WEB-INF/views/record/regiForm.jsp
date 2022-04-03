<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>

<div class="body-wrapper">
	<div class="record-board-wrapper record-view">	
		<h2>기록하기</h2>
		<hr>
		
		<form id="record-regi-form"  class="record-form" action="regi" method="post" enctype="multipart/form-data">
			<div class="record-view-top"> 
				
				<div class="record-view-left">
					<img id="record-img" src="../../../img/NoImage.svg" />
				</div>
				
				<div class="record-view-right record-regi-right">
					<div>
						<label>이미지 선택</label>
						<input type="file" name="uploadImg">
						<hr>
					</div>
					
					<!-- 책제목 -->
					<div>
						<label>책제목</label>
						<input type="text" name="btitle">
						<hr>
					</div>
					
					<!-- 평점 -->
					<div>
						<label>평점</label>
						<select name="rate">
							<option value="" selected>--선택--</option>
							<c:forEach var="rate" items="${rateList}">
								<option value="${rate.key}">${rate.value}</option>
							</c:forEach>
						</select>
						<hr>
					</div>
					
					<!-- 한줄감상 -->
					<div>
						<label>한줄 감상</label>
						<input type="text" name="one_line" maxlength=60>
						<hr>
					</div>
					
				</div>
				
			</div>

			
			<!-- 기록 -->
			<div class="record-view-bottom record-modify">
				<div>
					<hr><label>나의 기록</label><hr>
					<textarea name="content"></textarea>
					<hr>
				</div>
			</div>
			
			<!-- 등록버튼 -->
			<div class="record-view-button">
				<button>기록</button>
			</div>
		</form>
	</div>
</div>




<%@include file="../../includes/footer.jsp" %>