package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import vo.MemberVO;

public class MemberDao {

	private static MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	private MemberDao() {}
	
	// DB정보
	private final String HOST = "jdbc:mysql://54.180.160.240:8080/wlstjd3398";
	private final String USER = "wlstjd3398";
	private final String PASS = "1234";
	
	public void insertMember(MemberVO vo) {
		try {
			// 1단계
			Class.forName("com.mysql.jdbc.Driver");
			// 2단계
			Connection conn = DriverManager.getConnection(HOST, USER, PASS);
			// 3단계
			String sql = "INSERT INTO `MEMBER` VALUES (?,?,?,?,?,NOW())";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getHp());
			psmt.setString(4, vo.getPos());
			psmt.setInt(5, vo.getDep());
			// 4단계
			psmt.executeUpdate();
			// 5단계			
			// 6단계
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectMember() {}
	public void selectMembers() {}
	public void updateMember() {}
	public void deleteMember() {}
}
