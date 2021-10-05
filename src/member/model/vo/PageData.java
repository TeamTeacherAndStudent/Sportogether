package member.model.vo;

import java.util.List;

public class PageData{
	private List<Member> memberList;
	private String pageNavi;
	
	public PageData() {}

	public List<Member> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<Member> memberList) {
		this.memberList = memberList;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	@Override
	public String toString() {
		return "PageData [memberList=" + memberList + ", pageNavi=" + pageNavi + "]";
	}
	
	
	
	
	
}
