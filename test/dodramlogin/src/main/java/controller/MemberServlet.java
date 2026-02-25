package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBConnectionMgr;

@WebServlet("/member")
public class MemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. 요청 파라미터 한글 처리
        request.setCharacterEncoding("UTF-8");
        
        String userid = request.getParameter("userid");
        String userpw = request.getParameter("userpw");

        // 2. DB 저장 로직
        String sql = "INSERT INTO users (id, userpw) VALUES (?, ?)";
        
        try (Connection conn = DBConnectionMgr.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, userid);
            pstmt.setString(2, userpw);
            
            int result = pstmt.executeUpdate();
            
            if (result > 0) {
                // 저장 성공 시 리다이렉트
                //response.sendRedirect("request.getContextPath/view/member/success.jsp");
            	//위코드로 인해 404에러 ""안이그냥 문자열로 전달되니 당연히 404
            	response.sendRedirect(request.getContextPath() + "/view/member/success.jsp");
            	//${pageContext.request.contextPath} JSP에서 사용하는 EL방식
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().append("DB Error: " + e.getMessage());
        }
    }
}