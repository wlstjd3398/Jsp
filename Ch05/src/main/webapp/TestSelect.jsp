<%@page import="sub1.TestMemberBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%

//DB정보
String host = "jdbc:mysql://54.180.99.142:3306/wlstjd3398";
String user = "wlstjd3398";
String pass = "limited";


List<TestMemberBean> members = new ArrayList<>();

try{
// 1단계 - 데이터베이스
Class.forName("com.mysql.jdbc.Driver");

// 2단계 - 데이터베이스 접속
Connection conn = DriverManager.getConnection(host, user, pass);

// 3단계 - SQl 실행객체 생성
Statement stmt = conn.createStatement();

// 4단계 - SQL 실행
String sql = "SELECT * FROM `Employee` ORDER BY `rdate`";
ResultSet rs = stmt.executeQuery(sql);

// 5단계 - SQL 결과셋 처리
while(rs.next()){
	TestMemberBean mb = new TestMemberBean();
	
	mb.setUid(rs.getString(1));
	mb.setName(rs.getString(2));
	mb.setGender(rs.getInt(3));
	mb.setHp(rs.getString(4));
	mb.setEmail(rs.getString(5));
	mb.setPos(rs.getString(6));
	mb.setDep(rs.getInt(7));
	mb.setRdate(rs.getString(8));

	members.add(mb);
}

// 6단계 - 데이터베이스 종료
conn.close();

}catch(Exception e){
	e.printStackTrace();
}

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>TestSelect</title>
</head>
<body>
<h3>TestSelect</h3>

<a href="./TestInsert.jsp">직원등록</a>

<h4>직원목록</h4>
<table border="1">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>성별</th>
		<th>휴대폰</th>
		<th>이메일</th>
		<th>직급</th>
		<th>부서</th>
		<th>입사일</th>
		<th>기타</th>
	</tr>
	<% for(TestMemberBean mb : members){ %>
	<tr>
		<td><%= mb.getUid() %></td>
		<td><%= mb.getName() %></td>
		<td><%= mb.getGender() %></td>
		<td><%= mb.getHp() %></td>
		<td><%= mb.getEmail() %></td>
		<td><%= mb.getPos() %></td>
		<td><%= mb.getDep() %></td>
		<td><%= mb.getRdate().substring(2, 10) %></td>
		<td>
			<a href="#">수정</a>
			<a href="#">삭제</a>
		</td>
	</tr>
	<% } %>
</table>
</body>
</html>