package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeRemoveServlet
 */
@WebServlet("/notice/remove")
public class NoticeRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeRemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo")); //jsp 쿼리스트링에 있는 키값을 써줘야함
		int result = new NoticeService().removeNotice(noticeNo); 
		if(result>0) {
			//성공하면 게시글 리스트로 이동
			response.sendRedirect("/notice/list");
		}else {
			request.getRequestDispatcher("/WEB-INF/Notice/Notice_Error.html").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
