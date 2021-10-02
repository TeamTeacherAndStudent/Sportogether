package qna.model.vo;

import java.sql.Date;

public class QnA {
	private int qnaNo;
	private String userId;
	private String qnaTitle;
	private String qnaContents;
	private Date qnaDate;
	private String qnaAns;
	
	public QnA() {}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContents() {
		return qnaContents;
	}

	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getQnaAns() {
		return qnaAns;
	}

	public void setQnaAns(String qnaAns) {
		this.qnaAns = qnaAns;
	}

	@Override
	public String toString() {
		return "QnA [qnaNo=" + qnaNo + ", userId=" + userId + ", qnaTitle=" + qnaTitle + ", qnaContents=" + qnaContents
				+ ", qnaDate=" + qnaDate + ", qnaAns=" + qnaAns + "]";
	}
	
	
	
	
}
