package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;

/**
 * Servlet implementation class SupportApprovalServlet
 */
@WebServlet("/support/approval")
public class SupportApprovalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportApprovalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//suppotr_approval.jsp(후원 승인 목록) 페이지에서
		// 해당 게시물의 번호를 받아온다 
		int supportNo = Integer.parseInt(request.getParameter("supportNo"));
		int result = new AdminService().approveSupport(supportNo);
		
		if(result > 0 ) {
			//성공
			response.sendRedirect("/support/appList");
			System.out.println("후원 승인 성공");
		}else {
			//실패
			System.out.println("후원 승인 실패");
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
