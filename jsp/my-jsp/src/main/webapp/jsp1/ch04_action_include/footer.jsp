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
            <%
                String siteName = "JSP Study";
                int year = java.time.Year.now().getValue();

                <p>Copyright <%= year %> <%= siteName %></p>
            %> 
        --%>
        <footer>
            <p>Copyright <%= request.getParameter("year") %> <%= request.getParameter("siteName") %></p> 
        </footer>
        <%--
         (me)자바코드만 사용 , html 사용시 에러,대소문자 구분,
        --%>
    </body>
</html>