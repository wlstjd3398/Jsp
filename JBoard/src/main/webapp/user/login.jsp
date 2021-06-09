<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String success = request.getParameter("success");
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="/JBoard/css/style.css"/>
    <script>
    	var success = "<%= success %>";
    	
    	if(success == 100){
    		alert('해당하는 회원이 없습니다. \n아이디, 비밀번호를 다시 확인해 주세요');
    	}else if(success == 101){
    		alert('먼저 로그인을 하셔야 합니다.');
    	}else if(success == 102){
    		alert('정상적으로 로그아웃이 되었습니다.');
    	}
    </script>
</head>
<body>
    <div id="wrapper">
        <section id="user" class="login">
            <form action="/JBoard/user/proc/login.jsp" method="post"> 
                <table border="0">
                    <tr>
                        <td><img src="/JBoard/img/login_ico_id.png" alt="아이디"/></td>
                        <td><input type="text" name="uid" placeholder="아이디를 입력" /></td>
                    </tr>
                    <tr>
                        <td><img src="/JBoard/img/login_ico_pw.png" alt="비밀번호"/></td>
                        <td><input type="password" name="pass" placeholder="비밀번호 입력" /></td>
                    </tr>
                </table>
                <input type="submit" class="btnLogin" value="로그인"/>
            </form>

            <div class="info">
                <h3>회원로그인 안내</h3>
                <p>
                    아직 회원이 아니시면 회원으로 가입하세요.
                </p>
                <a href="/JBoard/user/terms.jsp">회원가입</a>
            </div>

        </section>
    </div>    
</body>
</html>