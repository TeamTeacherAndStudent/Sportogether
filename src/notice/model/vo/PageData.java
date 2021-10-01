package notice.model.vo;

import java.util.List;

public class PageData {
	private List<Notice> noticeList;
	private String pageNavi;
	
	public PageData() {}

	
	public List<Notice> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(List<Notice> noticeList) {
		this.noticeList = noticeList;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}


	@Override
	public String toString() {
		return "PageData [noticeList=" + noticeList + ", pageNavi=" + pageNavi + "]";
	}
	
	
	
	
}
