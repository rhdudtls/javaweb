package study2.pdstest;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class FileDownLoadCommond implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fName = request.getParameter("file")==null ? "" : request.getParameter("file");
		
		String realPath = request.getServletContext().getRealPath("/images/pdstest/");
		
		File file = new File(realPath + fName);
		
		/* 프로토콜형식에 맞도록 헤더에 정보를 제공해준다. */
		// mimeType : 파일형식(ex : 텍스트파일? 바이너리파일? ...등등) --> 파일 전송시는 자바에서는 2진 바이너리형식으로 전송처리한다.
		String mimeType = request.getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream");
		}
		
		// 사용하는 브라우저에 대한 정보 : 만약 인터넷익스플로러(IE)에서는 경우의 인코딩방식은 'euc-kr'으로 전송처리한다.
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downLoadName = new String(fName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(fName.getBytes("EUC-KR"), "8859_1");
		}
		
		response.setHeader("Content-Disposition", "attachment;filename=" + downLoadName);
		
		// Java에 의해서 실제로 파일을 다운(업)로드 처리시켜준다.(FileInputStream/FileOutputStream/ServletOutputStream)
		
		FileInputStream fis = new FileInputStream(file);
		ServletOutputStream sos = response.getOutputStream();
		
		// 전송할 객체를 생성한 후에는 실제로 파일을 객체에 Byte 단위로 담아서 처리시켜준다.
		byte[] b = new byte[2048];
		int data = 0;
		
		while((data = fis.read(b, 0, b.length)) != -1) {
			sos.write(b, 0, data);
		}
		sos.flush();
		// 여기까지가 다운로드가 완료됨. 이후 사용된 객체 모두 반납
		
		sos.close();
		fis.close();
 	}
}
