package com.ess.common.action;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;




import com.ess.util.GetConnection;


public class EmployeeDetailsPersonal  {
	 //private Map<String, String> session;
	 

		/*public Map<String, String> getSession() {
			return session;
		}
		public void setSession(Map<String, String> session) {
			this.session = session;
		}*/
		 
	public static final String SUCCESS = "success";
	public static final String ERROR = "error";

	private static final long serialVersionUID = 1L;

	public  EmployeeDetailsPersonal() {
		
		// TODO Auto-generated constructor stub
	}
	 public String personlMenu()
	  {
		/* ((SessionMap)this.session).invalidate();*/
		  return "success";
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
	//static Map session = ActionContext.getContext().getSession();
	public static String getPersonalInfo() throws SQLException {
		String finalResponse = "";
		 Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		System.out.println("id from login=========="+id);
		String empQRY = "select EMP_ID,EMP_FNAME,EMP_LNAME,EMP_JOINING_DATE,EMP_DOB,EMP_DESIG,EMP_MAILID,EMP_RM,EMP_CTC,PAN from NCSS_EMP_MASTER_INFO where EMP_ID='"+id+"'";
		
		//String empQRY = "select * from NCSS_EMP_MASTER_INFO where EMP_ID='CSSE150044'";
		
		System.out.println("Personal info query======"+empQRY);

		Connection con = GetConnection.getConnection();
		System.out.println("connection" + con);
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
			String panNo="";
			

			if (rst.next()) {
				
				empId = rst.getString("EMP_ID");
				empFname = rst.getString("EMP_FNAME");
				empLname = rst.getString("EMP_LNAME");
				if(empLname==null || empLname=="")
				{
					empLname="-";
					
				}
				
				joiningDate = rst.getDate("EMP_JOINING_DATE");
				empDob = rst.getDate("EMP_DOB");
				empDesig = rst.getString("EMP_DESIG");
				empEmail = rst.getString("EMP_MAILID");
				repManager = rst.getString("EMP_RM");
				empCtc = rst.getString("EMP_CTC");
				panNo=rst.getString("PAN");
			

				finalResponse = empId + "^" + empFname + "^" + empLname + "^"
						+ joiningDate + "^" + empDob + "^" + empDesig + "^"
						+ empEmail + "^" + repManager + "^" + empCtc  + "^" + panNo ;

				System.out.println("final result=============" + finalResponse);
			}
		} catch (Exception ex) {
			ex.printStackTrace();

		} finally {
			con.close();

		}

		return finalResponse;
	}

	
	/*public static String getPersonalInfo1() throws SQLException {
		String finalResponse = "";
		 Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		System.out.println("id from login=========="+id);
		String empQRY = "select EMP_ID,EMP_FNAME,EMP_LNAME,EMP_JOINING_DATE,EMP_DOB,EMP_DESIG,EMP_MAILID,EMP_RM,EMP_CTC from NCSS_EMP_MASTER_INFO where EMP_ID='"+id+"'";
		String empQRY = "select * from NCSS_EMP_MASTER_INFO where EMP_ID='"+id+"'";
		//String empQRY = "select * from NCSS_EMP_MASTER_INFO where EMP_ID='CSSE150044'";
		
		System.out.println("Personal info query======"+empQRY);

		Connection con = GetConnection.getConnection();
		System.out.println("connection" + con);
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
			String panNo="";
			String Dept="";
			String Location="";
			String Role="";
			

			if (rst.next()) {
				
				empId = rst.getString("EMP_ID");
				empFname = rst.getString("EMP_FNAME");
				empLname = rst.getString("EMP_LNAME");
				joiningDate = rst.getDate("EMP_JOINING_DATE");
				empDob = rst.getDate("EMP_DOB");
				empDesig = rst.getString("EMP_DESIG");
				empEmail = rst.getString("EMP_MAILID");
				repManager = rst.getString("EMP_RM");
				empCtc = rst.getString("EMP_CTC");
				panNo = rst.getString("PAN");
				Dept = rst.getString("DEPARTMENT");
				Location = rst.getString("LOCATION");
				Role = rst.getString("ROLE");

				finalResponse = empId + "^" + empFname + "^" + empLname + "^"
						+ joiningDate + "^" + empDob + "^" + empDesig + "^"
						+ empEmail + "^" + repManager + "^" + empCtc + "^" + panNo + "^" + Dept + "^" + Location + "^" + Role;

				System.out.println("final result=============" + finalResponse);
			}
		} catch (Exception ex) {
			ex.printStackTrace();

		} finally {
			con.close();

		}

		return finalResponse;
	}
*/
	
