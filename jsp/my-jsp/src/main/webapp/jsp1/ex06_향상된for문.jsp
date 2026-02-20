<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>향상된for문</h2>
		<% String[] fruits = {"사과", "바나나", "포도"}; %>
	<ul>
	<% for(String f : fruits) { %>
		<li><%= f %></li>
	<% } %>
	</ul>
	
<%-- JSTL+EL --%>
    <%-- 에러: EL 안에 new 키워드로 객체 생성할 수 없다.
        <c:set var="fruits1" value='${new String[] {"사과", "바나나", "포도"}}' />
    --%>
    <%-- JSTL+표현식 --%>
    <c:set var="fruits2" value='<%= new String[] {"사과", "바나나", "포도", "딸기", "수박", "참외"} %>' />

    <%--
        첫 번째 형식: 
            <c:forEach var="변수명" begin="시작값" end="끝깞" [step="증감값"]> 
        두 번째 형식:
            <c:forEach var="변수명" items="${배열명}" [varStatus="상태변수명"]> 
            속성	의미
            index	0부터
            count	1부터
            first	첫 요소 여부
            last	마지막 요소 여부
    --%>

    <ul>
        <c:forEach var="fruit" items="${fruits1}">
            <li>${fruit}</li>
        </c:forEach>
    </ul>
    <ul>
        <c:forEach var="fruit" items="${fruits2}" varStatus="st">
            <%-- index: 0,1,2... --%>
            <li>${st.index + 1}-${fruit}</li>
            <%-- count: 1,2,3... --%>
            <%-- <li>${st.count}${fruit}</li> --%>
            <%-- first: 첫 번째 요소만 true, 나머지는 false --%>
            <%-- <li>${st.first}${fruit}</li> --%>
            <%-- last: 마지막 요소만 true, 나머지는 false --%>
            <%-- <li>${st.last}${fruit}</li> --%>
        </c:forEach>
    </ul>

</body>
</html>