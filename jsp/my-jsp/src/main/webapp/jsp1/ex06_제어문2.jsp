<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제어문</title>
</head>
<body>
	
	<h1>제어문:스크립틀릿+표현식</h1>
	<h2>조건문:스크립틀릿</h2>
	<% int score = 85; %>
	<% if(score >= 90) { %>
		<b>합격입니다.</b>
	<% } else { %>
		<b>불합격입니다.</b>
	<% } %>
	
	<h2>반복문:스크립틀릿+표현식</h2>
	<%
		for(int i = 1; i<=5; i++) {
			//콘솔출력
			System.out.println(i);
	%>
			<%-- 브라우저 출력 --%>
			<%-- 표현식:태그 내부/외부 , 태그의 속성값을 사용!--%>
			<b><%= i %></b>
			<img src="images/<%= i %>.png" alt="이미지<%= i %>">
			<%-- <img src="images/<%= i %>.png"  alt="이미지<%= i %>"> --%>
	<%
		}
	%>
</body>
</html>