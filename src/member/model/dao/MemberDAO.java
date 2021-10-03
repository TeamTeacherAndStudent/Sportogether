package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.ResultSet;

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
			pstmt.setString(5, member.getUserBirthDate());
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

	// 로그인 
	
	// 아이디, 닉네임, 유저코드(관리자여부), 선수여부를 가져와 세션에 넣기
	public Member selectOneLogin(Connection conn, String userId, String userPw) {
		PreparedStatement pstmt = null;
		Member member = null;
		ResultSet rset = null;
		String query = "SELECT * FROM MEMBER WHERE USER_ID = ? AND USER_PW = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			rset = pstmt.executeQuery();
			if(rset.next()) { 
				member = new Member();
				member.setUserId(rset.getString("USER_ID"));
				member.setUserNickName(rset.getString("USER_NICKNAME"));
				member.setUserCode(rset.getString("USER_CODE"));
				member.setUserPlayer(rset.getString("PLAYER"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return member;
	}

	
	//마이페이지 회원정보 조회
	public Member selectOneById(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		String query = "SELECT * FROM MEMBER WHERE USER_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member();
				member.setUserId(rset.getString("USER_ID"));
				member.setUserPw(rset.getString("USER_PW"));
				member.setUserNickName(rset.getString("USER_NICKNAME"));
				member.setUserName(rset.getString("USER_NAME"));
				member.setUserBirthDate(rset.getString("USER_BIRTHDATE"));
				member.setUserGender(rset.getString("USER_GENDER"));
				member.setUserPhone(rset.getString("USER_PHONE"));
				member.setUserEmail(rset.getString("USER_EMAIL"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return member;
	}
	
	
	//마이페이지 회원정보 수정
	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET USER_NICKNAME = ?, USER_PW = ?, USER_EMAIL = ?, USER_PHONE = ? WHERE USER_ID=?";
	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserNickName());
			pstmt.setString(2, member.getUserPw());
			pstmt.setString(3, member.getUserEmail());
			pstmt.setString(4, member.getUserPhone());
			pstmt.setString(5, member.getUserId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//자원해제
			JDBCTemplate.close(pstmt);
		}
		return result;
	}




}
