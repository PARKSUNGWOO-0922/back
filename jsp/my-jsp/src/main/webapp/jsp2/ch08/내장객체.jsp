<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체(EL+JSTL)</title>
</head>
<body>

	<%-- request.getParameter("userid"): <%= request.getParameter("userid") %><br>
	request.getContextPath(): <%= request.getContextPath() %><br>
	
	<% request.setAttribute("msg","hello"); %>
	request.getAttribute("msg"): <%= request.getAttribute("msg") %> --%>
	
    <%-- EL --%>
	request.getParameter("userid"): ${param.userid}<br>
	request.getContextPath(): ${pageContext.request.contextPath}<br>
	
	<%-- scope: page, request, session, application --%>
    <%-- JSTL --%>
	<c:set var="msg" value="hello" scope="request" />
	request.getAttribute("msg"): ${msg}
	
	<%-- 6. out: 브라우저에 내용 출력 객체 --%>
	<%-- <%
		int totalBuffer = out.getBufferSize(); // 설정된 전체 버퍼 크기
		int remainBuffer = out.getRemaining(); // 현재 사용 가능한 남은 버퍼 크기
	%>
	<h1>Out Example1</h1>
	<p><b>현재 페이지의 Buffer 상태</b></p>
	<p>출력 Buffer의 전체 크기 : <%=totalBuffer%>byte</p>
	<p>남은 Buffer의 크기 : <%=remainBuffer%>byte</p>
	<p>현재 Buffer의 사용량 : <%= totalBuffer - remainBuffer %>byte</p> --%>

	<%-- JSTL --%>
	<c:set var="total" value="${pageContext.out.bufferSize}" />
	<c:set var="remain" value="${pageContext.out.remaining}" />

	<h1>Out Example1(JSTL+EL)</h1>
	<p><b>현재 페이지의 Buffer 상태</b></p>
	<p>출력 Buffer의 전체 크기 : ${total}byte</p>
	<p>남은 Buffer의 크기 : ${remain}byte</p>
	<p>현재 Buffer의 사용량 : ${total - remain}byte</p>


	<%-- response.sendRedirect("ex03_main.jsp"); --%>
	<%-- <c:redirect url="ex03_main.jsp" /> --%>
	
	<% session.setAttribute("nick", "길동"); %>
	 <% String str = (String) session.getAttribute("nick"); %>
	 별명:<%=str%>
	 
	 <%-- 세션에 데이터 저장[EL] --%>
	<c:set var="nick" value="길동" scope="session" />
	
	별명(EL): ${sessionScope.nick}
</body>
</html>



