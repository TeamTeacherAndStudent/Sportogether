package qna.model.vo;

import java.sql.Date;

public class QnAReply {
	private int qnaReplyNo;
	private int qnaNo;
	private String qnaReplyContents;
	private Date qnaReplyDate;
	private String userId;
	
	public QnAReply() {}

	public int getQnaReplyNo() {
		return qnaReplyNo;
	}

	public void setQnaReplyNo(int qnaReplyNo) {
		this.qnaReplyNo = qnaReplyNo;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaReplyContents() {
		return qnaReplyContents;
	}

	public void setQnaReplyContents(String qnaReplyContents) {
		this.qnaReplyContents = qnaReplyContents;
	}

	public Date getQnaReplyDate() {
		return qnaReplyDate;
	}

	public void setQnaReplyDate(Date qnaReplyDate) {
		this.qnaReplyDate = qnaReplyDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "QnAReply [qnaReplyNo=" + qnaReplyNo + ", qnaNo=" + qnaNo + ", qnaReplyContents=" + qnaReplyContents
				+ ", qnaReplyDate=" + qnaReplyDate + ", userId=" + userId + "]";
	}
	
	
	
	

}
