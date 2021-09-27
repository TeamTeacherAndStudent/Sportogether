package member.model.vo;

import java.sql.Date;

public class Member {
		private String userId;
		private String userNickName;
		private String userName;
		private String userPw;
		private	Date userBirthDate;
		private String userGender;
		private int userPhone;
		private String userEmail;
		private Date userEnrollDate;
		
		public Member() {};
		
		
		public Member(String userId, String userNickName, String userName, String userPw, Date userBirthDate,
				String userGender, int userPhone, String userEmail, Date userEnrollDate) {
			this.userId = userId;
			this.userNickName = userNickName;
			this.userName = userName;
			this.userPw = userPw;
			this.userBirthDate = userBirthDate;
			this.userGender = userGender;
			this.userPhone = userPhone;
			this.userEmail = userEmail;
			this.userEnrollDate = userEnrollDate;
		}

		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getUserNickName() {
			return userNickName;
		}
		public void setUserNickName(String userNickName) {
			this.userNickName = userNickName;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getUserPw() {
			return userPw;
		}
		public void setUserPw(String userPw) {
			this.userPw = userPw;
		}
		public Date getUserBirthDate() {
			return userBirthDate;
		}
		public void setUserBirthDate(Date userBirthDate) {
			this.userBirthDate = userBirthDate;
		}
		public String getUserGender() {
			return userGender;
		}
		public void setUserGender(String userGender) {
			this.userGender = userGender;
		}
		public int getUserPhone() {
			return userPhone;
		}
		public void setUserPhone(int userPhone) {
			this.userPhone = userPhone;
		}
		public String getUserEmail() {
			return userEmail;
		}
		public void setUserEmail(String userEmail) {
			this.userEmail = userEmail;
		}
		public Date getUserEnrollDate() {
			return userEnrollDate;
		}
		public void setUserEnrollDate(Date userEnrollDate) {
			this.userEnrollDate = userEnrollDate;
		}
		public String toString() {
			return "Member [userId=" + userId + ", userNickName=" + userNickName + ", userName=" + userName
					+ ", userPw=" + userPw + ", userBirthDate=" + userBirthDate + ", userGender=" + userGender + ", userPhone="
					+ userPhone + ", userEmail=" + userEmail + ", userEnrollDate="
					+ userEnrollDate + "]";
		}

}
