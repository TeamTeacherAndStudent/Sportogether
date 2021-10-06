package support.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.model.service.SupportService;

/**
 * Servlet implementation class PaymentGetServlet
 */
@WebServlet("/support/paytodb")
public class PaymentGetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentGetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//결제 성공시 결제한 정보를 받아와
		int supportNo = Integer.parseInt(request.getParameter("supportNo"));
		String userId = request.getParameter("userId");
		int payAmount = Integer.parseInt(request.getParameter("amount"));
		//후원 내역과 후원 모금액에 추가
		SupportService ss= new SupportService();
		//후원 내역 추가
		System.out.println("1"+supportNo + userId + payAmount);
		int result1 = ss.registerSptHistory(userId, supportNo, payAmount);
		
		System.out.println("2"+supportNo + userId + payAmount);
		int result2 = ss.addDonation(supportNo,  payAmount);
		
		
		if(result1>0 && result2>0) {
			response.sendRedirect("/support/detail?supportNo="+supportNo);
		}else {
			request.getRequestDispatcher("/WEB-INF/Support/supportError.html").forward(request, response);
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

}
