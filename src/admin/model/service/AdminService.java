package admin.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import admin.model.dao.AdminDAO;
import admin.model.vo.ReportedBoard;
import common.JDBCTemplate;
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
	
	

	/*
	 * public board.model.vo.PageData printReportedBoardList(int currentPage) {
	 * Connection conn = null; AdminDAO aDAO = new AdminDAO(); PageData pageData =
	 * null; try { conn = jdbcTemplate.createConnection();
	 * pageData.setPageNavi(aDAO.getPageNavi(conn, currentPage));
	 * PageData.setReportedBoard(aDAO.selectReportedBoard(conn, currentPage)); }
	 * catch (SQLException e) { e.printStackTrace(); } finally {
	 * JDBCTemplate.close(conn); } return pageData; }
	 */


	
	}
