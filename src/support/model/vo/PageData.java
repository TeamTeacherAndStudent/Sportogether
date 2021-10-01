package support.model.vo;

import java.util.List;

public class PageData {
	private List<Support> supportList;
	private String pageNavi;
	
	public PageData() {}

	public List<Support> getSupportList() {
		return supportList;
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
