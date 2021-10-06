package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberFindMyPw
 */
@WebServlet("/member/findpw")
public class MemberFindMyPw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindMyPw() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/login_registration/findmyPw.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("user-id");
		MemberService ms = new MemberService();
		Member m = ms.printOneById(userId);
		
		if(m == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");

			out.println("alert('존재하지 않는 아이디 입니다.')");

			out.println("history.back()");

			out.println("</script>");
//			request.setAttribute("userMail", userMail);
//			request.getRequestDispatcher("/login_registration/sendPw.jsp").forward(request, response);
			
		}
		//인증 번호 생성기
		 StringBuffer temp =new StringBuffer();
        Random rnd = new Random();
        for(int i=0;i<6;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String tempPw = temp.toString();
        //비밀번호 변경
        int result = 0 ;
        result = ms.modifyPassword(userId,tempPw);
        
        if(result > 0) {

        	//메일발송
        	String host = "smtp.gmail.com";
        	final String user = "rohilkie94@gmail.com"; 
        	String sender = "sportogether";
        	final String password = "jsilki94";
        	
        	
        	
        	// SMTP 서버 정보를 설정한다. (ssl적용에따라 설정옵션이 달라진다. 아래는 ssl적용 안한버전이다.)
        	Properties props = new Properties(); 
        	props.put("mail.smtp.starttls.enable", "true");
        	props.put("mail.smtp.host", host); 	
        	props.put("mail.smtp.port", 587); 
        	props.put("mail.smtp.auth", "true"); 
        	props.put("mail.smtp.ssl.protocols", "TLSv1.2");                                                                     
        	//인증	    
        	Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
        		protected PasswordAuthentication getPasswordAuthentication() { 
        			return new PasswordAuthentication(user, password); 
        		} 
        	}); 
        	
        	try { 
        		MimeMessage message = new MimeMessage(session); 
        		//받는사람 메일
        		message.setFrom(new InternetAddress(sender)); 
        		message.addRecipient(Message.RecipientType.TO, new InternetAddress(m.getUserEmail())); 
        		
        		// 메일 제목 
        		message.setSubject("SPORTOGETHER 임시 비밀번호 발송 안내입니다."); 
        		// 메일 내용 
        		message.setText("비밀번호가 임시 비밀번호 : "+temp+" 로 변경되었습니다. 로그인 후 반드시 비밀번호를 변경해주세요."); 
        		// send the message 
        		Transport.send(message); 
        	} catch (MessagingException e) {
        		e.printStackTrace(); 
        	} 
        	
        	
        	response.setContentType("text/html;charset=UTF-8");
        	
        	PrintWriter out = response.getWriter();
        	
        	out.println("<script>");
        	
        	out.println("alert('메일이 발송되었습니다.')");
        	
        	out.println("location.href='/index.jsp'");
        	
        	out.println("</script>");
        }else {
        	response.setContentType("text/html;charset=UTF-8");
        	
        	PrintWriter out = response.getWriter();
        	
        	out.println("<script>");
        	
        	out.println("alert('다시 시도해주세요.')");
        	
        	out.println("location.href='/index.jsp'");
        	
        	out.println("</script>");
        }
        
        
        
	}

}
