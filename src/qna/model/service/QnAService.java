package qna.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import common.JDBCTemplate;
import qna.model.dao.QnADAO;
import qna.model.vo.PageData;
import qna.model.vo.QnA;

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

}
