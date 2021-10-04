package qna.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import common.JDBCTemplate;
import qna.model.dao.QnADAO;
import qna.model.vo.PageData;
import qna.model.vo.QnA;
import qna.model.vo.QnAReply;

public class QnAService {
	
	//JDBCTemplate 캡슐화
	private JDBCTemplate jdbcTemplate;
	
	public QnAService() {
		jdbcTemplate = JDBCTemplate.getConnection();
	}

	//문의사항 목록
	public PageData printAllList(int currentPage) {
		PageData pd = new PageData();
		Connection conn = null;
		QnADAO qDAO = new QnADAO();
		try {
			conn = jdbcTemplate.createConnection();
			pd.setQnaList(qDAO.selectAllList(conn,currentPage));
			pd.setPageNavi(qDAO.getPageNavi(conn,currentPage));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		return pd;
	}

	//문의사항 등록
	public int registerQna(QnA qna) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = jdbcTemplate.createConnection();
			result = new QnADAO().insertQna(conn,qna);
			if(result>0) {
				//커밋
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	//문의사항 상세페이지
	public QnA printOneByNo(int qnaNo) {
		QnA qnaOne = null;
		Connection conn = null;
		QnADAO qDao = new QnADAO();
		List<QnAReply> list = null;
		try {
			conn = jdbcTemplate.createConnection();
			qnaOne = qDao.selectOneByNo(conn,qnaNo);
			//댓글 불러오기
			list = qDao.selectAllQnAReply(conn,qnaNo);
			qnaOne.setReplies(list);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		
		return qnaOne;
	}

	//문의사항 삭제
	public int removeQna(int qnaNo) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = jdbcTemplate.createConnection();
			result = new QnADAO().deleteQna(conn,qnaNo);
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

	//댓글등록
	public int registerQnaReply(int qnaNo, String replyContents, String userId) {
		Connection conn = null;
		int result = 0;		
		QnADAO qna = new QnADAO();
		try {
			conn= jdbcTemplate.createConnection();
			result = qna.insertQnaReply(conn,qnaNo,replyContents,userId);
			if(result>0) {
				// update qna board qna_ans 답변대기 -> 답변완료 
				qna.updateQnaAns(conn,qnaNo);
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

	//댓글삭제
	public int removeQnaReplyOne(int replyNo) {
		Connection conn = null;
		int result = 0;
		try {
			conn = jdbcTemplate.createConnection();
			result = new QnADAO().deleteQnaReplyOne(conn,replyNo);
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

	
	//검색 리스트
	public PageData printSearchQna(String searchKeyword, int currentPage) {
		Connection conn = null;
		List<QnA> qList = null;
		String searchPageNavi = null;
		PageData pd = new PageData();
		QnADAO qDAO = new QnADAO();
		try {
			conn = jdbcTemplate.createConnection();
			qList = qDAO.selectSearchQna(conn,searchKeyword,currentPage);
			searchPageNavi = qDAO.getSearchPageNavi(conn,searchKeyword,currentPage);
			pd.setQnaList(qList);
			pd.setPageNavi(searchPageNavi);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		return pd;
	}

}
