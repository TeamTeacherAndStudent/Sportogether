package board.model.vo;

import java.sql.Timestamp;

public class BoardFile {
	private int boardNo;
	private String fileName;
	private String filePath;
	private long fileSize;
	private String fileUser;
	private Timestamp uploadTime;
	
	public BoardFile() {};
	
	public BoardFile(int boardNo, String fileName, String filePath, long fileSize, String fileUser,
			Timestamp uploadTime) {
		super();
		this.boardNo = boardNo;
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.fileUser = fileUser;
		this.uploadTime = uploadTime;
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

	public String getFileUser() {
		return fileUser;
	}

	public void setFileUser(String fileUser) {
		this.fileUser = fileUser;
	}

	public Timestamp getUploadTime() {
		return uploadTime;

	}
	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}

	@Override
	public String toString() {
		return "BoardFile [boardNo=" + boardNo + ", fileName=" + fileName + ", filePath=" + filePath + ", fileSize="
				+ fileSize + ", fileUser=" + fileUser + ", uploadTime=" + uploadTime + "]";
	}
	
}
