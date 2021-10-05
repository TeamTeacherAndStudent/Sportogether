package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.vo.ReportedReply;
import board.model.service.BoardService;

/**
 * Servlet implementation class ReportedReply
 */
@WebServlet("/boardReply/reported")
public class ReportedReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportedReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId"); //여기가 안된다
		int replyNo = Integer.parseInt(request.getParameter("boardReplyNo"));
	//위에 null처리됨 : js코드를 받아오거나 
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	
		ReportedReply rReply = new ReportedReply();
		rReply.setReplyNo(replyNo);
		rReply.setUserId(userId);
		int result = new BoardService().insertReportedReply(rReply);
		if(result > 0) {
			response.sendRedirect("/board/detail?boardNo="+boardNo);
		}else {
			request.getRequestDispatcher("/Board/serviceFailed.html").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
	
	}

}
