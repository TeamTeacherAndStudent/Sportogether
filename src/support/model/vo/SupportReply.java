package support.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class SupportReply {
	private int supportReplyNo;
	private int supportNo;
	private String supportReplyWriter;
	private String supportReplyContents;
	private String supportReplyRegDate;
	
	//생성자
	public SupportReply() {}
	
	//toString
	@Override
	public String toString() {
		return "SupportReply [supportReplyNo=" + supportReplyNo + ", supportNo=" + supportNo + ", supportReplyWriter="
				+ supportReplyWriter + ", supportReplyContents=" + supportReplyContents + ", supportReplyRegDate="
				+ supportReplyRegDate + "]";
	}
	//getter/setter
	public int getSupportReplyNo() {
		return supportReplyNo;
	}


	

	public void setSupportReplyNo(int supportReplyNo) {
		this.supportReplyNo = supportReplyNo;
	}


	public int getSupportNo() {
		return supportNo;
	}


	public void setSupportNo(int supportNo) {
		this.supportNo = supportNo;
	}


	public String getSupportReplyWriter() {
		return supportReplyWriter;
	}


	public void setSupportReplyWriter(String supportReplyWriter) {
		this.supportReplyWriter = supportReplyWriter;
	}


	public String getSupportReplyContents() {
		return supportReplyContents;
	}


	public void setSupportReplyContents(String supportReplyContents) {
		this.supportReplyContents = supportReplyContents;
	}


	public String getSupportReplyRegDate() {
		return supportReplyRegDate;
	}


	public void setSupportReplyRegDate(String supportReplyRegDate) {
		this.supportReplyRegDate = supportReplyRegDate;
	}
	
	
}
