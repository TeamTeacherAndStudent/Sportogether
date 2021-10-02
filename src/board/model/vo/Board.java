package board.model.vo;

import java.sql.Date;
import java.util.List;

public class Board {
	private int boardNo;
	private String boardTitle;
	private String boardContents;
	private String sportsName;
	private String userId;
	private Date boardEnrollDate;
	private int boardCount;
	private int boardLike;
	private List<BoardFile> files; //파일
	private List<BoardReply> replies; //댓글:toString  x
	
	public Board() {}	
	public Board(int boardNo, String boardTitle, String boardContents, String sportsName, String userId, Date boardEnrollDate, int boardCount,
			int boardLike) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContents = boardContents;
		this.sportsName = sportsName;
		this.userId = userId;
		this.boardEnrollDate = boardEnrollDate;
		this.boardCount = boardCount;
		this.boardLike = boardLike;
	}


	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	public String getSportsName() {
		return sportsName;
	}

	public void setSportsName(String sportsName) {
		this.sportsName = sportsName;
	}


	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContents() {
		return boardContents;
	}

	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getBoardEnrollDate() {
		return boardEnrollDate;
	}

	public void setBoardEnrollDate(Date boardEnrollDate) {
		this.boardEnrollDate = boardEnrollDate;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	
	public int getBoardLike() {
		return boardLike;
	}

	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}

	public List<BoardFile> getFiles() {
		return files;
	}
	
	public void setFiles(List<BoardFile> files) {
		this.files = files;
	}

	public List<BoardReply> getReplies() {
		return replies;
	}

	public void setReplies(List<BoardReply> replies) {
		this.replies = replies;
	}
	
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo +  ", boardTitle=" + boardTitle + ", boardContents=" + boardContents
				+ ", sportsName = " + sportsName + ", userId=" + userId + ", boardEnrollDate=" + boardEnrollDate + ", boardCount=" + boardCount
				+ ", boardLike=" + boardLike + "]";
	}
	
}
