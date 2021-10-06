package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class MemberEnrollServlet
 */
@WebServlet("/member/enroll")
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/login_registration/registration.html").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//한글이 있으니 인코딩..
		request.setCharacterEncoding("UTF-8");
		//registraion.jsp(회원가입 page)에서 받은 값들 변수에..
		String userId = request.getParameter("user-id");
		String userPw = request.getParameter("user-pw");
		String userNickName =request.getParameter("user-nickname");
		String userName = request.getParameter("user-name");
		//String으로 온 가입 신청자의 생년월일 Date 형으로 변환 후 변수에 넣기
		String userBirthDate = request.getParameter("user-birth");
		String userGender = request.getParameter("user-gender");
		String userPhone = request.getParameter("user-phone");
		String userEmail = request.getParameter("user-email");
		
		//변수에 넣어둔 정보 Member 객체에 저장 
		Member member = new Member(userId, userNickName, userName, userPw, userBirthDate, userGender, userPhone, userEmail);
		int result = new MemberService().registerMember(member);
		System.out.println(member.toString());
		if(result > 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer =response.getWriter();
			writer.println("<script>alert('회원가입이 완료되었습니다.'); location.href='/index.jsp';</script>");
			writer.flush();
//			response.sendRedirect("/index.html");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer =response.getWriter();
			writer.println("<script>alert('중복되는 아이디입니다.다시 시도해주세요'); history.back();</script>");
			writer.flush();
//			response.sendRedirect("/login_registration/loginError.html");
		}
	}

}
