package admin.model.vo;


public class ReportedBoard {
	private int boardNo;
	private int reportedBoardNo;
	private String boardTitle;
	private String userId;
	
	public ReportedBoard() {}

	
	public ReportedBoard(int boardNo, int reportedBoardNo, String boardTitle, String userId) {
		super();
		this.boardNo = boardNo;
		this.reportedBoardNo = reportedBoardNo;
		this.boardTitle = boardTitle;
		this.userId = userId;
	}


	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getReportedBoardNo() {
		return reportedBoardNo;
	}

	public void setReportedBoardNo(int reportedBoardNo) {
		this.reportedBoardNo = reportedBoardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "ReportedBoard [boardNo=" + boardNo + ", reportedBoardNo=" + reportedBoardNo + ", boardTitle="
				+ boardTitle + ", userId=" + userId + "]";
	}

}
