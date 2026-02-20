<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
    <%--
		taglib: 태그 라이브러리를 사용하겠다는 뜻입니다.

		prefix="c": 앞으로 이 라이브러리의 태그들은 앞에 c:를 붙여서 쓰겠다는 약속입니다. 
					(그래서 <c:if>, <c:set>이 되는 거죠!)

		uri="...": JSTL의 표준 규격 주소입니다. 이 주소를 보고 컴퓨터가 
				"아, 이게 그 유명한 JSTL 코어 태그구나!"라고 이해합니다.    
     --%>
    
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
	<%-- 
	<% int score = 85; %>
	<% if(score >= 90) { %>
		<b>합격입니다.</b>
	<% } else { %>
		<b>불합격입니다.</b>
	<% } %>
	--%>
	
	<%--너무 지저분해서 나온 게 바로 오늘 배운 JSTL이다! --%>
	<%--자바의 if-else 구조를 JSTL에서 구현하려면 <c:if>를 두 번 쓰거나, 
		아니면 **<c:choose>**라는 태그를 사용 --%>
		
	<%-- 값 설정 --%>	
	<c:set var="score" value = "75" />
	<%-- 조건 확인 --%>
	<c:if test="${score >= 80}">
    <b>합격입니다!</b> 
    </c:if> 
	<c:if test="${score <  80}">
    <b>불합격입니다!</b> 
    </c:if> 
    
    <%--
    	 4. choose 문 (if-else 역할) 
    <c:choose>
        <c:when test="${score >= 80}">
            <b style="color: blue;">합격입니다!</b>
        </c:when>
        <c:when test="${score >= 40}">
            <b style="color: orange;">재시험 대상입니다.</b>
        </c:when>
        <c:otherwise>
            <b style="color: red;">불합격입니다.</b>
        </c:otherwise>
    </c:choose>
     --%>
</body>
</html>










