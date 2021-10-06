package support.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.model.service.SupportService;
import support.model.vo.PageData;
import support.model.vo.Support;

/**
 * Servlet implementation class SupportListServlet
 */
@WebServlet("/support/list")
public class SupportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SupportListServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
		if(!sList.isEmpty()) {
			request.setAttribute("sList", sList);
			
			request.setAttribute("pageNavi",pageData.getPageNavi());
			request.getRequestDispatcher("/WEB-INF/Support/support_main.jsp")
			.forward(request, response);
		}else {
//			RequestDispatcher view = request.getRequestDispatcher("/Support/support_main.jsp");
//			view.forward(request, response);
//			response.sendRedirect("/Support/support_main.jsp");
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
