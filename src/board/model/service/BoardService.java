package board.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import common.JDBCTemplate;

public class BoardService {
	private JDBCTemplate jdbcTemplate;
	
	public BoardService() {
		jdbcTemplate = JDBCTemplate.getConnection();
	}
	public int registerBoard(Board board) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn =jdbcTemplate.createConnection();
			result = new BoardDAO().insertBoard(conn, board);
			if(result > 0) {
				//commit
				JDBCTemplate.commit(conn);
			}else {
				//rollback
				JDBCTemplate.rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		return result;
	}
	
	public Board printOneByNo(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
