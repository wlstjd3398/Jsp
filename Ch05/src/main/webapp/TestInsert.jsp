<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>TestInsert</title>

</head>
<body>
<h3>TestInsert</h3>

<a href="./TestSelect.jsp">직원목록</a>

<h4>직원등록</h4>
<form action="./proc/TestInsertProc.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="uid"/>
			</td>
		</tr>
		
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="name"/>
			</td>
		</tr>
		
		<tr>
		<td>성별</td>
		<td>
			<label><input type="radio" name="gender" value="1"/>남자</label>
			<label><input type="radio" name="gender" value="2"/>여자</label>
		</td>
		</tr>
		
		<tr>
			<td>휴대폰</td>
			<td>
				<input type="tel" name="hp"/>
			</td>
		</tr>
		
		<tr>
			<td>이메일</td>
			<td>
				<input type="email" name="email"/>
			</td>
		</tr>
		
		<tr>
			<td>직급</td>
			<td>
				<select name="pos">
					<option>사원</option>
					<option>대리</option>
					<option>과장</option>
					<option>차장</option>
					<option>부장</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>부서</td>
			<td>
				<select name="dep">
					<option value="101">101</option>
					<option value="102">102</option>
					<option value="103">103</option>
					<option value="104">104</option>
					<option value="105">105</option>
				</select>
			</td>
		</tr>
		
		
		
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="직원등록"/>
			</td>
		</tr>
	</table>
</form>


</body>
</html>