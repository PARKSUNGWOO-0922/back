<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체</title>
</head>
<body>
	<%-- 1. 인코딩 설정: 
		- 클라이언트가 보낸 POST 방식의 데이터의 한글 깨짐 방지 
	--%>
	<% request.setCharacterEncoding("UTF-8"); %>
	
	<%-- 2. URL 파라미터 또는 <form> 데이터 가져오기(읽기) --%>
	request.getParameter("userid"): <%= request.getParameter("userid") %><br>
	<%-- 3. 프로젝트 루트 경로 가져오기(예, my-jsp) --%>
	request.getContextPath(): <%= request.getContextPath() %><br>
	
	<h2>request 데이터 저장</h2>
	<%-- 4. 요청이 유지되는 동안 데이터 저장(지정)하기 --%>
	<% request.setAttribute("msg","헬로우"); %>
	<%-- 5. 저장된 데이터 가져오기 --%>
	request.getAttribute("msg"): <%= request.getAttribute("msg") %>
	
	<%-- 6. out: 브라우저에 내용 출력 객체 --%>
	<%
		int totalBuffer = out.getBufferSize(); // 설정된 전체 버퍼 크기
		int remainBuffer = out.getRemaining(); // 현재 사용 가능한 남은 버퍼 크기
		int useBuffer = totalBuffer - remainBuffer; // 실제 사용 중인 버퍼 크기
	%>
	<h1>Out Example1</h1>
	<p><b>현재 페이지의 Buffer 상태</b></p>
	<p>출력 Buffer의 전체 크기 : <%=totalBuffer%>byte</p>
	<p>남은 Buffer의 크기 : <%=remainBuffer%>byte</p>
	<p>현재 Buffer의 사용량 : <%=useBuffer%>byte</p>
	
	<%-- 7. 브라우저에게 해당 경로로 다시 접속하라고 명령 
		- HTML 내용들이 화면에 보이기 전에 즉시 페이지가 전환된다.
	--%>
	<%-- response.sendRedirect("ex03_main.jsp"); --%>
	
	<%--session --%>
	<h2> session데이터 저장 </h2>
	<% session.setAttribute("nick", "길동"); %>
	별명: <%= session.getAttribute("nick") %> 
	session.getAttribute("nick"): <%= session.getAttribute("nick") %>
</body>
</html>