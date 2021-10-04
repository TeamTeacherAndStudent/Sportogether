package admin.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import admin.model.dao.AdminDAO;
import common.JDBCTemplate;

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

}
