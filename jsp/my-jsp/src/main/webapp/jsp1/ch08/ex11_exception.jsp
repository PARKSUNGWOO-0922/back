
<%--에러 강제발생 경우 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="ex11_exception_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 발생 페이지</title>
</head>
<body>
	<%-- 강제로 예외 발생 --%>
	<%
		// 의도적으로 예외 발생
		int a = 10 / 0;
	%>
</body>
</html>