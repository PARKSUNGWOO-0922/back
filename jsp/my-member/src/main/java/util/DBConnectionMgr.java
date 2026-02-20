package util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionMgr {

		private static final String URL =
		"jdbc:mysql://localhost:3306/testdb?serverTimezone=Asia/Seoul&useSSL=false";
		private static final String USER = "subway";
		private static final String PASSWORD = "1234";
		
		public static Connection getConnection() {
			try {
				 Class.forName("com.mysql.cj.jdbc.Driver");
					return DriverManager.getConnection(URL, USER, PASSWORD);
			} catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
					return null;
        }
    }
}