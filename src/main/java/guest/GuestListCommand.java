package guest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestListCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		// 1. 현재 페이지 번호를 구한다.
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		// 2.한 페이지 분량 결정
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		// 3.총 레코드 건수를 구한다.
		int totRecCnt = dao.getTotRecCnt();
		// 4.총 페이지 수를 구한다.
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize)+1;
		// 5.현재 페이지의 시작 인덱스번호 구하기
		int startIndexNo = (pag -1) * pageSize;
		// 6.현재 화면에 표시할 시작번호를 구한다.
		int curScrstartNo = totRecCnt - startIndexNo;
		
		//블록 페이징처리... 블록의 시작번호를 0부터 처리
		//1. 블록의 크기 결정(3으로)
		int blockSize = 3;
		//2. 현재 페이지가 속한 블록 번호 구하기
		int curBlock = (pag-1) / blockSize;
		
		//3. 마지막 블록을 구한다.
		int lastBlock = (totPage - 1) / blockSize;
		
		// 지정된 페이지의 자료를 요청한 페이지 분량만큼 가져오기
		ArrayList<GuestVO> vos = dao.getGuestList(startIndexNo, pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrstartNo", curScrstartNo);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("pageSize", pageSize);
	}

}
