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
 * Servlet implementation class SupportReplyRemove
 */
@WebServlet("/supportReply/Remove")
public class SupportReplyRemove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportReplyRemove() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int supportNo = Integer.parseInt(request.getParameter("supportNo"));
		int replyNo = Integer.parseInt(request.getParameter("replyNo"));
		int result = new SupportService().removeSupportReply(replyNo);
		if(result > 0) {
//			response.sendRedirect("/support/detail?supportNo="+supportNo);


			response.sendRedirect("/support/detail?supportNo="+supportNo);

			
		}else {
			request.getRequestDispatcher("/WEB-INF/support/supportError.html");
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
