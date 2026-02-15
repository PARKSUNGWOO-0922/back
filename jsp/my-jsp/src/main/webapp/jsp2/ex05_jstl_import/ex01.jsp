<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%-- JSP 2.0 / JSTL 1.x --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%-- Jakarta EE (최신), taglib 디렉티브: JSTL를 사용하기 위해 --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%-- 
    taglib	  지시자 종류
    prefix	  태그 접두어
    uri	      태그 라이브러리 식별자

    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
    <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>taglib 디렉티브 + JSTL</title>
</head>
<body>
  <%-- 
      스크립틀릿(Legacy)
      <% 
          // 변수 선언 및 할당
          int totalCount = 100; 
          int sum = 0;

          // 제어문
          for (int i = 1; i <= 10; i++) {
              sum += i;
          }           
      %>
  --%>

  <%-- JSTL(Modern) --%>
	<c:set var="totalCount" value="100" />

  <%-- for문 --%>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:set var="sum" value="${sum + i}" />
	</c:forEach>

  <%-- EL --%>
  <p>totalCount: ${totalCount}</p>
  <p>합계: ${sum}</p>
</body>
</html>