package study.t0420;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/t0420/Test5Ok")
public class Test5Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int i=0;
		int su[] = new int[5];
		for(i=0; i<5; i++) {
			su[i] = Integer.parseInt(request.getParameter("su["+i+"]"));
			System.out.println(su[i]);
		}
	}
}
