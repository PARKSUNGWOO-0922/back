package jsp;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

import java.io.IOException;

@WebServlet("/ch08/session")
public class Ch08SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		//세션 생성(Servlet에서는 객체 생성필요/jsp에서는 그냥 사용?
		//JSP는 실행될 때 이미 HttpSession 객체를 자동으로 만들어주기 때문에
		//우리가 직접 만들 필요가 없습니다.)
		
		HttpSession session = request.getSession();
		
		// session.setAttribute(String key, Object value);
		// 세션(Session)에 데이터를 저장하여 같은 사용자에 대해 여러 요청 동안 공유할 수 있게 하는 메서드
		session.setAttribute("idKey",id);
		// session.setMaxInactiveInterval(int seconds);
		// 세션(Session)의 유효 시간을 설정
		session.setMaxInactiveInterval(60*5);
		// request.getRequestDispatcher("/jsp2/ch08/ex05_session_pro.jsp").forward(request, response);
		request.getRequestDispatcher("/view/jsp2/ch08_내장객체/ex05_session_pro.jsp").forward(request, response);
	}

}
