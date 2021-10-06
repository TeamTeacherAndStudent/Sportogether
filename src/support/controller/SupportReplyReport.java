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
 * Servlet implementation class SupportReplyReport
 */
@WebServlet("/supportReply/report")
public class SupportReplyReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportReplyReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//신고 대상 댓글 번호 , 게시물 번호
		int supportNo = Integer.parseInt(request.getParameter("supportNo"));
		int replyNo = Integer.parseInt(request.getParameter("replyNo"));
	
		//세션에서 아이디 가져오기
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
	
		//로그인 했는지 세션 확인
		if(userId==null) {
			response.setContentType("text/html;charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");

			out.println("alert('로그인 후에 이용해주세요.')");

			out.println("history.back()");

			out.println("</script>");
		}
		//해당 댓글에 해당 아이디로 이미 신고 했는지 확인
		String idCheck = new SupportService().beforeReportCheck(replyNo, userId);
		//확인해서 같으면 = ( 이미 신고했으면 )
		if(idCheck!=null && idCheck.equals(userId)) {
			//이미 신고했습니다 ! 팝업 띄우기

			response.setContentType("text/html;charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");

			out.println("alert('이미 신고한 댓글입니다.')");

			out.println("history.back()");

			out.println("</script>");
		}else {
			// 신고한적 없으면
			// 댓글 번호, 아이디 '응원댓글신고' 테이블에 insert
			int result = new SupportService().reportSupportReply(replyNo,userId);
			if(result > 0) {
				
				//신고하였습니다. 최대한 빠른 시일 내에 검토하겠습니다. 팡ㅇㅂ업 띄우기
				response.setContentType("text/html;charset=UTF-8");

				PrintWriter out = response.getWriter();
				
				out.println("<script>");

				out.println("alert('신고접수되었습니다. 최대한 빠른 시일 내에 검토하겠습니다.')");

				out.println("history.back()");

				out.println("</script>");
			}else {
				request.getRequestDispatcher("WEB-INF/support/supportError.html");
			}
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
