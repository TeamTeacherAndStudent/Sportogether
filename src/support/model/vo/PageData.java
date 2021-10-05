package support.model.vo;

import java.util.List;

import member.model.vo.Member;

public class PageData {
	private List<Support> supportList;
	private String pageNavi;
	private List<Member> memberList;
	public PageData() {}

	public List<Support> getSupportList() {
		return supportList;
	}

	public List<Member> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<Member> memberList) {
		this.memberList = memberList;
	}
	
	public void setSupportList(List<Support> supportList) {
		this.supportList = supportList;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	@Override
	public String toString() {
		return "PageData [supportList=" + supportList + ", pageNavi=" + pageNavi + "]";
	}
	
	
}
