package qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnAService;
import qna.model.vo.QnA;

/**
 * Servlet implementation class QnADetailServlet
 */
@WebServlet("/qna/detail")
public class QnADetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnADetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		QnA qnaOne = new QnAService().printOneByNo(qnaNo);
		if(qnaOne != null) {
			//성공하면 디테일 페이지
			request.setAttribute("qnaOne", qnaOne);
			request.getRequestDispatcher("/WEB-INF/QnA/Qna_Detail.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/WEB-INF/QnA/Qna_Error.html").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
