<%@page import="sub1.Account"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2_4_Class</title>
</head>
<body>

<!--Account에 ctrl+spacebar 지시자 설정 가능-->

	<h3>4.JSP 클래스 실습하기</h3>
	<%
		Account kb = new Account("국민은행", "121-101-1021", "김유신", 10000);
		Account wr = new Account("우리은행", "111-111-1021", "김춘추", 20000);
	
		kb.deposit(40000);
		kb.withdraw(7000);
		kb.show(out);
		
		wr.deposit(20000);
		wr.withdraw(5000);
		wr.show(out);
	%>
	
</body>
</html>