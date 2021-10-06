package support.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import support.model.service.SupportService;
import support.model.vo.Support;

/**
 * Servlet implementation class SupportWriteServlet
 */
@WebServlet("/support/write")
public class SupportWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/Support/supportWrite.html").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		//upload 경로?
		String uploadFilePath = request.getServletContext().getRealPath("upload");
//		System.out.println("업로드 리얼 패스 : " + uploadFilePath);
		int uploadFileLimit = 8*1024*1024; //최대 파일 크기 5mb
		String encType = "UTF-8";
		MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileLimit, encType, new DefaultFileRenamePolicy());
		//multi로 수정	
		String title =multi.getParameter("title");
		String content = multi.getParameter("content");
		String purpose = multi.getParameter("purpose");
		String sportsCate = multi.getParameter("sports");
		String sptGoal = multi.getParameter("mokpyo");
		String sptEndDate = multi.getParameter("end-date");
		String sptIntro = multi.getParameter("intro");
		
		int supportGoal = Integer.parseInt(sptGoal);
		Date supportEndDate = Date.valueOf(sptEndDate);
		
		//세션에서 id 가져오기..
		HttpSession session = request.getSession();
		String supportWriter = (String)session.getAttribute("userId");
	
		String supportFileName = multi.getFilesystemName("img-file");
		if(supportFileName == null) {
			response.setContentType("text/html;charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");

			out.println("alert('첨부할 이미지 파일을 선택해주세요.')");

			out.println("history.back()");

			out.println("</script>");
		}
		File uploadFile = multi.getFile("img-file");
		String filePath = uploadFile.getPath();
		long fileSize = uploadFile.length();
		
		
		//Support 객체에 정보 세팅..
		Support spt = new Support();
		spt.setSupportTitle(title);
		spt.setSupportContents(content);
		spt.setSupportPurpose(purpose);
		spt.setSportsCategory(sportsCate);
		spt.setSupportGoal(supportGoal);
		spt.setSupportEndDate(supportEndDate);
		spt.setSupportWriter(supportWriter);
		spt.setSupportIntro(sptIntro);
		
		
		//upload파일 정보 Support객체에 세팅
		spt.setSupportFileName(supportFileName);
		spt.setSupportFilePath(filePath);
		spt.setSupportFileSize(fileSize);
		//insert
		int result = new SupportService().registerSupport(spt);
		
		
		//결과
		if(result > 0) {
			
			//콘솔에 후원 성공 테스트
			System.out.println("후원 등록 성공");
			response.sendRedirect("/support/list");
		}else {
			request.getRequestDispatcher("/WEB-INF/Support/supportError.html")
			.forward(request, response);
		}
	}

}
