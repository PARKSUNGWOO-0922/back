package jsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/ch08/session/result")
public class Ch08SessionResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String season = request.getParameter("season");
		// String fruit =  request.getParameter("fruit");
		String fruit = request.getParameter("fruit");
		
		request.setAttribute("season", season);
		request.setAttribute("fruit", fruit);

		// Object value = session.getAttribute(String name);
		// - 세션에 저장된 이름(name)에 해당하는 값을 반환
		// - 세션(Session)에 저장된 값을 꺼내오는 메서드
		
		
		
		
		// request.getRequestDispatcher("/jsp2/ch08/ex05_session_result.jsp")
		request.getRequestDispatcher("/view/jsp2/ch08_내장객체/ex05_session_result.jsp")
		.forward(request, response);
	}

}
