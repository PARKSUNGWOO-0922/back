<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
	<jsp:useBean id="객체명" class="전체클래스명(패키지포함)"/>
		- 자바 객체를 생성하거나 기존 객체를 찾는다.
		- id는 setProperty와 getProperty의 name과 같아야 한다.
		
		클래스타입 객체(인스턴스) = new 생성자();
		Ch09JavaBeans test = new Ch09JavaBeans();
--%>
<jsp:useBean id="test" class="jsp.Ch09JavaBeans"/>
<%--
	<jsp:setProperty name="객체명" property="속성" value="값" />
		- 빈 객체의 필드 값 설정
		- name은 useBean의 id
		
		// setter
		public void setMessage(String message) {
			this.message = message;
		}
 --%>
<jsp:setProperty name="test" property="message" value="빈을 쉽게 정복하자" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>간단한 빈 프로그래밍</h1>
	<br>
	<%--
		<jsp:getProperty name="test" property="message" />
			- 빈 객체에 저장된 값을 가져와 화면 출력
			- name은 useBean의 id
			
			public String getMessage() {
				return message;
			}		
	 --%>
	Message: <jsp:getProperty name="test" property="message" />
</body>
</html>