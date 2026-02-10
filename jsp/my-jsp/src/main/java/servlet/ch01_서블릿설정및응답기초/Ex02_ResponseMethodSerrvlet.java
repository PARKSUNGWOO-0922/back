package servlet.ch01_서블릿설정및응답기초;

/*
 * 한글 응답 설정
 *  - 한글이 깨지지 않도록 컨텐츠 타입 설정
 *  response.setContentType("text/plain;charset=UTF-8");
 *  - HTML 태그를 인식하게 컨테츠 타입 설정
 *  response.setContentType("text/html;charset=UTF-8");
 *  
*/
//임포트:ctrl+shift+o
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/mime") // servlet만든후 next버튼 누르고 url..eidt버튼클릭 수정
public class Ex02_ResponseMethodSerrvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.setContentType("text/plain;charset=UTF-8");
		response.setContentType("text/html;charset=UTF-8");//되도록 맨윗줄에
		response.getWriter().println("한글");
		response.getWriter().println("<h1>한글</h1>");
		PrintWriter out = response.getWriter();
		/*
		 * 오류500
		 * 이유: response.getWriter()는 한 응답 안에서 한 번만 호출해서 변수에 담아 쓰는 게 원칙이에요. 
		 * 톰캣에 따라 이미 꺼낸 펜을 또 꺼내려고 하면 "야, 아까 가져갔잖아!"라며 
		 * 내부적으로 충돌(IllegalStateException)을 일으키고 500 에러를 뿜을 수 있습니다.
		 * */
		
		/* 
		갱신이 안되어 이전 내용으로 출력된다면?
		1. 톰캣 서버 종료
			- project > clean
				*Servlet.java -> *Servlet.class 갱신이 안되었을 때
			- servers > clean
		2. 웹 브라우저 갱신
			- ctrl+shift+del -> 캐시 삭제
	*/

	// HTML: text/html
	// HTML 태그를 인식하게 컨텐츠 타입 설정
		out.println(""
		+"<table style='border:1px solid;'>"
		+"<tr>"
		+ "<td style='border:1px solid;'>Cell 1</td>"
		+ "<td style='border:1px solid;'>Cell 2</td>"
		+ "</tr>"
		+ "</table>");
	
		// 자바스크립트
				out.println("<script>alert('Hello JavaScript!');</script>");

				// JSON(JavaScript Object Notation)
				// 예: {"name": "hong"}
				// 이스케이프 문자: \"
				response.setContentType("application/json; charset=UTF-8");
				out.println("{\"name\": \"hong\"}");

			} // doGet() 끝

			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			}

}
