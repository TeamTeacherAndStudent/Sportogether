package board.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import board.model.vo.BoardFile;
import board.model.vo.BoardReply;
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
		Board boardOne = null;
		Connection conn = null;
		List<BoardFile> fileList = null;
		List<BoardReply>replyList  = null;
		BoardDAO bDao = new BoardDAO();
		
		try {
			conn = jdbcTemplate.createConnection();
			boardOne = new BoardDAO().selectOneByNo(conn, boardNo);
			fileList = bDao.selectByOneBoardFile(conn, boardNo);
			boardOne.setFiles(fileList);
			replyList = bDao.selectAllBoardReply(conn, boardNo);
			boardOne.setReplies(replyList);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		return boardOne;
	}
	
	public int modifyBoard(Board board) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = jdbcTemplate.createConnection();
			result = new BoardDAO().updateBoard(conn, board);
			if(result > 0) {
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
	
	public int removeBoard(int boardNo) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = jdbcTemplate.createConnection();
			result = new BoardDAO().deleteBoard(conn, boardNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			jdbcTemplate.close(conn);
		}
		return result;
	}
	
	public int registerBoardReply(int boardNo, String replyContents, String userId) {
		Connection conn = null;
		int result = 0;
		
		try {
			conn = jdbcTemplate.createConnection();
			result = new BoardDAO().insertBoardReply(conn, boardNo, replyContents, userId);
			if(result > 0) {
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
	public int removeBoardReplyOne(int replyNo) {
		Connection conn = null;
		int result = 0;
		try {
			conn  = jdbcTemplate.createConnection();
			result = new BoardDAO().deleteBoardReply(conn, replyNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		return result;
	}

	
}
