package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardModifyServlet
 */
@WebServlet("/board/modify")
public class BoardModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		Board boardOne = new BoardService().printOneByNo(boardNo);
		request.setAttribute("board", boardOne);
		request.getRequestDispatcher("/Board/board_modify.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 //한글 인코딩
		request.setCharacterEncoding("UTF-8");
		String Title = request.getParameter("title");
		String Contents = request.getParameter("contents");
		String sportsName = request.getParameter("sportsName");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		Board board = new Board();
		board.setBoardTitle(Title);
		board.setBoardContents(Contents);
		board.setBoardNo(boardNo);
		board.setSportsName(sportsName);
		int result = new BoardService().modifyBoard(board);
		if(result > 0) {
			response.sendRedirect("/board/list");
			System.out.println("Yes");
		}else {
			request.getRequestDispatcher("/Board/boardError.html");
		}
	}

}
