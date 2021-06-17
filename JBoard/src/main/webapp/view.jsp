<%@page import="java.util.List"%>
<%@page import="kr.co.jboard.bean.MemberBean"%>
<%@page import="kr.co.jboard.dao.ArticleDao"%>
<%@page import="kr.co.jboard.bean.ArticleBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//세션 사용정보 가져오기
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");
	
	// 로그인을 하지 않고 List 페이지를 요청할 경우
	if(mb == null){
		response.sendRedirect("/JBoard/user/login.jsp?success=101");
		return;
	}
	
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	
	// Dao 객체 가져오기
	ArticleDao dao = ArticleDao.getInstance();
	
	// 글 가져오기
	ArticleBean article = dao.selectArticle(seq);
	
	// 해당 글 조회수 업데이트
	dao.updateArticleHit(seq);
	
	// 댓글 가져오기
	List<ArticleBean> comments = dao.selectComments(seq);
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="/JBoard/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
	    jQuery(function(){
	    	
	    	$('.btnCommentDel').click(function(){
	    		if(confirm('정말 삭제 하시겠습니까?')){
	    			return true;
	    		}else{
	    			return false;
	    		}
	    	});
	    	
	    	$('.btnCommentModify').click(function(e){
	    					e.preventDefault();
	    					
				var btnThis = $(this);
	    		var mode = btnThis.text();
	    		var textarea = $(this).parent().prev();
	    		
	    		if(mode == '수정'){
	    			// 수정모드
	    			$(this).text('수정완료');
		    		textarea.attr('readonly', false).focus();
		    		textarea.css('outline', '1px gray solid');
		    		
	    		}else{
	    			// 수정완료 모드
	    			var content = textarea.val();
	    			var seq = textarea.attr('data-seq');
	    			var parent = textarea.attr('data-parent');
	    			
	    			var jsonData = {'seq': seq,
	    							'parent': parent,
	    							'content': content
	    							};
	    			
					$.ajax({
	    				url: '/JBoard/proc/commentUpdate.jsp',
	    				type: 'post',
	    				data: jsonData,
	    				dataType: 'json',
	    				success: function(data){
	    					
	    					if(data.result == 1){
	    						textarea.attr('readonly', true);
	    						textarea.css('outline', 'none');
	    						btnThis.text('수정');
	    						
	    						alret('수정 완료했습니다.'); 			
	    					
	    					}
	    				}
	    			
					});
	    		}
	    	});
	    	
	    });
    </script>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="view">
            <h3>글보기</h3>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="<%= article.getTitle() %>" readonly/></td>
                </tr>
                <% if(article.getFile() == 1){ %>
                <tr>
                    <td>첨부파일</td>
                    <td>
                        <a href="/JBoard/proc/download.jsp?seq=<%= article.getFb().getSeq() %>"><%= article.getFb().getOriName() %></a>
                        <span><%= article.getFb().getDownload() %>회 다운로드</span>
                    </td>
                </tr>
                <% } %>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" readonly><%= article.getContent() %></textarea>
                    </td>
                </tr>
            </table>
            <div>
            	<% if(mb.getUid().equals(article.getUid())){ %>
                <a href="/JBoard/proc/delete.jsp?seq=<%= article.getSeq() %>" class="btnDelete">삭제</a>
                <a href="/JBoard/modify.jsp?seq=<%= article.getSeq() %>" class="btnModify">수정</a>
                <% } %>
                <a href="/JBoard/list.jsp" class="btnList">목록</a>
            </div>  
            
            <!-- 댓글리스트 -->
            <section class="commentList">
                <h3>댓글목록</h3>
                
                <% for(ArticleBean comment : comments){ %>
                <article class="comment">
                    <span>
                        <span><%= comment.getNick() %></span>
                        <span><%= comment.getRdate().substring(2, 16) %></span>
                    </span>
                    <textarea name="comment" data-seq="<%= comment.getSeq() %>" data-parent="<%= comment.getParent() %>" readonly><%= comment.getContent() %></textarea>
                    <% if(comment.getUid().equals(mb.getUid())){ %>
                    <div>
                        <a href="/JBoard/proc/commentDelete.jsp?seq=<%= comment.getSeq() %>&parent=<%= comment.getParent() %>" class="btnCommentDel">삭제</a>
                    	<a href="#" class="btnCommentModify">수정</a>
                    </div>
                    <% } %>
                </article>
                <% } %>
                
                <% if(comments.size() == 0){ %>
                <p class="empty">
                    등록된 댓글이 없습니다.
                </p>
                <% } %>
            </section>

            <!-- 댓글입력폼 / 여기서 get이 아닌 post 쓰는이유 : 길이 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="/JBoard/proc/comment.jsp" method="post"> 
                	<input type="hidden" name="parent" value="<%= article.getSeq() %>"/>
                	<input type="hidden" name="uid" value="<%= mb.getUid()  %>"/>
                    <textarea name="comment" required></textarea>
                    <div>
                        <a href="#" class="btnCancel">취소?</a>
                        <input type="submit" class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </section>

        </section>
    </div>    
</body>
</html>