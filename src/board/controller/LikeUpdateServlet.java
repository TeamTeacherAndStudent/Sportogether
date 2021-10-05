package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.BoardLike;

/**
 * Servlet implementation class LikeUpdateServlet
 */
@WebServlet("/like/update")
public class LikeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int CountLike = Integer.parseInt(request.getParameter("likeCount"));
		String userId = (String)session.getAttribute("userId");
		BoardLike boardLike  = new BoardLike();
		boardLike.setBoardNo(boardNo);
		boardLike.setUserId(userId);
		boardLike.setLikeCount(CountLike);
		int result = new BoardService().updateLike(boardLike);
		if(result> 0) {
			response.sendRedirect("/board/detail?boardNo="+boardNo);
		}else {
			request.getRequestDispatcher("/Board/boardError.html").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
}
