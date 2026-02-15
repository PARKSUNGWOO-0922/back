<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="${path}/view/common/favicon.png">
<link rel="stylesheet" href="${path}/static/css/step3.css">
<title>SUBWAY 써브웨이</title>
</head>

<body>
	<%-- 헤더: 액션 include --%> 
	<jsp:include page="/view/common/header.jsp" />

	<section id="step3">
		<header class="logo">
			<h1>SUBWAY</h1>
			<p>EAT FRESH</p>
		</header>
		<nav class="step">
			<ul>
				<li>STEP1. 약관동의</li>
				<li>STEP2. 정보입력</li>
				<li class="active">STEP4. 가입완료</li>
			</ul>
		</nav>
		<section class="container">
			<div class="complete-box">
				<div class="icon">🎁</div>
				<h2>
					<span id="userName">홍길동</span>님<br> 써브웨이 가입을 환영합니다.
				</h2>
				<p class="desc">
					이제부터 써브웨이 멤버십 서비스를 통해<br> 다양한 할인과 이벤트 혜택을 이용하실 수 있습니다.
				</p>
				<div class="btn-group">
					<a href="${path}/index.jsp" id="benefitBtn">신규회원 혜택 확인</a> 
					<a href="${path}/index.jsp" id="mainBtn" class="sub">메인으로 이동</a>
				</div>
			</div>
		</section>
	</section>

	<%-- 푸터: 액션 include --%> 
	<jsp:include page="/view/common/footer.jsp" />

	<script src="${path}/static/js/step3.js"></script>
</body>
</html>