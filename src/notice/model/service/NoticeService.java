package notice.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import common.JDBCTemplate;
import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;
import notice.model.vo.PageData;

public class NoticeService {

	//JDBCTemplate 캡슐화
	private JDBCTemplate jdbcTemplate;
	
	public NoticeService() {
		jdbcTemplate = JDBCTemplate.getConnection();
	}
	
	//공지사항 작성
	public int registerNotice(Notice notice) {
		int result = 0;
		Connection conn = null;
		try {
			conn = jdbcTemplate.createConnection();
			result = new NoticeDAO().insertNotice(conn,notice);
			if(result>0) {
				//커밋
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

	//공지사항 목록 출력
	public PageData printAllNotice(int currentPage) {
		PageData pd = new PageData();
		Connection conn = null;
		NoticeDAO nDAO = new NoticeDAO();
		try {
			conn = jdbcTemplate.createConnection();
			pd.setNoticeList(nDAO.selectAllNotice(conn,currentPage));
			pd.setPageNavi(nDAO.getPageNavi(conn,currentPage));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		return pd;
	}

}
