package support.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import support.model.service.SupportService;

/**
 * Servlet implementation class SupportReplyReport
 */
@WebServlet("/supportReply/report")
public class SupportReplyReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportReplyReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//신고 대상 댓글 번호 , 게시물 번호
		int supportNo = Integer.parseInt(request.getParameter("supportNo"));
		int replyNo = Integer.parseInt(request.getParameter("replyNo"));
		//세션에서 아이디 가져오기
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		// 댓글 번호, 아이디 '응원댓글신고' 테이블에 insert
		int result = new SupportService().reportSupportReply(replyNo,userId);
		if(result > 0) {
			response.sendRedirect("/support/detail?supportNo="+supportNo);
		}else {
			request.getRequestDispatcher("/support/supportError.html");
		}
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
