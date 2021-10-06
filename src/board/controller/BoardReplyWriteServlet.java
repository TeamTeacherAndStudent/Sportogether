package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;

/**
 * Servlet implementation class BoardReplyWriteServlet
 */
@WebServlet("/boardReply/write")
public class BoardReplyWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReplyWriteServlet() {
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
		//로그인한 자만 쓰기
		HttpSession session = request.getSession();
		String replyContents = request.getParameter("replyContents");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String userId = (String)session.getAttribute("userId");
		int result = new BoardService().registerBoardReply(boardNo, replyContents, userId);
		if(result > 0) {
			response.sendRedirect("/board/detail?boardNo="+boardNo);
		}else {
			request.getRequestDispatcher("/WEB-INF/Board/serviceFailed.html").forward(request, response);
		}
	}
}
