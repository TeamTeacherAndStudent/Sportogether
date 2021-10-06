package visitor.controller;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import visitor.model.dao.VisitorDAO;

/**
 * 방문자 수를 계산하는 클래스<br>
 * web.xml에 listener 등록을 해두었다. 이렇게 할 경우 톰캣이 실행되면서
 * 리스너가 실행된다. 
 */


public class VisitSessionListener implements HttpSessionListener{
	
	private VisitorDAO vDAO;
	
	public VisitSessionListener() {
		vDAO = new VisitorDAO();
	}

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("session이 생성확인");
		// 세션이 새로 생성되면 execute() 실행한다.
		if(arg0.getSession().isNew()){
			execute(arg0);
		}


	}

	private void execute(HttpSessionEvent arg0) {
		try {
			//전체 방문자 수 + 1
			vDAO.setVisitTotalCount();
			//오늘 방문자 수 
			int todayCount = vDAO.getVisitTodayCount();
			//전체 방문자 수
			int totalCount = vDAO.getVisitTotalCount();
			HttpSession session = arg0.getSession();

			//세션 속성에 담아준다
			session.setAttribute("totalCount", totalCount); //전체 방문자 수
			session.setAttribute("todayCount", todayCount); //오늘 방문자 수
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub

	}

}
