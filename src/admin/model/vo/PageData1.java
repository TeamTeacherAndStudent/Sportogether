package admin.model.vo;

import java.util.List;

public class PageData1 {
	private List<ReportedBoard> ReportedbList;
	private List<ReportedReply> ReportedrList;
	private String ReportPageNavi;
	
	public PageData1() {}
	
	public PageData1(List<ReportedBoard> reportedbList, List<ReportedReply> reportedrList,
			String ReportpageNavi) {
		super();
		ReportedbList = reportedbList;
		ReportedrList = reportedrList;
		ReportPageNavi = ReportpageNavi;
	}

	public List<ReportedBoard> getReportedbList() {
		return ReportedbList;
	}
	public void setReportedbList(List<ReportedBoard> reportedbList) {
		ReportedbList = reportedbList;
	}
	public List<ReportedReply> getReportedrList() {
		return ReportedrList;
	}
	public void setReportedrList(List<ReportedReply> reportedrList) {
		ReportedrList = reportedrList;
	}
	public String getReportPageNavi() {
		return ReportPageNavi;
	}
	public void setReportPageNavi(String ReportpageNavi) {
		ReportPageNavi = ReportpageNavi;
	}
	@Override
	public String toString() {
		return "PageData [ReportedbList=" + ReportedbList + ", ReportedrList=" + ReportedrList
				+ ", ReportPageNavi=" + ReportPageNavi + "]";
	}
	
}