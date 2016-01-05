package com.ess.common.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class EmployeeDetails {
	public EmployeeDetails() {
		// TODO Auto-generated constructor stub
	}

	public static ArrayList getEmployees() throws SQLException {

		ArrayList employeeList = new ArrayList();

		String empQRY = "select * from EMP_PAY_MASTER_TEMP";

		Connection con = GetConnection.getConnection();
		System.out.println("connection" + con);
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		rst = stmt.executeQuery(empQRY);

		String empId = "";
		String empName = "";
		String empDesig = "";
		String empDoj = "";
		String empPan = "";
		String empEmail = "";
		String empCtc = "";

		while (rst.next()) {

			empId = rst.getString("EMP_ID");
			empName = rst.getString("EMP_NAME");
			empDesig = rst.getString("EMP_DESIGNATION");
			empDoj = rst.getString("DOJ");
			empPan = rst.getString("PAN_NO");
			empEmail = rst.getString("EMAIL_ID");
			empCtc = rst.getString("CTC");

			String empDetails = empId + "^" + empName + "^" + empName + "^"
					+ empName + "^" + empName + "^" + empName + "^" + empName;

			employeeList.add(empDetails);

		}

		return employeeList;
	}

	/*
	 * public static String getPersonalInfo() throws SQLException {
	 * 
	 * String finalResponse = ""; String empQRY =
	 * "select * from NCSS_EMP_MASTER_INFO where EMP_ID='10'";
	 * 
	 * Connection con = GetConnection.getConnection();
	 * System.out.println("connection"+con); Statement stmt =
	 * con.createStatement(); ResultSet rst = null;
	 * 
	 * try { System.out.println("inside the method===="); rst =
	 * stmt.executeQuery(empQRY);
	 * 
	 * String empId = ""; String empFname = ""; String empLname = ""; String
	 * joiningDate = ""; String empDob = ""; String empDesig = ""; String
	 * empEmail = ""; String repManager = ""; String empCtc = "";
	 * 
	 * if (rst.next()) {
	 * 
	 * empId = rst.getString("EMP_ID"); empFname = rst.getString("EMP_FNAME");
	 * empLname = rst.getString("EMP_LNAME"); joiningDate =
	 * rst.getString("EMP_JOINING_DATE"); empDob = rst.getString("EMP_DOB");
	 * empDesig = rst.getString("EMP_DESIG"); empEmail =
	 * rst.getString("EMP_MAILID"); repManager = rst.getString("EMP_RM"); empCtc
	 * = rst.getString("EMP_CTC");
	 * 
	 * finalResponse = empId + "^" + empFname + "^" + empLname + "^" +
	 * joiningDate + "^" + empDob + "^" + empDesig + "^" + empEmail + "^" +
	 * repManager + "^" + empCtc;
	 * 
	 * System.out.println("final result=============" + finalResponse); } }
	 * catch (Exception ex) { ex.printStackTrace();
	 * 
	 * } finally { con.close();
	 * 
	 * }
	 * 
	 * return finalResponse; }
	 */

	public static ArrayList getAllEmployeeInfo() throws SQLException {

		System.out.println("getAllEmployeeInfo");
		// String finalResponse = "";
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		ArrayList leaveOver = new ArrayList();
		// String empQRY =
		// "SELECT * FROM CALENDAR_LEAVE_APPLY_TEST where MAILID='"+ id + "'";
		String empQRY = "select * from NCSS_EMP_MASTER_INFO where STATUS='Active'";
		System.out.println("empQry.." + empQRY);
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);
			String empId = "";
			String empFname = "";
			String empLname = "";
			Date joiningDate;
			Date empDob;
			String empDesig = "";
			String empEmail = "";
			String repManager = "";
			String empCtc = "";
			String status = "";
			String remarks = "";
			Date Dor;
			int i = 1;
			while (rst.next()) {
				empId = rst.getString("EMP_ID");
				empFname = rst.getString("EMP_FNAME");
				empLname = rst.getString("EMP_LNAME");
				if (empLname == null) {
					empLname = "";
				}
				joiningDate = rst.getDate("EMP_JOINING_DATE");
				empDob = rst.getDate("EMP_DOB");

				empDesig = rst.getString("EMP_DESIG");
				if (empDesig == null) {
					empDesig = "-";
				}
				empEmail = rst.getString("EMP_MAILID");
				if (empEmail == null) {
					empEmail = "-";
				}
				repManager = rst.getString("EMP_RM");
				if (repManager == null) {
					repManager = "-";
				}
				empCtc = rst.getString("EMP_CTC");
				if (empCtc == null) {
					empCtc = "-";
				}
				status = rst.getString("STATUS");
				if (status == null) {
					status = "-";
				}
				remarks = rst.getString("REMARKS");
				if (remarks == null) {
					remarks = "-";
				}
				Dor = rst.getDate("DATE_REL");
				System.out.println("i...." + i);

				// System.out.println("finalresource====" + used);

				String finalResponse = empId + "^" + empFname + "^" + empLname
						+ "^" + joiningDate + "^" + empDob + "^" + empDesig
						+ "^" + empEmail + "^" + repManager + "^" + empCtc
						+ "^" + status + "^" + remarks + "^" + Dor + "^" + i;

				i = i + 1;
				System.out.println("finalresource====" + finalResponse);
				leaveOver.add(finalResponse);

			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return leaveOver;
	}

	/* who has resign the company */
	public static ArrayList getAllEmployeeResignInfo() throws SQLException {

		// String finalResponse = "";
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		ArrayList leaveOver1 = new ArrayList();
		// String empQRY =
		// "SELECT * FROM CALENDAR_LEAVE_APPLY_TEST where MAILID='"+ id + "'";
		String empQRY2 = "select * from NCSS_EMP_MASTER_INFO where STATUS='Resign'";
		System.out.println("empQry.region." + empQRY2);
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY2);
			String empId = "";
			String empFname = "";
			String empLname = "";
			Date joiningDate;
			Date empDob;
			String empDesig = "";
			String empEmail = "";
			String repManager = "";
			String empCtc = "";
			String status = "";
			String remarks = "";
			Date Dor;

			while (rst.next()) {
				empId = rst.getString("EMP_ID");
				empFname = rst.getString("EMP_FNAME");
				empLname = rst.getString("EMP_LNAME");
				joiningDate = rst.getDate("EMP_JOINING_DATE");
				empDob = rst.getDate("EMP_DOB");
				empDesig = rst.getString("EMP_DESIG");
				empEmail = rst.getString("EMP_MAILID");
				repManager = rst.getString("EMP_RM");
				empCtc = rst.getString("EMP_CTC");
				status = rst.getString("STATUS");
				remarks = rst.getString("REMARKS");
				if (remarks == null) {
					remarks = "-";
				}
				Dor = rst.getDate("DATE_REL");
				// System.out.println("finalresource====" + used);

				String finalResponse1 = empId + "^" + empFname + "^" + empLname
						+ "^" + joiningDate + "^" + empDob + "^" + empDesig
						+ "^" + empEmail + "^" + repManager + "^" + empCtc
						+ "^" + status + "^" + remarks + "^" + Dor;
				System.out.println("finalresource====" + finalResponse1);
				leaveOver1.add(finalResponse1);

			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return leaveOver1;
	}

	/* FOR UNDER MANANGER EMPLOYEE LIST */

	public static ArrayList<String> getAllEmployeeInfoMgr() throws SQLException {

		System.out.println("getAllEmployeeInfo");
		// String finalResponse = "";
		Map<String, Object> session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		ArrayList<String> leaveOver = new ArrayList<String>();
		String empQRY = "SELECT * FROM NCSS_EMP_MASTER_INFO WHERE STATUS='Active' AND  EMP_RM in (select EMP_MAILID from NCSS_EMP_MASTER_INFO where EMP_ID='"
				+ id + "')";
		// String empQRY =
		// "select * from NCSS_EMP_MASTER_INFO where STATUS='Active' AND EMP_RM='JAYARAJ'";

		System.out.println("empQry.." + empQRY);
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);
			String empId = "";
			String empFname = "";
			String empLname = "";
			Date joiningDate;
			Date empDob;
			String empDesig = "";
			String empEmail = "";
			String repManager = "";
			String empCtc = "";
			String status = "";
			String remarks = "";
			Date Dor;
			int i = 1;
			while (rst.next()) {
				empId = rst.getString("EMP_ID");
				empFname = rst.getString("EMP_FNAME");
				empLname = rst.getString("EMP_LNAME");
				if (empLname == null) {
					empLname = "";
				}
				joiningDate = rst.getDate("EMP_JOINING_DATE");
				empDob = rst.getDate("EMP_DOB");

				empDesig = rst.getString("EMP_DESIG");
				if (empDesig == null) {
					empDesig = "-";
				}
				empEmail = rst.getString("EMP_MAILID");
				if (empEmail == null) {
					empEmail = "-";
				}
				repManager = rst.getString("EMP_RM");
				if (repManager == null) {
					repManager = "-";
				}
				empCtc = rst.getString("EMP_CTC");
				if (empCtc == null) {
					empCtc = "-";
				}
				status = rst.getString("STATUS");
				if (status == null) {
					status = "-";
				}
				remarks = rst.getString("REMARKS");
				if (remarks == null) {
					remarks = "-";
				}
				Dor = rst.getDate("DATE_REL");
				System.out.println("i...." + i);

				// System.out.println("finalresource====" + used);

				String finalResponse = empId + "^" + empFname + "^" + empLname
						+ "^" + joiningDate + "^" + empDob + "^" + empDesig
						+ "^" + empEmail + "^" + repManager + "^" + empCtc
						+ "^" + status + "^" + remarks + "^" + Dor + "^" + i;

				i = i + 1;
				System.out.println("finalresource====" + finalResponse);
				leaveOver.add(finalResponse);

			}

		} catch (Exception ex) {

		} finally {
			con.close();
		}

		return leaveOver;
	}

	public static String getQualificationInfo() throws SQLException {

		String finalResponse = "";

		String empQRY = "select * from NCSS_EMP_EDUCATION WHERE EMP_ID='10'";

		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);

			String empId = "";
			String empQual1 = "";
			String empQual1Perc = "";
			String empQual1passout = "";
			String empQual2 = "";
			String empQual2Perc = "";
			String empQual2passout = "";
			String empQual3 = "";
			String empQual3Perc = "";
			String empQual3passout = "";
			String cert1 = "";
			String cert2 = "";
			String cert3 = "";

			while (rst.next()) {

				empId = rst.getString("EMP_ID");
				empQual1 = rst.getString("EMP_QUAL1");
				empQual1Perc = rst.getString("EMP_QUAL1_PERC");
				empQual1passout = rst.getString("EMP_QUAL1_PASSOUT");
				empQual2 = rst.getString("EMP_QUAL2");
				empQual2Perc = rst.getString("EMP_QUAL2_PERC");
				empQual2passout = rst.getString("EMP_QUAL2_PASSOUT");
				empQual3 = rst.getString("EMP_QUAL3");
				empQual3Perc = rst.getString("EMP_QUAL3_PERC");
				empQual3passout = rst.getString("EMP_QUAL3_PASSOUT");
				cert1 = rst.getString("CERT1");
				cert2 = rst.getString("CERT2");
				cert3 = rst.getString("CERT3");

				finalResponse = empId + "^" + empQual1 + "^" + empQual1Perc
						+ "^" + empQual1passout + "^" + empQual2 + "^"
						+ empQual2Perc + "^" + empQual2passout + "^" + empQual3
						+ "^" + empQual3Perc + "^" + empQual2Perc + "^" + cert1
						+ "^" + cert2 + "^" + cert3;
				System.out.println("finalresource====" + finalResponse);

			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return finalResponse;
	}

	public static String getPreviousEmpInfo() throws SQLException {

		String finalResponse = "";

		String empQRY1 = "select * from NCSS_EMP_PREV_ORG_INFO where EMP_ID='10'";

		Connection con = GetConnection.getConnection();

		try {
			Statement stmt1 = con.createStatement();
			ResultSet rst = null;
			System.out.println("statement========" + con);
			rst = stmt1.executeQuery(empQRY1);

			String empId = "";
			String totalExp = "";
			String org1Name = "";
			String org1Exp = "";
			String org1RefName = "";
			String org1RefMail = "";
			String org1RefPhone = "";
			String org2Name = "";
			String org2Exp = "";
			String org2RefName = "";
			String org2RefMail = "";
			String org3Name = "";
			String org3Exp = "";
			String org3RefName = "";
			String org3RefMail = "";
			System.out.println("result set===========" + rst.next());
			if (rst.next()) {
				System.out.println("inside if");

				empId = rst.getString("EMP_ID");
				/*
				 * totalExp = rst.getString("TOTAL_EXP"); org1Name =
				 * rst.getString("ORG1_NAME"); org1Exp =
				 * rst.getString("ORG1_EXP"); org1RefName =
				 * rst.getString("ORG1_REF_NAME"); org1RefMail =
				 * rst.getString("ORG1_REF_MAIL"); org1RefPhone =
				 * rst.getString("ORG1_REF_PHNUM"); org2Name =
				 * rst.getString("ORG2_NAME"); org2Exp =
				 * rst.getString("ORG2_EXP"); org2RefName =
				 * rst.getString("ORG2_REF_NAME"); org2RefMail =
				 * rst.getString("ORG2_REF_MAIL"); org3Name =
				 * rst.getString("ORG3_NAME"); org3Exp =
				 * rst.getString("ORG3_EXP"); org3RefName =
				 * rst.getString("ORG3_REF_NAME"); org3RefMail =
				 * rst.getString("ORG3_REF_MAIL");
				 */
				finalResponse = empId + "^" + totalExp + "^" + org1Name + "^"
						+ org1Exp + "^" + org1RefName + "^" + org1RefMail + "^"
						+ org1RefPhone + "^" + org2Name + "^" + org2Exp + "^"
						+ org2RefName + "^" + org2RefMail + "^" + org3Name
						+ "^" + org3Exp + "^" + org3RefName + "^" + org3RefMail;
				System.out.println("finalresource====" + finalResponse);
			}

		} catch (Exception ex) {

		} finally {
			con.close();
		}

		return finalResponse;
	}

	public static String getNomineeInfo() throws SQLException {

		String finalResponse = "";
		String empQRY = "select * from EMP_PAY_MASTER_TEMP";

		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {

		} catch (Exception ex) {

		} finally {

		}

		return finalResponse;
	}

	public static String getPanInfo() throws SQLException {

		String finalResponse = "";
		String empQRY = "select * from NCSS_EMP_MASTER_INFO where EMP_ID='10'";

		Connection con = GetConnection.getConnection();
		System.out.println("connection" + con);
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			System.out.println("inside the method====");
			rst = stmt.executeQuery(empQRY);

			String empId = "";
			String pan = "";
			String passportNum = "";
			String uid = "";
			String visaInfo = "";
			String adharNum = "";

			if (rst.next()) {

				empId = rst.getString("EMP_ID");
				pan = rst.getString("PAN");
				passportNum = rst.getString("PASSPORTNUM");
				uid = rst.getString("EMP_UID");
				visaInfo = rst.getString("EMP_VISA_INFO");
				adharNum = rst.getString("EMP_ADHAR_NUM");

				finalResponse = empId + "^" + pan + "^" + passportNum + "^"
						+ uid + "^" + visaInfo + "^" + adharNum;

				System.out.println("final result=============" + finalResponse);
			}
		} catch (Exception ex) {
			ex.printStackTrace();

		} finally {
			con.close();

		}

		return finalResponse;
	}

	/* EMPLOYEE SEARCH by emp id */

	public static ArrayList getEmployeeSearchInfo() throws SQLException {

		System.out.println("getEmployeeSearchInfo");
		// String finalResponse = "";
		/*
		 * Map session = ActionContext.getContext().getSession(); String id =
		 * (String) session.get("empid");
		 */
		ArrayList leaveOver = new ArrayList();

		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String empid1 = request.getParameter("empid1").trim().toUpperCase();

		String empQRY = "select * from NCSS_EMP_MASTER_INFO where STATUS='Active' and Emp_id='"
				+ empid1 + "'";
		System.out.println("empQry.." + empQRY);
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);
			String empId = "";
			String empFname = "";
			String empLname = "";
			Date joiningDate;
			Date empDob;
			String empDesig = "";
			String empEmail = "";
			String repManager = "";
			String empCtc = "";
			String status = "";
			String remarks = "";
			Date Dor;
			String phno = "";
			int i = 1;
			while (rst.next()) {
				empId = rst.getString("EMP_ID");
				empFname = rst.getString("EMP_FNAME");
				empLname = rst.getString("EMP_LNAME");
				if (empLname == null) {
					empLname = "";
				}
				joiningDate = rst.getDate("EMP_JOINING_DATE");
				empDob = rst.getDate("EMP_DOB");

				empDesig = rst.getString("EMP_DESIG");
				if (empDesig == null) {
					empDesig = "-";
				}
				empEmail = rst.getString("EMP_MAILID");
				if (empEmail == null) {
					empEmail = "-";
				}
				repManager = rst.getString("EMP_RM");
				if (repManager == null) {
					repManager = "-";
				}
				empCtc = rst.getString("EMP_CTC");
				if (empCtc == null) {
					empCtc = "-";
				}
				status = rst.getString("STATUS");
				if (status == null) {
					status = "-";
				}
				remarks = rst.getString("REMARKS");
				if (remarks == null) {
					remarks = "-";
				}

				phno = rst.getString("PHONENUM1");
				if (phno == null) {
					phno = "-";
				}
				// System.out.println("finalresource====" + used);

				String finalResponse = empId + "^" + empFname + "^" + empLname
						+ "^" + joiningDate + "^" + empDob + "^" + empDesig
						+ "^" + empEmail + "^" + repManager + "^" + empCtc
						+ "^" + status + "^" + remarks + "^" + phno;

				System.out.println("finalresource====" + finalResponse);
				leaveOver.add(finalResponse);
			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return leaveOver;
	}

	/* EMPLOYEE SEARCH by emp name */

	public static ArrayList getEmployeeSearchInfoByName() throws SQLException {

		System.out.println("getEmployeeSearchInfo");
		// String finalResponse = "";
		/*
		 * Map session = ActionContext.getContext().getSession(); String id =
		 * (String) session.get("empid");
		 */
		ArrayList leaveOver = new ArrayList();

		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String empname1 = request.getParameter("empname").trim();

		String empQRY = "select * from NCSS_EMP_MASTER_INFO where STATUS='Active' and emp_fname='"
				+ empname1 + "'";
		System.out.println("empQry.." + empQRY);
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);
			String empId = "";
			String empFname = "";
			String empLname = "";
			Date joiningDate;
			Date empDob;
			String empDesig = "";
			String empEmail = "";
			String repManager = "";
			String empCtc = "";
			String status = "";
			String remarks = "";
			Date Dor;

			String phno = "";
			int i = 1;
			while (rst.next()) {
				empId = rst.getString("EMP_ID");
				empFname = rst.getString("EMP_FNAME");
				empLname = rst.getString("EMP_LNAME");
				if (empLname == null) {
					empLname = "";
				}
				joiningDate = rst.getDate("EMP_JOINING_DATE");
				empDob = rst.getDate("EMP_DOB");

				empDesig = rst.getString("EMP_DESIG");
				if (empDesig == null) {
					empDesig = "-";
				}
				empEmail = rst.getString("EMP_MAILID");
				if (empEmail == null) {
					empEmail = "-";
				}
				repManager = rst.getString("EMP_RM");
				if (repManager == null) {
					repManager = "-";
				}
				empCtc = rst.getString("EMP_CTC");
				if (empCtc == null) {
					empCtc = "-";
				}
				status = rst.getString("STATUS");
				if (status == null) {
					status = "-";
				}
				remarks = rst.getString("REMARKS");
				if (remarks == null) {
					remarks = "-";
				}

				phno = rst.getString("PHONENUM1");
				if (phno == null) {
					phno = "-";
				}
				// System.out.println("finalresource====" + used);

				String finalResponse = empId + "^" + empFname + "^" + empLname
						+ "^" + joiningDate + "^" + empDob + "^" + empDesig
						+ "^" + empEmail + "^" + repManager + "^" + empCtc
						+ "^" + status + "^" + remarks + "^" + phno;

				System.out.println("finalresource====" + finalResponse);
				leaveOver.add(finalResponse);

			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return leaveOver;
	}

	/* EMPLOYEE SEARCH by emp blood group */

	public static ArrayList getEmployeeSearchInfoByBloodGroup()
			throws SQLException {

		System.out.println("getEmployeeSearchInfo");
		// String finalResponse = "";
		/*
		 * Map session = ActionContext.getContext().getSession(); String id =
		 * (String) session.get("empid");
		 */
		ArrayList leaveOver = new ArrayList();

		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String bgroup1 = request.getParameter("bgroup").trim();

		String empQRY = "select * from NCSS_EMP_MASTER_INFO where STATUS='Active' and BLOOD_GROUP='"
				+ bgroup1 + "'";
		System.out.println("empQry.." + empQRY);
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);
			String empId = "";
			String empFname = "";
			String empLname = "";
			Date joiningDate;
			Date empDob;
			String empDesig = "";
			String empEmail = "";
			String repManager = "";
			String empCtc = "";
			String status = "";
			String remarks = "";
			Date Dor;

			String phno = "";
			int i = 1;
			while (rst.next()) {
				empId = rst.getString("EMP_ID");
				empFname = rst.getString("EMP_FNAME");
				empLname = rst.getString("EMP_LNAME");
				if (empLname == null) {
					empLname = "";
				}
				joiningDate = rst.getDate("EMP_JOINING_DATE");
				empDob = rst.getDate("EMP_DOB");

				empDesig = rst.getString("EMP_DESIG");
				if (empDesig == null) {
					empDesig = "-";
				}
				empEmail = rst.getString("EMP_MAILID");
				if (empEmail == null) {
					empEmail = "-";
				}
				repManager = rst.getString("EMP_RM");
				if (repManager == null) {
					repManager = "-";
				}
				empCtc = rst.getString("EMP_CTC");
				if (empCtc == null) {
					empCtc = "-";
				}
				status = rst.getString("STATUS");
				if (status == null) {
					status = "-";
				}
				remarks = rst.getString("REMARKS");
				if (remarks == null) {
					remarks = "-";
				}

				phno = rst.getString("PHONENUM1");
				if (phno == null) {
					phno = "-";
				}
				// System.out.println("finalresource====" + used);

				String finalResponse = empId + "^" + empFname + "^" + empLname
						+ "^" + joiningDate + "^" + empDob + "^" + empDesig
						+ "^" + empEmail + "^" + repManager + "^" + empCtc
						+ "^" + status + "^" + remarks + "^" + phno;

				System.out.println("finalresource====" + finalResponse);
				leaveOver.add(finalResponse);

			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return leaveOver;
	}

	/* R-MATRIX INFO UNDER WHO IS WHO */

	public static ArrayList<Object> r_matrix_info_self(String rmatrix_input) throws SQLException {

		System.out.println("r_matrix_info_self");
		// String finalResponse = "";
		Map session = ActionContext.getContext().getSession();
		String mailid = (String) session.get("loginid");
		ArrayList<Object> leaveOver_mgr = new ArrayList<Object>();

	/*HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String rmatrix_input = request.getParameter("input_value").trim();*/
		System.out.println("rmatrix_input....."+rmatrix_input);
		
		String empQRY="select EMP_FNAME,EMP_LNAME from NCSS_EMP_MASTER_INFO where EMP_MAILID in (select EMP_RM from NCSS_EMP_MASTER_INFO where EMP_MAILID='"+mailid+"')";

		System.out.println("empQry_mgr name.." + empQRY);
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);
			String empFname_rm = "";
			String empLname_rm = "";
			
			while (rst.next()) {
			
				empFname_rm = rst.getString("EMP_FNAME");
				empLname_rm = rst.getString("EMP_LNAME");
				if (empLname_rm == null) {
					empLname_rm = "";
				}
				
				String finalResponse = empFname_rm + "^" + empLname_rm;

				leaveOver_mgr.add(finalResponse);
			}

		} catch (Exception ex) {

		} finally {
			con.close();
		}

		return leaveOver_mgr;
	}

	public static ArrayList<Object> r_matrix_info_self_details(String rmatrix_input) throws SQLException {

		System.out.println("r_matrix_info_self_details");
		// String finalResponse = "";
		Map session = ActionContext.getContext().getSession();
		String mailid = (String) session.get("loginid");
		ArrayList<Object> leaveOver = new ArrayList<Object>();

	/*HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String rmatrix_input = request.getParameter("input_value").trim();*/
		System.out.println("rmatrix_input....."+rmatrix_input);

		String empQRY = "select EMP_ID,EMP_FNAME,EMP_LNAME,EMP_JOINING_DATE,EMP_DOB,EMP_DESIG,EMP_MAILID,EMP_RM,BUSINESS_HEAD,HR from NCSS_EMP_MASTER_INFO where EMP_MAILID='"+mailid+"' and status='Active'";
		

		
		System.out.println("empQry.." + empQRY);
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);
			String empId = "";
			String empFname = "";
			String empLname = "";
			Date joiningDate;
			Date empDob;
			String empDesig = "";
			String empEmail = "";
			String repManager = "";
			int i = 1;
			String business_heade="";
			String hr="";
			
			while (rst.next()) {
				empId = rst.getString("EMP_ID");
				empFname = rst.getString("EMP_FNAME");
				empLname = rst.getString("EMP_LNAME");
				if (empLname == null) {
					empLname = "";
				}
			joiningDate = rst.getDate("EMP_JOINING_DATE");
				empDob = rst.getDate("EMP_DOB");

				empDesig = rst.getString("EMP_DESIG");
				if (empDesig == null) {
					empDesig = "-";
				}
				empEmail = rst.getString("EMP_MAILID");
				if (empEmail == null) {
					empEmail = "-";
				}
				repManager = rst.getString("EMP_RM");
				if (repManager == null) {
					repManager = "-";
				}
				
				business_heade = rst.getString("BUSINESS_HEAD");
				if (business_heade == null) {
					business_heade = "-";
				}
				hr = rst.getString("HR");
				if (hr == null) {
					hr = "-";
				}
				// System.out.println("finalresource====" + used);

				String finalResponse = empId + "^" + empFname + "^" + empLname
						+ "^" + joiningDate + "^" + empDob + "^" + empDesig
						+ "^" + empEmail + "^" + repManager 
					    +"^"+ business_heade +"^"+ hr;
				

				leaveOver.add(finalResponse);

			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return leaveOver;
	}
	public static ArrayList<Object> r_matrix_info_subordinate(String rmatrix_input) throws SQLException {

		System.out.println("r_matrix_info");
		// String finalResponse = "";
		Map session = ActionContext.getContext().getSession();
		String mailid = (String) session.get("loginid");
		ArrayList<Object> leaveOver = new ArrayList<Object>();

	/*HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String rmatrix_input = request.getParameter("input_value").trim();*/
		System.out.println("rmatrix_input....."+rmatrix_input);

		String empQRY = "select EMP_ID,EMP_FNAME,EMP_LNAME,EMP_JOINING_DATE,EMP_DOB,EMP_DESIG,EMP_MAILID,EMP_RM,BUSINESS_HEAD,HR from NCSS_EMP_MASTER_INFO where EMP_RM='"+mailid+"' and status='Active'";
		
		System.out.println("empQry.." + empQRY);
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			rst = stmt.executeQuery(empQRY);
			String empId = "";
			String empFname = "";
			String empLname = "";
			Date joiningDate;
			Date empDob;
			String empDesig = "";
			String empEmail = "";
			String repManager = "";
			int i = 1;
			String business_heade="";
			String hr="";
			while (rst.next()) {
				empId = rst.getString("EMP_ID");
				empFname = rst.getString("EMP_FNAME");
				empLname = rst.getString("EMP_LNAME");
				if (empLname == null) {
					empLname = "";
				}
				joiningDate = rst.getDate("EMP_JOINING_DATE");
				empDob = rst.getDate("EMP_DOB");

				empDesig = rst.getString("EMP_DESIG");
				if (empDesig == null) {
					empDesig = "-";
				}
				empEmail = rst.getString("EMP_MAILID");
				if (empEmail == null) {
					empEmail = "-";
				}
				repManager = rst.getString("EMP_RM");
				if (repManager == null) {
					repManager = "-";
				}
				
				business_heade = rst.getString("BUSINESS_HEAD");
				if (business_heade == null) {
					business_heade = "-";
				}
				hr = rst.getString("HR");
				if (hr == null) {
					hr = "-";
				}
				// System.out.println("finalresource====" + used);

				String finalResponse = empId + "^" + empFname + "^" + empLname
						+ "^" + joiningDate + "^" + empDob + "^" + empDesig
						+ "^" + empEmail + "^" + repManager 
					    +"^"+ business_heade +"^"+ hr;


				leaveOver.add(finalResponse);

			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return leaveOver;
	}

	
	
	public static void main(String[] args) throws SQLException {

		/* EmployeeDetails.getPreviousEmpInfo(); */

		/* EmployeeDetails.getAllEmployeeInfo(); */
	}

}