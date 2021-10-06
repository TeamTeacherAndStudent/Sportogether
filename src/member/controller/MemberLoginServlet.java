package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/member/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/login_registration/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("user-id");
		String userPw = request.getParameter("user-pw");
		
		if(userId == "" || userPw == "") {
			response.setContentType("text/html;charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");

			out.println("alert('아이디와 비밀번호를 입력해주세요')");
			
			out.println("history.back()");

			out.println("</script>");
		}else {
			Member member = new MemberService().printOneLogin(userId,userPw);
			if(member != null) {
				//세션
				HttpSession session = request.getSession();
				session.setAttribute("userId", member.getUserId());
				session.setAttribute("userNickname",member.getUserNickName());
				session.setAttribute("userCode",member.getUserCode());
				session.setAttribute("userPlayer", member.getUserPlayer());
				response.sendRedirect("/index.jsp"); //성공시 메인 페이지로 이동 
				
			}else { 
				response.setContentType("text/html;charset=UTF-8");

				PrintWriter out = response.getWriter();

				out.println("<script>");

				out.println("alert('아이디 혹은 비밀번호가 다릅니다.')");
				
				out.println("history.back()");

				out.println("</script>");//실패시 ( 임시로만든 에러 페이지 ) 로 이동
			}
		}
	
		
	}

}
