package servlet.ch05_세션;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/session")
public class Ex01_SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 세션 객체 생성
		HttpSession session = request.getSession();
		// 2. 세션 ID 확인
		response.getWriter().println("세션 ID: " + session.getId() + "<br>");

		// 3. 세션에 데이터 저장
		session.setAttribute("userName", "홍길동");
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println("세션에 사용자 이름 저장 완료!<br>");

		// 4. 세션 데이터 조회
		String name = (String) session.getAttribute("userName");
		response.getWriter().println("세션에 저장된 사용자 이름: " + name + "<br>");

		// 5. 세션 데이터 삭제
		session.removeAttribute("userName");
		response.getWriter().println("세션으로부터 데이터 삭제!<br>");
		name = (String) session.getAttribute("userName");
		response.getWriter().println("세션에 저장된 사용자 이름: " + name + "<br>");

		// 6. 세션 유지 시간(단위: 초)
		// 10분 설정으로 변경, 기본값은 30분
		session.setMaxInactiveInterval(600); 
		
		// 7. 세션 무효화
		//session.invalidate();

	}

}