<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%--
			JSTL import
				- 요청(request) 시점마다 실행 시 포함
				- 동적 include
				- 변수 공유 ❌
				- 파라미터 전달 ⭕
			
				<c:import url="포함할페이지.jsp">
					<c:param name="파라미터명" value="값" />
					<c:param name="다른파라미터" value="값" />
				</c:import>
		--%>

		<%-- <%@ include file="header.jsp" %>
		<% String siteName = "JSP Study" %>
		
		<jsp:include page="header.jsp">
			<jsp:param name="siteName" value="JSP Study"/>
		</jsp:include> --%>

		<c:import url="header.jsp">
			<c:param name="siteName" value="Subway"/>
		</c:import>


		<%-- <%!
			String loginId = "admin";
		%> --%>
		<c:set var="loginId" value="admin" />

		<main>
			<%-- 표현식 --%>
			<%-- <p>로그인 사용자: <%= loginId %></p> --%>
			<%-- EL --%>
			<p>로그인 사용자: ${loginId}</p>
			<%-- 지역 변수 공유x --%>
			<%-- <p>사이트명 재사용: <%= siteName %></p> --%>
		</main>

		<%-- <%@ include file="footer.jsp" %> --%>
		<%-- <jsp:include page="action_footer.jsp">
			<jsp:param name="siteName" value="JSP Study"/>
			<jsp:param name="year" value="<%= java.time.Year.now().getValue() %>"/>
		</jsp:include> --%>

		<c:import url="footer.jsp">
			<c:param name="siteName" value="JSP Study"/>
			<%-- 
				EL은 값 조회 전용 언어이며, Java 로직 실행은 금지
				EL은 Java 클래스의 정적 메서드 호출을 허용❌ 
			--%>
			<%-- <c:param name="year" value="${java.time.Year.now().getValue()}"/> --%>
			<c:param name="year" value="2026"/>
		</c:import>
	</body>
</html>