package board.model.vo;

import java.sql.Timestamp;

public class FileData {
	private int fileNo;
	private int boardNo;
	private String fileName;
	private String filePath;
	private long fileSize;
	
	public FileData() {};
	
	public FileData(int fileNo, int boardNo, String fileName, String filePath, long fileSize) {
		super();
		this.fileNo = fileNo;
		this.boardNo = boardNo;
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
	}
	

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	@Override
	public String toString() {
		return "FileData [fileNo=" + fileNo + ", boardNo=" + boardNo + ", fileName=" + fileName + ", filePath="
				+ filePath + ", fileSize=" + fileSize + "]";
	}
}