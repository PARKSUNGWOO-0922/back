package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.DBConnectionMgr;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.요청 파라미터 한글처리
		request.setCharacterEncoding("UTF-8");
		//2.
		String id = request.getParameter("id");
		String userpw = request.getParameter("userpw");
		//3.데이터베이스 처리
		String sql = "INSERT INTO users (id,userpw) VALUES(?,?)";
		//DBconnectionMgr.java에서 getConnection()를 정의
		try (Connection conn = DBConnectionMgr.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql)) {
			psmt.setString(1,id);
			psmt.setString(2,userpw);
			
			int result = psmt.executeUpdate();
			
			if(result > 0) {
				// 저장 성공
				response.sendRedirect("view/success.jsp");
			}
		} catch (Exception e) {
				//저장 실패
				e.printStackTrace()	;
				response.getWriter().append("DB Error: " + e.getMessage());
		}
	}

}
