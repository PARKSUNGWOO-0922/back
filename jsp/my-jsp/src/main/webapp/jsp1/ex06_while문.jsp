<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int n = 1;
	while(n <= 3) {
	%>
		<p><%=n%>번째 반복</p>
	<% 
	n++;
	} 
	%>
	
	<c:forEach var="n" begin="1" end="3" step="1">
	</c:forEach>
</body>
</html>