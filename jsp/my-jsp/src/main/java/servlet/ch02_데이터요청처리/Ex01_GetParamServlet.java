package servlet.ch02_데이터요청처리;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/getParam")
public class Ex01_GetParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 브라우저(클라이언트)로 요청 신호를 보냈다.
	/* 
		1. Get 방식
			// 예) 프로토콜://도메인:포트/경로?쿼리스트링
			// 예) 프로토콜://도메인:포트/경로?속성=값&속성=값& ...
			// 예) http://localhost:8080/my-jsp/getParam?userid=hong&userpw=1234

			<form [method="get"]>
			
		2. Post 방식
			<form method="post">
	*/

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 단일 파라미터 처리
		// 쿼리 스트링에서 값 읽기
		String username = request.getParameter("username");
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		
		// 문자열 -> 숫자
		// URL에 직접 입력
		int userage = Integer.parseInt(request.getParameter("userage"));

        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().println("<h1>GET 요청 처리</h1>");
        response.getWriter().println("<p>이름: " + username +"</p>");
        response.getWriter().println("<p>나이: " + userage +"</p>");
        response.getWriter().println("<p>아이디: " + userid +"</p>");
        response.getWriter().println("<p>비밀번호: " + userpw +"</p>");

		// 2. 다중 파라미터 처리
		// {"독서", "영화", "여행", "게임"}
		String[] values = request.getParameterValues("hobby");

		if (values != null) {
			for (String val : values) {
				response.getWriter().println("취미: " + val + "<br>");
			}
		}
	}

}