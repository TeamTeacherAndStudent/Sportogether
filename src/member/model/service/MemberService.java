package member.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import common.JDBCTemplate;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {
	
	private JDBCTemplate jdbcTemplate;

	public MemberService () {
		jdbcTemplate = JDBCTemplate.getConnection();
	}
	//회원 가입
	public int registerMember(Member member) {
		int result = 0;
		Connection conn = null;
		try {
			conn = jdbcTemplate.createConnection();
			result = new MemberDAO().insertMember(conn, member);
			
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
	
	
	//Login 
	//login page에서 id와 pw를 받아와 해당하는 회원 정보를  DB에서 가져와
	//세션에 저장( 아이디, 닉네임, 선수여부, 관리자여부 )
	public Member printOneLogin(String userId, String userPw) {
		
		
		return null;
	}

}