	public static String getQualificationInfo() throws SQLException {

		String finalResponse = "";
		 Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		String empQRY = "select * from NCSS_EMP_EDUCATION WHERE EMP_ID='"+id+"'";

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
			String count1="";

			if (rst.next()) {

				empId = rst.getString("EMP_ID");
				empQual1 = rst.getString("EMP_QUAL1");
				if(empQual1==null){
					empQual1=" ";
				}
				empQual1Perc = rst.getString("EMP_QUAL1_PERC");
				if(empQual1Perc==null){
					empQual1Perc=" ";
				}
				empQual1passout = rst.getString("EMP_QUAL1_PASSOUT");
				if(empQual1passout==null){
					empQual1passout=" ";
				}
				empQual2 = rst.getString("EMP_QUAL2");
				if(empQual2==null){
					empQual2=" ";
				}
				empQual2Perc = rst.getString("EMP_QUAL2_PERC");
				if(empQual2Perc==null){
					empQual2Perc=" ";
				}
				empQual2passout = rst.getString("EMP_QUAL2_PASSOUT");
				if(empQual2passout==null){
					empQual2passout=" ";
				}
				empQual3 = rst.getString("EMP_QUAL3");
				if(empQual3==null){
					empQual3=" ";
				}
				empQual3Perc = rst.getString("EMP_QUAL3_PERC");
				if(empQual3Perc==null){
					empQual3Perc=" ";
				}
				empQual3passout = rst.getString("EMP_QUAL3_PASSOUT");
				if(empQual3passout==null){
					empQual3passout=" ";
				}
				cert1 = rst.getString("CERT1");
				if(cert1==null){
					cert1=" ";
				}
				cert2 = rst.getString("CERT2");
				if(cert2==null){
					cert2=" ";
				}
				cert3 = rst.getString("CERT3");
				if(cert3==null){
					cert3=" ";
				}
				count1=rst.getString("count");

				finalResponse = empId + "^" + empQual1 + "^" + empQual1Perc
						+ "^" + empQual1passout + "^" + empQual2 + "^"
						+ empQual2Perc + "^" + empQual2passout + "^" + empQual3
						+ "^" + empQual3Perc + "^" + empQual2Perc + "^" + cert1
						+ "^" + cert2 + "^" + cert3+"^" + count1;
				System.out.println("finalresource====" + finalResponse);

			}

		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return finalResponse;
	}
	
	
	//EMP QUALIFICATION UPDATE
	private String empId;
	private String empQual1;
	private String empQual1Perc;
	public String getEmpQual1Perc() {
		return empQual1Perc;
	}
	public void setEmpQual1Perc(String empQual1Perc) {
		this.empQual1Perc = empQual1Perc;
	}
	public String getEmpQual1passout() {
		return empQual1passout;
	}
	public void setEmpQual1passout(String empQual1passout) {
		this.empQual1passout = empQual1passout;
	}
	public String getEmpQual2() {
		return empQual2;
	}
	public void setEmpQual2(String empQual2) {
		this.empQual2 = empQual2;
	}
	public String getEmpQual2Perc() {
		return empQual2Perc;
	}
	public void setEmpQual2Perc(String empQual2Perc) {
		this.empQual2Perc = empQual2Perc;
	}
	public String getEmpQual2passout() {
		return empQual2passout;
	}
	public void setEmpQual2passout(String empQual2passout) {
		this.empQual2passout = empQual2passout;
	}
	public String getEmpQual3() {
		return empQual3;
	}
	public void setEmpQual3(String empQual3) {
		this.empQual3 = empQual3;
	}
	public String getEmpQual3Perc() {
		return empQual3Perc;
	}
	public void setEmpQual3Perc(String empQual3Perc) {
		this.empQual3Perc = empQual3Perc;
	}
	public String getEmpQual3passout() {
		return empQual3passout;
	}
	public void setEmpQual3passout(String empQual3passout) {
		this.empQual3passout = empQual3passout;
	}
	public String getCert1() {
		return cert1;
	}
	public void setCert1(String cert1) {
		this.cert1 = cert1;
	}
	public String getCert2() {
		return cert2;
	}
	public void setCert2(String cert2) {
		this.cert2 = cert2;
	}
	public String getCert3() {
		return cert3;
	}
	public void setCert3(String cert3) {
		this.cert3 = cert3;
	}
	public String getCount1() {
		return count1;
	}
	public void setCount1(String count1) {
		this.count1 = count1;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}

