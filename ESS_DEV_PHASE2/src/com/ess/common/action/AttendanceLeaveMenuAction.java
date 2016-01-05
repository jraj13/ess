package com.ess.common.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.ess.common.util.MyDataSource;
import com.opensymphony.xwork2.ActionSupport;

public class AttendanceLeaveMenuAction extends ActionSupport{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public static final String SUCCESS = "success";
	public static final String ERROR = "error";

/* Attendance/leave actions */
	public String attendanceLeave()
	{
		System.out.println("Attendance/Leave method calling");
		return SUCCESS;
	}
	
	public String workingTime()
	{
		System.out.println("working time method calling");
		return SUCCESS;
	}
	
	public String attendanceQuery() 
	{
		/*System.out.println("Calling insertion method");
		String ret = SUCCESS;
		Connection conn = null;
		//ResultSet rs=null

			DataSource dataSource = MyDataSource.getInstance();
			conn = dataSource.getConnection();
			Statement st=conn.createStatement();
			String Query="select * from NCSS_EMP_ATTENDANCE order by emp_id desc";
			ResultSet rs=st.executeQuery(Query);
			rs.getString(2);
			   rs.getString(3); 
			   rs.getString(4);
			   rs.getString(5);
			   rs.getString(6); 
			rs.getString(7);
			 
			 rs=st.getResultSet();
	
		System.out.println("attendance query method calling");*/
		return SUCCESS;
	}
	public String attendanceQuery_success() 
	{
		return SUCCESS;
	}
	
	public String leaveOverveiw()
	{
		System.out.println("leave overview method calling");
		return SUCCESS;
	}
	
	public String leaveEnhancement()
	{
		System.out.println("leaveInhancement method calling");
		return SUCCESS;
	}
	
	public String paidHoliday()
	{
		System.out.println("paid holiday calendar method calling");
		return SUCCESS;
	}

	/* Personal info actions */
	
	public String personalInfoMenu()
	{
		System.out.println("personal info method calling");
		return SUCCESS;
	}

	public String personalInfo()
	{
		System.out.println("personalInfo method calling");
		return SUCCESS;
	}
	public String personalProfile()
	{
		System.out.println("personalProfile method calling");
		return SUCCESS;
	}
	public String qualification()
	{
		System.out.println("qualification method calling");
		return SUCCESS;
	}
	public String prevEmpInfo()
	{
		System.out.println("prevEmpInfo method calling");
		return SUCCESS;
	}
	public String nomination()
	{
		System.out.println("nomination method calling");
		return SUCCESS;
	}
	public String panRetailer()
	{
		System.out.println("panRetailer method calling");
		return SUCCESS;
	}

}

