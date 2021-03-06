package support.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import common.JDBCTemplate;
import support.model.dao.SupportDAO;
import support.model.vo.PageData;
import support.model.vo.Support;
import support.model.vo.SupportReply;

public class SupportService {
 
	private JDBCTemplate jdbcTemplate;
	
	public SupportService() {
		jdbcTemplate = JDBCTemplate.getConnection();
	}
	
	// 후원 전체 목록 조회
	public PageData printAllSupport(int currentPage) {
		
		Connection conn = null;
		SupportDAO sDAO = new SupportDAO();
		PageData pageData = new PageData();
		try {
			conn = jdbcTemplate.createConnection();
			pageData.setPageNavi(sDAO.getPageNavi(conn, currentPage));
			pageData.setSupportList(sDAO.selectAllSupport(conn, currentPage));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			JDBCTemplate.close(conn);
		}
		return pageData;
	}
	// 후원 게시물 등록
	public int registerSupport(Support spt) {
		int result = 0;
		Connection conn = null;
		try {
			conn = jdbcTemplate.createConnection();
			result = new SupportDAO().insertSupport(conn, spt);
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
	// 후원 상세 조회 
	public Support printOneByNo(int supportNo) {
		Support spt = null;
		SupportDAO sDAO = new SupportDAO();
		List<SupportReply> srList = null;
		Connection conn = null;
		try {
			conn = jdbcTemplate.createConnection();
			spt = sDAO.selectOneByNo(conn, supportNo);
			srList = sDAO.selectReplayList(conn, supportNo);
			spt.setrList(srList);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		
		return spt;
	}
	//후원 댓글 작성
	public int registerSupportReply(int supportNo, String userId, String supportReplyContents) {
		int result = 0 ;
		Connection conn = null;
		try {
			conn = jdbcTemplate.createConnection();
			result = new SupportDAO().insertReply(conn, supportNo, userId, supportReplyContents);
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
	//후원 댓글 삭제
	public int removeSupportReply(int replyNo) {
		int result = 0;
		Connection conn =null;
		try {
			conn = jdbcTemplate.createConnection();
			result = new SupportDAO().deleteReply(conn, replyNo);
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
	// 후원 댓글 신고
	public int reportSupportReply(int replyNo, String userId) {
		int result = 0;
		Connection conn = null;
		
		
		return 0;
	}

}
