<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 파라미터 수신
request.setCharacterEncoding("utf-8");

String uid =request.getParameter("uid");
String name =request.getParameter("name");
int gender = Integer.parseInt(request.getParameter("gender"));
String hp =request.getParameter("hp");
String email =request.getParameter("email");
String pos =request.getParameter("pos");
String dep =request.getParameter("dep");


// DB정보
String host = "jdbc:mysql://54.180.99.142:3306/wlstjd3398";
String user = "wlstjd3398";
String pass = "limited";


try{
//1단계 - JDBC 드라이버 로드
Class.forName("com.mysql.jdbc.Driver");

//2단계 - 데이터베이스 접속
Connection conn= DriverManager.getConnection(host, user, pass);

//3단계 - SQL 실행객체 생성
Statement stmt = conn.createStatement();

//4단계 - SQL 실행
String sql = "INSERT INTO `Employee` VALUES ('"+uid+"', '"+name+"', '"+gender+"', '"+hp+"', '"+email+"', '"+pos+"', '"+dep+"', NOW());";
stmt.executeUpdate(sql);

//5단계 - SQL 결과셋 처리(SELECT 일 경우)
//6단계 - 데이터베이스 종료
conn.close();

}catch(Exception e){
	e.printStackTrace();
}

// 리다이렉트
response.sendRedirect("../TestInsert.jsp");
%>