package member.controller;

import java.awt.font.TransformAttribute;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MyInfoServlet
 */
@WebServlet("/mypage/modify")
public class MyInfoModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public MyInfoModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("user-id");
		String userNickName = request.getParameter("user-nickName");
		String userName = request.getParameter("user-name");
		String userGender = request.getParameter("user-gender");
		String userBirthDate = request.getParameter("user-birthDate");
		String userPw = request.getParameter("user-pw");
		String userEmail = request.getParameter("user-email");
		String userPhone = request.getParameter("user-phone");

		Member member = new Member(userId, userNickName, userName, userPw, userBirthDate, userGender, userPhone, userEmail);
	
		int result = new MemberService().modifyMember(member);
		if(result>0) {
			response.sendRedirect("/MyPage/MyPage_Main.jsp");
		}else {
			response.sendRedirect("/MyPage/Mypage_Error.html");
		}
	}

}
