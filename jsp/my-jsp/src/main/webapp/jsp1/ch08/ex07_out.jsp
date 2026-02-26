<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- out 내장객체: 브라우저로 데이터를 출력하기 위한 기본 출력 스트림 --%>
	<% out.println("직접 출력하는 메시지"); %>
	<%--현대적방식 --%>
	<%-- 단순히 HTML로 작성하는 것을 권장 --%>
	<p>직접 출력하는 메시지</p>
	<%
	out.println("직접 출력하는 메시지");//줄바꿈이 안된다 ?브라우저는 기본적으로	엔터(\n)를 무시
    out.print("Hello JSP");
    out.println("<br>");//줄바꿈 됨
    out.print(10 +20);
	%>
	<%= "직접 출력하는 메시지" %>
	<%= "Hello JSP" %>
	<%= "<br>" %>
	<%= (10 +20) %>
</body>
</html>