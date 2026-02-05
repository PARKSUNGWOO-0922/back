package controller;
// jakarta 톰캣 10.0+
//
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class HelloServlet
 * 
 * web.xml 도는 @WebServlet("URL 맵핑주소") 애노테이션
 * http://localhost:8080/프로젝트명/URL맵핑
 * http://localhost:8080/my-jsp/hello
 * 실행(run):ctrl+F11
 */
@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Hello Console!");
		response.getWriter().println("Hello Java!");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
