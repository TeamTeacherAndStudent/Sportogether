package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardLike;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/board/detail")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		Board boardOne = new BoardService().printOneByNo(boardNo);
		
		if(boardOne != null) {
			request.setAttribute("boardOne",boardOne); //service에서 와서 출력
		}else {
			request.getRequestDispatcher("/WEB-INF/board/boardError.html").forward(request, response);
		}
		HttpSession session = request.getSession();
//		int likeCount = Integer.parseInt(request.getParameter("likeCount"));
		String userId = (String)session.getAttribute("userId");
		BoardLike boardLike  = new BoardService().selectBoardLike(boardNo, userId);
		if(boardLike != null) {
			request.setAttribute("likeYn", "Y");
		}else {
			request.setAttribute("likeYn", "N");
		}
		request.getRequestDispatcher("/WEB-INF/Board/board_detail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
