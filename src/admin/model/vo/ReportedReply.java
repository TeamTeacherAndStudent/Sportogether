package admin.model.vo;

public class ReportedReply {
	private int replyNo;
	private String userId;
	
	public ReportedReply() {}
	
	public ReportedReply(int replyNo, String userId) {
		super();
		this.replyNo = replyNo;
		this.userId = userId;
	}


	public int getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "ReportedReply [replyNo=" + replyNo + ", userId=" + userId + "]";
	}
	
	
}