	private String empQual1passout;
	private String empQual2;
	private String empQual2Perc;
	private String empQual2passout;
	private String empQual3;
	private String empQual3Perc;
	private String empQual3passout;
	private String cert1;
	private String cert2;
	private String cert3;
	private String count1;
	private String count;

	public String getEmpQual1() {
		return empQual1;
	}
	public void setEmpQual1(String empQual1) {
		this.empQual1 = empQual1;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	
	//for Qualification Updation
	
	public String qualificationUpdate()
	{
		System.out.println("Calling qualification updation method");
	      String ret = SUCCESS;
	      try
	      {
	    	  Connection con = GetConnection.getConnection();
	    		Statement stmt = con.createStatement();

	    	String editQRY="UPDATE NCSS_EMP_EDUCATION SET EMP_QUAL1='"+empQual1+"',EMP_QUAL1_PERC='"+empQual1Perc+"', EMP_QUAL1_PASSOUT='"+empQual1passout+"', EMP_QUAL2='"+empQual2+"',EMP_QUAL2_PERC='"+empQual2Perc+"', EMP_QUAL2_PASSOUT='"+empQual2passout+"', EMP_QUAL3='"+empQual3+"',EMP_QUAL3_PERC='"+empQual3Perc+"', EMP_QUAL3_PASSOUT='"+empQual3passout+"',  CERT1='"+cert1+"',CERT2='"+cert2+"', CERT3='"+cert3+"' , count='"+count+"' WHERE EMP_ID='"+empId+"'";
	    	System.out.println("editQRY .."+editQRY);

	    		int rs=stmt.executeUpdate(editQRY);
	    		System.out.println("rs.."+rs);
	    		
	    		if(rs>0)
	    		{
	    			ret = SUCCESS;	
	    		}
	    		else
	    		{
	    			ret=ERROR;
	    		}
	         
	      }
	      catch(Exception e)
	      {
	         ret = ERROR;
	         e.printStackTrace();
	      }
	      return ret;
	   }



	public static String getPreviousEmpInfo() throws SQLException {

		String finalResponse = "";
		 Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		String empQRY1 = "SELECT * FROM NCSS_EMP_PREV_ORG_INFO WHERE EMP_ID='"+id+"'";

		Connection con = GetConnection.getConnection();
		Statement stmt;
		//ResultSet rst = null;
		

		try {
			//Statement stmt1 = con.createStatement();
			ResultSet rst = null;
			stmt = con.createStatement();
			System.out.println("statement========" + con);
			rst = stmt.executeQuery(empQRY1);

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
			String org2RefPhone = "";
			
			String org3Name = "";
			String org3Exp = "";
			String org3RefName = "";
			String org3RefMail = "";
			String org3RefPhone = "";
			
			String orgEXT1Name = "";
			String orgEXT1Exp = "";
			String orgEXT1RefName = "";
			String orgEXT1RefMail = "";
			String orgEXT1RefPhone = "";
			
			String orgEXT2Name = "";
			String orgEXT2Exp = "";
			String orgEXT2RefName = "";
			String orgEXT2RefMail = "";
			String orgEXT2RefPhone = "";
			
			String orgEXT3Name = "";
			String orgEXT3Exp = "";
			String orgEXT3RefName = "";
			String orgEXT3RefMail = "";
			String orgEXT3RefPhone = "";
			
			String count1="";
			
			
			
			
			
			
			if (rst.next()) {

				empId = rst.getString("EMP_ID");
				totalExp = rst.getString("TOTAL_EXP");
				org1Name = rst.getString("ORG1_NAME");if(org1Name==null){org1Name=" "; }
				org1Exp = rst.getString("ORG1_EXP");if(org1Exp==null){org1Exp=" "; }
				org1RefName = rst.getString("ORG1_REF_NAME");if(org1RefName==null){org1RefName=" "; }
				org1RefMail = rst.getString("ORG1_REF_MAIL");if(org1RefMail==null){org1RefMail=" "; }
				org1RefPhone = rst.getString("ORG1_REF_PHNUM");if(org1RefPhone==null){org1RefPhone=" "; }
				
				org2Name = rst.getString("ORG2_NAME");if(org2Name==null){org2Name=" "; }
				org2Exp = rst.getString("ORG2_EXP");if(org2Exp==null){org2Exp=" "; }
				org2RefName = rst.getString("ORG2_REF_NAME");if(org2RefName==null){org2RefName=" "; }
				org2RefMail = rst.getString("ORG2_REF_MAIL");if(org2RefMail==null){org2RefMail=" "; }
				org2RefPhone = rst.getString("ORG2_REF_PHNUM");if(org2RefPhone==null){org2RefPhone=" "; }
				
				org3Name = rst.getString("ORG3_NAME");if(org3Name==null){org3Name=" "; }
				org3Exp = rst.getString("ORG3_EXP");if(org3Exp==null){org3Exp=" "; }
				org3RefName = rst.getString("ORG3_REF_NAME");if(org3RefName==null){org3RefName=" "; }
				org3RefMail = rst.getString("ORG3_REF_MAIL");if(org3RefMail==null){org3RefMail=" "; }
				org3RefPhone = rst.getString("ORG3_REF_PHNUM");if(org3RefPhone==null){org3RefPhone=" "; }
				
				
				
				orgEXT1Name = rst.getString("ORG1_NAME_E");if(orgEXT1Name==null){orgEXT1Name=" "; }
				orgEXT1Exp = rst.getString("ORG1_EXP_E");if(orgEXT1Exp==null){orgEXT1Exp=" "; }
				orgEXT1RefName = rst.getString("ORG1_REF_NAME_E");if(orgEXT1RefName==null){orgEXT1RefName=" "; }
				orgEXT1RefMail = rst.getString("ORG1_REF_MAIL_E");if(orgEXT1RefMail==null){orgEXT1RefMail=" "; }
				orgEXT1RefPhone = rst.getString("ORG1_REF_PHNUM_E");if(orgEXT1RefPhone==null){orgEXT1RefPhone=" "; }
				orgEXT2Name = rst.getString("ORG1_NAME_E");if(orgEXT2Name==null){orgEXT2Name=" "; }
				orgEXT2Exp = rst.getString("ORG1_EXP_E");if(orgEXT2Exp==null){orgEXT2Exp=" "; }
				orgEXT2RefName = rst.getString("ORG1_REF_NAME_E");if(orgEXT2RefName==null){orgEXT2RefName=" "; }
				orgEXT2RefMail = rst.getString("ORG1_REF_MAIL_E");if(orgEXT2RefMail==null){orgEXT2RefMail=" "; }
				orgEXT2RefPhone = rst.getString("ORG1_REF_PHNUM_E");if(orgEXT2RefPhone==null){orgEXT2RefPhone=" "; }
				
				orgEXT3Name = rst.getString("ORG1_NAME_E");if(orgEXT3Name==null){orgEXT3Name=" "; }
				orgEXT3Exp = rst.getString("ORG1_EXP_E");if(orgEXT3Exp==null){orgEXT3Exp=" "; }
				orgEXT3RefName = rst.getString("ORG1_REF_NAME_E");if(orgEXT3RefName==null){orgEXT3RefName=" "; }
				orgEXT3RefMail = rst.getString("ORG1_REF_MAIL_E");if(orgEXT3RefMail==null){orgEXT3RefMail=" "; }
				orgEXT3RefPhone = rst.getString("ORG1_REF_PHNUM_E");if(orgEXT3RefPhone==null){orgEXT3RefPhone=" "; }
				
				count1=rst.getString("count");


				finalResponse = empId + "^" + totalExp + "^" + org1Name + "^"
						+ org1Exp + "^" + org1RefName + "^" + org1RefMail + "^"
						+ org1RefPhone + "^" + org2Name + "^" + org2Exp + "^"
						+ org2RefName + "^" + org2RefMail + "^" + org3Name
						+ "^" + org3Exp + "^" + org3RefName + "^" + org3RefMail+"^" + count1
						
						+ "^" + org2RefPhone + "^" + org3RefPhone + "^" + orgEXT1Name+"^" + orgEXT1Exp
						+ "^" + orgEXT1RefName + "^" + orgEXT1RefMail + "^" + orgEXT1RefPhone+"^" + orgEXT2Name
						+ "^" + orgEXT2Exp + "^" + orgEXT2RefName + "^" + orgEXT2RefMail+"^" + orgEXT2RefPhone
						+ "^" + orgEXT3Name + "^" + orgEXT3Exp + "^" + orgEXT3RefName+"^" + orgEXT3RefMail
						+"^" +orgEXT3RefPhone;
				
				System.out.println("finalresource====" + finalResponse);
				
			}

		} catch (Exception ex) {

		} finally {
			con.close();
		}

		return finalResponse;
	}
	
	//PREVIOUS EMP UPDATE
	
	
	//private String empId;
		private String totalExp;
		private String org1Name;
		private String org1Exp;
		private String org1RefName;
		private String org1RefMail;
		private String org1RefPhone;
		private String org2Name;
		private String org2Exp;
		private String org2RefName;
		private String org2RefMail;
		private String org3Name;
		private String org3Exp;
		private String org3RefName;
		private String org3RefMail;
		
//		private String count1;
//		private String count;
		
		private String org2RefPhone;
		private String org3RefPhone;
		
		private String orgEXT1Name;
		private String orgEXT1Exp;
		private String orgEXT1RefName;
		private String orgEXT1RefMail;
		private String orgEXT1RefPhone;
		private String orgEXT2Name;
		private String orgEXT2Exp;
		private String orgEXT2RefName;
		private String orgEXT2RefMail;
		private String orgEXT2RefPhone;
		private String orgEXT3Name;
		private String orgEXT3Exp;
		private String orgEXT3RefName;
		private String orgEXT3RefMail;
		private String orgEXT3RefPhone;
		
	
		public String getOrg3RefMail() {
			System.out.println("in action class ..."+org3RefMail);
			return org3RefMail;
		}
		public void setOrg3RefMail(String org3RefMail) {
			this.org3RefMail = org3RefMail;
		}
		public String getTotalExp() {
			return totalExp;
		}
		public void setTotalExp(String totalExp) {
			this.totalExp = totalExp;
		}
		public String getOrg1Name() {
			return org1Name;
		}
		public void setOrg1Name(String org1Name) {
			this.org1Name = org1Name;
		}
		public String getOrg1Exp() {
			return org1Exp;
		}
		public void setOrg1Exp(String org1Exp) {
			this.org1Exp = org1Exp;
		}
		public String getOrg1RefName() {
			return org1RefName;
		}
		public void setOrg1RefName(String org1RefName) {
			this.org1RefName = org1RefName;
		}
		public String getOrg1RefMail() {
			return org1RefMail;
		}
		public void setOrg1RefMail(String org1RefMail) {
			this.org1RefMail = org1RefMail;
		}
		public String getOrg1RefPhone() {
			return org1RefPhone;
		}
		public void setOrg1RefPhone(String org1RefPhone) {
			this.org1RefPhone = org1RefPhone;
		}
		public String getOrg2Name() {
			return org2Name;
		}
		public void setOrg2Name(String org2Name) {
			this.org2Name = org2Name;
		}
		public String getOrg2Exp() {
			return org2Exp;
		}
		public void setOrg2Exp(String org2Exp) {
			this.org2Exp = org2Exp;
		}
		public String getOrg2RefName() {
			return org2RefName;
		}
		public void setOrg2RefName(String org2RefName) {
			this.org2RefName = org2RefName;
		}
		public String getOrg2RefMail() {
			return org2RefMail;
		}
		public void setOrg2RefMail(String org2RefMail) {
			this.org2RefMail = org2RefMail;
		}
		public String getOrg3Name() {
			return org3Name;
		}
		public void setOrg3Name(String org3Name) {
			this.org3Name = org3Name;
		}
		public String getOrg3Exp() {
			return org3Exp;
		}
		public void setOrg3Exp(String org3Exp) {
			this.org3Exp = org3Exp;
		}
		public String getOrg3RefName() {
			return org3RefName;
		}
		public void setOrg3RefName(String org3RefName) {
			this.org3RefName = org3RefName;
		}

		
		
		public String getOrg2RefPhone() {
			return org2RefPhone;
		}
		public void setOrg2RefPhone(String org2RefPhone) {
			this.org2RefPhone = org2RefPhone;
		}
		public String getOrg3RefPhone() {
			return org3RefPhone;
		}
		public void setOrg3RefPhone(String org3RefPhone) {
			this.org3RefPhone = org3RefPhone;
		}
		public String getOrgEXT1Name() {
			return orgEXT1Name;
		}
		public void setOrgEXT1Name(String orgEXT1Name) {
			this.orgEXT1Name = orgEXT1Name;
		}
		public String getOrgEXT1Exp() {
			return orgEXT1Exp;
		}
		public void setOrgEXT1Exp(String orgEXT1Exp) {
			this.orgEXT1Exp = orgEXT1Exp;
		}
		public String getOrgEXT1RefName() {
			return orgEXT1RefName;
		}
		public void setOrgEXT1RefName(String orgEXT1RefName) {
			this.orgEXT1RefName = orgEXT1RefName;
		}
		public String getOrgEXT1RefMail() {
			return orgEXT1RefMail;
		}
		public void setOrgEXT1RefMail(String orgEXT1RefMail) {
			this.orgEXT1RefMail = orgEXT1RefMail;
		}
		public String getOrgEXT1RefPhone() {
			return orgEXT1RefPhone;
		}
		public void setOrgEXT1RefPhone(String orgEXT1RefPhone) {
			this.orgEXT1RefPhone = orgEXT1RefPhone;
		}
		public String getOrgEXT2Name() {
			return orgEXT2Name;
		}
		public void setOrgEXT2Name(String orgEXT2Name) {
			this.orgEXT2Name = orgEXT2Name;
		}
		public String getOrgEXT2Exp() {
			return orgEXT2Exp;
		}
		public void setOrgEXT2Exp(String orgEXT2Exp) {
			this.orgEXT2Exp = orgEXT2Exp;
		}
		public String getOrgEXT2RefName() {
			return orgEXT2RefName;
		}
		public void setOrgEXT2RefName(String orgEXT2RefName) {
			this.orgEXT2RefName = orgEXT2RefName;
		}
		public String getOrgEXT2RefMail() {
			return orgEXT2RefMail;
		}
		public void setOrgEXT2RefMail(String orgEXT2RefMail) {
			this.orgEXT2RefMail = orgEXT2RefMail;
		}
		public String getOrgEXT2RefPhone() {
			return orgEXT2RefPhone;
		}
		public void setOrgEXT2RefPhone(String orgEXT2RefPhone) {
			this.orgEXT2RefPhone = orgEXT2RefPhone;
		}
		public String getOrgEXT3Name() {
			return orgEXT3Name;
		}
		public void setOrgEXT3Name(String orgEXT3Name) {
			this.orgEXT3Name = orgEXT3Name;
		}
		public String getOrgEXT3Exp() {
			return orgEXT3Exp;
		}
		public void setOrgEXT3Exp(String orgEXT3Exp) {
			this.orgEXT3Exp = orgEXT3Exp;
		}
		public String getOrgEXT3RefName() {
			return orgEXT3RefName;
		}
		public void setOrgEXT3RefName(String orgEXT3RefName) {
			this.orgEXT3RefName = orgEXT3RefName;
		}
		public String getOrgEXT3RefMail() {
			return orgEXT3RefMail;
		}
		public void setOrgEXT3RefMail(String orgEXT3RefMail) {
			this.orgEXT3RefMail = orgEXT3RefMail;
		}
		public String getOrgEXT3RefPhone() {
			return orgEXT3RefPhone;
		}
		public void setOrgEXT3RefPhone(String orgEXT3RefPhone) {
			this.orgEXT3RefPhone = orgEXT3RefPhone;
		}
		
		
		//for Qualification previous Employer Update
		
			public String previousEmployerUpdate()
			{
				System.out.println("Calling previous Employer updation method");
			      String ret = SUCCESS;
			      try
			      {
			    	  Connection con = GetConnection.getConnection();
			    		Statement stmt = con.createStatement();

			    	/*String editQRY="UPDATE NCSS_EMP_PREV_ORG_INFO SET TOTAL_EXP='"+totalExp+"',ORG1_NAME='"+org1Name+"' ,ORG1_EXP='"+org1Exp+"' , ORG1_REF_NAME='"+org1RefName+"', ORG1_REF_MAIL='"+org1RefMail+"',ORG1_REF_PHNUM='"+org1RefPhone+"', ORG2_NAME='"+org2Name+"', ORG2_EXP='"+org2Exp+"',ORG2_REF_NAME='"+org2RefName+"', ORG2_REF_MAIL='"+org2RefMail+"',  ORG3_NAME='"+org3Name+"',ORG3_EXP='"+org3Exp+"', ORG3_REF_NAME='"+org3RefName+"' , ORG3_REF_MAIL='"+org3RefMail+"', COUNT='"+count+"' WHERE EMP_ID='"+empId+"'";*/
			    
			String editQRY="UPDATE NCSS_EMP_PREV_ORG_INFO SET TOTAL_EXP='"+totalExp+"',ORG1_NAME='"+org1Name+"' ,ORG1_EXP='"+org1Exp+"' , ORG1_REF_NAME='"+org1RefName+"', ORG1_REF_MAIL='"+org1RefMail+"',ORG1_REF_PHNUM='"+org1RefPhone+"', ORG2_NAME='"+org2Name+"', ORG2_EXP='"+org2Exp+"',ORG2_REF_NAME='"+org2RefName+"', ORG2_REF_MAIL='"+org2RefMail+"',  ORG3_NAME='"+org3Name+"',ORG3_EXP='"+org3Exp+"', ORG3_REF_NAME='"+org3RefName+"' , ORG3_REF_MAIL='"+org3RefMail+"', COUNT='"+count+"' ,                     ORG2_REF_PHNUM='"+org2RefPhone+"' , ORG3_REF_PHNUM='"+org3RefPhone+"' ,      ORG1_NAME_E='"+orgEXT1Name+"' ,ORG1_EXP_E='"+orgEXT1Exp+"' , ORG1_REF_NAME_E='"+orgEXT1RefName+"', ORG1_REF_MAIL_E='"+orgEXT1RefMail+"',ORG1_REF_PHNUM_E='"+orgEXT1RefPhone+"'   ,      ORG2_NAME_E='"+orgEXT2Name+"' ,ORG2_EXP_E='"+orgEXT2Exp+"' , ORG2_REF_NAME_E='"+orgEXT2RefName+"', ORG2_REF_MAIL_E='"+orgEXT2RefMail+"',ORG2_REF_PHNUM_E='"+orgEXT2RefPhone+"'  ,      ORG3_NAME_E='"+orgEXT3Name+"' ,ORG3_EXP_E='"+orgEXT3Exp+"' , ORG3_REF_NAME_E='"+orgEXT3RefName+"', ORG3_REF_MAIL_E='"+orgEXT3RefMail+"',ORG3_REF_PHNUM_E='"+orgEXT3RefPhone+"'           WHERE EMP_ID='"+empId+"'";
			    		System.out.println("editQRY for prev emp .."+editQRY);

			    		int rs=stmt.executeUpdate(editQRY);
			    		System.out.println("rs.."+rs);
			    		
			    		if(rs>0)
			    		{
			    			ret = SUCCESS;	
			    		}
			    		else
			    		{
			    			ret=ERROR;
			    		}
			      }
			      catch(Exception e)
			      {
			         ret = ERROR;
			         e.printStackTrace();
			      }
			      return ret;
			   }


		

	/*public static String getNomineeInfo() throws SQLException {

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
	}*/

	public static String getPanInfo() throws SQLException {
		
		String finalResponse = "";
		 Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		String empQRY = "select * from NCSS_EMP_MASTER_INFO where EMP_ID='"+id+"'";

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
	
	//nominies of employee
	public static String getEmpNomineeInfo() throws SQLException {

		String finalResponse = "";
		 Map session = ActionContext.getContext().getSession();
			String id=(String)session.get("empid");
			
		
		//String empQRY = "select * from EMP_PAY_MASTER_TEMP";
		String empQRY = "select * from NCSS_EMP_NOMINIES where EMP_ID='"+id+"'";
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		try {
			
			//ResultSet rst = null;
			stmt = con.createStatement();
			System.out.println("statement========" + con);
			rst = stmt.executeQuery(empQRY);

			String empId = "";
			String Spouse_Name = "";
			String Mother_Name = "";
			String Father_Name = "";
			
	
			if (rst.next()) {

				empId = rst.getString("EMP_ID");
				Spouse_Name = rst.getString("SPOUSE_NAME");
				Mother_Name = rst.getString("MOTHER_NAME");
				Father_Name = rst.getString("FATHER_NAME");
				
				finalResponse = empId + "^" + Spouse_Name + "^" + Mother_Name + "^"
						+ Father_Name ;
			
				System.out.println("finalresource====" + finalResponse);
				
			}
			
			
			

		} catch (Exception ex) {

		} finally {
		}
		return finalResponse;
	}
	
	//UPDATE Employee Nominies info
	
	
		private String Spouse_Name;
		private String Mother_Name;
		private String Father_Name;
		
		public String getSpouse_Name() {
			return Spouse_Name;
		}
		public void setSpouse_Name(String spouse_Name) {
			Spouse_Name = spouse_Name;
		}
		public String getMother_Name() {
			return Mother_Name;
		}
		public void setMother_Name(String mother_Name) {
			Mother_Name = mother_Name;
		}
		public String getFather_Name() {
			return Father_Name;
		}
		public void setFather_Name(String father_Name) {
			Father_Name = father_Name;
		}

		
				public String nominiUpdate()
				{
					System.out.println("Calling nominiUpdate updation method");
				      String ret = SUCCESS;
				      Map session = ActionContext.getContext().getSession();
						String id=(String)session.get("empid");
						System.out.println("nomini emp id.."+id);
				      try
				      {
				    	  Connection con = GetConnection.getConnection();
				    	  Statement stmt = con.createStatement();

				    	String editQRY="UPDATE NCSS_EMP_NOMINIES SET SPOUSE_NAME='"+Spouse_Name+"',MOTHER_NAME='"+Mother_Name+"' ,FATHER_NAME='"+Father_Name+"'  WHERE EMP_ID='"+id+"'";
				    	System.out.println("editQRY for nomini .."+editQRY);

				    		int rs=stmt.executeUpdate(editQRY);
				    		System.out.println("rs.."+rs);
				    		
				    		if(rs>0)
				    		{
				    			ret = SUCCESS;	
				    		}
				    		else
				    		{
				    			ret=ERROR;
				    		}
				      }
				      catch(Exception e)
				      {
				         ret = ERROR;
				         e.printStackTrace();
				      }
				      return ret;
				   }

				



	public static void main(String[] args) throws SQLException {
 
	//ActionContext session = null;
		/*Map session = ActionContext.getContext().getSession(); 
		Object id=session.get("loginid");
		System.out.println("id from login=========="+id);
		*/
		EmployeeDetailsPersonal.getPersonalInfo();
		
	}

}