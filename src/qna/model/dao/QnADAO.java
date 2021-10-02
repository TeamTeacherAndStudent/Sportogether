package qna.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import qna.model.vo.QnA;

public class QnADAO {

	//문의사항 목록 출력
	public List<QnA> selectAllList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY QNA_NO DESC) AS NUM, QNA_NO, USER_ID, QNA_TITLE, QNA_CONTENTS, QNA_DATE, QNA_ANS FROM QNA) WHERE NUM BETWEEN ? AND ?";
		List<QnA> qList = null;
		try {
			pstmt = conn.prepareStatement(query);
			int viewCountPerPage = 10;
			int start = currentPage * viewCountPerPage - (viewCountPerPage - 1);
			int end = currentPage * viewCountPerPage;
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			qList = new ArrayList<QnA>();
			while(rset.next()) {
				QnA qna = new QnA();
				qna.setQnaNo(rset.getInt("QNA_NO"));
				qna.setUserId(rset.getString("USER_ID"));
				qna.setQnaTitle(rset.getString("QNA_TITLE"));
				qna.setQnaContents(rset.getString("QNA_CONTENTS"));
				qna.setQnaDate(rset.getDate("QNA_DATE"));
				qna.setQnaAns(rset.getString("QNA_ANS"));
				qList.add(qna);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return qList;
	}

	//페이징
	public String getPageNavi(Connection conn, int currentPage) {
		int pageCountPerView = 5;
		int viewTotalCount = totalCount(conn);
		int viewCountPerPage = 10;
		int pageTotalCount = 0;
		int pageTotalCountMod = viewTotalCount % viewCountPerPage;
		if(pageTotalCountMod > 0) {
			pageTotalCount = (viewTotalCount / viewCountPerPage) + 1;
		}else {
			pageTotalCount = viewTotalCount / viewCountPerPage;
		}
		
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
			sb.append("<a href='/qna/list?currentPage=" + (startNavi-1) + "'> ◀ </a>");
		}
		for(int i = startNavi; i <= endNavi; i++) {
			if(i == currentPage) {
				sb.append(i + " ");
			}else {
				sb.append("<a href='/qna/list?currentPage=" + i + "'> " + i + "</a>");
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
		String query = "SELECT COUNT(*) AS TOTALCOUNT FROM QNA";
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

	//문의사항 등록
	public int insertQna(Connection conn, QnA qna) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO QNA VALUES(SEQ_QNA.NEXTVAL,?,?,?,DEFAULT,DEFAULT)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qna.getUserId());
			pstmt.setString(2, qna.getQnaTitle());
			pstmt.setString(3, qna.getQnaContents());
			
			//쿼리문 실행
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}
