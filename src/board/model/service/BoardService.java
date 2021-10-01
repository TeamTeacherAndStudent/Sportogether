package board.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.model.vo.Board;
import common.JDBCTemplate;

public class BoardService {
	private JDBCTemplate jdbcTemplate;
	
	public BoardService() {
		jdbcTemplate = JDBCTemplate.getConnection();
	}
	public void registerBoard(Board board) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn =jdbcTemplate.createConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
