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
		//views로 이동하는 코드작성
		request.getRequestDispatcher("/WEB-INF/Board/boardWrite.html").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String Title = request.getParameter("title");
		String Contents = request.getParameter("content");
		String sportsName = request.getParameter("sportsName");
		HttpSession session = request.getSession();
		String userId= (String)session.getAttribute("userId");
		
		//board에 셋팅
		Board board = new Board();
		board.setBoardTitle(Title);
		board.setBoardContents(Contents);
		board.setUserId(userId);
		board.setSportsName(sportsName);
		
		int result = new BoardService().registerBoard(board);
		if(result > 0) {
			response.sendRedirect("/board/list");
		}else {
			request.getRequestDispatcher("/WEB-INF/Board/serviceFailed.html").forward(request, response);
			System.out.println("error");
		}
	}

}
