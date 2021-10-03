package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Scrap;

/**
 * Servlet implementation class ScrapUpdateServlet
 */
@WebServlet("/scrap/update")
public class ScrapUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScrapUpdateServlet() {
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
	 HttpSession session = request.getSession();
	 int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	 int scrapNo = Integer.parseInt(request.getParameter("scrapNo"));
	 String Contents = request.getParameter("boardContents");
	 String userId = (String)session.getAttribute("userId");
	 
	 Scrap scrap = new Scrap();
	 scrap.setScrapNo(scrapNo);
	 scrap.setBoardNo(boardNo);
	 scrap.setUserId(userId);
	 scrap.setBoardContents(Contents);
	 int result = new BoardService().updateScrap(scrap); 
	 if(result > 0 ) {
		 response.sendRedirect("/board/detail?boardNo="+ boardNo);
	 }else {
		 request.getRequestDispatcher("/Board/boardError.html").forward(request, response);
	 }
	}
}
