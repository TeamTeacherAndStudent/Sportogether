package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import member.model.vo.Member;

/**
 * Servlet implementation class PlayerApprovalServlet
 */
@WebServlet("/admin/player")
public class PlayerApprovalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PlayerApprovalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("user-id");
		String userPlayer = request.getParameter("user-player");
		Member member = new Member(userId,userPlayer);
		int result = new AdminService().updatePlayer(member);
		if(result > 0) {
			request.setAttribute("member", member);
			response.sendRedirect("/admin/main");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/Admin/Admin_Error.html");
			view.forward(request, response);
		}
	}

}
