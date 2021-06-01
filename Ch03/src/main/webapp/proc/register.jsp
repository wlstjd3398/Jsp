<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>register</title>
</head>
<body>
	<h3>회원가입 정보 수신</h3>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobby"); // value 에 s 쓰는것과 같이 복수형을 쓰면 배열[]을 쓴다
	String addr = request.getParameter("addr");
	%>

	<p>
		이름 : <%= name %><br/>
		성별 : 
		<%=gender.equals("1") ? "남자": "여자" %><br/>  
		취미 : 
		<% 
		for(String hobby : hobbies){
			out.print(hobby+", ");
		}
		%>
		<br/>
		주소 : <%= addr %><br/>
	</p>
	

</body>
</html>