package kr.co.jboard.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	private static DBConfig instance = new DBConfig();
	private DBConfig() {}
	public static DBConfig getInstance() {
		return instance;
	}

	// DB정보
	private final String HOST = "jdbc:mysql://54.180.99.142:3306/wlstjd3398";
	private final String USER = "wlstjd3398";
	private final String PASS = "limited";
	
	public Connection getConnection() throws Exception {
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
	
		return conn;
	}
	
}
