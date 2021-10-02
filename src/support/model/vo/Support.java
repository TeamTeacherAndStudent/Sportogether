package support.model.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class Support {
	private int supportNo;
	private String supportWriter;
	private String supportTitle;
	private String supportPurpose;
	private String supportContents;
	private int supportGoal;
	private int supportAchived;
	private String sportsCategory;
	private String supportFileName;
	private String supportFilePath;
	private Long supportFileSize;
	private String supportApproval;
	private Timestamp supportRegDate;
	private Date supportEndDate;
	//댓글 list
	private List<SupportReply> rList;
	public Support () {}
	
	
	
	



	@Override
	public String toString() {
		return "Support [supportNo=" + supportNo + ", supportWriter=" + supportWriter + ", supportTitle=" + supportTitle
				+ ", supportPurpose=" + supportPurpose + ", supportContents=" + supportContents + ", supportGoal="
				+ supportGoal + ", supportAchived=" + supportAchived + ", sportsCategory=" + sportsCategory
				+ ", supportFileName=" + supportFileName + ", supportFilePath=" + supportFilePath + ", supportFileSize="
				+ supportFileSize + ", supportApproval=" + supportApproval + ", supportRegDate=" + supportRegDate
				+ ", supportEndDate=" + supportEndDate + ", rList=" + rList + "]";
	}







	//getter and setter 
	public int getSupportNo() {
		return supportNo;
	}

	public void setSupportNo(int supportNo) {
		this.supportNo = supportNo;
	}

	public String getSupportWriter() {
		return supportWriter;
	}

	public void setSupportWriter(String supportWriter) {
		this.supportWriter = supportWriter;
	}

	public String getSupportTitle() {
		return supportTitle;
	}

	public void setSupportTitle(String supportTitle) {
		this.supportTitle = supportTitle;
	}

	public String getSupportPurpose() {
		return supportPurpose;
	}

	public void setSupportPurpose(String supportPurpose) {
		this.supportPurpose = supportPurpose;
	}

	public String getSupportContents() {
		return supportContents;
	}

	public void setSupportContents(String supportContents) {
		this.supportContents = supportContents;
	}

	public int getSupportGoal() {
		return supportGoal;
	}

	public void setSupportGoal(int supportGoal) {
		this.supportGoal = supportGoal;
	}

	public int getSupportAchived() {
		return supportAchived;
	}

	public void setSupportAchived(int supportAchived) {
		this.supportAchived = supportAchived;
	}

	public String getSportsCategory() {
		return sportsCategory;
	}

	public void setSportsCategory(String sportsCategory) {
		this.sportsCategory = sportsCategory;
	}

	public String getSupportFileName() {
		return supportFileName;
	}

	public void setSupportFileName(String supportFileName) {
		this.supportFileName = supportFileName;
	}

	public String getSupportFilePath() {
		return supportFilePath;
	}

	public void setSupportFilePath(String supportFilePath) {
		this.supportFilePath = supportFilePath;
	}

	public Long getSupportFileSize() {
		return supportFileSize;
	}

	public void setSupportFileSize(Long supportFileSize) {
		this.supportFileSize = supportFileSize;
	}

	public String getSupportApproval() {
		return supportApproval;
	}

	public void setSupportApproval(String supportApproval) {
		this.supportApproval = supportApproval;
	}

	public Timestamp getSupportRegDate() {
		return supportRegDate;
	}

	public void setSupportRegDate(Timestamp supportRegDate) {
		this.supportRegDate = supportRegDate;
	}

	public Date getSupportEndDate() {
		return supportEndDate;
	}

	public void setSupportEndDate(Date supportEndDate) {
		this.supportEndDate = supportEndDate;
	}



	public List<SupportReply> getrList() {
		return rList;
	}



	public void setrList(List<SupportReply> rList) {
		this.rList = rList;
	}
	
	
}
