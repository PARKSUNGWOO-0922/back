<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%-- 
  		절대 주소 
  		${pageContext.request.contextPath}/는
  		프로젝트명/ -> localhost:8080/my-subway/
  		href="${pageContext.request.contextPath}/static/css/login.css"
  --%>
  <link rel="icon" href="${path}/view/common/favicon.png">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
  <title>SUBWAY 써브웨이</title>
</head>

<body>

    <!-- login page: login.html -->
    <div class="login_container">
        <div class="login_box">
            <!-- 닫기 버튼 -->
            <c:url var="mainLink" value="/index.jsp" />
            <a href="${mainLink}" class="closed_btn"><i class="fa-solid fa-xmark"></i></a>
            <div class="login_inner">
                <h1>LOGIN</h1>
                <form action="${mainLink}" method="post">
                    <div class="login_group">
                        <label for="uid"><i class="fa-solid fa-user"></i></label>
                        <input type="text" name="uid" id="uid" placeholder="아이디" required>
                    </div>
                    <div class="login_group">
                        <label for="upw"><i class="fa-solid fa-lock"></i></label>
                        <input type="password" name="upw" id="upw" placeholder="비밀번호" required>
                    </div>
                    <div class="options">
                        <input type="checkbox" name="options" id="options" value="Y">
                        <label for="options">로그인 유지</label>
                    </div>
                    <div class="login_btn">
                        <button type="submit">로그인</button>
                    </div>
                </form>
                <div class="links">
                    <a href="${path}/view/member/member.jsp">회원가입</a>
                    <a href="/">ID/PW 찾기</a>
                    <a href="/">인증메일 재발송</a>
                </div>
            </div>
        </div><!-- .login_box -->
    </div><!-- .login_container -->

</body>

</html>