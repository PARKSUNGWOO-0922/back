<%-- <%@ page language="java"
         contentType="text/html; charset=ISO-8859-1"%> --%>
<%@ page language="java"
         pageEncoding="EUC-KR" %>
<%-- <%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %> --%>

<%-- 
    pageEncoding="UTF-8"
        - 서버 내부용
        - JSP 파일이 서버(Tomcat 등)에 저장될 때 어떤 인코딩으로 작성되었는지 알려준다.
        - 서버가 JSP 코드를 읽어서 서블릿(Java)으로 변환할 때, 
          이 설정이 없으면 서버 기본값(보통 ISO-8859-1)으로 소스코드를 읽는다. 
          이때 코드 내의 한글 주석이나 문자열이 서버 내부에서 깨질 수 있다.
    
    contentType="text/html; charset=UTF-8"
        - 브라우저(클라이언트) 전달용
        - 서버가 실행 결과를 브라우저로 보낼 때, 응답 헤더(HTTP Header)에 담기는 정보이다.
        - 브라우저는 이 정보를 보고 "이 데이터는 UTF-8 방식으로 그려야겠구나"라고 판단한다. 
          이게 없으면 브라우저가 자기 마음대로(예: EUC-KR) 해석해서 화면에 외계어를 출력한다.
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한글 테스트</title>
</head>
<body>
	<h1>한글 테스트</h1>
	<ul>
        <li>ISO-8859-1: 기본값</li>
        <li>EUC-KR(한글 완성형 인코딩 (국내 표준)) - 한글 2,350자 (한정적)</li>
        <li>UTF-8(유니코드 가변 길이 인코딩 (국제 표준)) - 전 세계 모든 언어 + 이모지</li>
    </ul>
</body>
</html>