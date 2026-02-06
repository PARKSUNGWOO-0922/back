<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>도드람몰 - 공지사항(Backend)</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/notice/notice.css" />
</head>
<body>
    <main>
        <div class="container">
            <h1 class="title">공지사항 (Java Servlet 버전)</h1>
            
            <div class="search-box">
                <input type="text" placeholder="검색어를 입력해 주세요.">
                <button>검색</button>
            </div>

            <table class="notice-table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>날짜</th>
                        <th>작성자</th>
                        <th>조회</th>
                    </tr>
                </thead>
                <tbody>
    <%
        // 1. 서블릿이 보낸 기차(list)를 꺼냅니다.
        java.util.List<com.dodram.notice.dto.NoticeDTO> list = 
            (java.util.List<com.dodram.notice.dto.NoticeDTO>) request.getAttribute("noticeList");

        // 2. 데이터가 있다면 반복문을 돌립니다.
        if (list != null) {
            for (com.dodram.notice.dto.NoticeDTO notice : list) {
    %>
                <tr>
                    <td><%= notice.getId() %></td>
                    <td><a href="<%= notice.getAddr() %>"><%= notice.getTitle() %></a></td>
                    <td><%= notice.getDate() %></td>
                    <td><%= notice.getWriter() %></td>
                    <td><%= notice.getCheckNum() %></td>
                </tr>
    <%
            }
        }
    %>
</tbody>
            </table>

            <div class="pagination">
                <a href="#" class="active">1</a>
            </div>
        </div>
    </main>
</body>
</html>