package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.vo.ReportedBoard;
import board.model.service.BoardService;

/**
 * Servlet implementation class ReportedBoard
 */
@WebServlet("/board/reported")
public class ReportedBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportedBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int boardNo  = Integer.parseInt(request.getParameter("boardNo"));
		String userId = (String)session.getAttribute("userId");//로그인 한 사람의 userId
		String boardTitle = request.getParameter("boardTitle");
		
		ReportedBoard rboard = new ReportedBoard();
		rboard.setBoardNo(boardNo);
		rboard.setUserId(userId);
		rboard.setBoardTitle(boardTitle);
		
		int result = new BoardService().insertReportedBoard(rboard);
		if(result >0) {
			response.sendRedirect("/board/list");
		}else {
			request.getRequestDispatcher("/Board/serviceFailed.html").forward(request, response);
		}
	}			
				
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}