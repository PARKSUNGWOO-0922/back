<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.eclipse.tags.shaded.org.apache.xalan.xsltc.compiler.util.TestGenerator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 연산자</title>
</head>
<body>
    <h1>연산자</h1>
    <h2>산술 연산자</h2>
    <%-- 표현식 --%>
    <p><%= 10 + 3 %></p>
    <p><%= 10 / 3 %></p>
    <%-- <p><%= 10 mod 3 %></p> 에러 --%>

    <%-- EL --%>
    <p>${10 + 3}</p>
    <p>${10 / 3}</p>
    <p>${13 mod 7}</p>

    <h2>비교 연산자</h2>
    <%-- 표현식 --%>
    <p><%= 10 > 3 %></p>
    <p><%= 10 < 3 %></p>
    <p><%= 10 >= 3 %></p>
    <p><%= 10 <= 3 %></p>
    <p><%= 10 == 3 %></p>
    <p><%= 10 != 3 %></p>
    <hr>
    <%-- EL --%>
    <p>${10 > 3}</p>
    <p>${10 < 3}</p>
    <p>${10 >= 3}</p>
    <p>${10 <= 3}</p>
    <p>${10 == 3}</p>
    <p>${10 != 3}</p>
    <hr>
    <p>${10 eq 3}</p>
    <p>${10 gt 3}</p>
    <p>${10 lt 3}</p>
    <p>${10 ge 3}</p>
    <p>${10 le 3}</p>

    <h2>논리 연산자</h2>
    <p><%= 10 >= 3 && 10 <= 3 %></p>
    <p><%= 10 >= 3 || 10 <= 3 %></p>
    <p><%= !(10 >= 3) %></p>
    <hr>
    <p>${10 >= 3 && 10 <= 3}</p>
    <p>${10 >= 3 || 10 <= 3}</p>
    <p>${!(10 >= 3)}</p>
    <p>${10 >= 3 and 10 <= 3}</p>
    <p>${10 >= 3 or 10 <= 3}</p>
    <p>${not (10 >= 3)}</p>

    <h2>조건(삼항) 연산자</h2>
    <% int score1 = 70; %>
    <%= score1 >= 60 ? "합격" : "불합격" %>
    <hr>
    <c:set var="score2" value="70" />
    ${score2 >= 60 ? "합격" : "불합격"}

    <h2>empty 연산자</h2>
    <%
        // 1. String을 담은 list 배열 생성
        List<String> list = new ArrayList<>();

        // 2. 리스트에 값 추가
        list.add("사과");
        list.add("포도");
        list.add("딸기");

        // 3. 리스트를 request 영역에 저장
        // -> 스크립틀릿이나 EL에서 찾을 수 있게 함
        request.setAttribute("list", list);
    %>

    <h3>목록 확인</h3>
    <%-- 스크립트릿 내부에 HTML을 직접 사용x --%>
    <% 
        List<String> resultList = (List<String>) request.getAttribute("list");
       
    	if (resultList.isEmpty()) {
    %>
    		<p>조회된 결과가 없습니다. (리스트가 비어있음)</p>
    <%
    	} else {
    %>
    		<ul>
    		<%
    			// 향상된 for
    			for (String item : resultList) {
    		%>
    				<li><%= item %></li>
    		<%
    			}
	         %>
        	</ul>
    <%
    	}
    %>
    
    <%-- 
        <c:choose> -> if
        <c:when test="값"> -> else if
        <c:otherwise> -> else
     --%>
    <c:choose>
        <%-- 
            list가 null 또는 비어있을 때("") 
            request.getAttribute("list");
        --%>
        <c:when test="${empty list}">
            <p>조회된 결과가 없습니다. (리스트가 비어있음)</p>
        </c:when>
        <%-- list에 값이 있으면 --%>
        <c:otherwise>
            <ul>
                <c:forEach var="item" items="${list}">
                    <li>${item}</li>
                </c:forEach>
            </ul>
        </c:otherwise>
    </c:choose>

    <h2>문자열 결합 연산자</h2>
    <% String name1 = "홍길동"; %>
    <%= "Hello " + name1 %>
    <%-- EL에서는 +는 산술 연산으로 사용! --%>
    <%-- <c:set var="name2" value="박자바" />
    ${"Hello " + name2} --%>
</body>
</html>