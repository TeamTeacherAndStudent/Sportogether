package qna.model.vo;

import java.util.List;

public class PageData {
	private List<QnA> qnaList;
	private String pageNavi;
	
	public PageData() {}

	public List<QnA> getQnaList() {
		return qnaList;
	}

	public void setQnaList(List<QnA> qnaList) {
		this.qnaList = qnaList;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	@Override
	public String toString() {
		return "PageData [qnaList=" + qnaList + ", pageNavi=" + pageNavi + "]";
	}
	
	
	
	

}
