package support.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import common.JDBCTemplate;
import support.model.dao.SupportDAO;
import support.model.vo.PageData;
import support.model.vo.Support;

public class SupportService {
 
	private JDBCTemplate jdbcTemplate;
	
	public SupportService() {
		jdbcTemplate = JDBCTemplate.getConnection();
	}
	
	// 후원 전체 목록 조회
	public PageData printAllSupport(int currentPage) {
		PageData pageData = null;
		Connection conn = null;
		SupportDAO sDAO = new SupportDAO();
		try {
			conn = jdbcTemplate.createConnection();
			pageData.setPageNavi(sDAO.getPageNavi(conn, currentPage));
			pageData.setSupportList(sDAO.selectAllSupport(conn, currentPage));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			JDBCTemplate.close(conn);
		}
		return pageData;
	}
	// 후원 게시물 등록
	public int registerSupport(Support spt) {
		int result = 0;
		Connection conn = null;
		try {
			conn = jdbcTemplate.createConnection();
			result = new SupportDAO().insertSupport(conn, spt);
			if(result>0) {
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

}
