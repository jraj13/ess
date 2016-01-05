package com.ess.common.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.ess.util.GetConnection;



public class ReportsDAO {
	
	public ReportsDAO() {
	}
	
	private Connection getConnection()throws SQLException
	{
	    Connection con = GetConnection.getConnection();
	    return con;
	}
	
	
	public ArrayList getAttendenceReport(ReportFilter filter) throws SQLException {

		Connection con = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Date fdate = null;
		Date tdate = null;
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		try {
			fdate = sdf.parse(filter.getFromDate());
			tdate = sdf.parse(filter.getToDate());
		} catch (Exception e) {
			e.printStackTrace();
		}
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");

		AttendanceDO report = null;
		ArrayList attendenceReportList = new ArrayList();
		try {

			con = GetConnection.getConnection();

			StringBuffer sb = new StringBuffer();
			sb.append("SELECT DB_DATE,DATE_TIME,FULLID AS EMP_ID,IN_TIME,OUT_TIME,STATUS  FROM NCSS_TEMP_BKP_DUMP3");
			sb.append(" ");

			System.out.println("Query :" + sb);

			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, sdf1.format(fdate));
			pstmt.setString(2, sdf1.format(tdate));
			
			System.out.println("sdf1.format(fdate)....."+sdf1.format(fdate));
			System.out.println("sdf1.format(tdate)....."+sdf1.format(tdate));

			rs = pstmt.executeQuery();

			while (rs.next()) {
				report = new AttendanceDO();
				report.setDbDate(rs.getString("DB_DATE"));
				report.setDateTime(rs.getString("DATE_TIME"));
				report.setEmpid(rs.getString("FULLID"));
				report.setInTime(rs.getString("IN_TIME"));
				report.setOutTime(rs.getString("OUT_TIME"));
				report.setStatus(rs.getString("STATUS"));
				attendenceReportList.add(report);
			}
		} catch (SQLException e) {
			System.out
					.println(" Exception occurred while getting the attendenceReportList.");
			e.printStackTrace();
		}
		GetConnection.closeConnection(con, rs, pstmt);
		return attendenceReportList;
	}

	
}
