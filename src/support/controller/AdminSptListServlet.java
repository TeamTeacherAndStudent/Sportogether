package support.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import support.model.service.SupportService;
import support.model.vo.PageData;
import support.model.vo.Support;

/**
 * Servlet implementation class AdminSptListServlet
 */
@WebServlet("/support/delList")
public class AdminSptListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSptListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    ///support/delList
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 0;
		String getCurrentPage = request.getParameter("currentPage");
		
		if(getCurrentPage == null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(getCurrentPage);
		}
		PageData pageData = new SupportService().printAllSupport(currentPage);
		List<Support> sList = pageData.getSupportList();
		//리스트 조회 성공하면
		if(!sList.isEmpty()) {
			//
			request.setAttribute("sList", sList);
			request.setAttribute("pageNavi",pageData.getPageNavi());
			
			request.getRequestDispatcher("/WEB-INF/Admin/campaign_delete.jsp")
			.forward(request, response);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/Admin/serviceFailed.html");
			view.forward(request, response);
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
