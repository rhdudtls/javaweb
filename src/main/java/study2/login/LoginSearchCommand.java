package study2.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginSearchCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getMidCheck(mid);
		
//		if(vo.getMid() != null) {
//			request.setAttribute("vo", vo);
//			request.setAttribute("url", request.getContextPath()+"/MemberSearch.re");
//		}
//		else {
//			request.setAttribute("msg","회원정보가 없습니다.");
//			request.setAttribute("url", request.getContextPath()+"/MemberMain.re");
//		}
		
		if(vo.getMid() != null) {
			request.setAttribute("msg","NO");
			request.setAttribute("url", request.getContextPath()+"/MemberSearch.re?mid=" + mid);
			
		}
		else {
			request.setAttribute("msg","회원정보가 없습니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberMain.re");
		}
		
	}

}
