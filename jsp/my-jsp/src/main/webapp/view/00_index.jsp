<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%--page 디렉티브 --%>   
 <%@ page import =  "java.util.Date" %>   
 <%--taglib 디렉티브 --%>
 <%-- 톰캣9.0이전 --%>
 <%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
 <%-- 톰캣10.1 --%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
 <%--
 	JSP 구성 요소
 		1. 디렉티브 (Directive)
 			-<%@ page %>
			-<%@ include %>
			-<%@ taglib %> -> JSTL 라이브러리 연결
 		2.스크립트 요소(Script)
 			=================================
 			종류		문법		설명
 			---------------------------------
			선언문	<%! %>	변수·메서드 선언
			스크립틀릿	<% %>	Java 로직 			 -> JSTL
			표현식	<%= %>	출력 ->EL				->EL ${}
			=================================
 		3.내장 객체
 			==========================
 			객체				역할
 			--------------------------
			request			요청 정보
			response		응답
			session			세션
			application		서버 전역
			out				출력
			pageContext		JSP 환경
			==========================
 		
 	1.페이지 디렉티브
 	 <%@ page import =  "패키지.클래스,..." %>
  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 시작하기</title>
</head>
<body>
    <h1>Hello JSP</h1>
    <!-- HTML 주석 -->
    <%-- JSP 주석: 페이지 소스 보기에 출력x --%>
    <%
        // 스크립틀릿❌ -> JSTL로 전환
        /* Java 로직(제어문, ...) 
           자바의 주석
        */

       int sum = 0;
       for (int i = 1; i<=10; i++) {
            sum += i;
       }
       System.out.println("콘솔 출력: " + sum);

       // out은 JSP 브라우저 출력용 내장객체
       out.println("JSP out 내장객체로 출력: " + sum);
    %>

    <%-- JSTL+EL  --%>
    <c:set var="sum2" value="0" />
    <c:forEach var="i" begin="1" end="10">
        <%-- sum2 = sum2 + 1 --%>
        <c:set var="sum2" value="${sum2 + i}" />
    </c:forEach>

    <%--
    	표현식 
            - 출력용 Java 코드
            - 변수, 메서드 호출문
    	    <%= 변수 %>
    	    <%= 메서드() %>
    --%>
    <p>현재 시간: <%= new Date() %></p>
    <p>JSP 표현식으로 출력(이전 방식): <%= sum %></p>
    <p>JSP 표현식으로 출력(EL): ${sum2}</p>
</body>
</html>












