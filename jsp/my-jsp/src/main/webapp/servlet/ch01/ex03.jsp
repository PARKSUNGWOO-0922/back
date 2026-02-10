<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- page 디렉티브 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%-- 1. 선언문: 변수, 메서드 정의 --%>
    <%!
        String str = "Hello JSP!";
    %>
    <%-- 2. 스크립틀릿 --%>
    <%
        // 자바 프로그래밍
        String root = request.getContextPath();
    %>

    <%-- 경로: /프로젝트명/서블릿주소 --%>
    <%-- 3. 표현식 --%>
    <a href="/my-jsp/requestMethod">프로젝트명직접기록</a><br>
    <a href="<%= root %>/requestMethod">JSP 1.0 Legacy</a><br>

    <%-- EL --%>
    <%--<a href="${pageContext.request.contextPath}/requestMethod">JSP 2.0 EL(Modern)</a>--%> 
</body>
</html>