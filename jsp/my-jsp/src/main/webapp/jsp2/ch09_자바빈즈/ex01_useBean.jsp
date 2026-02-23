<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="test" class="jsp.Ch09JavaBeans"/>
<jsp:setProperty name="test" property="message" value="빈을 쉽게 정복하자" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>간단한 빈 프로그래밍</h1>
    <br>
    Message: ${test.message}
</body>
</html>