<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sub1.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%

/*
	날짜 : 2021/06/03
	이름 : 김철할
	내용 : JSON 2 실습하기
	
	""문자란에 있는 그것을 문자로 처리한다
*/

	//DB정보
	String host = "jdbc:mysql://54.180.160.240:3306/wlstjd3398";
	String user = "wlstjd3398";
	String pass = "1234";

	List<MemberBean> members = new ArrayList<>();
	
	try{
	// 1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	String sql = "SELECT * FROM `MEMBER` ORDER BY `rdate`;";
	ResultSet rs = stmt.executeQuery(sql);
	
	// 5단계
	while(rs.next()){
		
		MemberBean mb = new MemberBean();
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));
		
		members.add(mb);
	}
	
	// 6단계
	conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}

	// List를 Json 데이터로 가공처리
	Gson gson = new Gson();
	String json = gson.toJson(members);
	
	// JSON 출력
	out.print(json);
	
	
	
%>