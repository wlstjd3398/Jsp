<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>5_2_Select</title>
</head>
<body>
<h3>2.select 실습하기</h3>

<a href="./5_1_Insert.jsp">직원등록</a>

<h4>직원목록</h4>
<table border="1">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>휴대폰</th>
		<th>직급</th>
		<th>부서</th>
		<th>입사일</th>
		<th>기타</th>
	</tr>
	
	<tr>
		<td>a101</td>
		<td>홍</td>
		<td>101-1010-1111</td>
		<td>과장</td>
		<td>영업1부</td>
		<td>2021-06-02</td>
		<td>
			<a href="#">수정</a>
			<a href="#">삭제</a>
		</td>
	</tr>
</table>
</body>
</html>