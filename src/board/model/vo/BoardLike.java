package board.model.vo;

public class BoardLike {
	private int boardNo;
	private String userId;
	private int likeCount;
	
	public BoardLike() {};
	
	public BoardLike(int boardNo, String userId, int likeCount) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.likeCount = likeCount;
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
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	@Override
	public String toString() {
		return "Like [boardNo=" + boardNo + ", userId=" + userId + ", likeCount=" + likeCount + "]";
	}
	
}
