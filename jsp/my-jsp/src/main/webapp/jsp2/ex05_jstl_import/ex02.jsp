<%@page import="java.util.Date"%>
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
    <%-- 선언문 --%>
    <%!
        // 새로 고침시 안바뀐다.
        // 서버(톰캣) 종료 후 다시 실행하면 바뀐다.
        Date now1 = new Date();
    %>

	<%-- 스크립틀릿: 
			- 자바 로직을 실행하는 문법
			- 제어문, 변수 선언
			- 요청이 올 때마다 실행됨 --%>
	<% 
        // 새로 고침시 바뀐다.
        Date now2 = new Date(); 
    %>

    <%-- 표현문 --%>
	선언문으로 작성한 변수: <%= now1 %><br>
	선언문으로 작성한 변수: <%= new Date() %><br>
	스크립틀릿으로 작성한 변수: <%= now2 %>

</body>
</html>