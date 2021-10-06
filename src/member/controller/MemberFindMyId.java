package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberFindMyId
 */
@WebServlet("/member/findid")
public class MemberFindMyId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindMyId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("user-name");
		String userBirth = request.getParameter("user-birth");
		String userPhone = request.getParameter("user-phone");
//		Member member = new Member();
//		member.setUserBirthDate(userBirth);
//		member.setUserName(userName);
//		member.setUserPhone(userPhone);
		String userId = new MemberService().findUserId(userName, userBirth, userPhone);
		if(userId != null) {
			response.setContentType("text/html;charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");

			out.println("alert('회원님의 아이디는 "+userId+" 입니다.')");

			out.println("location.href='/login_registration/login.jsp");

			out.println("</script>");
		}else {
			response.setContentType("text/html;charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");

			out.println("alert('일치하는 회원 정보가 없습니다.')");

			out.println("history.back()");

			out.println("</script>");
		}
	}

}
