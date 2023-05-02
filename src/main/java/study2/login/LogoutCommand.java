package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LogoutCommand implements LoginInterface {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		session.invalidate(); // 로그아웃 후 세션값 삭제 유효시간을 0으로 만들기~~~
		
		request.setAttribute("msg", mid+"님 로그아웃 되었습니다.");
		request.setAttribute("url", request.getContextPath()+"/Login.re");
	}

}
