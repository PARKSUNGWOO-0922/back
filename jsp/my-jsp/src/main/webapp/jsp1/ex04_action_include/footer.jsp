<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>공통 푸터 페이지</title>
    </head>
    <body>
        <%-- <%
            int year = java.time.Year.now().getValue();
        %> --%>
        <footer>
            <%-- <p>Copyright &copy; <%= year %> <%= siteName %></p> --%>
            <p>Copyright
             <%= request.getParameter("year") %>
              <%= request.getParameter("siteName") %>
              All Right Reserved.
             
              </p> 
        </footer>
    </body>
</html>