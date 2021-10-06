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
 * Servlet implementation class SupportPayServlet
 */
@WebServlet("/support/pay")
public class SupportPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportPayServlet() {
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
		request.setCharacterEncoding("UTF-8");
		SupportService ss= new SupportService();
		int donateMin = 1000;
		String userId = request.getParameter("donator-id");
		int supportNo = Integer.parseInt(request.getParameter("supportNo"));
		String pAmount = request.getParameter("amount");
		
//		if( pAmount.equals("")) {
//			
//			
//		}
		int payAmount = Integer.parseInt(pAmount);
		
		if(payAmount < donateMin) {
			response.setContentType("text/html;charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");

			out.println("alert('1000원 이상의 금액을 입력해주세요.')");

			out.println("history.back()");

			out.println("</script>");
			
		
		}
		
		System.out.println(payAmount);
		
		int result = ss.registerSptHistory(userId, supportNo, payAmount);
		if(result > 1) {
			response.sendRedirect("/support/detail?supportNo="+supportNo);
		}else {
			request.getRequestDispatcher("/WEB-INF/Support/supportError.html").forward(request, response);
		}
		
	}

}
