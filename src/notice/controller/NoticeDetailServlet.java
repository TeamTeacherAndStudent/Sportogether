package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.dao.NoticeDAO;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

@WebServlet("/notice/detail")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public NoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		Notice noticeOne = new NoticeService().printOneByNo(noticeNo);
		 
		
		if(noticeOne != null) {
			//성공하면 디테일 페이지
			/* NoticeDAO.updateReadCount(noticeNo); */
			/* int result = new NoticeService().updateReadCount(noticeNo); */
			/* int noticeCount = Integer.parseInt(request.getParameter("noticeCount")); */
			request.setAttribute("noticeOne", noticeOne);
			request.getRequestDispatcher("/Notice/Notice_Detail.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/Noitce/Notice_Error.html").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
