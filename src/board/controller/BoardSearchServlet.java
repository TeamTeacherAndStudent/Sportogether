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
import board.model.vo.PageData;

/**
 * Servlet implementation class BoardSearchServlet
 */
@WebServlet("/board/search")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchServlet() {
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
		String searchKeyword = request.getParameter("searchKeyWord");
		int currentPage = 1;
		String currentPageVal = request.getParameter("currentPage");
		if(currentPageVal != null) {
			currentPage = Integer.parseInt(currentPageVal);
		}
		PageData pd = new BoardService().printSearchBoard(searchKeyword, currentPage);
		List<Board> bList = pd.getBoardList();
		if(!bList.isEmpty()) {
			request.setAttribute("bList", bList);
			request.setAttribute("pageNavi", pd.getPageNavi());
			request.getRequestDispatcher("/Board/board_search.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/Board/boardError.html").forward(request, response);
		}
		
	}

}
