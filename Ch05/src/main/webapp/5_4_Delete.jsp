<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 파라미터 수신
request.setCharacterEncoding("utf-8");

String uid =request.getParameter("uid");

// java/Ch12/lib/java.jar -> jsp/Ch05/lib으로 복사


// DB정보
String host = "jdbc:mysql://54.180.160.240:3306/wlstjd3398";
String user = "wlstjd3398";
String pass = "1234";


try{
//1단계 - JDBC 드라이버 로드
Class.forName("com.mysql.jdbc.Driver");

//2단계 - 데이터베이스 접속
Connection conn= DriverManager.getConnection(host, user, pass);

//3단계 - SQL 실행객체 생성
Statement stmt = conn.createStatement();

//4단계 - SQL 실행
String sql = "DELETE FROM `MEMBER` WHERE `uid`='"+uid+"';";
stmt.executeUpdate(sql);

//5단계 - SQL 결과셋 처리(SELECT 일 경우)
//6단계 - 데이터베이스 종료
conn.close();

}catch(Exception e){
	e.printStackTrace();
}

// 리다이렉트
response.sendRedirect("./5_2_Select.jsp");
%>