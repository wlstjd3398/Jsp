package kr.co.jboard2.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.dao.ArticleDao;
import kr.co.jboard2.vo.ArticleVo;
import kr.co.jboard2.vo.MemberVo;

public class ViewService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		//���� ������� ��������
		HttpSession sess = req.getSession();
		MemberVo mv = (MemberVo) sess.getAttribute("sessMember");
		
		// �α����� ���� �ʰ� List �������� ��û�� ���
		if(mv == null){
			return "redirect:/JBoard2/user/login.do?success=101";
		}

		// ���� ������ ����
		String seq = req.getParameter("seq");

		// Dao ��ü ��������
		ArticleDao dao = ArticleDao.getInstance();
		
		// �� ��������
		ArticleVo article = dao.selectArticle(seq);
		
		// �ش� �� ��ȸ�� ������Ʈ
		dao.updateArticleHit(seq);
		
		// ��� ��������
		List<ArticleVo> comments = dao.selectComments(seq);
		
		req.setAttribute("article", article);
		req.setAttribute("comments", comments);
		
		return "/view.jsp";
	}

}