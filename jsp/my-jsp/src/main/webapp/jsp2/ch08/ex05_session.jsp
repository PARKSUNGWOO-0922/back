<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Session Example1</h1>
	<%-- <form method="post" action="${pageContext.request.contextPath}/ch08/session/result"> --%>
	<form method="post" action="/ch08/session">
		아이디 : <input type="text" name="id"><p>
		비밀번호 : <input type="password" name="pwd"><p/>
		<input type="submit" value="로그인">
	</form>
</body>
</html>