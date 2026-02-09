package servlet.ch01_서블릿설정및응답기초;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/requestMethod")
public class Ex03_RequestMethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Context Root는 우리 프로젝트의 대문 주소이고, 
	// 지금 코드에 나온 Context Path는 그 대문 주소를 자바가 인식하는 변수 이름
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*
			request.getContextPath()
			- 웹 애플리케이션의 루트 경로(Context Root) 반환
			- 예) 프로젝트명이 my-jsp이면 '/my-jsp'를 반환
			-> 용도: 서버 내에서 파일 경로나 이동 경로를 동적으로 지정할 때 필수!
			아래부터 복사...
		*/
		String path = request.getContextPath();
		response.getWriter().println("ContextPath : "+ request.getContextPath()); // /my-jsp
		response.getWriter().println("ContextPath : "+ request.getServletPath()); 
		response.getWriter().println("ContextPath : "+ request.getRemoteAddr()); 
		response.getWriter().println("ContextPath : "+ request.getRequestURI()); 
		response.getWriter().println("ContextPath : "+ request.getRequestURL()); 
		
		response.getWriter().println("ContextPath : "+ request.getMethod()); 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
