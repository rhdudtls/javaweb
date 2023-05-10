package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardDeleteCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		
		//정상적인 경로를 통해서 삭제하지 않을 경우는 홈으로 이동
		HttpSession session = request.getSession();
		String sNickName = (String)session.getAttribute("sNickName");
		int sLevel = (int)session.getAttribute("sLevel");
		System.out.println("sNickName :" + sNickName + ", nickName : " + nickName);
		
		if(sLevel != 0) {
			if(!sNickName.equals(nickName)) {
				request.setAttribute("msg", "잘못된 접근입니다.");
				request.setAttribute("url", request.getContextPath()+"/");
				return;
			}
		}
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoardDelete(idx);
		
		if(res == 1) {
			request.setAttribute("msg", "게시글이 삭제되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/BoardList.bo?pag="+pag+"&pageSize="+pageSize);
		}
		else {
			request.setAttribute("msg", "게시글 삭제실패~~");
			request.setAttribute("url", request.getContextPath()+"/BoardContent.bo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}
	}

}
