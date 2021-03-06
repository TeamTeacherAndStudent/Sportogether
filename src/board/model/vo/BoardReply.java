package board.model.vo;

import java.sql.Date;

public class BoardReply {
	private int boardNo;
	private int boardReplyNo;
	private String boardReplyContents;
	private String boardReplyUserId;
	private Date boardReplyDate;
	
	public BoardReply() {};
	
	public BoardReply(int boardNo, int boardReplyNo, String boardReplyContents, String boardReplyUserId,
			Date boardReplyDate) {
		super();
		this.boardNo = boardNo;
		this.boardReplyNo = boardReplyNo;
		this.boardReplyContents = boardReplyContents;
		this.boardReplyUserId = boardReplyUserId;
		this.boardReplyDate = boardReplyDate;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getBoardReplyNo() {
		return boardReplyNo;
	}
	public void setBoardReplyNo(int boardReplyNo) {
		this.boardReplyNo = boardReplyNo;
	}
	public String getBoardReplyContents() {
		return boardReplyContents;
	}
	public void setBoardReplyContents(String boardReplyContents) {
		this.boardReplyContents = boardReplyContents;
	}
	public String getBoardReplyUserId() {
		return boardReplyUserId;
	}
	public void setBoardReplyUserId(String boardReplyUserId) {
		this.boardReplyUserId = boardReplyUserId;
	}
	public Date getBoardReplyDate() {
		return boardReplyDate;
	}
	public void setBoardReplyDate(Date boardReplyDate) {
		this.boardReplyDate = boardReplyDate;
	}
	@Override
	public String toString() {
		return "BoardReply [boardNo=" + boardNo + ", boardReplyNo=" + boardReplyNo + ", boardReplyContents="
				+ boardReplyContents + ", boardReplyUserId=" + boardReplyUserId + ", boardReplyDate=" + boardReplyDate
				+ "]";
	}
	
}
