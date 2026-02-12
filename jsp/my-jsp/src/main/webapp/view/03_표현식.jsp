<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>  
<%--디렉티브 JSTL 라이브러리 연결--%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%--선언문:변수 선언, 메서드 정의 --%>
		<%! int num = 50; %>
		<%--스크립틀릿:자바 로직 --%>
		<% num += 10; %>
		<%-- 표현식 --%>
		표현식: <%= num + "<br>"%>
		<h2>EL</h2>
		<%--JSTL --%>
		<c:set var="num2" value="50"/>
		<c:set var="num2" value="${num2 + 10}"/>
		표현식:${num2 }
		
		
		
</body>
</html>