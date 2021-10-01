package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.JDBCTemplate;
import member.model.vo.Member;

public class MemberDAO {

	
	// 회원가입
	public int insertMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = 
				"INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPw());
			pstmt.setString(3, member.getUserNickName());
			pstmt.setString(4, member.getUserName());
			pstmt.setDate(5, member.getUserBirthDate());
			pstmt.setString(6, member.getUserGender());
			pstmt.setString(7, member.getUserPhone());
			pstmt.setString(8, member.getUserEmail());
			pstmt.setString(9, "");
			pstmt.setLong(10, 0);
			pstmt.setString(11, "");
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}
