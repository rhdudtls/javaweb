package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/mapping/Test4")
public class Test4Controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 /mapping/Test4 입니다.");
		
		int su1 = request.getParameter("su1")==null ? 0 : Integer.parseInt(request.getParameter("su1"));
		int su2 = request.getParameter("su2")==null ? 0 : Integer.parseInt(request.getParameter("su2"));
		
		Test4Service t4 = new Test4Service(2, 1);
		int hap = t4.test4Cal();
		request.setAttribute("hap", hap);
		String viewPage = "/WEB-INF/study2/mapping/test1.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
