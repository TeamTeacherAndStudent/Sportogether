package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import support.model.vo.Support;

/**
 * Servlet implementation class SupportAppListServlet
 */
@WebServlet("/support/appList")
public class SupportAppListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportAppListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    
    
//승인 여부가 'N'인 후원 게시물 리스트 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int supportNo =Integer.parseInt(request.getParameter("supportNo"));
		
		List<Support> sList = new AdminService().printSupportList();
		
		//리스트 조회 성공하면
		if(!sList.isEmpty()) {
			//
			request.setAttribute("sList", sList);
			// 후원 승인 목록 페이지로 이동
			request.getRequestDispatcher("/Admin/support_approval.jsp")
			.forward(request, response);
		}else {
			//실패!
			System.out.println("미승인 후원 리스트 조회 실패 ㅠㅠ");
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
