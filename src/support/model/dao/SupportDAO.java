package support.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import support.model.vo.Support;

public class SupportDAO {
	// 후원 전체 조회
	public List<Support> selectAllSupport(Connection conn, int currentPage) {
		List<Support> sList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "";
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
				spt.setSupportContents(rset.getString("SUPPORT_CONTENTS"));
				spt.setSupportGoal(rset.getInt("SUPPORT_GOAL"));
				spt.setSupportAchived(rset.getInt("ACHIVED_RECORD"));
				spt.setSportsCategory(rset.getString("SPORTS_CATEGORY"));
				spt.setSupportFileName(rset.getString("FILE_NAME"));
				spt.setSupportFilePath(rset.getString("FILE_NAME"));
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
				sb.append("<a href ='/notice/list?currentPage=" + i + "'>" + i + " </a>");
			}
		}
		if(needNext) {
			sb.append("<a href='/notice/list?currentPage=" + (endNavi+1) + "'> [다음] </a>");
		}
		return sb.toString();
		
	}
	
	// 전체 후원 게시글의 갯수 구해오기
	private int totalCount(Connection conn) {
		int totalValue = 0;
		PreparedStatement pstmt = null;
		String query= "SELECT COUNT(*) AS TOTALCOUNT FROM SUPPORT WHERE SUPPORT_APPROVAL = ?";
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "Y");
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
		String query = "INSERT INTO SUPPORT VALUES (SEQ_SPT_NO.NEXTVAL,DEFAULT,?,?,?,DEFAULT,?,?,?,?,?,?,?,? )";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, spt.getSportsCategory());
			pstmt.setString(2,spt.getSupportWriter() );
			pstmt.setDate(3,spt.getSupportEndDate());
			pstmt.setString(4, spt.getSupportTitle());
			pstmt.setString(5, spt.getSupportPurpose());
			pstmt.setString(6, spt.getSupportContents());
			pstmt.setInt(7, spt.getSupportGoal());
			//모금액
			pstmt.setInt(8, 0);
			pstmt.setString(9, spt.getSupportFileName());
			pstmt.setLong(10, spt.getSupportFileSize());
			pstmt.setString(11, spt.getSupportFilePath());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
}
