<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <body>
        <%-- <%
            String siteName = "JSP Study";
        %> --%>
        <header>
            <%-- <h1><%= siteName %></h1> --%>
            <%-- <h1><%= request.getParameter("siteName") %></h1> --%>
            <h1>${param.siteName}</h1>
        </header>
    </body>
</html>