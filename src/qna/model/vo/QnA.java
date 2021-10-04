package qna.model.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class QnA {
	private int qnaNo;
	private String userId;
	private String qnaTitle;
	private String qnaContents;
	private Timestamp qnaDate;
	private String qnaAns;
	
	//댓글 - 구조상 QNA에 포함되기 떄문에 어레이리스트를 포함시킴
	private List<QnAReply> replies;
	
	public QnA() {}
	

	public List<QnAReply> getReplies() {
		return replies;
	}


	public void setReplies(List<QnAReply> replies) {
		this.replies = replies;
	}



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

	public Timestamp getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Timestamp qnaDate) {
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
