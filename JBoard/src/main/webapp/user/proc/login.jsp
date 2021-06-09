<%@page import="kr.co.jboard.bean.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	// DB정보
	String host = "jdbc:mysql://54.180.99.142:3306/wlstjd3398";
	String user = "wlstjd3398";
	String pw = "limited";
	
	MemberBean mb = null;
	
	try{
	// 1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계
	Connection conn = DriverManager.getConnection(host, user, pw);
	
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	String sql = "SELECT * FROM `JBOARD_MEMBER` WHERE `uid`='"+uid+"' AND `pass`=PASSWORD('"+pass+"');";
	ResultSet rs = stmt.executeQuery(sql);
	
	// 5단계
	if(rs.next()) {
		// 회원일 경우
		mb = new MemberBean();
		mb.setUid(rs.getString(1));
		mb.setPass(rs.getString(2));
		mb.setName(rs.getString(3));
		mb.setNick(rs.getString(4));
		mb.setEmail(rs.getString(5));
		mb.setHp(rs.getString(6));
		mb.setGrade(rs.getInt(7));
		mb.setZip(rs.getString(8));
		mb.setAddr1(rs.getString(9));
		mb.setAddr2(rs.getString(10));
		mb.setRegip(rs.getString(11));
		mb.setRdate(rs.getString(12));
		
	}
		
	
	// 6단계
	conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}


	// 세션 처리
	if(mb != null){
		// 회원일 경우
		session.setAttribute("sessMember", mb);
		response.sendRedirect("/JBoard/list.jsp");
		
	}else{
		// 회원아닐 경우
		response.sendRedirect("/JBoard/user/login.jsp?success=0");
		
	}
	
	// 리다이렉트
	
	

%>