package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.ReportedBoard;
import support.model.vo.Support;
import admin.model.vo.PageData1;

/**
 * Servlet implementation class ReportedBoardList
 */
@WebServlet("/admin/reportedList/board")
public class ReportedBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportedBoardListServlet() {
        super();
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
		PageData1 pd = new AdminService().printReportedBoard(currentPage);
		List<ReportedBoard> bList = pd.getReportedbList();
		//System.out.println(pd.getReportPageNavi());
		
		if(!bList.isEmpty()) {
			request.setAttribute("bList", bList);
			request.setAttribute("pageNavi", pd.getReportPageNavi());
			request.getRequestDispatcher("/Admin/reported_manage.jsp").forward(request, response);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/Admin/serviceFailed.html");
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
