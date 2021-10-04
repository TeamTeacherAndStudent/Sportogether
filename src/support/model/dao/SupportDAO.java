package support.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import support.model.vo.Support;
import support.model.vo.SupportReply;

public class SupportDAO {
	// 후원 전체 조회
	public List<Support> selectAllSupport(Connection conn, int currentPage) {
		List<Support> sList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM(SELECT ROW_NUMBER() OVER(ORDER BY SUPPORT_NO DESC) AS NUM, SUPPORT_NO,SUPPORT_APPROVAL, SUPPORT_CATEGORY, USER_ID, END_DATE, POSTING_DATE,SUPPORT_TITLE, SUPPORT_INTRO, SUPPORT_PURPOSE,SUPPORT_CONTENTS,SUPPORT_GOAL,ACHIVED_RECORD,FILE_NAME,FILE_SIZE,FILE_PATH  FROM SUPPORT  ) WHERE NUM BETWEEN ? AND ? ";
		try {
			pstmt = conn.prepareStatement(query);
			
			int viewCountPerPage = 8;
			int start = currentPage * viewCountPerPage - (viewCountPerPage - 1);
			int end = currentPage * viewCountPerPage;
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			sList = new ArrayList<Support>();
			
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

	// 페이지 네비
	public String getPageNavi(Connection conn, int currentPage) {
		
		int pageCountPerView = 5;
		int viewTotalCount = totalCount(conn);
		int viewCountPerPage = 8;
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
			sb.append("<a href='/support/list?currentPage="+(startNavi-1) + "'>[이전] </a>");
		}
		for ( int i = startNavi ; i <= endNavi; i ++) {
			if(i == currentPage) {
				sb.append(i + " ");
			}else {
				sb.append("<a href ='/support/list?currentPage=" + i + "'>" + i + " </a>");
			}
		}
		if(needNext) {
			sb.append("<a href='/support/list?currentPage=" + (endNavi+1) + "'> [다음] </a>");
		}
		return sb.toString();
		
	}
	
	// 전체 후원 게시글의 갯수 구해오기
	private int totalCount(Connection conn) {
		int totalValue = 0;
		PreparedStatement pstmt = null;
		String query= "SELECT COUNT(*) AS TOTALCOUNT FROM SUPPORT ";
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			//승인 여부 바꿔줘야함. 
//			pstmt.setString(1, "Y");
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
	// 후원 게시물 등록
	public int insertSupport(Connection conn, Support spt) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO SUPPORT VALUES (SEQ_SPT_NO.NEXTVAL,DEFAULT,?,?,?,DEFAULT,?,?,?,?,?,?,?,?,? )";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, spt.getSportsCategory());
			pstmt.setString(2,spt.getSupportWriter() );
			pstmt.setDate(3,spt.getSupportEndDate());
			pstmt.setString(4, spt.getSupportTitle());
			pstmt.setString(5, spt.getSupportIntro());
			pstmt.setString(6, spt.getSupportPurpose());
			pstmt.setString(7, spt.getSupportContents());
			pstmt.setInt(8, spt.getSupportGoal());
			//모금액
			pstmt.setInt(9, 0);
			pstmt.setString(10, spt.getSupportFileName());
			pstmt.setLong(11, spt.getSupportFileSize());
			pstmt.setString(12, spt.getSupportFilePath());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	//만약 닉네임을 찾는 메소드를 하나 만든다면?
	// 후원 상세 조회
	public Support selectOneByNo(Connection conn, int supportNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Support spt = null;
		String query = "SELECT * FROM SUPPORT WHERE SUPPORT_NO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, supportNo);
			rset = pstmt.executeQuery();
			spt = new Support();
			if(rset.next()) {
				spt.setSupportNo(supportNo);
				spt.setSupportTitle(rset.getString("SUPPORT_TITLE"));
				spt.setSupportWriter(rset.getString("USER_ID"));
				spt.setSupportIntro(rset.getString("SUPPORT_INTRO"));
				spt.setSupportPurpose(rset.getString("SUPPORT_PURPOSE"));
				spt.setSupportContents(rset.getString("SUPPORT_CONTENTS"));
				spt.setSupportGoal(rset.getInt("SUPPORT_GOAL"));
				spt.setSupportAchived(rset.getInt("ACHIVED_RECORD"));
				spt.setSportsCategory(rset.getString("SUPPORT_CATEGORY"));
				spt.setSupportFileName(rset.getString("FILE_NAME"));
				spt.setSupportFilePath(rset.getString("FILE_PATH"));
				spt.setSupportFileSize(rset.getLong("FILE_SIZE"));
				spt.setSupportApproval(rset.getString("SUPPORT_APPROVAL"));
				spt.setSupportRegDate(rset.getTimestamp("POSTING_DATE"));
				spt.setSupportEndDate(rset.getDate("END_DATE"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally  {
			
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return spt;
	}
	// 후원 댓글 목록 가져오기
	public List<SupportReply> selectReplayList(Connection conn, int supportNo) {
		PreparedStatement pstmt = null;
		String query = "SELECT * FROM SUPPORT_REPLY WHERE SUPPORT_NO = ? ORDER BY REPLY_NO DESC";
		List<SupportReply> srList = null;
		ResultSet rset = null;
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, supportNo);
			rset=pstmt.executeQuery();
			srList = new ArrayList<SupportReply>();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			while(rset.next()) {
				SupportReply sp = new SupportReply();
				sp.setSupportReplyNo(rset.getInt("REPLY_NO"));
				sp.setSupportNo(rset.getInt("SUPPORT_NO"));
				sp.setSupportReplyContents(rset.getString("REPLY_CONTENTS"));
				sp.setSupportReplyWriter(rset.getString("USER_ID"));
				
				sp.setSupportReplyRegDate(formatter.format(rset.getTimestamp("REPLY_DATE")));
				srList.add(sp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return srList;
	}
	
	// 후원 게시물 수정
		public int updateSupport(Connection conn, Support spt) {
			int result = 0;  
			String query = "UPDATE SUPPORT SET SUPPORT_TITLE = ?, SUPPORT_PURPOSE = ?, SUPPORT_CONTENTS = ?, SUPPORT_CATEGORY = ?, SUPPORT_GOAL = ?, END_DATE = ?, FILE_NAME = ? , FILE_SIZE = ?, FILE_PATH = ?, SUPPORT_INTRO = ? WHERE SUPPORT_NO = ?";
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, spt.getSupportTitle());
				pstmt.setString(2, spt.getSupportPurpose());
				pstmt.setString(3, spt.getSupportContents());
				pstmt.setString(4, spt.getSportsCategory());
				pstmt.setInt(5, spt.getSupportGoal());
				pstmt.setDate(6,spt.getSupportEndDate());
				pstmt.setString(7, spt.getSupportFileName());
				pstmt.setLong(8, spt.getSupportFileSize());
				pstmt.setString(9, spt.getSupportFilePath());
				pstmt.setString(10, spt.getSupportIntro());
				pstmt.setInt(11, spt.getSupportNo());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally { 
				JDBCTemplate.close(pstmt);
			}
			return result ;
		}
	
		
	//후원 응원 댓글 작성
	public int insertReply(Connection conn, int supportNo, String userId, String supportReplyContents) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		String query = "INSERT INTO SUPPORT_REPLY VALUES(SEQ_SPT_REPLY_NO.NEXTVAL,?,DEFAULT,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, supportNo);
			pstmt.setString(2, supportReplyContents);
			pstmt.setString(3, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	// 후원 댓글 삭제 
	public int deleteReply(Connection conn, int replyNo) {
		PreparedStatement pstmt = null;
		String query ="DELETE FROM SUPPORT_REPLY WHERE REPLY_NO = ?";
		int result = 0;
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, replyNo);
					result = pstmt.executeUpdate();
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally { 
					JDBCTemplate.close(pstmt);
				}
				
		return result;
	}
	// 후원 댓글 신고 
	//REPORTED_SUPPORT_REPLY 테이블에 삽입
	public int insertReportReply(Connection conn, int replyNo, String userId) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO REPORTED_SUPPORT_REPLY VALUES(?,?)";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, replyNo);
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	// 댓글 신고 전
	// 이미 신고했는지 select
	public String selectBeforeReport(Connection conn, int replyNo, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query= "SELECT USER_ID FROM REPORTED_SUPPORT_REPLY WHERE USER_ID = ? AND REPLY_NO = ? ";
		String idCheck = null;
		try {
			pstmt  = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2, replyNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				idCheck = rset.getString("USER_ID");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return idCheck;
	}
	
	
}
