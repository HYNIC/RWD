<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>

<div class="body-wrapper">
	<div class="form join-form">
        <h3>SIGN-UP</h3>

        <form action="join" method="post">
        	<!-- email칸 -->
            <div>
                <label>e-mail</label>
                <div class="div-email">
                	<input type="text" name="email" placeholder="이메일 입력">
                	<label id="email-label">@</label>
                	<select name="email" class="join-form-domain" >
                		<option value="" selected disabled>--선택--</option>
                		<option value="gmail.com">gmail.com</option>
	                    <option value="naver.com">naver.com</option>
	                    <option value="hanmail.net">hanmail.net</option>
	                    <option value="direct_input">직접 입력</option>
                	</select>
                	
                </div>
               	<p class="errMsg" id="err-email"></p>
            </div>
            
            <!-- 이름입력칸 -->
            <div>
                <label>이름</label>
                <input type="text" name="username" id="name" placeholder="이름을 입력해 주세요">
            </div>
            
            <!-- 비밀번호 입력, 확인 -->
            <div>
                <label>비밀번호</label>
                <input type="password" name="user_pw" placeholder="비밀번호를 입력해 주세요" minlength="4" maxlength="20">
            </div>

            <div>
                <label>비밀번호 확인</label>
                <input type="password" name="user_pw" placeholder="비밀번호를 다시 입력해 주세요" minlength="4" maxlength="20">
                <p class="errMsg" id="err-pw"></p>
            </div>
			
			
			<!-- 연락처 입력칸 -->
            <div>
                <label>연락처</label>
                <div class="join-form-phone">
                    <input type="text" name="phone" class="phone" maxlength="3">
                    <label>-</label>
                    <input type="text" name="phone" class="phone" maxlength="4">
                    <label>-</label>
                    <input type="text" name="phone" class="phone" maxlength="4">
                </div>
            </div>
			
			<!-- 성별선택 -->
            <div>
                <label>성별</label>

                <div class="join-form-gender"> 
                    <span><input type="radio" name="gender" value="Male">남자</span>
                    <span><input type="radio" name="gender" value="Female">여자</span>
                    <span><input type="radio" name="gender" value="None">선택안함</span>
                </div>
            </div>

            <hr>
			
			<!-- 버튼 -->
			<div class="btn">
				<button id="submit-btn" disabled>가입하기</button>
			</div>
        </form>
    </div>
</div>


<script src="/js/member_join.js"></script>
<%@include file="../../includes/footer.jsp" %>