package support.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import support.model.service.SupportService;

/**
 * Servlet implementation class PaymentTestServlet
 */
@WebServlet("/support/paytest")
public class PaymentTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentTestServlet() {
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
		int supportNo = Integer.parseInt(request.getParameter("supportNo"));
		HttpSession session = request.getSession();
		String sesId = (String) session.getAttribute("userId");
		
		String userId = request.getParameter("donator-id");
		String userEmail = request.getParameter("donator-email");
		String userPhone = request.getParameter("donator-phone");
		String payMoney =request.getParameter("amount");
		int pAmount = Integer.parseInt(payMoney);
		
	
		
		
		System.out.println("유저아이디:"+userId.length());
		System.out.println("세션아이디:"+sesId);
		if(pAmount > 999 ) {
			
				request.setAttribute("supportNo", supportNo);
				request.setAttribute("userId", sesId);
				request.setAttribute("userEmail", userEmail);
				request.setAttribute("userPhone", userPhone);
				request.setAttribute("Amount", pAmount);
				request.getRequestDispatcher("/WEB-INF/Support/paypage.jsp").forward(request, response);
		
				
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");

			out.println("alert('최소 후원 금액은 1000원 입니다.')");

			out.println("history.back()");

			out.println("</script>");
		}
//		else {
		
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
//
//			out.println("<script>");
//
//			out.println("alert('후원 최소 금액은 1000원 입니다.')");
//
//			out.println("history.back()");
//
//			out.println("</script>");
//		}
		
	}

}
