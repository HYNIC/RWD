<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>
<div class="body-wrapper">
	<div class="record-form">	
		<!-- 이 제목 나중에 .form밖으로 빼기. -->
		<h2>기록하기</h2>
		
		<form id="record-regi-form" action="regi" method="post" enctype="multipart/form-data">
			<!-- 이미지 삽입 -->
<!-- 			<div>
				<input type="file" name="img">
				<div id="record-img"></div>
			</div> -->
			
			<div id="space-between">
				<!-- 책제목 -->
				<span>
					<label>책제목</label>
					<input type="text" name="btitle">
				</span>
				
				<!-- 평점 -->
				<span>
					<label>평점</label>
					<select name="rate">
						<option value="" selected>--선택--</option>
						<option value="0">☆☆☆☆☆</option>
						<option value="1">★☆☆☆☆</option>
						<option value="2">★★☆☆☆</option>
						<option value="3">★★★☆☆</option>
						<option value="4">★★★★☆</option>
						<option value="5">★★★★★</option>
					</select>
				</span>
			</div>
			
			<!-- 한줄감상 -->
			<div>
				<label>한줄 감상</label>
				<input type="text" name="one_line" maxlength=60>
			</div>
			

			
			<!-- 기록 -->
			<div>
				<label>나의 기록</label>
				<textarea name="content"></textarea>
			</div>
			
			<!-- 등록버튼 -->
			<div>
				<button>기록</button>
			</div>
		</form>
	</div>
</div>




<%@include file="../../includes/footer.jsp" %>