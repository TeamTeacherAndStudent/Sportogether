package member.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import board.model.vo.Board;
import board.model.vo.PageData;
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
	
	
	//로그인
	//login page에서 id와 pw를 받아와 해당하는 회원 정보를  DB에서 가져와
	//세션에 저장( 아이디, 닉네임, 선수여부, 관리자여부 )
	public Member printOneLogin(String userId, String userPw) {
		Member member = null;
		Connection conn = null;
		try {
			conn = jdbcTemplate.createConnection();
			member = new MemberDAO().selectOneLogin(conn, userId, userPw);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		return member;
	}
	
	//마이페이지 회원정보 조회
	public Member printOneById(String userId) {
		Member member = null;
		Connection conn = null;
		
		try {
			conn = jdbcTemplate.createConnection();
			member = new MemberDAO().selectOneById(conn,userId);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		return member;
	}
	
	//마이페이지 회원정보 수정
	public int modifyMember(Member member) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = jdbcTemplate.createConnection();
			result = new MemberDAO().updateMember(conn,member);
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
	
	//마이페이지 회원탈퇴
	public int deleteMember(String userId) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = jdbcTemplate.createConnection();
			result = new MemberDAO().deleteMember(conn,userId);
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
	
	//마이페이지 내가 쓴 게시글 리스트
	public PageData printAllMypost(int currentPage, String userId) {
		Connection conn = null;
		List<Board> bList = null;
		String mypostPageNavi = null;
		PageData pd = new PageData();
		MemberDAO mDAO = new MemberDAO();
		try {
			conn = jdbcTemplate.createConnection();
			bList = mDAO.selectAllMypost(conn,currentPage,userId);
			mypostPageNavi = mDAO.getPageNavi(conn,currentPage,userId);
			pd.setBoardList(bList);
			pd.setPageNavi(mypostPageNavi);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		return pd;
	}
	
	// ID 찾기
	
	//입력받은 이름, 생년월일, 휴대폰 번호로 member 테이블에서 id 조회
	public String findUserId(String userName, String userBirth, String userPhone) {
		Connection conn = null;
		String userId = null;
		try {
			conn = jdbcTemplate.createConnection();
			userId = new MemberDAO().selectFindId(conn, userName, userBirth, userPhone);
				
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		
		return userId;
	}
	//회원 비밀번호 임시 비밀번호로 변경
	
	public int modifyPassword(String userId, String tempPw) {
		Connection conn = null;
		int result= 0;
		try {
			conn = jdbcTemplate.createConnection();
			result = new MemberDAO().updateTempPw(conn, userId , tempPw);
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
