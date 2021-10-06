package notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import notice.model.vo.Notice;

public class NoticeDAO {

	public int insertNotice(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO NOTICE VALUES(SEQ_NOTICE.NEXTVAL,?,?,?,DEFAULT,DEFAULT)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContents());
			pstmt.setString(3, notice.getNoticeWriter());
			//쿼리문 실행
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//공지사항 목록 출력
	public List<Notice> selectAllNotice(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY NOTICE_NO DESC) AS NUM, NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENTS, NOTICE_WRITER, NOTICE_DATE, NOTICE_COUNT FROM NOTICE) WHERE NUM BETWEEN ? AND ? ";
		List<Notice> nList = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			// 1. -> 1~10
			// 2. -> 11~20
			// 3. -> 21~30
			// 4. -> 31~40
			// 5. -> 41~50
			int viewCountPerPage = 10;
			int start = currentPage * viewCountPerPage - (viewCountPerPage -1);
			int end = currentPage * viewCountPerPage;
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			nList = new ArrayList<Notice>();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			while(rset.next()) {
				Notice notice = new Notice();
				notice.setNoticeNo(rset.getInt("NOTICE_NO"));
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setNoticeContents(rset.getString("NOTICE_CONTENTS"));
				notice.setNoticeWriter(rset.getString("NOTICE_WRITER"));
				notice.setNoticeDate(rset.getTimestamp("NOTICE_DATE"));
				nList.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return nList;
	}

	//페이징
	public String getPageNavi(Connection conn, int currentPage) {
		// 1 2 3 4 5
		int pageCountPerView = 5; //보이는 페이지의 갯수가 5개 -> [이전] 1 2 3 4 5 [다음]
		
		//총 페이지의 갯수는 게시물의 갯수에 의해 정해짐
		// 1페이지당 10개씩 출력, 예> 125개의 게시물 -> 총페이지는 13페이지가 되어야함
		int viewTotalCount = totalCount(conn);
		int viewCountPerPage = 10;
		int pageTotalCount = 0;
		int pageTotalCountMod = viewTotalCount % viewCountPerPage; 
		//나눠 떨어지면 몫 그대로 쓰면 되는데, 나누어 떨어지지 않으면 +1 해줘야함
		if(pageTotalCountMod > 0) {
			pageTotalCount = (viewTotalCount / viewCountPerPage) + 1;
		}else {
			pageTotalCount = viewTotalCount / viewCountPerPage;
		}
		
		//currentPage 값이 1일 때 -> 페이지 카운트 1 2 3 4 5 
		// 2일 때 -> 1 2 3 4 5 
		// 6일 때 -> 6 7 8 9 10
		int startNavi = ((currentPage -1) / pageCountPerView) * pageCountPerView + 1;
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
			sb.append("<a href='/notice/list?currentPage=" + (startNavi-1) + "'> ◀ </a>");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			if(i == currentPage) {
				sb.append(i + " ");
			}else {
				sb.append("<a href='/notice/list?currentPage=" + i + "'> " + i + "</a>");
			}
		}
		if(needNext) {
			sb.append("<a href='/notice/list?currentPage=" + (endNavi+1) + "'> ▶ </a>");
		}
		return sb.toString();
	}

	//토탈페이지값 알기 위한 메소드
	public int totalCount(Connection conn) {
		int totalValue= 0 ;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "SELECT COUNT(*) AS TOTALCOUNT FROM NOTICE";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				totalValue = rset.getInt("TOTALCOUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return totalValue;
	}

	//상세조회
	public Notice selectOneByNo(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice noticeOne = null;
		String query = "SELECT * FROM NOTICE WHERE NOTICE_NO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			if(rset.next()) {
				noticeOne = new Notice();
				noticeOne.setNoticeNo(rset.getInt("NOTICE_NO"));
				noticeOne.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				noticeOne.setNoticeContents(rset.getString("NOTICE_CONTENTS"));
				noticeOne.setNoticeWriter(rset.getString("NOTICE_WRITER"));
				noticeOne.setNoticeDate(rset.getTimestamp("NOTICE_DATE"));
				noticeOne.setNoticeCount(rset.getInt("NOTICE_COUNT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return noticeOne;
	}

	
	//공지삭제
	public int deleteNotice(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "DELETE FROM NOTICE WHERE NOTICE_NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
	
		return result;
	}

	//공지수정
	public int updateNotice(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "UPDATE NOTICE SET NOTICE_TITLE=?, NOTICE_CONTENTS=? WHERE NOTICE_NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContents());
			pstmt.setInt(3, notice.getNoticeNo());
			//쿼리문실행
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	/*
	 * //공지조회수 public int updateReadCount(Connection conn, int noticeNo) {
	 * PreparedStatement pstmt = null; String query =
	 * "UPDATE NOTICE SET NOTICE_COUNT = NOTICE_COUNT+1 WHERE NOTICE_NO = ? "; int
	 * result = 0; try { pstmt = conn.prepareStatement(query); pstmt.setInt(1,
	 * noticeNo); result = pstmt.executeUpdate();
	 * 
	 * } catch (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } finally { JDBCTemplate.close(pstmt); } return result;
	 * }
	 */
	
	
	
	
}
