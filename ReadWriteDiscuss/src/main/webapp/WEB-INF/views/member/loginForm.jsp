<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>

<div class="body-wrapper">
	
	<div class="form login-form">
		<h3>LOG-IN</h3>
		
		<form id="loginForm" action="login" method="post">
			<div>
				<label>이메일</label>
				<input type="text" name="email">
				<p class="errMsg"></p>
			</div>
			
			<div>
				<label>비밀번호</label>
				<input type="password" name="user_pw">
				<p class="errMsg"></p>
			</div>
			
			<div>
				<button>로그인하기</button>
			</div>
			
		</form>
		
		<div class="to-join">
			아직 계정이 없다면? <span><a href="join">회원가입하러가기</a></span>
		</div>
		
	</div>
	

</div>
<script src="/js/member_login.js"></script>
<%@include file="../../includes/footer.jsp" %>