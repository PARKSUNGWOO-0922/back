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
		<% %> 안은 자바 코드
		HTML 출력은 블록 밖에서 실행
	 --%>
	<%--<% %> 안에는 HTML 태그를 직접 쓸 수 없습니다. --%>
	<%--jsp파일은 코드 수정시 다시실행필요없이 저장후 브라우저 새로고침으로 가능 --%>
	<% int score = 85; %>
	<% if(score >= 90) { %>
		<b>합격입니다.</b>
	<% } else { %>
		<b>불합격입니다.</b>
	<% } %>
	
	<%--너무 지저분해서 나온 게 바로 오늘 배운 JSTL이다! --%>
	<%--<c:if test="${score >= 80}">
    <b>합격입니다!</b>  </c:if> --%>
</body>
</html>