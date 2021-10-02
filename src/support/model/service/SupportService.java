package support.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import common.JDBCTemplate;
import support.model.dao.SupportDAO;
import support.model.vo.PageData;

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

}
