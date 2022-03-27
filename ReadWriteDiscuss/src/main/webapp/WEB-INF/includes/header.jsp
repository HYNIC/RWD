<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>읽고쓰고말하기</title>
	<link rel="stylesheet" href="/css/style.css" type="text/css">
	<link rel="stylesheet" href="/css/recordStyle.css" />
</head>
<body> 
<header>

	<div class="header-container">
		<!-- 홈페이지 로고 -->
		<div class="logo" onclick="location.href='/'">읽.쓰.말</div>
		
		<!-- 게시판 nav -->
		<nav>
			<ul>
				<li><a href="/record/">기록</a></li>
				<li><a href="#">토론</a></li>
				<li><a href="#">북킷리스트</a></li>
			</ul>
		</nav>
		
		<!-- 로그인/회원페이지 버튼 -->
		<!-- 나중에 jstl말고 자바스크립트로 바꾸기 -->
		<c:set var="logged" value="${user}" />
		
		<c:if test="${empty logged}">
			<div class="to-login">
				<a href="/member/login">log-in</a>
			</div>
		</c:if>
	
		
		<c:if test="${not empty logged}">
			<div class="user-info">
				<a href="#">${logged.username}</a>
				<a href="/member/logout">log-out</a>
			</div>
		</c:if>
	
	</div>

</header>
