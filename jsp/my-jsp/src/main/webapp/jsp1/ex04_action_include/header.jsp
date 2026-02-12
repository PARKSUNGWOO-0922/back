<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>공통 헤더 페이지</title>
    </head>
    <body>
        <%
            String siteName = "Welcome to Subwayy";
        %>
       	<header>
		 <h1><%= siteName %></h1> 
            <h2><%= request.getParameter("siteName") %></h2>
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