package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import board.model.vo.Board;
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
				member.setUserBirthDate(rset.getString("USER_BIRTHDAY"));
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



	
	//마이페이지 회원탈퇴
	public int deleteMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "DELETE FROM MEMBER WHERE USER_ID = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//마이페이지 내가 쓴 게시글 리스트
	public List<Board> selectAllMypost(Connection conn, int currentPage, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY BOARD_NO DESC) AS NUM, BOARD_NO, BOARD_TITLE, BOARD_CONTENTS, SPORTS_NAME, USER_ID, BOARD_ENROLLDATE, BOARD_COUNT, BOARD_LIKE FROM FREEBOARD WHERE USER_ID = ?) WHERE NUM BETWEEN ? AND ?";
		List<Board> bList = null;
		try {
			pstmt = conn.prepareStatement(query);
			int viewCountPerPage = 10;
			int start = currentPage * viewCountPerPage - (viewCountPerPage - 1);
			int end = currentPage * viewCountPerPage;
			pstmt.setString(1, userId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			bList = new ArrayList<Board>();
			while(rset.next()) {
				Board board = new Board();
				board.setBoardNo(rset.getInt("BOARD_NO"));
				board.setSportsName(rset.getString("SPORTS_NAME"));
				board.setBoardTitle(rset.getString("BOARD_TITLE"));
				board.setBoardContents(rset.getString("BOARD_CONTENTS"));
				board.setUserId(rset.getString("USER_ID"));
				board.setBoardEnrollDate(rset.getDate("BOARD_ENROLLDATE"));
				board.setBoardCount(rset.getInt("BOARD_COUNT"));
				board.setBoardLike(rset.getInt("BOARD_COUNT"));
				bList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return bList;
	}

	//마이페이지 내가 쓴 게시글 리스트 페이징
	public String getPageNavi(Connection conn, int currentPage, String userId) {
		int pageCountPerView = 5;
		int viewTotalCount = totalCount(conn, userId);
		int viewCountPerPage = 10;
		int pageTotalCount = 0;
		int pageTotalCountMod = viewTotalCount % viewCountPerPage;
		if(pageTotalCountMod > 0) {
			pageTotalCount = (viewTotalCount / viewCountPerPage) + 1;
		}else {
			pageTotalCount = viewTotalCount / viewCountPerPage;
		}
		
		int startNavi = ((currentPage - 1) / pageCountPerView) * pageCountPerView + 1;
		int endNavi = startNavi + pageCountPerView - 1;
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder();
		if(needPrev) {
			sb.append("<a href='/mypage/mypost?userId="+userId+"&cuentPage="+(startNavi-1)+"'> ◀ </a>");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='/mypage/mypost?userId="+userId+"&currentPage"+i+"'>" + i + "</a>");
		}
		if(needNext) {
			sb.append("<a href='/mypage/mypost?userId="+userId+"&cuentPage="+(endNavi+1)+"'> ▶ </a>");
		}
		return sb.toString();
	}

	//마이페이지 내가쓴게시글 토탈카운트
	private int totalCount(Connection conn, String userId) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "SELECT COUNT(*) AS TOTALCOUNT FROM FREEBOARD WHERE USER_ID ='" +userId+ "'";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt("TOTALCOUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}

		return result;
	}




}
