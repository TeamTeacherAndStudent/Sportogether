package support.model.vo;

import java.sql.Timestamp;

public class SupportManage {
	private int supportManageNo;
	private int supportNo;
	private String sponsorID;
	private int payMoney;
	private String payType;
	private String sportsName;
	private Timestamp payDate;
	
	//기본생성자
	public SupportManage() {}
	//getter/setter
	public int getSupportManageNo() {
		return supportManageNo;
	}

	public void setSupportManageNo(int supportManageNo) {
		this.supportManageNo = supportManageNo;
	}

	public int getSupportNo() {
		return supportNo;
	}

	public void setSupportNo(int supportNo) {
		this.supportNo = supportNo;
	}

	public String getSponsorID() {
		return sponsorID;
	}

	public void setSponsorID(String sponsorID) {
		this.sponsorID = sponsorID;
	}

	public int getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(int payMoney) {
		this.payMoney = payMoney;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getSportsName() {
		return sportsName;
	}

	public void setSportsName(String sportsName) {
		this.sportsName = sportsName;
	}

	public Timestamp getPayDate() {
		return payDate;
	}

	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}
	//toString
	@Override
	public String toString() {
		return "SupportManage [supportManageNo=" + supportManageNo + ", supportNo=" + supportNo + ", sponsorID="
				+ sponsorID + ", payMoney=" + payMoney + ", payType=" + payType + ", sportsName=" + sportsName
				+ ", payDate=" + payDate + "]";
	}
	
	
	
}
