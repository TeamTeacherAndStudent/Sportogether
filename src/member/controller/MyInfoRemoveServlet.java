package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.dao.MemberDAO;
import member.model.service.MemberService;

/**
 * Servlet implementation class MyInfoRemoveServlet
 */
@WebServlet("/mypage/remove")
public class MyInfoRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyInfoRemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		int result = new MemberService().deleteMember(userId);
		if(result > 0) {
			//세션파괴를 해줘야 완벽한 탈퇴처리가 됨
			session.invalidate();
			response.sendRedirect("/index.jsp"); //--> 이거 아마로 로그아웃 서블릿에서 했었을 거임 => 로그아웃 서블릿 호출
			/* response.sendRedirect("/member/logout"); */
		}else {
			response.sendRedirect("/Mypage/Mypage_Error.html");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
