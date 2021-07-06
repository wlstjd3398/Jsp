package kr.co.jboard2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.dao.ArticleDao;
import kr.co.jboard2.vo.ArticleVo;

public class CommentService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String parent  = req.getParameter("parent");
		String uid 	   = req.getParameter("uid");
		String comment = req.getParameter("comment");
		String regip   = req.getRemoteAddr();
		
		ArticleVo articleVo = new ArticleVo();
		articleVo.setParent(parent);
		articleVo.setContent(comment);
		articleVo.setUid(uid);
		articleVo.setRegip(regip);
				
		ArticleDao dao = ArticleDao.getInstance();
		
		dao.insertComment(articleVo);
		
		// ��� ī��Ʈ +1
		dao.updateCommentCount(parent, +1);
		
		return "redirect:/Jboard2/view.do?seq="+parent;
	}

}
