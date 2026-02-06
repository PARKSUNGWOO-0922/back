package controller;

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
		String path = request.getContextPath();
		response.getWriter().println("ContextPath : "+ path); // /my-jsp
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
