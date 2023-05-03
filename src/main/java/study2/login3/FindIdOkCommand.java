package study2.login3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindIdOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");

		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getIdCheck(name);
		
		String msg="", url="";
		
		if(vo.getMid() != null) {
			msg = "NO";
			url = "/FindIdRes.fa?name="+vo.getName();
		}
		else {
			msg = "입력하신 성명은 회원이 아닙니다.";
			url = "/FindId.fa";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", request.getContextPath() + url);
	}

}
