package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t10")
public class Test10 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		
		PrintWriter out = response.getWriter();
		
		if((mid.equals("admin") || mid.equals("hkd1234")) && pwd.equals("1234")) {
			System.out.println("회원 인증 성공....");
			
			out.println("<script>");
			out.println("alert('회원인증 성공!!!!!!!!!!!');");
			out.println("location.href = '"+request.getContextPath()+"/study/0419/test10Success.jsp';");
			out.println("</script>");
			
		}
		else {
			out.println("<script>");
			out.println("alert('회원인증 실패!!!!!!!!!!!');");
			out.println("location.href = '"+request.getContextPath()+"/study/0419/test10.jsp';");
			out.println("</script>");
		}
	}
}
