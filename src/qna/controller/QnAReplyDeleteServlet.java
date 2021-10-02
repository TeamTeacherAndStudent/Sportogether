package qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnAService;

/**
 * Servlet implementation class QnAReplyDeleteServlet
 */
@WebServlet("/qnaReply/remove")
public class QnAReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAReplyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		int replyNo = Integer.parseInt(request.getParameter("qnaReplyNo"));
		int result = new QnAService().removeQnaReplyOne(replyNo);
		if(result>0) {
			response.sendRedirect("/qna/detail?qnaNo="+qnaNo);
		}else {
			request.getRequestDispatcher("/QnA/Qna_Error.html").forward(request, response);
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
