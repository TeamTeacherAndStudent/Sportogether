package member.model.vo;

import java.sql.Date;

public class Member {
		//------NOT NULL------
		private String userId;
		private String userNickName;
		private String userName;
		private String userPw;
		private	String userBirthDate;
		private String userGender;
		private String userPhone;
		private String userEmail;  
		//-----
		private Date userEnrollDate;
		private String userCode;
		private String userPlayer;
		
		//----- 이미지 관련 . 구현 미정
		private String userImgName;
		private long userImgSize;
		private String userImgPath;
		
		
		//생성자
		
		//기본생성자
		public Member() {};
		
		
		//가입일, 회원 구분, 선수 구분 등을 제외한 회원가입용 생성자
		
		public Member(String userId, String userNickName, String userName, String userPw, String userBirthDate,
				String userGender, String userPhone, String userEmail) {
			super();
			this.userId = userId;
			this.userNickName = userNickName;
			this.userName = userName;
			this.userPw = userPw;
			this.userBirthDate = userBirthDate;
			this.userGender = userGender;
			this.userPhone = userPhone;
			this.userEmail = userEmail;
		}

		//모든 필드 받는 생성자
		public Member(String userId, String userNickName, String userName, String userPw, String userBirthDate,
				String userGender, String userPhone, String userEmail, Date userEnrollDate, String userCode,
				String userPlayer, String userImgName, long userImgSize, String userImgPath) {
			super();
			this.userId = userId;
			this.userNickName = userNickName;
			this.userName = userName;
			this.userPw = userPw;
			this.userBirthDate = userBirthDate;
			this.userGender = userGender;
			this.userPhone = userPhone;
			this.userEmail = userEmail;
			this.userEnrollDate = userEnrollDate;
			this.userCode = userCode;
			this.userPlayer = userPlayer;
			this.userImgName = userImgName;
			this.userImgSize = userImgSize;
			this.userImgPath = userImgPath;
		}
		
		//setter , getter
		

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


		public String getUserBirthDate() {
			return userBirthDate;
		}


		public void setUserBirthDate(String userBirthDate) {
			this.userBirthDate = userBirthDate;
		}


		public String getUserGender() {
			return userGender;
		}


		public void setUserGender(String userGender) {
			this.userGender = userGender;
		}


		public String getUserPhone() {
			return userPhone;
		}


		public void setUserPhone(String userPhone) {
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


		public String getUserCode() {
			return userCode;
		}


		public void setUserCode(String userCode) {
			this.userCode = userCode;
		}


		public String getUserPlayer() {
			return userPlayer;
		}


		public void setUserPlayer(String userPlayer) {
			this.userPlayer = userPlayer;
		}


		public String getUserImgName() {
			return userImgName;
		}


		public void setUserImgName(String userImgName) {
			this.userImgName = userImgName;
		}


		public long getUserImgSize() {
			return userImgSize;
		}


		public void setUserImgSize(long userImgSize) {
			this.userImgSize = userImgSize;
		}


		public String getUserImgPath() {
			return userImgPath;
		}


		public void setUserImgPath(String userImgPath) {
			this.userImgPath = userImgPath;
		}


		@Override
		public String toString() {
			return "Member [userId=" + userId + ", userNickName=" + userNickName + ", userName=" + userName
					+ ", userPw=" + userPw + ", userBirthDate=" + userBirthDate + ", userGender=" + userGender
					+ ", userPhone=" + userPhone + ", userEmail=" + userEmail + ", userEnrollDate=" + userEnrollDate
					+ ", userCode=" + userCode + ", userPlayer=" + userPlayer + ", userImgName=" + userImgName
					+ ", userImgSize=" + userImgSize + ", userImgPath=" + userImgPath + "]";
		}
	
}
