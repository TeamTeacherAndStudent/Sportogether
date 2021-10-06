package visitor.model.vo;

import java.sql.Date;

public class Visitor {
	private Date vDate;
	private int todayCount; 
	private int totalCount;
	

	public Visitor() {
	}

	public Date getvDate() {
		return vDate;
	}

	public void setvDate(Date vDate) {
		this.vDate = vDate;
	}

	
	
	public int getTodayCount() {
		return todayCount;
	}

	public void setTodayCount(int todayCount) {
		this.todayCount = todayCount;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "Visitor [vDate=" + vDate + "]";
	}



}
