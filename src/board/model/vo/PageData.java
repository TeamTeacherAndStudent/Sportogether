package board.model.vo;

import java.util.List;

public class PageData {
	private List<Board> boardList;
	private String PageNavi;
	
	public PageData() {}

	public PageData(List<Board> boardList, String pageNavi) {
		super();
		this.boardList = boardList;
		PageNavi = pageNavi;
	}

	public List<Board> getBoardList() {
		return boardList;
	}

	public void setBoardList(List<Board> boardList) {
		this.boardList = boardList;
	}

	public String getPageNavi() {
		return PageNavi;
	}

	public void setPageNavi(String pageNavi) {
		PageNavi = pageNavi;
	}

	@Override
	public String toString() {
		return "PageData [boardList=" + boardList + ", PageNavi=" + PageNavi + "]";
	};

}
