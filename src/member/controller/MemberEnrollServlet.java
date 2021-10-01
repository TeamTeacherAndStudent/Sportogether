package member.controller;

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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		Date userBirthDate = Date.valueOf(request.getParameter("user-birth"));
		String userGender = request.getParameter("gender");
		//String으로 온 phone번호 형변환
		int userPhone = Integer.parseInt(request.getParameter("user-phone"));
		String userEmail = request.getParameter("user-email");
		
		//변수에 넣어둔 정보 Member 객체에 저장 
		Member member = new Member(userId, userNickName, userName, userPw, userBirthDate, userGender, userPhone, userEmail);
		int result = new MemberService().registerMember(member);
		if(result > 0) {
			response.sendRedirect("/index.jsp");
		}else {
			response.sendRedirect("");
		}
	}

}