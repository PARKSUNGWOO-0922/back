<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%-- 
	스크립팅 요소(Scripting Elements)
		1. 선언문(Declaration)
		2. 스크립틀릿(Scriptlet)
		3. 표현식(Expression)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 선언문</title>
</head>
<body>
	<%-- 
		1. 선언문(Declaration)
			- <%! %>
			- 변수 및 메서드 정의
			- 서블릿 변환 시 위치: 클래스 멤버(필드/메서드)		
	--%>
	<%! 
		// 변수
		int totalCount = 100; 
		// 메서드 정의
		public int plus(int a, int b) {
			return a + b;
		}
        // 새로 고침시 안바뀐다.
        // 서버(톰캣) 종료 후 다시 실행하면 바뀐다.
        // now1 객체 생성
        Date now1 = new Date();
    %>


	<%-- 
		2. 스크립틀릿(Scriptlet)
			- <% %>
			- 자바 로직
			- 변수 정의 가능
			- 메서드 정의❌
			- 서블릿 변환 시 위치: _jspService() 메서드 내부		
	 --%>

	<% 
        // now2 객체 생성
        // 새로 고침시 바뀐다.
        Date now2 = new Date(); 

		// 변수 선언 및 할당
		int sum = 0;
		// 제어문
		for (int i=1; i<=10; i++) {
			sum += i;
		}
    %>

	<%-- 
		3. 표현식(Expression)
			- <%= %>
			- 출력
			- 변수, 메서드 호출 등 값으로 표현되는 모든 것
			- 서블릿 변환 시 위치: out.print() 메서드 인자		
	--%>
	<h1>출력하기</h1>
	1. totalCount 변수 값: <%= totalCount %><br>
	2. plus(10, 20) 메서드 호출: <%= plus(10, 20) %>
	3. 선언문으로 작성한 now1 변수 값: <%= now1 %><br>
	4. 표현식에 직접 작성(new Date())한 값: <%= new Date() %><br>
	<p>5. 스크립틀릿으로 작성한 now2 변수 값: <%= now2 %></p>
	<p>6. 합계: <%= sum %></p>

</body>
</html>