<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 출력됨 --%>
	관리자1: <%= application.getInitParameter("adminEmail") %><br>
	<%-- 출력되지 않음 --%>
	관리자2: <%= config.getInitParameter("adminEmail") %>
	<%--
	     web.xml에 아래코드를 추가로 넣어준다.
	     application.getInitParameter("adminEmail") 이 읽을수 있는것
	     
		<context-param>
	    <param-name>adminEmail</param-name>
	    <param-value>admin@test.com</param-value>
		</context-param>
		
		config.getInitParameter("adminEmail") 이 읽을수 있는것
		
	 --%>
</body>
</html>