package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;


@WebServlet("/notice/write")
public class NoticeWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NoticeWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이지이동용
		request.getRequestDispatcher("Notice_Write.html").forward(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글인코딩
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("notice-title");
		String contents = request.getParameter("notice-content");
		HttpSession session = request.getSession();
		String writerId = (String)session.getAttribute("userId"); //로그인서블릿 셋하는 세션의 키값이 userId이기 때문에 ""안에는 userId, 리턴타입이 오브젝트이기때문에 형변환 필요
		
		//Notice 객체에 정보 셋팅
		Notice notice = new Notice();
		notice.setNoticeTitle(title);
		notice.setNoticeContents(contents);
		notice.setNoticeWriter(writerId); //아이디는 세션에서 갖고 와야하기 때문에 session 필요
		
		//Service에 넘김
		int result = new NoticeService().registerNotice(notice);
		
		//결과여부에 따라 페이지 이동
		if(result > 0) {
			//작성 성공 > NoticeList로 이동(noticeList.jsp로 이동)
			response.sendRedirect("/notice/list");
		}else {
			request.getRequestDispatcher("/Notice/ServiceFailed.html").forward(request, response);
		}
	}

}
