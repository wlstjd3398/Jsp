package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.UserVO;

public class UserDao {

	private static UserDao instance = new UserDao();
	
	public static UserDao getInstance() {
		return instance;
	}
	
	private UserDao() {}
	
	private final String HOST = "jdbc:mysql://54.180.160.240:3306/chhak2021";
	private final String USER = "chhak2021";
	private final String PASS = "1234";
	
	public void insertUser(UserVO vo) {
		try {
			// 1단계
			Class.forName("com.mysql.jdbc.Driver");
			// 2단계
			Connection conn = DriverManager.getConnection(HOST, USER, PASS);
			// 3단계
			String sql = "INSERT INTO `USER1` VALUES (?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getHp());
			psmt.setInt(4, vo.getAge());
			// 4단계
			psmt.executeUpdate();
			// 5단계			
			// 6단계
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public UserVO selectUser(String uid) {
		
		UserVO vo = new UserVO();
		
		try {
			// 1단계
			Class.forName("com.mysql.jdbc.Driver");
			// 2단계
			Connection conn = DriverManager.getConnection(HOST, USER, PASS);
			// 3단계
			String sql = "SELECT * FROM `USER1` WHERE `uid`=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
			
			// 4단계
			ResultSet rs = psmt.executeQuery();
			// 5단계
			if(rs.next()) {
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setAge(rs.getInt(4));
			}
			
			// 6단계
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public List<UserVO> selectUsers() {

		List<UserVO> Users = new ArrayList<>();
		
		try {
			// 1단계
			Class.forName("com.mysql.jdbc.Driver");
			// 2단계
			Connection conn = DriverManager.getConnection(HOST, USER, PASS);
			// 3단계
			String sql = "SELECT * FROM `USER1`";
			PreparedStatement psmt = conn.prepareStatement(sql);
			// 4단계
			ResultSet rs = psmt.executeQuery();
			// 5단계
			while(rs.next()) {
				UserVO vo = new UserVO();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setAge(rs.getInt(4));
				
				Users.add(vo);
			}
			
			// 6단계
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return Users;
	}
	
	public void updateUser(UserVO vo) {
		try {
			// 1단계
			Class.forName("com.mysql.jdbc.Driver");
			// 2단계
			Connection conn = DriverManager.getConnection(HOST, USER, PASS);
			// 3단계
			String sql  = "UPDATE `USER1` SET `name`=?, `hp`=?, `age`=? ";
			       sql += "WHERE `uid`=?";
			       
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getHp());
			psmt.setInt(3, vo.getAge());
			psmt.setString(4, vo.getUid());
			
			// 4단계
			psmt.executeUpdate();
			// 5단계
			// 6단계
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteUser(String uid) {
		try {
			// 1단계
			Class.forName("com.mysql.jdbc.Driver");
			// 2단계
			Connection conn = DriverManager.getConnection(HOST, USER, PASS);
			// 3단계
			String sql = "DELETE FROM `USER1` WHERE `uid`=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
			
			// 4단계
			psmt.executeUpdate();
			// 5단계
			// 6단계
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}














