<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%--
			액션 include 태그
				- 요청(request) 시점마다 실행 시 포함
				- 동적 include
				- 변수 공유 ❌
				- 파라미터 전달 ⭕
				- JSP 전통 방식 MVC에서 자주 사용
			
				비교: include 지시자: 변수 공유 ⭕, 파라미터 전달 ❌
					<%@ include file="경로/파일명.jsp" %>

				<jsp:include page="경로/파일명.jsp">
					<jsp:param name="키" value="값" />
				</jsp:include>
		--%>

		<%-- 
			<%@ include file="header.jsp" %> 
			<% String siteName = "Subway"; %>
		--%>
		<%-- <jsp:param name="키" value="값"/> --%>
		<%-- 액션 태그 내부에 주석 사용❌ --%>
		<jsp:include page="header.jsp">
			<jsp:param name="siteName" value="써브웨이"/>
		</jsp:include>

		<%
			String loginId = "hong";
		%>

		<h1>메인 페이지</h1>
		<main>
			<p>로그인 사용자: <%= loginId %></p>
			<%-- 지역 변수 공유❌ --%>
			<%-- <p>사이트명 재사용: <%= siteName %></p> --%>
		</main>

		<%-- <%@ include file="footer.jsp" %> --%>
		<jsp:include page="footer.jsp">
			<jsp:param name="siteName" value="JSP Study"/>
			<jsp:param name="year" value="<%= java.time.Year.now().getValue() %>"/>
		</jsp:include>
	</body>
</html>