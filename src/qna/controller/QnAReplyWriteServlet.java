package qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import qna.model.service.QnAService;

/**
 * Servlet implementation class QnAReplyWriteServlet
 */
@WebServlet("/qnaReply/write")
public class QnAReplyWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAReplyWriteServlet() {
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
		String replyContents = request.getParameter("replyContents");
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		String userId = (String)session.getAttribute("userId");
		int result = new QnAService().registerQnaReply(qnaNo,replyContents,userId);
		if(result>0) {
			response.sendRedirect("/qna/detail?qnaNo="+qnaNo);
		}else {
			request.getRequestDispatcher("/QnA/Qna_Error.html").forward(request, response);
		}
		
		
	}

}
