<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list</title>
</head>
<body>
	<a href="/Ch08/member/register.do">직원등록</a>
	
	<h4>직원목록</h4>
	<table border="1"> 
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>입사일</th>
			<th>관리</th>
		</tr>
		
	<c:forEach var="member" items="${requestScope.members}">
		<tr>
			<td>${member.uid}</td>
			<td>${member.name}</td>
			<td>${member.hp}</td>
			<td>${member.pos}</td>
			<td>${member.dep}</td>
			<td>${member.rdate}</td>
			<td>
				<a href="/Ch08/member/modify.do?uid=${member.uid}">수정</a>
				<a href="/Ch08/member/delete.do?uid=${member.uid}">삭제</a>
			</td>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>













