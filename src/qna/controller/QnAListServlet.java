package qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnAService;
import qna.model.vo.PageData;
import qna.model.vo.QnA;
import qna.model.vo.QnAReply;

/**
 * Servlet implementation class QnAListServlet
 */
@WebServlet("/qna/list")
public class QnAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnAListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 0;
		String getCurrentPage = request.getParameter("currentPage");
		/* String userId = request.getParameter("userId"); */
		if(getCurrentPage == null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(getCurrentPage);
		}
		
		PageData pageData = new QnAService().printAllList(currentPage);
		List<QnA> qList = pageData.getQnaList();
	
		if(!qList.isEmpty()) {
			request.setAttribute("qList", qList);
			request.setAttribute("pageNavi", pageData.getPageNavi());
			/* request.setAttribute("userId", userId); */
			request.getRequestDispatcher("/QnA/Qna_Main.jsp").forward(request, response);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/QnA/Qna_Error.html");
			view.forward(request, response);
		}
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
