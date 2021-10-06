package admin.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import admin.model.dao.AdminDAO;
import admin.model.vo.ReportedBoard;
import common.JDBCTemplate;
import member.model.vo.Member;
import support.model.dao.SupportDAO;
import support.model.vo.PageData;
import support.model.vo.Support;
import admin.model.vo.PageData1;
public class AdminService {
	
private JDBCTemplate jdbcTemplate;
	
	public AdminService() {
		jdbcTemplate = JDBCTemplate.getConnection();
	}
	
	// 관리자 후원 승인 
	public int approveSupport(int supportNo) {
		Connection conn = null;
		int result = 0;
		try {
			conn = jdbcTemplate.createConnection();
			result = new AdminDAO().updateSupportApp(conn, supportNo);
			if(result > 0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		
		return result;
	}
	//미승인 후원 전체  목록 조회
	public PageData printAllSupport(int currentPage) {
		
		Connection conn = null;
		AdminDAO aDAO = new AdminDAO();
		PageData pageData = new PageData();
		try {
			conn = jdbcTemplate.createConnection();
			pageData.setPageNavi(aDAO.getPageNavi(conn, currentPage));
			pageData.setSupportList(aDAO.selectAllSupport(conn, currentPage));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			JDBCTemplate.close(conn);
		}
		return pageData;
	}

	
	public PageData1 printReportedBoard(int currentPage) {
		Connection conn = null; 
		AdminDAO aDAO = new AdminDAO();  
		PageData1 pd = new PageData1();
		try { 
			conn = jdbcTemplate.createConnection();
			pd.setReportPageNavi(aDAO.getReportPageNavi(conn, currentPage));
			pd.setReportedbList(aDAO.selectReportedBoard(conn, currentPage));
		} catch (SQLException e) { 
			e.printStackTrace(); 
		} finally {
				 JDBCTemplate.close(conn); 
		}return pd;
	}

	
	//관리자페이지 전체 회원 목록 조회
	public PageData printAllMember(int currentPage) {
		PageData pd = new PageData();
		Connection conn = null;
		AdminDAO aDAO = new AdminDAO();
		
		try {
			conn = jdbcTemplate.createConnection();
			pd.setMemberList(aDAO.selectAllMember(conn,currentPage));
			pd.setPageNavi(aDAO.getPageNavi(conn, currentPage));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		return pd;
	}

	//관리자페이지 회원 상세 조회
	public Member printOneById(String userId) {
		Member member = null;
		Connection conn = null;
		
		try {
			conn = jdbcTemplate.createConnection();
			member = new AdminDAO().selectOneById(conn,userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		return member;
	}

	
	//관리자페이지 회원강퇴처리
	public int deleteMember(String userId) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = jdbcTemplate.createConnection();
			result = new AdminDAO().deleteMember(conn,userId);
			if(result > 0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	
	//선수 인증
	public int updatePlayer(String userId) {
		int result = 0;
		Connection conn = null;
		try {
			conn = jdbcTemplate.createConnection();
			result = new AdminDAO().updatePlayer(conn,userId);
			if(result>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		return result;
	}

	
	//관리자페이지 회원 검색
	public List<Member> printSearchMember(String searchKeyword) {
		Connection conn = null;
		List<Member> mList = null;
		try {
			conn = jdbcTemplate.createConnection();
			mList = new AdminDAO().selectSearchMember(conn,searchKeyword);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		return mList;
	}
}
