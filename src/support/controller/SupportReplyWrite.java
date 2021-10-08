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
 * Servlet implementation class SupportReplyWrite
 */
@WebServlet("/supportReply/write")
public class SupportReplyWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportReplyWrite() {
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
		int supportNo = Integer.parseInt(request.getParameter("supportNo"));
		String supportReplyContents = request.getParameter("reply-contents");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		
	
		//로그인 했는지 세션 확인
		if(userId == null) {
			response.setContentType("text/html;charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");

			out.println("alert('로그인 후에 이용해주세요.')");

			out.println("history.back()");

			out.println("</script>");
			
		}else {
			int result = new SupportService().registerSupportReply(supportNo, userId, supportReplyContents);
			if(result > 0) {
				response.sendRedirect("/support/detail?supportNo="+supportNo);
			}else {
				request.getRequestDispatcher("/WEB-INF/Support/supportError.html").forward(request, response);
			}
		}
	
		
	
	}

}
