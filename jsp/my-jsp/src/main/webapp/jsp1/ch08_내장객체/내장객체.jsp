<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체</title>
</head>
<body>
	아이디: <%= request.getParameter("userid") %><br>
	
	아이디: <%= request.getContextPath() %><br>
	<%
	request.setAttribute("msg","hello");
	String result = (String) request.getAttribute("msg");
	
	%>
	
</body>
</html>