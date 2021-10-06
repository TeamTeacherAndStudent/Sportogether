package admin.model.vo;

public class ReportedBoard {
	private int boardNo;
	private String userId;
	
	public ReportedBoard() {}
	
	public ReportedBoard(int boardNo, String userId) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "ReportedBoard [boardNo=" + boardNo + ", userId=" + userId + "]";
	}

	
}
