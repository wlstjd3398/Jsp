package service.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import service.CommonService;
import vo.UserVO;

public class ListService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		List<UserVO> users = UserDao.getInstance().selectUsers();
		
		// View에서 참조해서 출력하기 위해 request 객체로 저장
		req.setAttribute("users", users);
		
		return "/user/list.jsp";
	}

}
