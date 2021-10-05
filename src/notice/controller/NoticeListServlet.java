package notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import notice.model.vo.PageData;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/notice/list")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public NoticeListServlet() {
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 0;
		String getCurrentPage = request.getParameter("currentPage");
		if(getCurrentPage == null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(getCurrentPage);
		}
		
		PageData pageData = new NoticeService().printAllNotice(currentPage);
		List<Notice> nList = pageData.getNoticeList();
		if(!nList.isEmpty()) {
			request.setAttribute("nList", nList);
			request.setAttribute("pageNavi", pageData.getPageNavi());
			// 관리자/사용자화면 어떻게 구분?
			request.getRequestDispatcher("/WEB-INF/Notice/Notice_List.jsp").forward(request, response);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/Notice/Notice_Error.html");
			view.forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
