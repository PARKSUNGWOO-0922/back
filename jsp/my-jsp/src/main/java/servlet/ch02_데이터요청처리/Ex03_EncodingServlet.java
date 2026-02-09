package servlet.ch02_데이터요청처리;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/encoding")
public class Ex03_EncodingServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 요청 인코딩 설정
		req.setCharacterEncoding("UTF-8");
		String data = req.getParameter("data");
		// 응답 인코딩 설정
		resp.setContentType("text/html; charset=UTF-8");
		resp.getWriter().println("Data: " + data);
	}
}
