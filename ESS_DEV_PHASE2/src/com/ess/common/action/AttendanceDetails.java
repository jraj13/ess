package com.ess.common.action;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.omg.CORBA.Request;

import com.ess.util.GetConnection;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.lowagie.text.DocListener;
import com.lowagie.text.html.HtmlParser;
import com.opensymphony.xwork2.ActionContext;

public class AttendanceDetails {
	private static final DocListener Document = null;

	public AttendanceDetails() {
		// TODO Auto-generated constructor stub
	}

	public String attandenceMenu() {
		/* ((SessionMap)this.session).invalidate(); */
		return "success";
	}

	public static ArrayList<String> getPublicHolidays() throws SQLException {

		ArrayList<String> pHList = new ArrayList<String>();
		
		DateFormat dateFormat = new SimpleDateFormat("dd/MMM/yyyy");
		Date date = new Date();
		String dateinStr = dateFormat.format(date);
		//System.out.println("date====" + dateinStr);

		String[] str = dateinStr.split("/");
		System.out.println("PUBLIC HOLIDAY str0=========" + str[2] + "month====="	+ str[1].toUpperCase());
		String year = str[2];
		String month = str[1].toUpperCase();

		/*String empQRY = "SELECT * FROM NCSS_TEMP_BKP_DUMP3  WHERE to_char(db_date, 'MON')='"+ month
				+ "' and to_char(db_date,'YYYY')='"+ year
				+ "' and FULLID='" + id + "' order by db_date ";
		*/
		
		//String empQRY = "select * from NCSS_ATTENDANCE_PUBLICHOLIDAYS";
		String empQRY = "select * from NCSS_ATTENDANCE_PUBLICHOLIDAYS WHERE to_char(DATE_OF_HOLIDAY,'YYYY')='"+year+"'";

		Connection con = GetConnection.getConnection();
		System.out.println("connection" + con);
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			System.out.println("inside the method===="+empQRY);
			rst = stmt.executeQuery(empQRY);
			String sid = "";
			Date dateOfHoliday;
			String weekday = "";
			String holidayName = "";

			while (rst.next()) {

				sid = rst.getString("SID");
				dateOfHoliday = rst.getDate("DATE_OF_HOLIDAY");
				weekday = rst.getString("WEEK_DAY");
				holidayName = rst.getString("HOLIDAY");

				String finalResponse = sid + "^" + dateOfHoliday + "^"
						+ weekday + "^" + holidayName ;
				pHList.add(finalResponse);
				// System.out.println("final result=============" + finalResponse);
			}
		} catch (Exception ex) {
			ex.printStackTrace();

		} finally {
			con.close();
		}
		return pHList;
	}

	public static ArrayList getShifts() throws SQLException {

		// String finalResponse = "";
		ArrayList<String> workShifts = new ArrayList<String>();
		String empQRY = "select * from NCSS_ATTENDANCE_SHIFTS";

		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);
			String sid = "";
			String shiftName = "";
			String timings = "";

			while (rst.next()) {
				sid = rst.getString("SID");
				shiftName = rst.getString("SHIFT_NAME");
				timings = rst.getString("TIMINGS");

				String finalResponse = sid + "^" + shiftName + "^" + timings;
				//System.out.println("finalresource====" + finalResponse);
				workShifts.add(finalResponse);

			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return workShifts;
	}

	public static String typeOfLeave = "";
	public static String used = "";

	public static ArrayList getLeaveOverview() throws SQLException {

		// String finalResponse = "";
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		ArrayList leaveOver = new ArrayList();
		String empQRY = "SELECT * FROM CALENDAR_LEAVE_APPLY_TEST where MAILID='"
				+ id + "' AND status in ('pending','Rejected') ORDER  BY sid desc" ;

		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);
			int sid;
			// String mailid = "";
			Date startDate;
			Date endDate;
			String nextProcessor = "";
			String status = "";

			while (rst.next()) {
				sid = rst.getInt("SID");

				// mailid = rst.getString("MAILID");
				typeOfLeave = rst.getString("TYPE_OF_LEAVE");
				startDate = rst.getDate("START_DATE");

				endDate = rst.getDate("END_DATE");
				nextProcessor = rst.getString("NEXTPROCESSOR");
				status = rst.getString("STATUS");
				used = rst.getString("ABSENCE_DAY");
				// System.out.println("finalresource====" + used);

				String finalResponse = sid + "^" + typeOfLeave + "^"
						+ startDate + "^" + endDate + "^" + nextProcessor + "^"
						+ status + "^" + used;
				System.out.println("finalresource====" + finalResponse);
				leaveOver.add(finalResponse);

			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return leaveOver;
	}
	
	public static ArrayList getLeaveOverviewApproval() throws SQLException {

		// String finalResponse = "";
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		ArrayList leaveOver = new ArrayList();
		String empQRY = "SELECT * FROM CALENDAR_LEAVE_APPLY_TEST where MAILID='"
				+ id + "' and STATUS='Apporved'  ORDER  BY sid desc" ;

		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);
			int sid;
			// String mailid = "";

			Date startDate;
			Date endDate;
			String nextProcessor = "";
			String status = "";

			while (rst.next()) {
				sid = rst.getInt("SID");

				// mailid = rst.getString("MAILID");

				typeOfLeave = rst.getString("TYPE_OF_LEAVE");
				startDate = rst.getDate("START_DATE");

				endDate = rst.getDate("END_DATE");
				nextProcessor = rst.getString("NEXTPROCESSOR");
				status = rst.getString("STATUS");
				used = rst.getString("ABSENCE_DAY");
				// System.out.println("finalresource====" + used);

				String finalResponse = sid + "^" + typeOfLeave + "^"
						+ startDate + "^" + endDate + "^" + nextProcessor + "^"
						+ status + "^" + used;
				System.out.println("finalresource====" + finalResponse);
				leaveOver.add(finalResponse);

			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return leaveOver;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	/* FOR MANAGER CONTROLL EMPLOYEE LEAVE DETAILS */
	
	
public static ArrayList<String> getLeaveOverviewDataForMgr() throws SQLException {

		
		System.out.println("getLeaveOverviewDataForMgr");
		String finalResponse = "";
		Map<String ,Object> session = ActionContext.getContext().getSession();
		/*String id = (String) session.get("empid");*/
		String id = (String) session.get("empid");
		ArrayList<String> leaveOver = new ArrayList<String>();
		/*String empQRY = "SELECT * FROM CALENDAR_LEAVE_APPLY_TEST where MAILID='"
				+ id + "'";*/

		String empQRY ="SELECT b.emp_fname,b.emp_lname ,a.TYPE_OF_LEAVE,a.START_DATE,a.END_DATE,a.NEXTPROCESSOR,a.ABSENCE_DAY ,a.status,b.EMP_ID,a.mailid,a.sid,a.NOTE, b.emp_rm FROM CALENDAR_LEAVE_APPLY_TEST a, NCSS_EMP_MASTER_INFO b where a.mailid=b.emp_id and b.status='Active' AND a.status in('pending','Rejected')  and b.EMP_RM in(select EMP_MAILID from NCSS_EMP_MASTER_INFO where emp_id='"+id+"') ORDER  BY a.sid desc";
		
		System.out.println("empQRy.."+empQRY);
		//String empQRY =
		//		"SELECT * FROM NCSS_EMP_MASTER_INFO WHERE STATUS='Active' AND  EMP_RM in (select EMP_FNAME from NCSS_EMP_MASTER_INFO where EMP_ID='"+id+"')";
		ResultSet rst = null;
		Connection con=null;

		try {
			con = GetConnection.getConnection();
			Statement stmt = con.createStatement();
			rst = stmt.executeQuery(empQRY);
			String sid="";
			String mailid = "";
			String empfname="";
			String emplname="";
			Date startDate;
			Date endDate;
			String nextProcessor = "";
			//String absenceday="";
			String status = "";
			String typeOfLeave="";
			String used="";
			String note="";
			String rtm="";
			
			while (rst.next()) {
				empfname=rst.getString(1);
				emplname=rst.getString(2);
				
				typeOfLeave = rst.getString(3);
				startDate = rst.getDate(4);
				endDate = rst.getDate(5);
				nextProcessor = rst.getString(6);
				used = rst.getString(7);
				status = rst.getString(8);
				mailid = rst.getString(9);
				
				sid = rst.getString("SID");
				System.out.println("sid.."+sid);
				
				note=rst.getString("NOTE");
				System.out.println("note.."+note);
				if(note==null)
				{
					note="-";
				}
				
				rtm=rst.getString("EMP_RM");
				 
				 finalResponse = empfname + "^" + emplname + "^" 
						 		+typeOfLeave + "^" + startDate + "^" + endDate + "^"
						 		+ nextProcessor + "^" +  used +"^"+  status + "^" + mailid +"^"+ sid + "^" + note + "^" + rtm; 
				
				System.out.println("finalresource==== in attandance details mangaer :" + finalResponse);
				leaveOver.add(finalResponse);

			}

		} catch (Exception ex) {
			ex.printStackTrace();

		} finally {
			

		}

		return leaveOver;
	}

	
	
	public static ArrayList deleteLeaveOverview() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();

		String delQry = "delete from NCSS_ATTENDANCE_LEAVE_OVERVIEW where SID=1 ";
		stmt.executeUpdate(delQry);
		String empQRY = "select * from NCSS_ATTENDANCE_LEAVE_OVERVIEW";
		ArrayList leaveOver = new ArrayList();

		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);
			String sid = "";
			String typeOfLeave = "";
			Date startDate;
			String startTime = "";
			Date endDate;
			String endTime = "";
			String nextProcessor = "";
			String status = "";
			String used = "";

			while (rst.next()) {
				sid = rst.getString("SID");
				typeOfLeave = rst.getString("TYPE_OF_LEAVE");
				startDate = rst.getDate("START_DATE");
				startTime = rst.getString("START_TIME");
				endDate = rst.getDate("END_DATE");
				endTime = rst.getString("END_TIME");
				nextProcessor = rst.getString("NEXT_PROCESSOR");
				status = rst.getString("STATUS");
				used = rst.getString("USED");

				String finalResponse = sid + "^" + typeOfLeave + "^"
						+ startDate + "^" + startTime + "^" + endDate + "^"
						+ endTime + "^" + nextProcessor + "^" + status + "^"
						+ used;
				// System.out.println("finalresource====" + finalResponse);
				leaveOver.add(finalResponse);

			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return leaveOver;
	}

	public static ArrayList editLeaveOverview() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();

		String empQRY = "UPDATE NCSS_ATTENDANCE_LEAVE_OVERVIEW SET  TYPE_OF_LEAVE = ?,START_DATE = ?,START_TIME=?,END_DATE = ?,END_TIME = ?,NEXT_PROCESSOR = ?,STATUS = ?,USED = ? WHERE SID =2";
		// String empQRY = "select * from NCSS_ATTENDANCE_LEAVE_OVERVIEW";
		ArrayList leaveOver = new ArrayList();

		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);
			String sid = "";
			String typeOfLeave = "";
			Date startDate;
			String startTime = "";
			Date endDate;
			String endTime = "";
			String nextProcessor = "";
			String status = "";
			String used = "";

			while (rst.next()) {
				sid = rst.getString("SID");
				typeOfLeave = rst.getString("TYPE_OF_LEAVE");
				startDate = rst.getDate("START_DATE");
				startTime = rst.getString("START_TIME");
				endDate = rst.getDate("END_DATE");
				endTime = rst.getString("END_TIME");
				nextProcessor = rst.getString("NEXT_PROCESSOR");
				status = rst.getString("STATUS");
				used = rst.getString("USED");

				String finalResponse = sid + "^" + typeOfLeave + "^"
						+ startDate + "^" + startTime + "^" + endDate + "^"
						+ endTime + "^" + nextProcessor + "^" + status + "^"
						+ used;
				// System.out.println("finalresource====" + finalResponse);
				leaveOver.add(finalResponse);

			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return leaveOver;
	}

	public static String pl = "";

	/*
	 * public static String cl = ""; public static String sl = ""; public static
	 * String oth = ""; public static String paternity = "";
	 */

	public static String getLeaveDaysPL() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement st = con.createStatement();


		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		
		String timeAccountQuery = "SELECT AVAILABLE_BALANCE FROM NCSS_ATTENDANCE_TIME_ACCOUNTS WHERE EMP_ID='"+id+"' and TYPE_OF_LEAVE='Personal Leave' ";
		ResultSet rs = st.executeQuery(timeAccountQuery);
		String result = "";
		while (rs.next()) {
			result = rs.getString("AVAILABLE_BALANCE");

		}
		return result;
	}

	public static String getLeaveDaysCL() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement st = con.createStatement();
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");

		String timeAccountQuery = "SELECT AVAILABLE_BALANCE FROM NCSS_ATTENDANCE_TIME_ACCOUNTS WHERE EMP_ID='"+id+"' and TYPE_OF_LEAVE='Casual Leave' ";
		ResultSet rs = st.executeQuery(timeAccountQuery);
		String result = "";
		while (rs.next()) {
			result = rs.getString("AVAILABLE_BALANCE");

		}
		return result;
	}

	public static String getLeaveDaysSL() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement st = con.createStatement();

		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		String timeAccountQuery = "SELECT AVAILABLE_BALANCE FROM NCSS_ATTENDANCE_TIME_ACCOUNTS WHERE EMP_ID='"+id+"' and TYPE_OF_LEAVE='Sick Leave' ";
		ResultSet rs = st.executeQuery(timeAccountQuery);
		String result = "";
		while (rs.next()) {
			result = rs.getString("AVAILABLE_BALANCE");


		}
		return result;
	}

	/*public static String getLeaveDaysOth() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement st = con.createStatement();
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");

		String timeAccountQuery = "SELECT AVAILABLE_BALANCE FROM NCSS_ATTENDANCE_TIME_ACCOUNTS WHERE EMP_ID='"+id+"' and TYPE_OF_LEAVE='OPH' ";
		ResultSet rs = st.executeQuery(timeAccountQuery);
		String result = "";
		while (rs.next()) {
			result = rs.getString("AVAILABLE_BALANCE");
			System.out.println("oph leaves==" + result);


		}
		return result;
	}*/

	public static String getLeaveDaysPaternity() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement st = con.createStatement();

		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		String timeAccountQuery = "SELECT AVAILABLE_BALANCE FROM NCSS_ATTENDANCE_TIME_ACCOUNTS WHERE EMP_ID='"+id+"' and TYPE_OF_LEAVE='Advanced PL' ";
		ResultSet rs = st.executeQuery(timeAccountQuery);
		String result = "";
		while (rs.next()) {
			result = rs.getString("AVAILABLE_BALANCE");


		}
		return result;
	}

	public static String getAvanceSL() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement st = con.createStatement();

		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		String timeAccountQuery = "SELECT AVAILABLE_BALANCE FROM NCSS_ATTENDANCE_TIME_ACCOUNTS WHERE EMP_ID='"+id+"' and TYPE_OF_LEAVE='Advanced SL' ";
		ResultSet rs = st.executeQuery(timeAccountQuery);
		String result = "";
		while (rs.next()) {
			result = rs.getString("AVAILABLE_BALANCE");


		}
		return result;
	}
	public static String getCompo() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement st = con.createStatement();

		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		String timeAccountQuery = "SELECT AVAILABLE_BALANCE FROM NCSS_ATTENDANCE_TIME_ACCOUNTS WHERE EMP_ID='"+id+"' and TYPE_OF_LEAVE='Compensatory OFF' ";
		ResultSet rs = st.executeQuery(timeAccountQuery);
		String result = "";
		while (rs.next()) {
			result = rs.getString("AVAILABLE_BALANCE");


		}
		return result;
	}

	
	
	public static ArrayList<String> getLeavetimeAccounts() throws SQLException {
		ArrayList<String> timeAccounts = new ArrayList<String>();
		// String finalResponse = "";
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		
		String empQRY = "select * from NCSS_ATTENDANCE_TIME_ACCOUNTS where EMP_ID='"+ id + "'";
		//String empQRY = "select * from NCSS_ATTENDANCE_TIME_ACCOUNTS where EMP_ID='CSSE150059'";

		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);

			String typeOfLeave1 = "";
			String openingBalance = "";
			//String availed = "0.0";
			//String pendingwthApproves = "";
			String availableBalance = "";
			//double availableBalance1 = 0;

			while (rst.next()) {

				typeOfLeave1 = rst.getString("TYPE_OF_LEAVE");

				openingBalance = rst.getString("OPENING_BALANCE");
				availableBalance=rst.getString("AVAILABLE_BALANCE");

				
				String finalResponse = typeOfLeave1 + "^" + openingBalance
						 + "^"+ availableBalance;
				//System.out.println("time accounts status ====" + finalResponse);
				timeAccounts.add(finalResponse);

			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return timeAccounts;
	}
	
	
	

	public static ArrayList<String> getLeaverequest() throws SQLException {
		ArrayList<String> leareq = new ArrayList<String>();
		/*
		 * String sql1=
		 * "select type_of_leave,start_date,end_date,start_time,end_time,employee_name,personal_number,pending_with,clock_in,clock_out,status from leaverequest where mailid='amaranath@clocksoft.info'"
		 * ;
		 */
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");

		String sql1 = "SELECT * FROM CALENDAR_LEAVE_APPLY_TEST where MAILID='"
				+ id + "'";

		ResultSet rs1 = null;
		try {
			Connection con = GetConnection.getConnection();

			Statement st = con.createStatement();
			rs1 = st.executeQuery(sql1);
			String type_of_leave = "";
			Date start_date;
			Date end_date;
			String employee_name = "";
			String personal_number = "";
			String pending_with = "";
			String clock_in = "00:00";
			String clock_out = "00:00";
			String status = "";
			String leavedays="";
			while (rs1.next()) {
				type_of_leave = rs1.getString("TYPE_OF_LEAVE");
				start_date = rs1.getDate("START_DATE");
				end_date = rs1.getDate("END_DATE");
				// getting employee name
				/*
				 * Map session = ActionContext.getContext().getSession(); String
				 * id1=(String)session.get("loginid");
				 */

				String id1 = rs1.getString("MAILID");
				String[] name = id1.split("@");
				employee_name = name[0];
				personal_number = rs1.getString("PHNO");
				pending_with = rs1.getString("NEXTPROCESSOR");
				// clock_in=rs1.getString(CLOCK_IN);
				//System.out.println("name==================" + clock_in);
				// clock_out=rs1.getString(CLOCK_OUT);
				//System.out.println("name==================" + clock_out);
				status = rs1.getString("STATUS");
				leavedays=rs1.getString("ABSENCE_DAY");
				
				String finalrequest = type_of_leave + "^" + start_date + "^"
						+ end_date + "^" + employee_name + "^"
						+ personal_number + "^" + pending_with + "^" + clock_in
						+ "^" + clock_out + "^" + status+"^"+leavedays;
				//System.out.println(finalrequest);
				leareq.add(finalrequest);
			}

		} catch (Exception e) {
			System.out.println("Problem in leave request");
			e.printStackTrace();
		}
		return leareq;

	}

	private String monthList;

	public String getMonthList() {
		return monthList;
	}

	public void setMonthList(String monthList) {
		this.monthList = monthList;
	}

	public String getYearList() {
		return yearList;
	}

	public void setYearList(String yearList) {
		this.yearList = yearList;
	}

	private String yearList;

	public static String bmd_id = "";

	public static ArrayList<String> getAttendanceQueryCurrentMonth()
			throws SQLException {
		
		System.out.println("getAttendanceQueryCurrentMonth");

		ArrayList<String> attendanceUery = new ArrayList<String>();

		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
// String id="CSSE150044";

		String BmdRoleQuery = "SELECT * FROM NCSS_BMD_ROLE where empid='" + id
				+ "'";

		Connection con = GetConnection.getConnection();
		
		Statement stmtR = con.createStatement();
		ResultSet rstR = null;

		try {
			rstR = stmtR.executeQuery(BmdRoleQuery);

			while (rstR.next()) {

				bmd_id = rstR.getString("BMD_ID");
				System.out.println("bmd data id==================" + bmd_id);

			}

			// String id1=id.substring(8);
			// System.out.println("session======="+id1);
			DateFormat dateFormat = new SimpleDateFormat("dd/MMM/yyyy");
			Date date = new Date();
			String dateinStr = dateFormat.format(date);
			//System.out.println("date====" + dateinStr);

			String[] str = dateinStr.split("/");
			//System.out.println("str0=========" + str[2] + "month====="	+ str[1].toUpperCase());
			String year = str[2];
			String month = str[1].toUpperCase();

			String empQRY = "SELECT * FROM NCSS_TEMP_BKP_DUMP3  WHERE to_char(db_date, 'MON')='"
					+ month
					+ "' and to_char(db_date,'YYYY')='"
					+ year
					+ "' and FULLID='" + id + "' order by db_date ";
			
			System.out.println("getAttendanceQueryCurrentMonth.."+empQRY);
			
			Statement stmt = con.createStatement();

			ResultSet rst = null;

			rst = stmt.executeQuery(empQRY);

			Date IN_DATE;
			String SCHEDULE_SHIFT = "";
			String CLOCK_IN = "";
			String CLOCK_OUT = "";
			String ATTENDANCE_STATUS = "";
			String intime_status = "";
			String outtime_status = "";

			String LEAVE_STATUS = "";
			String reg_status=" ";

			//System.out.println("in attandace" + rst);
			while (rst.next()) {

				
				IN_DATE = rst.getDate("DB_DATE");
				//System.out.println("indate============"+IN_DATE);

				SCHEDULE_SHIFT = "GEN";
				//System.out.println("indate============"+SCHEDULE_SHIFT);

				
				
				CLOCK_IN = rst.getString("IN_TIME");
				//System.out.println("indate============"+CLOCK_IN);

				
				CLOCK_OUT = rst.getString("OUT_TIME");
				//System.out.println("indate============"+CLOCK_OUT);


				if (CLOCK_IN == null && CLOCK_OUT == null) {
					CLOCK_IN = " ";
					CLOCK_OUT = " ";
					//ATTENDANCE_STATUS = "";
					SCHEDULE_SHIFT="";
				} else {
					//ATTENDANCE_STATUS = "PRS";
				}

				if (CLOCK_OUT == null) {
					CLOCK_OUT = " ";
				}
				LEAVE_STATUS = " ";

			
				ATTENDANCE_STATUS = rst.getString("ATT_STATUS");
				if(ATTENDANCE_STATUS==null)
				{
					ATTENDANCE_STATUS="";
				}
				
				intime_status = rst.getString("STATUS");
			//	System.out.println("print REMANRKS" + intime_status);
				/*if (intime_status == null) {
					intime_status = " ";
				}*/

				outtime_status = rst.getString("REMARKS");
				//System.out.println("print DEFFERENCE" + outtime_status);
				/*if (outtime_status == null) {
					outtime_status = " ";
				}*/
				
				
				if (intime_status==null && outtime_status == null) {
					LEAVE_STATUS = " ";
				}
				else if(outtime_status == null) {
					LEAVE_STATUS = " ";
				}
				else if(outtime_status.equalsIgnoreCase("early going maitained 9 hours")){
					LEAVE_STATUS = "Early going";
				}
				else if(outtime_status.equalsIgnoreCase("and early going")){
					LEAVE_STATUS = "Early going";
				}
				else{
					LEAVE_STATUS = " ";
				}
				
				reg_status= rst.getString("REGULARIZATION_REMARKS");
				 if(reg_status==null)
				 {
					 reg_status=" ";
				 }
				 

				
				String empAttendanceDetails = IN_DATE + "^" + SCHEDULE_SHIFT
						+ "^" + CLOCK_IN + "^" + CLOCK_OUT + "^"
						+ ATTENDANCE_STATUS + "^" + LEAVE_STATUS + "^"
						+ intime_status + "^" + outtime_status +"^"+ reg_status;

				attendanceUery.add(empAttendanceDetails);

				//System.out.println("RESULT"+attendanceUery);
			}
		} catch (Exception ex) {

		} finally {

			con.close();

		}

		return attendanceUery;

	}

	/* ========================================================= */

	public static ArrayList<String> getAttendanceQuery() throws SQLException {
		System.out.println("getAttendanceQuery");

		ArrayList<String> attendanceUery = new ArrayList<String>();

		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		String emp_id_pass = request.getParameter("emp_id_pass");

		System.out.println("from jquery month=====" + month);
		System.out.println("from jquery year=====" + year);
		System.out.println("from jquery employee id=====" + emp_id_pass);

	/*	String empQRY = "SELECT * FROM NCSS_TEMP_BKP_DUMP3  WHERE to_char(DB_DATE, 'MON')='"
				+ month
				+ "' and to_char(DB_DATE,'YYYY')='"
				+ year
				+ "' and EMPID='" + bmd_id + "' order by DB_DATE ";*/
		
		String empQRY = "SELECT * FROM NCSS_TEMP_BKP_DUMP3  WHERE to_char(DB_DATE, 'MON')='"
				+ month
				+ "' and to_char(DB_DATE,'YYYY')='"
				+ year
				+ "' and FULLID='" + emp_id_pass + "' order by DB_DATE ";

		System.out.println("attendance query===================" + empQRY);
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();

		ResultSet rst = null;

		try {

			rst = stmt.executeQuery(empQRY);

			Date IN_DATE;
			String SCHEDULE_SHIFT = "";
			String CLOCK_IN = "";
			String CLOCK_OUT = "";
			String ATTENDANCE_STATUS = "";
			String intime_status = "";
			String outtime_status = "";
			String LEAVE_STATUS = "";
			String reg_status=" ";

			//System.out.println("in attandace" + rst);
			while (rst.next()) {

				
				IN_DATE = rst.getDate("DB_DATE");
				//System.out.println("indate============"+IN_DATE);

				SCHEDULE_SHIFT = "GEN";
				//System.out.println("indate============"+SCHEDULE_SHIFT);

				
				
				CLOCK_IN = rst.getString("IN_TIME");
				//System.out.println("indate============"+CLOCK_IN);

				
				CLOCK_OUT = rst.getString("OUT_TIME");
				//System.out.println("indate============"+CLOCK_OUT);


			
				if (CLOCK_IN == null && CLOCK_OUT == null) {
					CLOCK_IN = " ";
					CLOCK_OUT = " ";
					//ATTENDANCE_STATUS = "";
					SCHEDULE_SHIFT="";
				} else {
					//ATTENDANCE_STATUS = "PRS";
				}
				
				
				if (CLOCK_OUT == null) {
					CLOCK_OUT = " ";
				}
				LEAVE_STATUS = " ";
				ATTENDANCE_STATUS = rst.getString("ATT_STATUS");
				if(ATTENDANCE_STATUS==null)
				{
					ATTENDANCE_STATUS="";
				}
				
				intime_status = rst.getString("STATUS");
				//System.out.println("print REMANRKS" + intime_status);
				/*if (intime_status == null) {
					intime_status = " ";
				}*/

				outtime_status = rst.getString("REMARKS");
				//System.out.println("print DEFFERENCE" + outtime_status);
				/*if (outtime_status == null) {
					outtime_status = " ";
				}
				 */
				
				
				if (intime_status==null && outtime_status == null) {
					LEAVE_STATUS = " ";
				}
				else if(outtime_status == null) {
					LEAVE_STATUS = " ";
				}
				else if(outtime_status.equalsIgnoreCase("early going maitained 9 hours")){
					LEAVE_STATUS = "Early going";
				}
				else if(outtime_status.equalsIgnoreCase("and early going")){
					LEAVE_STATUS = "Early going";
				}
				else{
					LEAVE_STATUS = " ";
				}
				
				 reg_status= rst.getString("REGULARIZATION_REMARKS");
				 if(reg_status==null)
				 {
					 reg_status=" ";
				 }
				
				
				
				String empAttendanceDetails = IN_DATE + "^" + SCHEDULE_SHIFT
						+ "^" + CLOCK_IN + "^" + CLOCK_OUT + "^"
						+ ATTENDANCE_STATUS + "^" + LEAVE_STATUS + "^"
						+ intime_status + "^" + outtime_status +"^"+reg_status;

				attendanceUery.add(empAttendanceDetails);

				//System.out.println("RESULT"+attendanceUery);
			}
		} catch (Exception ex) {

		} finally {

			con.close();

		}

		return attendanceUery;

	}
	
	

	/* ========================================================= */

	public static ArrayList<String> getHolidayDates() throws SQLException {
		ArrayList<String> holidays = new ArrayList<String>();

		ResultSet rs1 = null;
		Connection con = GetConnection.getConnection();
		String sql1 = "SELECT DATE_OF_HOLIDAY from NCSS_ATTENDANCE_PUBLICHOLIDAYS";
		try {

			Statement st = con.createStatement();
			String start_date = "";
			rs1 = st.executeQuery(sql1);
			while (rs1.next()) {
				start_date = rs1.getString("DATE_OF_HOLIDAY");

				String month = start_date.substring(5, 7);
				int month1 = Integer.parseInt(month);
				if (month1 < 10) {
					month = start_date.substring(6, 7);
				}

				String date = start_date.substring(8, 10);
				int date1 = Integer.parseInt(date);
				if (date1 < 10) {
					date = start_date.substring(9, 10);
				}
				String year = start_date.substring(0, 4);

				String str = month + "-" + date + "-" + year;

				String finalresult = str;
				holidays.add(finalresult);

			}
			System.out.println("leave request page" + holidays);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return holidays;
	}

	/* taking all employee holidays */

	public static ArrayList<String> getHolidayDates1() throws SQLException {
		ArrayList<String> holidays1 = new ArrayList<String>();
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		System.out.println("id from jsp" + id);
		ResultSet rs1 = null;
		Connection con = GetConnection.getConnection();

		String sql1 = "SELECT END_DATE from CALENDAR_LEAVE_APPLY_TEST1 where MAIL_ID='"
				+ id + "'";
		try {

			Statement st = con.createStatement();
			String start_date = "";
			rs1 = st.executeQuery(sql1);
			while (rs1.next()) {
				start_date = rs1.getString("END_DATE");

				String month = start_date.substring(5, 7);
				int month1 = Integer.parseInt(month);
				if (month1 < 10) {
					month = start_date.substring(6, 7);
				}

				String date = start_date.substring(8, 10);
				int date1 = Integer.parseInt(date);
				if (date1 < 10) {
					date = start_date.substring(9, 10);
				}
				String year = start_date.substring(0, 4);

				String str = month + "-" + date + "-" + year;

				String finalresult = str;
				holidays1.add(finalresult);

			}
			System.out.println("leave request page total leaves " + holidays1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return holidays1;
	}

	public static void main(String[] args) throws SQLException, FileNotFoundException, DocumentException {
		
		
		//AttendanceDetails.getAttendanceQueryCurrentMonth();
		getLeavetimeAccounts();
		
	getLeaveOverviewDataForMgr();
		
	}
}
