<%@page import="kr.co.jboard.bean.TermsBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// DB정보
	String host = "jdbc:mysql://54.180.99.142:3306/wlstjd3398";
	String user = "wlstjd3398";
	String pass = "limited";

	TermsBean tb = new TermsBean();

	try{
	// 1단계
	Class.forName("com.mysql.jdbc.Driver");
	// 2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	// 3단계
	Statement stmt = conn.createStatement();
	// 4단계
	String sql = "SELECT * FROM `JBOARD_TERMS`;";
	ResultSet rs = stmt.executeQuery(sql);
	// 5단계
	if(rs.next()){
		tb.setTerms(rs.getString(1));
		tb.setPrivacy(rs.getString(2));
	}
	// 6단계
	conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>약관</title>
    <link rel="stylesheet" href="/JBoard/css/style.css"/>    
</head>
<body>
    <div id="wrapper">
        <section id="user" class="terms">
            <table>
                <caption>사이트 이용약관</caption>
                <tr>
                    <td>
                        <textarea readonly><%= tb.getTerms() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk1"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <table>
                <caption>개인정보 취급방침</caption>
                <tr>
                    <td>
                        <textarea readonly><%= tb.getPrivacy() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/JBoard/user/login.jsp">취소</a>
                <a href="/JBoard/user/register.jsp">다음</a>
            </div>
        </section>
    </div>
    
</body>
</html>