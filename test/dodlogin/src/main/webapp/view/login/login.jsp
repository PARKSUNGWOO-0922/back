<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>신선한 식탁을 즐기다, 도드람몰입니다.</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/img/main/favicon.png" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/layout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mypage/mypage_claim.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mypage/login.css">
    <link
      rel="stylesheet"
      as="style"
      crossorigin
      href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css"
    />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/layout.js"></script>
</head>
<body>

<main>
    <div class="login-wrap">
        <h1>로그인</h1>
    
        <div class="login-box">
            <h2>회원 로그인</h2>
    
		<form method="post" action="${pageContext.request.contextPath}/login">
            <div class="login-form">
                <div class="input-area">
                	<label for="id">아이디: </label>
                    <input type="text" name="id" id="id" placeholder="아이디" required>
                    <label for="pwd">비밀번호: </label>
        			<input type="password" name="pwd" id="pwd" placeholder="비밀번호" required>

                    <label class="save-id">
                    <input type="checkbox"> 아이디 저장
                    </label>
            </div>
    
                <div><button type="submit" class="btn-login">로그인</button></div>
            </div>
		</form>
        </div>
    </div>
</main>

