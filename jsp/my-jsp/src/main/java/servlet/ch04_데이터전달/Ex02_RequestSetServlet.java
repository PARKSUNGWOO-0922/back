package servlet.ch04_데이터전달;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/requestSet2")
public class Ex02_RequestSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		// 1. request 객체에 데이터 담기
		// .setAttribute(String "key", Object value);
		request.setAttribute("info", "보안 데이터");
		// 2. 목적지 경로 설정 및 포워딩(forwarding)
		// - .getRequestDispatcher("/경로")
		//		- 이동할 대상(다른 서블릿 또는 JSP) 경로 설정
		// - .forward(request, response)
		// 		- 현재 가진 request와 response 객체를 그대로 유지한 채 제어권을 넘김
		//		- URL이 바뀌지 않는다.
		request.getRequestDispatcher("/servlet/ch04/ex02.jsp").forward(request, response);
	}

}