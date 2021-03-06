<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String success = request.getParameter("success");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <link rel="stylesheet" href="/JBoard/css/style.css"/>
    <script>
    	var success = "<%= success %>"
    	if(success== 100){
    		alert('파일첨부는 10MB이하만 가능합니다')
    	}
    </script>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="write">
            <h3>글쓰기</h3>
            <article>
                <form action="/JBoard/proc/write.jsp" method="post" enctype="multipart/form-data">
                    <table>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="content"></textarea>                                
                            </td>
                        </tr>
                        <tr>
                            <td>첨부</td>
                            <td><input type="file" name="fname"/></td>
                        </tr>
                    </table>
                    <div>
                        <a href="/JBoard/list.jsp" class="btnCancel">취소</a>
                        <input type="submit"  class="btnWrite" value="작성완료">
                    </div>
                </form>
            </article>
        </section>
    </div>
</body>
</html>