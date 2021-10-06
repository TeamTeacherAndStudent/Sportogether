package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dao.BoardDAO;
import board.model.service.BoardService;

/**
 * Servlet implementation class LikePrintServlet
 */
@WebServlet("/like/print")
public class LikePrintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikePrintServlet() {
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
		int boardLike = Integer.parseInt(request.getParameter("boardLike"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
	//	int result = new BoardService().printLike(boardNo, boardLike);
		/*
		 * if(result>0) { response.sendRedirect("/board/detail?boardNo="+boardNo); }else
		 * { request.getRequestDispatcher("/WEB-INF/Board/boardError/html").forward(
		 * request, response); }
		 */
	}

}
