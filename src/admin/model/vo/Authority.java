package admin.model.vo;

public class Authority {
	private String userId;
	private String userPw;
	private String userdEmail;
	private String userCode;
	
	public Authority(String userId, String userPw, String userdEmail, String userCode) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userdEmail = userdEmail;
		this.userCode = userCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserdEmail() {
		return userdEmail;
	}
	public void setUserdEmail(String userdEmail) {
		this.userdEmail = userdEmail;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	@Override
	public String toString() {
		return "Authority [userId=" + userId + ", userPw=" + userPw + ", userdEmail=" + userdEmail + ", userCode="
				+ userCode + "]";
	}
	
}
