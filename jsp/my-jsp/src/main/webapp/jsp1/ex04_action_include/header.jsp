<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String siteName = "JSP Study";
    %>
	<header>
		<%-- 
              include 지시자로 파일을 합치면
              변수 이름으로 출력 -> 변수 공유
              <h1><%= siteName %></h1> 
        --%>
		<%-- 
              액션 include로 파일을 합치면
              request.getParameter("키")로 출력
        --%>
		<h1><a href="index.jsp"><%= request.getParameter("siteName") %></a></h1>
		<nav>
			<ul>
				<li><a href="sub.jsp">서브 페이지1</a></li>
				<li><a href="#">서브 페이지2</a></li>
				<li><a href="#">서브 페이지3</a></li>
			</ul>
		</nav>
	</header>
</body>
</html>