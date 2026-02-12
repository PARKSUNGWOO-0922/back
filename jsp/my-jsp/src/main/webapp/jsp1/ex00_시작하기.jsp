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
			스크립틀릿<% %>	Java 로직 			 -> JSTL
			표현식	<%= %>	출력 ->EL				->EL ${}
			=================================
 		3.액션 태그                                ->일부 JSTL
 			
 		
 	1.페이지 디렉티브
 	 <%@ page import =  "패키지.클래스,..." %>
  --%>
  <%--
  			
	 <%! %>는 클래스의 멤버 변수를 만드는 것이고, <% %>는 메서드 안의 지역 변수를 만드는 것입니다. 
	 이 차이 때문에 프로그램이 동작할 때 메모리 관리와 데이터 유지 방식이 완전히 달라져요.
	
	1. 한눈에 비교하기
	구분			<%! sum1 = 0 %> (선언문)				<% int sum = 0; %> (스크립틀릿)
	변수 종류	멤버 변수 (Field)					지역 변수 (Local Variable)
	생성 위치	변환된 Servlet 클래스의 바깥쪽		_jspService() 메서드 내부
	생명 주기	서버(서블릿)가 실행되는 동안 유지됨	해당 페이지를 요청할 때마다 생성/소멸
	공유 여부	모든 사용자가 하나의 변수를 공유		나 혼자만 사용하는 독립적인 변수
	
	2. 상세 설명
	<%! int sum1 = 0 %> (선언문 - Declaration)
	이 방식은 서블릿 클래스의 **필드(멤버 변수)**로 선언됩니다.
	공유 경제: 여러 명이 이 페이지에 접속해도 서버에는 sum1이 단 하나만 존재합니다.
	누적 발생: 만약 코드 아래에서 sum1++를 한다면, A 사용자가 접속해서 1이 된 값이 B 사용자가 접속했을 때 2가 되어 나타납니다.
	주의: 멀티스레드 환경에서 데이터가 꼬일 수 있어 실무에서는 상태를 저장하는 용도로 잘 쓰지 않습니다.
	
	<% int sum = 0; %> (스크립틀릿 - Scriptlet)
	이 방식은 _jspService()라는 메서드 내부에 선언됩니다.
	개인주의: 사용자가 페이지를 새로고침(요청)할 때마다 변수가 새로 만들어지고 0으로 초기화됩니다.
	독립적: 다른 사용자가 접속해도 나만의 sum 변수가 따로 존재하므로 서로 영향을 주지 않습니다.
	일반적인 용도: 계산이나 조건문 등 해당 페이지에서 일회성으로 사용할 변수를 선언할 때 주로 사용합니다.
  		
   --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 시작하기</title>
</head>
<body>
	<h1>Hello JSP</h1>
	<%! // 선언문(Declaration)
        // 변수 선언 -> 클래스의 멤버 변수로 변환
        int totalCount = 100;

        // 메서드 정의
        public int plus(int a, int b) {
            return a + b;
	    }
    %>

	<!-- HTML 주석 -->
	<%-- JSP 주석: 페이지 소스 보기에 출력x --%>
	<%
        // 스크립틀릿(Scriptlet)
        // Java 로직(제어문, ...) 
		// 메서드 정의❌❌
        // 변수 선언 -> _jspService() 메서드 안의 지역 변수로 변환
        int sum = 0;

        // 제어문
        for (int i = 1; i <= 10; i++) {
            sum += i;
        }
        System.out.println("콘솔 출력: " + sum);

        // out은 JSP 브라우저 출력용 내장객체
        out.println("JSP out 내장객체로 출력: " + sum);
	%>

	<%--
    	표현식(Expression)
            - 출력용 Java 코드
            - 변수, 메서드 호출
    	    <%= 변수 %>
    	    <%= 메서드() %>
    --%>
	<p>
		현재 시간:
		<%=new Date()%></p>
	<p>
		JSP 표현식으로 출력(이전 방식):
		<%=sum%></p>
</body>
</html>




