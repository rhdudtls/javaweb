package study2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.api.crime.CrimeDAO;
import study2.api.crime.CrimeVO;

public class ListCrimeDataCommond implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int year = request.getParameter("year")==null? 0 : Integer.parseInt(request.getParameter("year"));
		
		CrimeDAO dao = new CrimeDAO();
		
		ArrayList<CrimeVO> vos = dao.getList(year);
		request.setAttribute("vos", vos);
		
	}

}
