package servlet.ch03_서블릿생명주기;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 서블릿의 생명주기
 * 	1. init()
 * 	2. service()
 * 	3. doGet() 또는 doPost()
 * 	4. destroy()
 */
@WebServlet("/lifeCycle")
public class Ex01_LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 1. init()
	// - 서블릿 컨테이너(톰캣)가 객체를 최초 1회 생성 후 호출
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 호출: 서블릿 생성");
	}

	// 2. service()
	// 	- 클라이언트 요청이 있을 때마다 호출
	// 	-> 브라우저 새로고침 시 마다 호출
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service 실행");
		super.service(request, response);
	}

	// 클라이언트 요청 방식에 따라 호출
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 실행");
		// 브라우저 출력 한글 깨짐 방지
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println("init() 테스트");
		doPost(request, response);
		// HTTP 요청 방식(Method: GET|POST)을 대문자로 반환
		response.getWriter().println("요청 메서드: " + request.getMethod());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 실행");
		response.getWriter().println("일반적으로 doPost()에서 처리");
	}

	// 톰캣을 강제 종료하면 destory() 메서드가 호출되고, 서버가 종료된다.
	public void destroy() {
		System.out.println("destroy() 호출: 서블릿 소멸");
	}

}