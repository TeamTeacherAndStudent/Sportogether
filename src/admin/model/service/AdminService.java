package admin.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import admin.model.dao.AdminDAO;
import common.JDBCTemplate;
import support.model.vo.Support;

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
	// 미승인 후원 리스트 조회
	public List<Support> printSupportList() {
		Connection conn = null;
		
		List<Support> sList = null;
		try {
			conn = jdbcTemplate.createConnection();
			sList = new AdminDAO().selectSupportList(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		
		
		return sList;
	}

}
