<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체: request</title>
</head>
<body>
	<h1>Request Example1(JSTL+EL)</h1>
	<p>성명 : ${name}</p>
	<p>학번 : ${studentNum}</p>
	<p>성별 : ${gender}</p>
	<p>학과 : ${major}</p>
	
	<%-- <%
		if (habbies != null) {
			for (String habby : habbies) {
	%>
				<p>취미: <%= habby %></p>
	<%
			}
		}
	%> --%>

	<c:if test="${habbies ne null}">
		<c:forEach var="habby" items="habbies">
			<p>취미: ${habby}</p>
		</c:forEach>
	</c:if>


</body>
</html>