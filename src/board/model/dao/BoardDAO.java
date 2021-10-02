package board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import board.model.vo.Board;
import board.model.vo.FileData;
import board.model.vo.BoardReply;
import common.JDBCTemplate;

public class BoardDAO {
	public int insertBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO FREEBOARD VALUES(SEQ_BOARD.NEXTVAL, ?, ?, ?, (SELECT USER_NICKNAME FROM MEMBER WHERE USER_ID = '?') 'USER_NICKNAME', DEFAULT, ?, ?)";
		//쿼리문 순서 꼭 지키기
		//첨부파일 
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
		//INNER JOIN 추가 NICKNAME
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
			  //  boardOne.setFiles(rset.get);
			    //file OUTTER JOIN
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
	
	
	public int insertBoardFile(Connection conn, FileData fileData) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query ="INSERT INTO FREEBOARDFILE VALUES(?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, fileData.getFileNo());
			pstmt.setInt(2, fileData.getBoardNo());
			pstmt.setString(3, fileData.getFileName());
			pstmt.setString(4, fileData.getFilePath());
			pstmt.setLong(5, fileData.getFileSize());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	
	public int deleteBoardFile(Connection conn, int fileNo, String fileName) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "DELETE FROM FREEBOARDFILE WHERE FILE_NO = ? AND FILE_NAME = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, fileNo);
			pstmt.setString(2, fileName);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public List<FileData> selectByOneBoardFile(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<FileData> fileList = null;
		String query = "SELECT * FROM FREEBOARDFILE WHERE BOARD_NO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			fileList = new ArrayList<FileData>();
			rset = pstmt.executeQuery();
			while(rset.next()) {
				FileData fileData = new FileData();
				fileData.setBoardNo(rset.getInt("BOARD_NO"));
				fileData.setFileName(rset.getString("FILE_NAME"));
				fileData.setFilePath(rset.getString("FILE_PATH"));
				fileData.setFileSize(rset.getLong("FILE_SIZE"));
				fileList.add(fileData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return fileList;
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

	public String getPageNavi(Connection conn, int currentPage) {
		int pageCountPerView = 5;
		int viewTotalCount = totalCount(conn);
		int viewCountPerPage = 10;
		int pageTotalCount = 0;
		int pageTotalCountMod = viewTotalCount % viewCountPerPage;
		if(pageTotalCountMod > 0) {
			pageTotalCount = viewTotalCount / viewCountPerPage + 1;
		}else {
			pageTotalCount = viewTotalCount / viewCountPerPage;
		}
		int startNavi = ((currentPage - 1)/pageCountPerView) *pageCountPerView + 1;
		int endNavi = startNavi + pageCountPerView - 1;
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount; //끝페이지 이후의 값들 총 13페이지면 14 15안나오게
		}
		
		boolean needPrev = true; //다음이전값
		boolean needNext = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) { //끝값을 알아야(pageTotalCount 전체게시물가져옴
			needNext = false;
		}
		StringBuilder sb = new StringBuilder();
		if(needPrev) {
			sb.append("<a href = '/board/list?currnetPage=" + (startNavi-1) +"'> [이전] </a>");
		}
		for(int i = startNavi ; i <= endNavi; i++) {
			if(i == currentPage) {
				sb.append(i);
			}else {
				sb.append("<a href='/board/list?currentPage=" + i + "'>" + i + "</a>");
			}
		}
		if(needNext){
			sb.append("<a href = '/board/list?currentPage=" +(endNavi+1) +"'> [다음] </a>");
		}
			return sb.toString(); //String builder에 쌓음
			//두개넣을 pagedata선언
	}


	private int totalCount(Connection conn) {
			int totalValue = 0;
			Statement stmt = null;
			ResultSet rset = null;
			String query = "SELECT COUNT(*) AS TOTALCOUNT FROM BOARD";
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				if(rset.next()) {
					totalValue = rset.getInt("TOTALCOUNT");
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(stmt);
			}
				return totalValue;
		}


	public List<Board> selectAllBoard(Connection conn, int currentPage) {
		return null;

	}


	public String getSearchPageNavi(Connection conn, String searchKeyword, int currentPage) {
		// TODO Auto-generated method stub
		return null;
	}


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
			
			int viewCountPerPage = 10; int start = currentPage * viewCountPerPage-(viewCountPerPage - 1);
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
	
	
	//종목별 전체조회  - option을 통해 조회
}
