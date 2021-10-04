package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MyInfoMainServlet
 */
@WebServlet("/mypage/main")
public class MypageMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		String userId = request.getParameter("user-id");
//		String userNickName = request.getParameter("user-nickName");
//		String userName = request.getParameter("user-name");
//		String userGender = request.getParameter("user-gender");
//		String userBirthDate = request.getParameter("user-birthDate");
//		String userPw = request.getParameter("user-pw");
//		String userEmail = request.getParameter("user-email");
//		String userPhone = request.getParameter("user-phone");
		String userId = (String)request.getSession().getAttribute("userId");
		Member member = new MemberService().printOneById(userId);

//		Member member = new Member(userId, userNickName, userName, userPw, userBirthDate, userGender, userPhone, userEmail);
		if(member != null) {
			request.setAttribute("member", member);
			request.getRequestDispatcher("/MyPage/MyPage_Main.jsp").forward(request, response);
		}else {
			response.sendRedirect("/MyPage/Mypage_Error.html");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
