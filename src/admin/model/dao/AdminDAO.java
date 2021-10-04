package admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.JDBCTemplate;

public class AdminDAO {
	
	
	//후원 승인 여부 업데이트
	public int updateSupportApp(Connection conn, int supportNo) {
		int result = 0;
		String query = "UPDATE SUPPORT SET SUPPORT_APPROVAL = ? WHERE SUPPORT_NO = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "Y");
			pstmt.setInt(1, supportNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}
