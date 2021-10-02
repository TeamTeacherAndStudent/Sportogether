package qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import qna.model.service.QnAService;
import qna.model.vo.QnA;

/**
 * Servlet implementation class QnAWriteServlet
 */
@WebServlet("/qna/write")
public class QnAWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QnAWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이지 이동용
		request.getRequestDispatcher("/QnA/Qna_Write.html").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글인코딩
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("qna-title");
		String contents = request.getParameter("qna-content");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId"); 
		
		//QnA 객체에 정보 셋팅
		QnA qna = new QnA();
		qna.setQnaTitle(title);
		qna.setQnaContents(contents);
		qna.setUserId(userId);
		
		//Service에서 넘김
		int result = new QnAService().registerQna(qna);
		
		//결과여부에 따라 페이지 이동
		if(result > 0) {
			//작성성공
			response.sendRedirect("/qna/list");
		}else {
			request.getRequestDispatcher("/QnA/ServiceFailed.html").forward(request, response);
		}
	}

}
