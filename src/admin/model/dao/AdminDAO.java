package admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import admin.model.vo.ReportedBoard;
import admin.model.vo.ReportedReply;
import common.JDBCTemplate;
import member.model.vo.Member;
import support.model.vo.Support;

public class AdminDAO {
	
	
	//후원 승인 여부 업데이트
	public int updateSupportApp(Connection conn, int supportNo) {
		int result = 0;
		String query = "UPDATE SUPPORT SET SUPPORT_APPROVAL = ? WHERE SUPPORT_NO = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "Y");
			pstmt.setInt(2, supportNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	//미승인 후원 전체 조회
	public List<Support> selectAllSupport(Connection conn, int currentPage) {
		List<Support> sList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM(SELECT ROW_NUMBER() OVER(ORDER BY SUPPORT_NO DESC) AS NUM, SUPPORT_NO,SUPPORT_APPROVAL, SUPPORT_CATEGORY, USER_ID, END_DATE, POSTING_DATE,SUPPORT_TITLE, SUPPORT_INTRO, SUPPORT_PURPOSE,SUPPORT_CONTENTS,SUPPORT_GOAL,ACHIVED_RECORD,FILE_NAME,FILE_SIZE,FILE_PATH  FROM SUPPORT  ) WHERE NUM BETWEEN ? AND ? AND SUPPORT_APPROVAL = ?";
		try {
			pstmt = conn.prepareStatement(query);
			
			int viewCountPerPage = 8;
			int start = currentPage * viewCountPerPage - (viewCountPerPage - 1);
			int end = currentPage * viewCountPerPage;
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, "N");
			rset = pstmt.executeQuery();
			sList = new ArrayList<Support>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			while(rset.next()) {
				Support spt = new Support();
				spt.setSupportNo(rset.getInt("SUPPORT_NO"));
				spt.setSupportTitle(rset.getString("SUPPORT_TITLE"));
				spt.setSupportWriter(rset.getString("USER_ID"));
				spt.setSupportPurpose(rset.getString("SUPPORT_PURPOSE"));
				spt.setSupportIntro(rset.getString("SUPPORT_INTRO"));
				spt.setSupportContents(rset.getString("SUPPORT_CONTENTS"));
				spt.setSupportGoal(rset.getInt("SUPPORT_GOAL"));
				spt.setSupportAchived(rset.getInt("ACHIVED_RECORD"));
				spt.setSportsCategory(rset.getString("SUPPORT_CATEGORY"));
				spt.setSupportFileName(rset.getString("FILE_NAME"));
				spt.setSupportFilePath(rset.getString("FILE_PATH"));
				spt.setSupportFileSize(rset.getLong("FILE_SIZE"));
				spt.setSupportApproval(rset.getString("SUPPORT_APPROVAL"));
				spt.setSupportRegDate(rset.getTimestamp("POSTING_DATE"));
//				spt.setSupportRegDate(sdf.format(rset.getTimestamp("POSTING_DATE")));
				spt.setSupportEndDate(rset.getDate("END_DATE"));
				sList.add(spt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally  {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		return sList ;
	
	}
	//미승인 후원 페이지 네비
	public String getPageNavi(Connection conn, int currentPage) {

		int pageCountPerView = 5;
		int viewTotalCount = totalCount(conn);
		int viewCountPerPage = 10;
		int pageTotalCount = 0 ;
		int pageTotalCountMod = viewTotalCount % viewCountPerPage;
		if(pageTotalCountMod > 0) {
			pageTotalCount = viewTotalCount / viewCountPerPage + 1 ; 
			
		}else {
			pageTotalCount = viewTotalCount / viewCountPerPage;
		}
		
		int startNavi = ((currentPage-1) / pageCountPerView) * pageCountPerView + 1;
		int endNavi = startNavi + pageCountPerView  - 1;
		// 맨 끝 페이지에서 페이지 토탈보다 더 크게 나오지 않게
		if ( endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		//좌우 버튼
		boolean needPrev = true;
		boolean needNext = true;
		//이전 버튼 안보이기
		if(startNavi == 1 ) {
			needPrev = false;
		}
		//다음 버튼 안보이기
		if(endNavi >= pageTotalCount){
			needNext = false;
		}
		StringBuilder sb = new StringBuilder();
		if(needPrev) { 
			sb.append("<a href='/support/appList?currentPage="+(startNavi-1) + "'>[이전] </a>");
		}
		for ( int i = startNavi ; i <= endNavi; i ++) {
			if(i == currentPage) {
				sb.append(i + " ");
			}else {
				sb.append("<a href ='/support/appList?currentPage=" + i + "'>" + i + " </a>");
			}
		}
		if(needNext) {
			sb.append("<a href='/support/appList?currentPage=" + (endNavi+1) + "'> [다음] </a>");
		}
		return sb.toString();
		
	}


	
	
	
	// 전체 미승인 후원 게시글의 갯수 구해오기
		private int totalCount(Connection conn) {
			int totalValue = 0;
			PreparedStatement pstmt = null;
			String query= "SELECT COUNT(*) AS TOTALCOUNT FROM SUPPORT WHERE SUPPORT_APPROVAL = ?";
			ResultSet rset = null;
			
			try {
				pstmt = conn.prepareStatement(query);
				//승인 여부 바꿔줘야함. 
				pstmt.setString(1, "N");
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					totalValue = rset.getInt("TOTALCOUNT");
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			
			return totalValue;
		}
		
		//신고된 자유게시판 글 목록
		
		public List<ReportedBoard> selectReportedBoard(Connection conn, int currentPage) {
			List<ReportedBoard> bList = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String query = "SELECT * FROM(SELECT ROW_NUMBER() OVER(ORDER BY BOARD_NO DESC) AS NUM, BOARD_NO, USER_ID, REPORTED_NO FROM REPORTED_BOARD) WHERE NUM BETWEEN ? AND ?";
			try {
				pstmt = conn.prepareStatement(query);
				
				int viewCountPerPage = 5;
				int start = currentPage * viewCountPerPage - (viewCountPerPage - 1);
				int end = currentPage * viewCountPerPage;
				
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rset = pstmt.executeQuery();
				bList = new ArrayList<ReportedBoard>();
				
				while(rset.next()) {
					ReportedBoard rBoard = new ReportedBoard();
					rBoard.setBoardNo(rset.getInt("BOARD_NO"));
					rBoard.setUserId(rset.getString("USER_ID"));
				//	System.out.println(rBoard.getUserId());
					bList.add(rBoard);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally  {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
				
			}
			return bList ;
		}
		public String getReportPageNavi(Connection conn, int currentPage) {
			int pageCountPerView = 5;
			int viewTotalCount = totalCount(conn);
			int viewCountPerPage = 10;
			int pageTotalCount = 0;
			int pageTotalCountMod = viewTotalCount % viewCountPerPage;
			if(pageTotalCountMod > 0) {
				pageTotalCount = viewTotalCount / viewCountPerPage + 1;
			}else {
				pageTotalCount = viewTotalCount / viewCountPerPage;
			}
			int startNavi = ((currentPage - 1)/pageCountPerView) *pageCountPerView + 1;
			int endNavi = startNavi + pageCountPerView - 1;
			if(endNavi > pageTotalCount) {
				endNavi = pageTotalCount; //끝페이지 이후의 값들 총 13페이지면 14 15안나오게
			}
			
			boolean needPrev = true; //다음이전값
			boolean needNext = true;
			if(startNavi == 1) {
				needPrev = false;
			}
			if(endNavi == pageTotalCount) { //끝값을 알아야(pageTotalCount 전체게시물가져옴
				needNext = false;
			}
			StringBuilder sb = new StringBuilder();
			if(needPrev) {
				sb.append("<a href = '/reportedList/board?currnetPage=" + (startNavi-1) +"'> [이전] </a>");
			}
			for(int i = startNavi ; i <= endNavi; i++) {
				if(i == currentPage) {
					sb.append(i);
				}else {
					sb.append("<a href='/reportedList/board?currentPage=" + i + "'>" + i + "</a>");
				}
			}
			if(needNext){
				sb.append("<a href = '/reportedList/board?currentPage=" +(endNavi+1) +"'> [다음] </a>");
			}
				return sb.toString();
		}
		
		
		private int ReportTotalCount(Connection conn) {
			int totalValue = 0;
			Statement stmt = null;
			ResultSet rset = null;
			String query = "SELECT COUNT(*) AS TOTALCOUNT FROM REPORTED_BOARD";
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				if(rset.next()) {
					totalValue = rset.getInt("TOTALCOUNT");
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(stmt);
				JDBCTemplate.close(rset);
			}
				return totalValue;
		}
		
		//관리자페이지 전체 회원 목록 조회
		public List<Member> selectAllMember(Connection conn, int currentPage) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY USER_ID) AS NUM, USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BIRTHDAY, USER_GENDER, USER_PHONE, USER_EMAIL, USER_CODE, PLAYER, USER_ENROLLDATE, USER_IMG_NAME, USER_IMG_SIZE, USER_IMG_PATH FROM MEMBER) WHERE NUM BETWEEN ? AND ?";
			List<Member> mList = null;
			try {
				pstmt = conn.prepareStatement(query);
				int viewCountPerPage = 10;
				int start = currentPage * viewCountPerPage - (viewCountPerPage -1);
				int end = currentPage * viewCountPerPage;
				pstmt.setInt(1,start);
				pstmt.setInt(2,end);
				rset = pstmt.executeQuery();
				mList = new ArrayList<Member>();
				while(rset.next()) {
					Member member = new Member();
					member.setUserId(rset.getString("USER_ID"));
					member.setUserPw(rset.getString("USER_PW"));
					member.setUserNickName(rset.getString("USER_NICKNAME"));
					member.setUserName(rset.getString("USER_NAME"));
					member.setUserBirthDate(rset.getString("USER_BIRTHDAY"));
					member.setUserGender(rset.getString("USER_GENDER"));
					member.setUserPhone(rset.getString("USER_PHONE"));
					member.setUserEmail(rset.getString("USER_EMAIL"));
					member.setUserCode(rset.getString("USER_EMAIL"));
					member.setUserPlayer(rset.getString("PLAYER")); //변수명 체크
					member.setUserEnrollDate(rset.getDate("USER_ENROLLDATE"));
					member.setUserImgName(rset.getString("USER_IMG_NAME"));
					member.setUserImgSize(rset.getInt("USER_IMG_SIZE"));
					member.setUserImgPath(rset.getString("USER_IMG_PATH"));
					mList.add(member);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return mList;
		}
		
		
		//관리자 회원 상세 조회
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
					member.setUserCode(rset.getString("USER_EMAIL"));
					member.setUserPlayer(rset.getString("PLAYER")); //변수명 체크
					member.setUserEnrollDate(rset.getDate("USER_ENROLLDATE"));
					member.setUserImgName(rset.getString("USER_IMG_NAME"));
					member.setUserImgSize(rset.getInt("USER_IMG_SIZE"));
					member.setUserImgPath(rset.getString("USER_IMG_PATH"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return member;
		}
		
		//관리자페이지 회원강퇴
		public int deleteMember(Connection conn, String userId) {
			PreparedStatement pstmt = null;
			int result = 0;
			String query = "DELETE FROM MEMBER WHERE USER_ID = ?";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,userId);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			return result;
		}
		
		//선수 인증
		public int updatePlayer(Connection conn, String userId) {
			int result = 0;
			PreparedStatement pstmt = null;
			String query = "UPDATE MEMBER SET PLAYER = 'Y' WHERE USER_ID = ?";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, userId);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}
		
		
		//관리자페이지 회원검색
		public List<Member> selectSearchMember(Connection conn, String searchKeyword) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			List<Member> mList = null;
			String query = "SELECT * FROM MEMBER WHERE USER_ID = ?";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, searchKeyword);
				mList = new ArrayList<Member>();
				rset = pstmt.executeQuery();
				if(rset.next()) {
					Member member = new Member();
					member.setUserId(rset.getString("USER_ID"));
					member.setUserPw(rset.getString("USER_PW"));
					member.setUserNickName(rset.getString("USER_NICKNAME"));
					member.setUserName(rset.getString("USER_NAME"));
					member.setUserBirthDate(rset.getString("USER_BIRTHDAY"));
					member.setUserGender(rset.getString("USER_GENDER"));
					member.setUserPhone(rset.getString("USER_PHONE"));
					member.setUserEmail(rset.getString("USER_EMAIL"));
					member.setUserCode(rset.getString("USER_EMAIL"));
					member.setUserPlayer(rset.getString("PLAYER")); //변수명 체크
					member.setUserEnrollDate(rset.getDate("USER_ENROLLDATE"));
					member.setUserImgName(rset.getString("USER_IMG_NAME"));
					member.setUserImgSize(rset.getInt("USER_IMG_SIZE"));
					member.setUserImgPath(rset.getString("USER_IMG_PATH"));
					mList.add(member);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return mList;
		}
		public List<ReportedReply> selectReportedReply(Connection conn, int currentPage) {
			List<ReportedReply> rList = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String query = "SELECT * FROM(SELECT ROW_NUMBER() OVER(ORDER BY REPLY_NO DESC) AS NUM, REPLY_NO, USER_ID, REPORTED_REPLY_NO FROM REPORTED_REPLY) WHERE NUM BETWEEN ? AND ?";
			try {
				pstmt = conn.prepareStatement(query);
				
				int viewCountPerPage = 5;
				int start = currentPage * viewCountPerPage - (viewCountPerPage - 1);
				int end = currentPage * viewCountPerPage;
				
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rset = pstmt.executeQuery();
				rList = new ArrayList<ReportedReply>();
				
				while(rset.next()) {
					ReportedReply rReply = new ReportedReply();
					rReply.setReplyNo(rset.getInt("REPLY_NO"));
					rReply.setUserId(rset.getString("USER_ID"));
				//	System.out.println(rReply.getUserId());
					rList.add(rReply);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally  {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
				
			}
			return rList ;
		}
}
