package board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownServlet
 */
@WebServlet("/file/down")
public class FileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String filePath = request.getParameter("file-path");
		File file = new File(filePath);
		response.setContentType("application/ocet-stream");
		response.setContentLength((int)file.length());
		String fileName = new String(file.getName().getBytes(),"ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment;filename = "+fileName);
		//파일보내는 스트림
		FileInputStream fileIn = new FileInputStream(file);
		ServletOutputStream output = response.getOutputStream();
		
		byte[] outputByte = new byte[4096];
		while(fileIn.read(outputByte, 0, 4096) != -1) {
			output.write(outputByte, 0, 4096);
		}
		fileIn.close();
		output.flush();
		output.close();
	}
}
