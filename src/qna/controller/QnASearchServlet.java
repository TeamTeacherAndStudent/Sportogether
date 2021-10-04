package qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnAService;
import qna.model.vo.PageData;
import qna.model.vo.QnA;

/**
 * Servlet implementation class QnASearchServlet
 */
@WebServlet("/qna/search")
public class QnASearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnASearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//searchKeyword 받아 검색
		String searchKeyword = request.getParameter("searchKeyword");
		int currentPage = 1;
		String getCurrentPage = request.getParameter("currentPage");
		if(getCurrentPage != null) {
			currentPage = Integer.parseInt(getCurrentPage);
		}
		PageData pageData = new QnAService().printSearchQna(searchKeyword,currentPage);
		List<QnA> qList = pageData.getQnaList();
		if(!qList.isEmpty()) {
			//성공
			request.setAttribute("qList", qList);
			request.setAttribute("pageNavi",pageData.getPageNavi());
			//편의를 위해 검색페이지.jsp 새로 생성
			request.getRequestDispatcher("/QnA/Qna_Search.jsp").forward(request, response);
		}else {
			//실패
			request.getRequestDispatcher("/QnA/QnA_Error.html").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
