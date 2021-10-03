package board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

/**
 * Servlet implementation class FileRemoveServlet
 */
@WebServlet("/file/remove")
public class FileRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileRemoveServlet() {
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
		request.setCharacterEncoding("UTF-8");
		int fileNo = Integer.parseInt(request.getParameter("fileNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String fileName = request.getParameter("fileName");
		String filePath = request.getParameter("filePath");
		int result = new BoardService().removeFile(boardNo,fileNo);
		File removeFile = new File(filePath);
		if(result > 0) {
			removeFile.delete();
			response.sendRedirect("/board/detail?boardNo="+boardNo);
		}else {
			request.getRequestDispatcher("/Board/boardError.html").forward(request, response);
		}
	}
}
