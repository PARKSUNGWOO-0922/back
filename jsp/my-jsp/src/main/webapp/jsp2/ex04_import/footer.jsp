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
            int year = java.time.Year.now().getValue();
        %> --%>
        <footer>
            <%-- <p>Copyright <%= year %> <%= siteName %></p> --%>
            <%-- <p>Copyright <%= request.getParameter("year") %> <%= request.getParameter("siteName") %></p>  --%>
            <p>Copyright ${param.year} ${param.siteName}</p>
        </footer>
    </body>
</html>