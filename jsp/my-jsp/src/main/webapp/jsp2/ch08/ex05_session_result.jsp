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
		<%-- String id = (String) session.getAttribute("idKey");--%>
		<%--String sessionId = session.getId(); --%>
		<%-- int intervalTime = session.getMaxInactiveInterval();--%>

		<%-- >if(id != null){ --%>
<c:choose>
	<c:when test="${idkey != null}">
	<h1>Session Example1</h1>
	<p><b>${idKey}</b>님이 좋아하시는 계절과 과일은</p>
	<p><b>${season}</b>과 <b>${fruit}</b> 입니다.</p>
	<%--session.getId(); --%>
	<p>세션 ID : ${pageContext.session.id}</p>
	
	<%-- session.getMaxInactiveInterval(); --%>
	<p>세션 유지 시간 : ${pageContext.session.maxInactiveInterval}초</p>
	
<%-- 	<% session.invalidate(); %> --%>
	<%-- 	} else { --%>
			<p> 세션의 시간이 경과를 하였거나 다른 이유로 연결을 할 수가 없습니다.</p>;
	<%--   } --%>
	
	</c:when>
</c:choose>
</body>
</html>