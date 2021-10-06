package support.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.model.service.SupportService;

/**
 * Servlet implementation class SupportRemove
 */
@WebServlet("/support/remove")
public class SupportRemove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportRemove() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int supportNo = Integer.parseInt(request.getParameter("supportNo"));
		int result = new SupportService().removeSupport(supportNo);
		
		if(result>0) {
			//삭제 성공
			response.sendRedirect("/support/list?supprtNo="+supportNo);
		}else {
			//삭제 실패
			PrintWriter out = response.getWriter();

			out.println("<script>");

			out.println("alert('삭제에 실패하였습니다.')");

			out.println("history.back()");

			out.println("</script>");
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
