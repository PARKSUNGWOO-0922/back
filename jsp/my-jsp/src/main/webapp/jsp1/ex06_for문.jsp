<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%--pageContext: "야, 현재 페이지야."
	.request: "그 페이지에 들어온 '요청 객체' 좀 줘봐."
	.contextPath: "그 요청 객체 안에 저장된 '프로젝트 이름(경로)'이 뭔지 알려줘." --%>
	
<%-- ${pageContext.request.contextPath}는 프로젝트명" 그 자체라기보다는, 
		서버에서 이 프로젝트에 접근하기 위한 **'식별 주소(경로)'**를 의미: my-jsp 임.
		이클립스에서 my-jsp라는 이름으로 프로젝트를 만들면, 
		톰캣(Tomcat) 서버는 기본적으로 주소창에 http://localhost:8080/my-jsp/라고 
		쳐야 접속되도록 설정을 잡습니다.
		프로젝트 이름 = 접속 경로(Context Path)가 일치하는 경우가 
		90% 이상이라 편의상 그렇게 부르는 거죠.
		${pageContext.request.contextPath} 이 부분이 실행될 때 서버가
		 "아, 지금 내 이름은 my-jsp구나!" 하고 
		 그 글자로 샥 바꿔치기해 주는 거예요.--%>
		 
<c:set var="path" value="${pageContext.request.contextPath}"/>

  <%
  	String path = request.getContextPath();
  %>   
  <%--
  	JSTL 방식 (<c:set ... />): 이 코드는 ${path}라는 이름으로 데이터를 저장합니다.
  	                         나중에 EL 식(${ })이나 JSTL 태그 안에서 쓰기 위함입니다.
	스크립틀릿 방식 (<% String path ... %>): 이 코드는 자바 변수 path에 값을 담습니다.
					 나중에 **자바 코드(<% %>)**나 표현식(<%= %>) 안에서 쓰기 위함입니다.
	------------------------------------------------------------------------				 
	HTML/JSTL 구역: ${path}/images/1.png라고 쓰려면 <c:set>이 필요합니다.

	자바 코드 구역:	 <% if(path.equals("/admin")) { ... } %> 처럼 
				자바 로직을 태우려면 String path가 필요합니다.
   --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제어문</title>
</head>
<body>
		
	<%--이하 for --%>
	<%--JSTL + EL --%>
		<c:forEach var="i" begin="1" end="5" step="1">
		<b>${i}</b>
		<%--절대경로로 사용권장 --%>
		<%-- 
		<img src="${pageContext.request.contextPath}/images/${i}.png alt="이미지${i}">--%>
		<img src="${path}/jsp1/images/${i}.png" alt="이미지${i}">
		
		<%-- 
		<img src="${my-jsp}/jsp1/images/${i}.png" alt="이미지${i}">
			${my-jsp} (X): EL 식 안에 프로젝트 이름을 그냥 적으면, 컴퓨터는 my-jsp라는 
			이름의 변수를 찾으려고 합니다. 당연히 그런 변수는 선언한 적이 없으니
			아무 값도 출력되지 않거나 에러가 납니다.
			해결 방법: 서버가 알려주는 실제 프로젝트 경로인 ${pageContext.request.contextPath}를
			사용해야 합니다.
		<img src="/my-jsp/jsp1/images/${i}.png" alt="이미지${i}">	: 수정분
		--%>
		
	</c:forEach>
</body>
</html>