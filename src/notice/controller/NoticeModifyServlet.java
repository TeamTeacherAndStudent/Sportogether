package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeModifyServlet
 */
@WebServlet("/notice/modify")
public class NoticeModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면 보여주는 용도
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		Notice noticeOne = new NoticeService().printOneByNo(noticeNo);
		request.setAttribute("notice", noticeOne);
		request.getRequestDispatcher("/WEB-INF/Notice/Notice_Modify.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//폼태그 받는 용, 수정은 여기서
		request.setCharacterEncoding("UTF-8"); //한글인코딩
		String title = request.getParameter("notice-title"); //jsp 네임값
		String contents = request.getParameter("notice-content");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		Notice notice = new Notice();
		notice.setNoticeTitle(title);
		notice.setNoticeContents(contents);
		notice.setNoticeNo(noticeNo);
		int result = new NoticeService().modifyNotice(notice);
		if(result>0) {
			response.sendRedirect("/notice/list");
		}else {
			request.getRequestDispatcher("/WEB-INF/Notice/Notice_Error.html").forward(request, response);
		}
	}

}
