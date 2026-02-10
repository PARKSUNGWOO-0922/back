<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
    VSCode에서 JSP Language Support 프로그램을 추가
    	- JSP syntax highlighting
    	- JSP emmet 기능 향상 
--%>
    <!-- HTML 주석 -->
    <%-- JSP 주석 --%>
    <%-- JSP 표현식 --%>
    <%-- JSP1.0 Legacy --%>
	<%= request.getAttribute("info") %>
    <%-- JSP2.0, EL, Modern --%>
    ${info}
</body>
</html>