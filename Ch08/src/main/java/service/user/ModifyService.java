package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import service.CommonService;
import vo.UserVO;

public class ModifyService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			// Get 요청
			String uid = req.getParameter("uid");
			
			UserVO vo = UserDao.getInstance().selectUser(uid);
			
			req.setAttribute("memberVo", vo);
			
			return "/user/modify.jsp";
		}else {
			// Post 요청
			String uid  = req.getParameter("uid");
			String name = req.getParameter("name");
			String hp   = req.getParameter("hp");
			String age  = req.getParameter("age");
			
			UserVO vo = new UserVO();
			vo.setUid(uid);
			vo.setName(name);
			vo.setHp(hp);
			vo.setAge(age);
			
			UserDao.getInstance().updateUser(vo);
			
			
			return "redirect:/Ch08/user/list.do";
		}
	}

}
