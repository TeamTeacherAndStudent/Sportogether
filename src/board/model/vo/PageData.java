package board.model.vo;

import java.util.List;

public class PageData {
	private List<Board> boardList;
	private String type; //검색할때 유형
	private String PageNavi;
	
	public PageData() {}


	public PageData(List<Board> boardList, String type, String pageNavi) {
		super();
		this.boardList = boardList;
		this.type = type;
		PageNavi = pageNavi;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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
		return "PageData [boardList=" + boardList + ", type=" + type + ", PageNavi=" + PageNavi + "]";
	}

	

}
