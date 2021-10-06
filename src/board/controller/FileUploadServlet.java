package board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.model.service.BoardService;
import board.model.vo.FileData;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/file/upload")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fileNo = Integer.parseInt(request.getParameter("fileNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String uploadFilePath = request.getServletContext().getRealPath("upload");
		System.out.println("업로드 리얼 패스 :" +uploadFilePath);
		int uploadFileLimit = 5*1024*1024; //5MB, M > 10^6,
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		String encType = "UTF-8";
		MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileLimit, encType, policy);
		
	// 2단계 : upload폴더에 저장한 파일에 대한 정보를 DB에 저장하는 작업
		String fileName = multi.getFilesystemName("upFile");
		File uploadFile = multi.getFile("upFile");
		String filePath = uploadFile.getPath();
		long filesize = uploadFile.length();
		FileData fileData = new FileData();
		fileData.setFileNo(fileNo);
		fileData.setBoardNo(boardNo);
		fileData.setFileName(fileName);
		fileData.setFilePath(filePath);
		fileData.setFileSize(filesize);
		
		int result = new BoardService().registerFileInfo(fileData);
		if(result > 0) {
			response.sendRedirect("/board/detail?boardNo="+boardNo);
		}else {
			//실패메세지 출력
			request.getRequestDispatcher("/WEB-INF/Board/boardError.html").forward(request, response);
		}
	}

}
