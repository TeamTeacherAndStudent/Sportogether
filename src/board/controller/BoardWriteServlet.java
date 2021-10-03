package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.FileData;

/**
 * Servlet implementation class BoardWriteServlet
 */
@WebServlet("/board/write")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteServlet() {
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
		HttpSession session = request.getSession();
		String Title = request.getParameter("boardTitle");
		String Contents = request.getParameter("boardContents");
		String WriterNickName = (String)session.getAttribute("userId");
		
		//board에 셋팅
		Board board = new Board();
		board.setBoardTitle(Title);
		board.setBoardContents(Contents);
		board.setUserId(WriterNickName);
		
		int result = new BoardService().registerBoard(board);
		if(result > 0) {
			response.sendRedirect("/Board/board_main.jsp");
		}else {
			request.getRequestDispatcher("/Board/boardError.html").forward(request, response);
		}
	}

}
