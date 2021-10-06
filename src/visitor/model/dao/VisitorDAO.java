package visitor.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.JDBCTemplate;
import visitor.model.vo.Visitor;

public class VisitorDAO {
	/*
	 * //JDBCTemplate 캡슐화 private JDBCTemplate jdbcTemplate;
	 */
	
	private JDBCTemplate jdbcTemplate;
	
	public VisitorDAO() {
		jdbcTemplate = JDBCTemplate.getConnection();
	}
	//싱글톤 패턴
//	private static VisitorDAO instance = new VisitorDAO();
//	private VisitorDAO() {}
//	public static VisitorDAO getInstance() {
//		return instance;
//	}



	//테이블 현재 시간 등록 -> 전체방문자 수 증가
	public void setVisitTotalCount() {
		Connection conn;
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO VISITOR VALUES (SYSDATE)";
		
		try {
			//JDBC Driver 로딩
				conn = jdbcTemplate.createConnection();
				pstmt = conn.prepareStatement(query);
				result = pstmt.executeUpdate();
				if(result > 0) {
					JDBCTemplate.commit(conn);
				}else {
					JDBCTemplate.close(conn);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
	}

	//오늘 방문자수
	public int getVisitTodayCount() {
		Connection conn;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int todayCount = 0;
		String query = "SELECT COUNT(*) AS TodayCnt FROM VISITOR WHERE TO_DATE(V_DATE,'YYYY-MM-DD') = TO_DATE(SYSDATE, 'YYYY-MM-DD')";
		try {
			conn = jdbcTemplate.createConnection();
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				todayCount = rset.getInt("TodayCnt");
			}
			if(rset != null) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.close(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return todayCount;
	}

	//전체 방문자수
	public int getVisitTotalCount() {
		Connection conn;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "SELECT COUNT(*) AS TotalCnt FROM VISITOR";

		try {
			conn = jdbcTemplate.createConnection();
			pstmt=conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {totalCount = rset.getInt("TotalCnt");}
			if(rset != null) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.close(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
	
		return totalCount;
	}







}
