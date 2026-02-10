package com.dodram.notice.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dodram.notice.dto.NoticeDTO; // 우리가 만든 바구니를 가져옵니다.

//브라우저 주소창에 /noticeList 라고 치면 이 서블릿이 실행됩니다.
@WebServlet("/noticeList")
public class NoticeListServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;

 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
	
		    List<NoticeDTO> list = new ArrayList<>();
		    
		    
		    String url = "jdbc:mysql://localhost:3306/doitsql?serverTimezone=UTC&useSSL=false";
		    String user = "root"; 
		    String password = "1234"; // <- 이 부분을 꼭 수정하세요!

		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;

		    try {
		       
		        Class.forName("com.mysql.cj.jdbc.Driver");
		        
		        
		        conn = DriverManager.getConnection(url, user, password);
		        
		       
		        String sql = "SELECT id, title, writer, reg_date AS date, check_num, addr FROM notice ORDER BY id DESC";
		        pstmt = conn.prepareStatement(sql);
		        
		       
		        rs = pstmt.executeQuery();

		        while(rs.next()) {
		            
		            NoticeDTO dto = new NoticeDTO(
		                rs.getInt("id"),
		                rs.getString("title"),
		                rs.getString("writer"),
		                rs.getString("reg_date"),
		                rs.getInt("check_num"),
		                rs.getString("addr")
		            );
		            list.add(dto);
		        }
		        
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		       
		        try { if(rs != null) rs.close(); } catch(Exception e) {}
		        try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
		        try { if(conn != null) conn.close(); } catch(Exception e) {}
		    }

		   
		    request.setAttribute("noticeList", list);
		    request.getRequestDispatcher("/notice_list.jsp").forward(request, response);
		}
 }
