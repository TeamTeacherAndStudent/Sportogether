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
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		String searchKeyword = request.getParameter("keyWord");
		int currentPage = 1;
		String currentPageVal = request.getParameter("currentPage");
		if(currentPageVal != null) {
			currentPage = Integer.parseInt(currentPageVal);
		}else {
			currentPage = 1;
		}
		switch(type) {
		case "A" :
			PageData pd1 = new BoardService().printSearchBoard(searchKeyword, currentPage);
			List<Board> bList1 = pd1.getBoardList();
			if(!bList1.isEmpty()) {
				request.setAttribute("bList", bList1);
				request.setAttribute("pageNavi", pd1.getPageNavi());
				request.getRequestDispatcher("/Board/board_search.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/Board/boardError.html").forward(request, response);
			}
			break;
			
		case "T":
			PageData pd2 = new BoardService().printSearchBoardTitle(searchKeyword, currentPage);
			List<Board> bList2 = pd2.getBoardList();
			if(!bList2.isEmpty()) {
				request.setAttribute("bList", bList2);
				request.setAttribute("pageNavi", pd2.getPageNavi());
				request.getRequestDispatcher("/Board/board_search.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/Board/boardError.html").forward(request, response);
			}
			break;
			
		case "C" :
			PageData pd3 = new BoardService().printSearchBoardTContents(searchKeyword, currentPage);
			List<Board> bList3 = pd3.getBoardList();
			if(!bList3.isEmpty()) {
				request.setAttribute("bList", bList3);
				request.setAttribute("pageNavi", pd3.getPageNavi());
				request.getRequestDispatcher("/Board/board_search.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/Board/boardError.html").forward(request, response);
			}
			break;
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

}
