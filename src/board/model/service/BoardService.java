package board.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import board.model.vo.BoardLike;
import board.model.vo.BoardReply;
import board.model.vo.FileData;
import board.model.vo.PageData;
import board.model.vo.Scrap;
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
		List<FileData> fileList = null;
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
	
	public PageData printAllBoard(int currentPage) {
		PageData pd = new PageData();
		Connection conn = null;
		BoardDAO bDAO = new BoardDAO();
		
		try {
			conn = jdbcTemplate.createConnection();
			pd.setBoardList(bDAO.selectAllBoard(conn, currentPage));
			pd.setPageNavi(bDAO.getPageNavi(conn, currentPage));
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		return pd;
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
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
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
	
	public PageData printSearchBoard(String searchKeyword, int currentPage) {
		Connection conn = null;
		List<Board> bList = null;
		String searchPageNavi = null;
		PageData pd = new PageData();
		BoardDAO  nDAO = new BoardDAO();
		
		try {
			conn = jdbcTemplate.createConnection();
			bList = new BoardDAO().selectSearchBoard(conn, searchKeyword, currentPage);
			searchPageNavi = nDAO.getSearchPageNavi(conn, searchKeyword, currentPage);
			pd.setBoardList(bList);
			pd.setPageNavi(searchPageNavi);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		return pd;
	}

	public int registerFileInfo(FileData fileData) {
		Connection conn = null;
		int result = 0;
		try {
			conn = jdbcTemplate.createConnection();
			result = new BoardDAO().insertBoardFile(conn, fileData);
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
	
	
	public int removeFile(int boardNo, int fileNo) {
		Connection conn = null;
		int result = 0;
		try {
			conn = jdbcTemplate.createConnection();
			result = new BoardDAO().deleteBoardFile(conn,fileNo, boardNo);
			if(result > 0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int updateLike(BoardLike boardLike) {
		Connection conn = null;
		int result = 0;
		try {
			conn = jdbcTemplate.createConnection();
			result = new BoardDAO().updateLike(conn, boardLike);
			if(result > 0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int removeLike(int boardNo) {
		Connection conn = null;
		int result = 0;
		
		try {
			conn = jdbcTemplate.createConnection();
			result = new BoardDAO().removeLike(conn,boardNo);
			if(result > 0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		return result;
	}
	public int updateScrap(Scrap scrap) {
		Connection conn = null;
		int result = 0;
		
		try {
			conn = jdbcTemplate.createConnection();
			result = new BoardDAO().updateScrap(conn, scrap);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		return result;
	}
	
	//****여기 흠,,
	public int removeScrap(int scrapNo) {
		Connection conn = null;
		int result = 0;
		
		try {
			conn = jdbcTemplate.createConnection();
			result = new BoardDAO().deleteScrap(conn, scrapNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		return result;
	}
}
