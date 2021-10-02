package board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import board.model.vo.Board;
import common.JDBCTemplate;

public class BoardDAO {
	public int insertBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO BOARD VALUES(SEQ_BOARD.NEXTVAL, ?, ?, ?, ?, DEFAULT, ?, ?)";
		//쿼리문 순서 꼭 지키기
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(2, board.getBoardTitle());
			pstmt.setString(3, board.getBoardContents());
			pstmt.setString(4, board.getSportsName());
			pstmt.setString(5, board.getUserId());
			pstmt.setDate(6, board.getBoardEnrollDate());
			pstmt.setInt(7, board.getBoardCount());
			pstmt.setInt(8, board.getBoardLike());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
				e.printStackTrace();
		}finally {
		     	JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
