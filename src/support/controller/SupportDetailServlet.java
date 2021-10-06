package support.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import support.model.service.SupportService;
import support.model.vo.Support;

/**
 * Servlet implementation class SupportDetailServlet
 */
@WebServlet("/support/detail")
public class SupportDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//후원 상세 page로 이동
		MemberService ms = new MemberService();
		SupportService ss = new SupportService();
		int supportNo = Integer.parseInt(request.getParameter("supportNo"));
		
		HttpSession session = request.getSession();
		String donatorId = (String)session.getAttribute("userId");
		Member dm = ms.printOneById(donatorId);
		
		
		Support spt = ss.printOneByNo(supportNo);
		String userId = spt.getSupportWriter();
		Member member = ms.printOneById(userId);
//		HttpSession session = request.getSession();
//		String useridtest = (String)session.getAttribute("userId");
//		System.out.println(useridtest);
		if(spt != null) {
			request.setAttribute("donator", dm);
			request.setAttribute("member", member);
			request.setAttribute("supportOne", spt);
			request.getRequestDispatcher("/WEB-INF/Support/supportDetail.jsp").forward(request, response);
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
