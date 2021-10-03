package board.model.vo;

public class Scrap {
	private int scrapNo;
	private int boardNo;
	private String boardContents;
	private String userId;
	
	public Scrap() {};

	
	public Scrap(int scrapNo, int boardNo, String boardContents, String userId) {
		super();
		this.scrapNo = scrapNo;
		this.boardNo = boardNo;
		this.boardContents = boardContents;
		this.userId = userId;
	}


	public int getScrapNo() {
		return scrapNo;
	}


	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
	}


	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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


	@Override
	public String toString() {
		return "Scrap [scrapNo=" + scrapNo + ", boardNo=" + boardNo + ", boardContents=" + boardContents + ", userId="
				+ userId + "]";
	}
	
}
