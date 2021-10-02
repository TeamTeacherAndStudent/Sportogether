package board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.model.vo.Board;
import board.model.vo.BoardFile;
import board.model.vo.BoardReply;
import common.JDBCTemplate;

public class BoardDAO {
	public int insertBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO FREEBOARD VALUES(SEQ_BOARD.NEXTVAL, ?, ?, ?, ?, DEFAULT, ?, ?)";
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
	

	public Board selectOneByNo(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board boardOne = null;
		String query = "SELECT * FROM FREEBOARD WHERE BOARD_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				boardOne = new Board();
				boardOne.setBoardNo(rset.getInt("BOARD_NO"));
				boardOne.setBoardTitle(rset.getString("BOARD_TITLE"));
				boardOne.setBoardContents(rset.getString("BOARD_CONTENTS"));
				boardOne.setSportsName(rset.getString("SPORTS_NAME"));
				boardOne.setUserId(rset.getString("USER_ID"));
				boardOne.setBoardEnrollDate(rset.getDate("BOARD_ENROLLDATE"));
				boardOne.setBoardCount(rset.getInt("BOARD_COUNT"));
				boardOne.setBoardLike(rset.getInt("BOARD_LIKE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return boardOne;
	}

	public int updateBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "UPDATE FREEBOARD SET BOARD_TITLE = ?, BOARD_CONTETNS = ?, SPOARTS_NAME = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getBoardContents());
			pstmt.setString(3, board.getSportsName());
			//파일은 어떻게 ?
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}


	public int deleteBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "DELETE FROM FREEBOARD WHERE BOARD_NO = ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	
	//전체조회 
//	public List<Board> selectAllBoard(Connection conn, boardNo){
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//	//	String query ="SELECT * FROM(SELECT  ROW_NUMBER() OVER(ORDER BY NOTICE_NO DESC) AS NUM, NOTICE_NO, NOTICE_SUBJECT, NOTICE_CONTENTS, WRITER_ID, REG_DATE FROM NOTICE) WHERE NUM BETWEEN ? AND ?"; 
//	    List<Board> bList = null;
//	 try {
//	    pstmt = conn.prepareStatement(query);
//	    //페이지처리
///*	    int viewCountPerPage = 10;
//		int start = currentPage * viewCountPerPage - (viewCountPerPage - 1); //end-9;
//		int end = currentPage * viewCountPerPage;
//		pstmt.setInt(1,  start);
//		pstmt.setInt(2,  end);
//		rset = pstmt.executeQuery();
//		nList = new ArrayList<Notice>(); //currentpage에 의해 10개씩 가져온다
//	while(rset.next()) {
//		Notice notice = new Notice();
//		notice.setNoticeNo(rset.getInt("NOTICE_NO"));
//		notice.setNoticeSubject(rset.getString("NOTICE_SUBJECT"));
//		notice.setNoticeContents(rset.getString("NOTICE_CONTENTS"));
//		notice.setWriterId(rset.getString("WRITER_ID"));
//		notice.setRegDate(rset.getDate("REG_DATE"));
//		nList.add(notice);
//		}*/
//
//	 }catch(SQLException e){
//		 e.printStackTrace();
//	 }finally {
//		 JDBCTemplate.close(pstmt);
//		 JDBCTemplate.close(rset);
//	 }
	
	//페이지 네비
	//total count
	
	
	public List<BoardFile> selectByOneBoardFile(Connection conn, int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//전체검색
	public List<Board> selectSearchBoard(Connection conn, String searchKeyword, int currentPage) {
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		List<Board> bList = null;
		String query = "SELECT * FROM(\r\n" + 
				"SELECT ROW_NUMBER() OVER(ORDER BY BOARD_NO DESC) AS NUM, BOARD_NO, BOARD_TITLE, BOARD_CONTENTS, USER_ID, \r\n" + 
				"FROM FREEBOARD WHERE BOARD_TITLE LIKE ? OR BOARD_CONTENTS LIKE ?) WHERE NUM BETWEEN ? AND ?";  //"SELECT * FROM NOTICE WHERE NOTICE_SUBJECT LIKE ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,  "%" + searchKeyword + "%"); // LIKE 안에 들어가야 되므로 와일드 카드를 searchKeyword에 넣어준다
			pstmt.setString(2,  "%" + searchKeyword + "%"); 
			
			int viewCountPerPage = 10; int start = currentPage *viewCountPerPage-(viewCountPerPage - 1);
			int end = currentPage * viewCountPerPage;
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);
			
			bList = new ArrayList<Board>();
			rset = pstmt.executeQuery();
			while(rset.next()) {
				//객체 생성해서 담아준다
				Board board = new Board();
				board.setBoardNo(rset.getInt("BOARD_NO"));
				board.setBoardTitle(rset.getString("BOARD_TITLE"));
				board.setBoardContents(rset.getString("BOARD_CONTENTS"));
				board.setSportsName(rset.getString("SPORTS_NAME"));
				board.setUserId(rset.getString("USER_ID"));
				board.setBoardEnrollDate(rset.getDate("BOARD_ENROLLDATE"));
				bList.add(board);
				//List에 답아 전체적으로 결과가 나오게 해준다
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return bList;
	}


	public int insertBoardReply(Connection conn, int boardNo, String replyContents, String userId) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, ?, ?, DEFAULT, ?)";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,  boardNo);
			pstmt.setString(2,  replyContents);
			pstmt.setString(3, userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}


	public int deleteBoardReply(Connection conn, int replyNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "DELETE FROM REPLY WHERE REPLY_NO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, replyNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public List<BoardReply> selectAllBoardReply(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM REPLY WHERE BOARD_NO = ?";
		List<BoardReply> ReplyList = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			ReplyList = new ArrayList<BoardReply>();
			rset = pstmt.executeQuery();
			while(rset.next()) {
				BoardReply reply = new BoardReply();
				reply.setBoardReplyNo(rset.getInt("REPLY_NO"));
				reply.setBoardNo(rset.getInt("BOARD_NO"));
				reply.setBoardReplyContents(rset.getString("REPLY_CONTENTS"));
				reply.setBoardReplyDate(rset.getDate("REPLY_DATE"));
				reply.setBoardReplyUserId(rset.getString("REPLY_USERID"));
				ReplyList.add(reply);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return ReplyList;
	}
	//종목별 전체조회  - option을 통해 조회
	
	//
	
}
