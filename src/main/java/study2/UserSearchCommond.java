package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study2.ajax2.UserDAO;
import study2.ajax2.UserVO;

public class UserSearchCommond implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		HttpSession session = request.getSession();
		
		UserDAO dao = new UserDAO();
		UserVO vo = dao.getUserSearch(idx);
		session.setAttribute("sMid", vo.getMid());
		
		String str = "";
		if(vo.getName() == null) {
			str = "찾는 자료가 없습니다.";
		}
		else {
			str = vo.getMid() + "/" + vo.getName() + "/" + vo.getAge() + "/" + vo.getAddress();
		}
		response.getWriter().write(str);
	}

}
