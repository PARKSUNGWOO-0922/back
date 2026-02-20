<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--직접쓴 코딩 덮어쓰기로 사라짐 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	    body { font-family: Arial, sans-serif; }
	    .result { margin-top: 20px; font-weight: bold; }
	</style>
</head>
<body>
		<%--한글 인코딩 설정 --%>
		<% request.setCharacterEncoding("UTF-8"); %>
		<h2>단일 파라미터 수집 </h2>
		<%= request.getParameter("name") %><br>
		<h2>숫자 파라미터 변환 </h2>
		<%
		String sAge = request.getParameter("age");
		int age = (sAge != null) ? Integer.parseInt(sAge) : 0;
		%>
		내년 나이: <%= age + 1 %>
		
		
		<h2>다중 파라미터 수집</h2>
		<h2>취미 선택</h2>
		
		<form method="post">
		    <input type="checkbox" name="hobby" value="독서"> 독서<br>
		    <input type="checkbox" name="hobby" value="운동"> 운동<br>
		    <input type="checkbox" name="hobby" value="영화감상"> 영화감상<br>
		    <input type="checkbox" name="hobby" value="게임"> 게임<br>
		    <input type="submit" value="전송">
		</form>
		
		<hr>
		
		<div class="result">
		<%
		    String[] hobbies = request.getParameterValues("hobby");
		
		    if (hobbies != null) {
		        out.print("선택한 취미 : ");
		        for (String h : hobbies) {
		            out.print(h + " ");
		        }
		    } else {
		        out.print("선택한 취미가 없습니다.");
		    }
		%>
		<%--패키지 다중 임포트 --%>
		<%--ArrayList를 사용하기 위해 임포트 지시자를 작성(ctrl+space) --%>
			<% ArrayList<String> list = new ArrayList<>(); %>
		</div>
</body>
</html>