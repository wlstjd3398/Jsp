<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	
	String uid =request.getParameter("uid");
	String pass1 =request.getParameter("pass1"); 
	String name =request.getParameter("name");
	String nick =request.getParameter("nick");
	String email =request.getParameter("email");
	String hp =request.getParameter("hp");
	String zip =request.getParameter("zip");
	String addr1 =request.getParameter("addr1");
	String addr2 =request.getParameter("addr2"); // request를 통해 server로 데이터 이동
	String regip =request.getRemoteAddr(); //client 주소를 regip request가 알고있음
	// String getRemoteAddr() : 웹 서버로 정보를 요청한 웹 브라우저의 IP주소를 리턴한다. 
	
	// DB정보
		String host = "jdbc:mysql://54.180.99.142:3306/wlstjd3398";
		String user = "wlstjd3398";
		String pass = "limited";
	
	try{
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		// 3단계
		Statement stmt = conn.createStatement();
		// 4단계
		String sql = "INSERT INTO `JBOARD_MEMBER` SET ";
				sql += "`uid`='"+uid+"',";
				sql += "`pass`=PASSWORD('"+pass1+"'),";
				sql += "`name`='"+name+"',";
				sql += "`nick`='"+nick+"',";
				sql += "`email`='"+email+"',";
				sql += "`hp`='"+hp+"',";
				sql += "`zip`='"+zip+"',";
				sql += "`addr1`='"+addr1+"',";
				sql += "`addr2`='"+addr2+"',";
				sql += "`regip`='"+regip+"',";
				sql += "`rdate`=NOW();";
	stmt.executeUpdate(sql);
				
		// 5단계
		// 6단계
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 로그인 페이지로 리다이렉트
	response.sendRedirect("/JBoard/user/login.jsp");
%>