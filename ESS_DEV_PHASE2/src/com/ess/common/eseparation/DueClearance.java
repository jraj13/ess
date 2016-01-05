package com.ess.common.eseparation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.text.WordUtils;
import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class DueClearance {
	
	/**
	 * 
	 */

	public String amar_method()
	{
		System.out.println("this is struts url patteren for new ly created");
		return "success";
	}
	
	 public ArrayList<String> dqueclearance_DeptDetails() throws SQLException{
		 System.out.println("come in dqueclearance_DeptDetails");
		ArrayList<String> al_clearance=new ArrayList<String>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String due_clerance_hr_sql_query="select emp_fname,emp_lname,EMP_MAILID from NCSS_EMP_MASTER_INFO where EMP_DESIG='IT Support Team' and ROLE_ID=5";
		System.out.println(due_clerance_hr_sql_query);
		String emp_fname=null;
		String emp_lname=null;
		String EMP_MAILID=null;
		try
		{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(due_clerance_hr_sql_query);
			while(rs.next())
			{
				emp_fname=rs.getString("emp_fname");
				emp_lname=rs.getString("emp_lname");
				EMP_MAILID=rs.getString("EMP_MAILID");
				
				String final_data=emp_fname+"^"+emp_lname+"^"+EMP_MAILID;
				al_clearance.add(final_data);
				
				System.out.println("final result is"+al_clearance);
			}
			
		}catch(Exception e)
		{
			System.out.println("Problem in geeting data in e-separation hr level");
			e.printStackTrace();
		}
		return al_clearance;
		
	}

	 
	 
	 public ArrayList<String> dqueclearance_personalDetails() throws SQLException{
		 System.out.println("dqueclearance_personalDetails() ");
		
		 
		 ArrayList<String> data_clearance=new ArrayList<String>();
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			
			HttpServletRequest request = (HttpServletRequest) ActionContext
					.getContext().get(ServletActionContext.HTTP_REQUEST);
			
			String sequence_id=request.getParameter("sequence_id").trim();
			
			String due_clerance_hr_sql_query="select EMP_ID from E_SEPARATION_EMP where SEQUENCE_NO='"+sequence_id+"'";
			
			/*String due_clerance_hr_sql_query="select emp_fname,emp_lname,EMP_MAILID from NCSS_EMP_MASTER_INFO where EMP_DESIG='IT Support Team' and ROLE_ID=5";*/
			System.out.println(due_clerance_hr_sql_query);
			String emp_id=null;
		
			try
			{
				con=GetConnection.getConnection();
				st=con.createStatement();
				rs=st.executeQuery(due_clerance_hr_sql_query);
				while(rs.next())
				{
					emp_id=rs.getString("EMP_ID");
					
					String final_data=emp_id;
					data_clearance.add(final_data);
					
					System.out.println("final result is"+data_clearance);
				}
				
			}catch(Exception e)
			{
				System.out.println("Problem in geeting data in e-separation hr level");
				e.printStackTrace();
			}
			return data_clearance;
		 
	 }
	 
	 
	 
	 public ArrayList<String> dqueclearance_ItSupportDetails() throws SQLException{
		 System.out.println("come in dqueclearance_DeptDetails");
		ArrayList<String> al_clearance=new ArrayList<String>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String due_clerance_hr_sql_query="select RESIGNATION_NO,EMP_ID,EMP_HEAD_ROLENAME,STATUS from EMP_DUE_CLEARANCE where EMP_HEAD_ROLENAME='IT Support Team' and STATUS='Inprocess' and IT_SUPPORT_COMMENT is NULL";
		System.out.println(due_clerance_hr_sql_query);
		
		String resign_no=null;
		String emp_id=null;
		String emp_head_rolename=null;
		String status=null;
		
		try
		{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(due_clerance_hr_sql_query);
			while(rs.next())
			{
				resign_no=rs.getString("RESIGNATION_NO");
				emp_id=rs.getString("emp_id");
				emp_head_rolename=rs.getString("EMP_HEAD_ROLENAME");
				status=rs.getString("STATUS");
				
				String final_data=resign_no+"^"+ emp_id +"^"+ emp_head_rolename+"^"+status;
				al_clearance.add(final_data);
				
				System.out.println("final result is"+al_clearance);
			}
			
		}catch(Exception e)
		{
			System.out.println("Problem in geeting data in e-separation hr level");
			e.printStackTrace();
		}
		return al_clearance;
		
	}

	 
	 
	 
	 static Properties properties = new Properties();
	   static
	   {
		   properties.put("mail.smtp.auth", "true");
		   properties.put("mail.smtp.starttls.enable", "true");
		   properties.put("mail.smtp.host", "smtp.office365.com");
		   properties.put("mail.smtp.port", "587");
	   }
	/*public  void sending_empterminate_byhr_mail(String type_of_reg,Object reg_date,String reg_note,String reporting_man,String emp_id)*/
	
	public void sending_itsupportteam_mail(String  mailid1, String resign_id, String emp_id)
	
	{
		System.out.println("come in mail sending");
		/*Map<String,Object> session1 = ActionContext.getContext().getSession(); 
	      String id= (String) session1.get("loginid");*/
	      String id=mailid1;
	      String names[]=id.split("\\@");
	      String id1=names[0];
		try
	      {
	    	  System.out.println("in to send a mail program");
	         Session session = Session.getDefaultInstance(properties,  
	            new javax.mail.Authenticator() {
	            protected PasswordAuthentication 
	            getPasswordAuthentication() {
	            return new 
	            PasswordAuthentication("essadmin@Clocksoft.info", "admin@123");
	            }});
	         Message message = new MimeMessage(session);
	         message.setFrom(new InternetAddress("essadmin@Clocksoft.info"));//sender information
	          // message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailid1));//keep rm mail id
	         message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("amaranath@clocksoft.info"));
	         message.addRecipients(Message.RecipientType.CC, InternetAddress.parse("yogesh@clocksoft.info"));//cc persons names(put mgr here)
	         
	         
	         //System.out.println("to address:"+toAddress);
	         message.setSubject("Employee Due Clearance");
	         
	         message.setText("Hi "+id1+",\n\n Please check Due Clearance for given below employee. \n\n Employee Id : "+emp_id+",\n Resignation_No :  "+resign_id+",  \n\n\n\nThanks & Regards ,  \n HR Team ");
	         Transport.send(message);
	      }
	      catch(Exception e)
	      {
	         System.out.println("problem to send a mail");
	         e.printStackTrace();
	      }
	   
	   }
	
	/*  for fetching department detail for due clearance */
	
	public ArrayList<String> itSupportTeam() throws SQLException{
	ArrayList<String> due_clearance_administartion=new ArrayList<String>();
	Connection con_due_clearance_administartion=null;
	Statement st_due_clearance_administartion=null;
	ResultSet rs_due_clerance_administartion=null;
	String due_clerance_administartion_sql_query="Select EMP_MAILID from NCSS_EMP_MASTER_INFO where EMP_DESIG='IT SUPPORT TEAM'";
	String emp_mail_id=null;
	try
	{
		con_due_clearance_administartion=GetConnection.getConnection();
		st_due_clearance_administartion=con_due_clearance_administartion.createStatement();
		rs_due_clerance_administartion=st_due_clearance_administartion.executeQuery(due_clerance_administartion_sql_query);
		while(rs_due_clerance_administartion.next())
		{
			emp_mail_id=rs_due_clerance_administartion.getString("EMP_MAILID");
			
			String final_data_admin=emp_mail_id;
			due_clearance_administartion.add(final_data_admin);
			System.out.println("final result is"+due_clearance_administartion);
			
		}
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in e-separation administarion level");
		e.printStackTrace();
	}
	
	return due_clearance_administartion;
	
}
	
	
	
	public ArrayList<String> itAsset() throws SQLException{
	ArrayList<String> due_clearance_itAsset=new ArrayList<String>();
	Connection con_due_clearance_medical=null;
	Statement st_due_clearance_medical=null;
	ResultSet rs_due_clerance_medical=null;
	String due_clerance_medical_sql_query="Select EMP_MAILID from NCSS_EMP_MASTER_INFO where EMP_DESIG='IT ASSET'";
	String emp_mail_id=null;
	try
	{
		con_due_clearance_medical=GetConnection.getConnection();
		st_due_clearance_medical=con_due_clearance_medical.createStatement();
		rs_due_clerance_medical=st_due_clearance_medical.executeQuery(due_clerance_medical_sql_query);
		while(rs_due_clerance_medical.next())
		{
			emp_mail_id=rs_due_clerance_medical.getString("EMP_MAILID");
			String final_data_admin=emp_mail_id;
			due_clearance_itAsset.add(final_data_admin);
			System.out.println("final result is"+due_clearance_itAsset);
			
		}
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in e-separation medical  level");
		e.printStackTrace();
	}
	
	return due_clearance_itAsset;
	
}
	
	
	
	public ArrayList<String> Administration() throws SQLException{
	ArrayList<String> due_clearance_administartion=new ArrayList<String>();
	Connection con_due_clearance_administartion=null;
	Statement st_due_clearance_administartion=null;
	ResultSet rs_due_clerance_administartion=null;
	String due_clerance_administartion_sql_query="Select EMP_MAILID from NCSS_EMP_MASTER_INFO where EMP_DESIG='ADMINISTRATION'";
	String emp_mail_id=null;
	try
	{
		con_due_clearance_administartion=GetConnection.getConnection();
		st_due_clearance_administartion=con_due_clearance_administartion.createStatement();
		rs_due_clerance_administartion=st_due_clearance_administartion.executeQuery(due_clerance_administartion_sql_query);
		while(rs_due_clerance_administartion.next())
		{
			emp_mail_id=rs_due_clerance_administartion.getString("EMP_MAILID");
			
			String final_data_admin=emp_mail_id;
			due_clearance_administartion.add(final_data_admin);
			System.out.println("final result is"+due_clearance_administartion);
			
		}
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in e-separation administarion level");
		e.printStackTrace();
	}
	
	return due_clearance_administartion;
	
}
	
	
	
	public ArrayList<String> medical_insurance_team() throws SQLException{
	ArrayList<String> due_clearance_medical=new ArrayList<String>();
	Connection con_due_clearance_medical=null;
	Statement st_due_clearance_medical=null;
	ResultSet rs_due_clerance_medical=null;
	String due_clerance_medical_sql_query="Select EMP_MAILID from NCSS_EMP_MASTER_INFO where EMP_DESIG='MEDICAL INSURANCE TEAM'";
	String emp_mail_id=null;
	try
	{
		con_due_clearance_medical=GetConnection.getConnection();
		st_due_clearance_medical=con_due_clearance_medical.createStatement();
		rs_due_clerance_medical=st_due_clearance_medical.executeQuery(due_clerance_medical_sql_query);
		while(rs_due_clerance_medical.next())
		{
			emp_mail_id=rs_due_clerance_medical.getString("EMP_MAILID");
			String final_data_admin=emp_mail_id;
			due_clearance_medical.add(final_data_admin);
			System.out.println("final result is"+due_clearance_medical);
			
		}
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in e-separation medical  level");
		e.printStackTrace();
	}
	
	return due_clearance_medical;
	
}
	
	
	public ArrayList<String> banking_team() throws SQLException{
	ArrayList<String> banking=new ArrayList<String>();
	Connection con_bank=null;
	Statement st_bank=null;
	ResultSet rs_bank=null;
	String bank_sql_query="Select EMP_MAILID from NCSS_EMP_MASTER_INFO where EMP_DESIG='BANKING'";
	String emp_mail_id=null;
	try
	{
		con_bank=GetConnection.getConnection();
		st_bank=con_bank.createStatement();
		rs_bank=st_bank.executeQuery(bank_sql_query);
		while(rs_bank.next())
		{
			emp_mail_id=rs_bank.getString("EMP_MAILID");
			String final_data_admin=emp_mail_id;
			banking.add(final_data_admin);
			System.out.println("final result is"+banking);
			
		}
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in e-separation banking_team level");
		e.printStackTrace();
	}
	finally{
		rs_bank.close();
		st_bank.close();
		con_bank.close();
	}
	
	return banking;
	
}
	
	public ArrayList<String> id_card() throws SQLException{
	ArrayList<String> id_card_data=new ArrayList<String>();
	Connection con_idcard=null;
	Statement idcard_bank=null;
	ResultSet rs_idcard=null;
	String idcard_sql_query="Select EMP_MAILID from NCSS_EMP_MASTER_INFO where EMP_DESIG='ID CARD CELL'";
	String emp_mail_id=null;
	try
	{
		con_idcard=GetConnection.getConnection();
		idcard_bank=con_idcard.createStatement();
		rs_idcard=idcard_bank.executeQuery(idcard_sql_query);
		while(rs_idcard.next())
		{
			emp_mail_id=rs_idcard.getString("EMP_MAILID");
			String final_data_admin=emp_mail_id;
			id_card_data.add(final_data_admin);
			System.out.println("final result is"+id_card_data);
			
		}
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in e-separation id card cell level");
		e.printStackTrace();
	}
	finally{
		rs_idcard.close();
		idcard_bank.close();
		con_idcard.close();
	}
	
	return id_card_data;
	
}
	
	
	public ArrayList<String> payment_Team() throws SQLException{
		//LOGGER.warn("dueclearnce basic page under payment team");
	ArrayList<String> payment_data=new ArrayList<String>();
	Connection con_payment=null;
	Statement st_payment=null;
	ResultSet rs_payment=null;
	String payment_sql_query="Select EMP_MAILID from NCSS_EMP_MASTER_INFO where EMP_DESIG='PAYMENT TEAM'";
	String emp_mail_id=null;
	try
	{
		con_payment=GetConnection.getConnection();
		st_payment=con_payment.createStatement();
		rs_payment=st_payment.executeQuery(payment_sql_query);
		while(rs_payment.next())
		{
			emp_mail_id=rs_payment.getString("EMP_MAILID");
			String final_data_admin=emp_mail_id;
			payment_data.add(final_data_admin);
			System.out.println("final result is"+payment_data);
			
		}
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in e-separation payment level");
		e.printStackTrace();
	}
	finally{
		rs_payment.close();
		st_payment.close();
		con_payment.close();
	}
	
	return payment_data;
	
}
	
	public ArrayList<String> payroll_Team() throws SQLException{
		//LOGGER.warn("dueclearnce basic page under payroll team");
	ArrayList<String> payroll_data=new ArrayList<String>();
	Connection con_payroll=null;
	Statement st_payroll=null;
	ResultSet rs_payroll=null;
	String payroll_sql_query="Select EMP_MAILID from NCSS_EMP_MASTER_INFO where EMP_DESIG='PAYROLL TEAM'";
	String emp_mail_id=null;
	try
	{
		con_payroll=GetConnection.getConnection();
		st_payroll=con_payroll.createStatement();
		rs_payroll=st_payroll.executeQuery(payroll_sql_query);
		while(rs_payroll.next())
		{
			emp_mail_id=rs_payroll.getString("EMP_MAILID");
			String final_data_admin=emp_mail_id;
			payroll_data.add(final_data_admin);
			System.out.println("final result is"+payroll_data);
			
		}
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in e-separation payroll level");
		e.printStackTrace();
	}
	finally{
		rs_payroll.close();
		st_payroll.close();
		con_payroll.close();
	}
	
	return payroll_data;
	
}
	
	public ArrayList<String> hr() throws SQLException{
		//LOGGER.warn("dueclearnce basic page under hr team");
	ArrayList<String> hr_data=new ArrayList<String>();
	Connection con_hr=null;
	Statement st_hr=null;
	ResultSet rs_hr=null;
	String hr_sql_query="Select EMP_MAILID from NCSS_EMP_MASTER_INFO where EMP_DESIG='HR'";
	String emp_mail_id=null;
	try
	{
		con_hr=GetConnection.getConnection();
		st_hr=con_hr.createStatement();
		rs_hr=st_hr.executeQuery(hr_sql_query);
		while(rs_hr.next())
		{
			emp_mail_id=rs_hr.getString("EMP_MAILID");
			String final_data_admin=emp_mail_id;
			hr_data.add(final_data_admin);
			System.out.println("final result is"+hr_data);
			
		}
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in e-separation hr level");
		e.printStackTrace();
	}
	finally{
		rs_hr.close();
		st_hr.close();
		con_hr.close();
	}
	
	return hr_data;
	
}
	
	
public ArrayList<String> employee() throws SQLException{
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String sequence_num=request.getParameter("sequence_id");
		//LOGGER.warn("dueclearnce basic page under employee team");
	ArrayList<String> employee_data=new ArrayList<String>();
	Connection con_emp=null;
	Statement st_emp=null;
	ResultSet rs_emp=null;
	String emp_sql_query="Select EMP_MAILID from NCSS_EMP_MASTER_INFO where EMP_ID in(select EMP_ID from E_SEPARATION_EMP where SEQUENCE_NO='"+sequence_num+"')";
	String emp_mail_id=null;
	try
	{
		con_emp=GetConnection.getConnection();
		st_emp=con_emp.createStatement();
		rs_emp=st_emp.executeQuery(emp_sql_query);
		while(rs_emp.next())
		{
			emp_mail_id=rs_emp.getString("EMP_MAILID");
			String final_data_admin=emp_mail_id;
			employee_data.add(final_data_admin);
			System.out.println("final result is"+employee_data);
			
		}
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in e-separation employee level");
		e.printStackTrace();
	}
	finally{
		rs_emp.close();
		st_emp.close();
		con_emp.close();
	}
	
	return employee_data;
	
}
	
	
//fetching the department


public static String dept_desig() throws SQLException{

Connection con_desig=null;
Statement st_desig=null;
ResultSet rs_design=null;
Map<String,Object> session = ActionContext.getContext().getSession();
String id = (String) session.get("empid");

String hr_sql_query="Select EMP_DESIG from NCSS_EMP_MASTER_INFO where EMP_ID='"+id+"'";
String emp_desig=null;
try
{
	con_desig=GetConnection.getConnection();
	st_desig=con_desig.createStatement();
	rs_design=st_desig.executeQuery(hr_sql_query);
	while(rs_design.next())
	{
		emp_desig=rs_design.getString("EMP_DESIG");
	}
	
}catch(Exception e)
{
	System.out.println("Problem in geeting data in e-separation hr level");
	e.printStackTrace();
}
finally{
	rs_design.close();
	st_desig.close();
	con_desig.close();
}
System.out.println("final result is"+emp_desig);
return emp_desig;

}

	

//fetching the details based on the department

public static ArrayList<String> department_based_department() throws SQLException{
ArrayList<String> department_data=new ArrayList<String>();
Connection con_dept=null;
Statement st_dept=null;
ResultSet rs_dept=null;

Map<String,Object> session = ActionContext.getContext().getSession();
String emp_mail_id = (String) session.get("loginid");

HttpServletRequest request = (HttpServletRequest) ActionContext
.getContext().get(ServletActionContext.HTTP_REQUEST);

String sequence_id=request.getParameter("sequence_id").trim();

String dept=DueClearance.dept_desig();


//String hr_sql_query="select t_list.SR_NO,t_list.TASK_NAME from TASK_LIST t_list,TASK_ASSIGN_SEPARATION t_assign where t_list.DEPARTMENT='IT SUPPORT TEAM' and t_assign.MANAGER_MAIL_ID='BALAJI.KONERU@CLOCKSOFT.INFO' and t_assign.STATUS_HR='Initiate' and t_assign.EMP_SEQ_NO='105'";

String hr_sql_query="select t_list.SR_NO,t_list.TASK_NAME from TASK_LIST t_list,TASK_ASSIGN_SEPARATION t_assign where t_list.DEPARTMENT='"+dept+"' and t_assign.MANAGER_MAIL_ID='"+emp_mail_id+"' and t_assign.STATUS_HR='Initiate' and t_assign.EMP_SEQ_NO='"+sequence_id+"'";

String task_name=null;
String task_number=null;
try
{
	con_dept=GetConnection.getConnection();
	st_dept=con_dept.createStatement();
	rs_dept=st_dept.executeQuery(hr_sql_query);
	while(rs_dept.next())
	{
		task_number=rs_dept.getString("SR_NO");
		task_name=rs_dept.getString("TASK_NAME");
		
		String total_data=task_number+"^"+task_name;
		
		department_data.add(total_data);
	}
	
}catch(Exception e)
{
	System.out.println("Problem in geeting data in e-separation hr level");
	e.printStackTrace();
}
finally{
	rs_dept.close();
	st_dept.close();
	con_dept.close();
}
System.out.println("final result is"+department_data);
return department_data;

}
/*
 * 
 * checking status of employee with out side of the program
 * 
 */
public  ArrayList<String> getDueClearanceStatus(String sequence_no) throws SQLException
{
	ArrayList<String> getStatus=new ArrayList<String>();
	
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
	String getstatusSQL="select a.EMP_SEQ_NO,a.TASK_LIST as  Department,a.MANAGER_MAIL_ID,b.TASK_TYPE, b.REMARKS,b.AMOUNT,b.TASK_STATUS,b.TASK_CLEARANCE_DATE from TASK_ASSIGN_SEPARATION a,TASK_CLEARANCE_STATUS b where a.EMP_SEQ_NO='"+sequence_no+"'  and a.MANAGER_MAIL_ID=b.MANAGER_MAIL_ID ";
	
	
	try{
		con=GetConnection.getConnection();
		st=con.createStatement();
		rs=st.executeQuery(getstatusSQL);
			System.out.println(getstatusSQL);
				
				while(rs.next()){
					
					String EMP_SEQ_NO=rs.getString(1);
					String TASK_LIST=WordUtils.capitalizeFully(rs.getString(2));
					String MANAGER_MAIL_ID=WordUtils.capitalizeFully(rs.getString(3));
					String TASK_TYPE=rs.getString(4);
					String REMARKS=rs.getString(5);
					String AMOUNT=rs.getString(6);
					String TASK_STATUS=rs.getString(7);
					Date TASK_CLEARANCE_DATE=rs.getDate(8);
					String getdata=EMP_SEQ_NO +"^"+TASK_LIST  +"^"+  MANAGER_MAIL_ID +"^"+  TASK_TYPE +"^"+ REMARKS +"^"+  AMOUNT +"^"+   TASK_STATUS+"^"+TASK_CLEARANCE_DATE;
					
					getStatus.add(getdata);
				}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		
	}
	return getStatus;
}

/* check status for due clearance in fnf settlement by hr */

public  ArrayList<String> getDueClearanceStatusfor_fnf(String sequence_no) throws SQLException
{
	System.out.println("getDueClearanceStatusfor_fnf");
	ArrayList<String> getStatus=new ArrayList<String>();
	
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
	/*String getstatusSQL="select a.EMP_SEQ_NO,a.TASK_LIST as  Department,a.MANAGER_MAIL_ID,b.TASK_TYPE, b.REMARKS,b.AMOUNT,b.TASK_STATUS,b.TASK_CLEARANCE_DATE from TASK_ASSIGN_SEPARATION a,TASK_CLEARANCE_STATUS b where a.EMP_SEQ_NO='"+sequence_no+"'  and a.MANAGER_MAIL_ID=b.MANAGER_MAIL_ID ";*/
	String getstatusSQL="select * from TASK_ASSIGN_SEPARATION where emp_seq_no='"+sequence_no+"' and status_hr in('Initiate','Inprocess','Rejected')";
	System.out.println(getstatusSQL);
	try{
		con=GetConnection.getConnection();
		st=con.createStatement();
		rs=st.executeQuery(getstatusSQL);
				
				while(rs.next()){
					
					String EMP_SEQ_NO=rs.getString("EMP_SEQ_NO");
					String TASK_LIST=WordUtils.capitalizeFully(rs.getString("TASK_LIST"));
					String MANAGER_MAIL_ID=WordUtils.capitalizeFully(rs.getString("MANAGER_MAIL_ID"));
					Date TASK_ASSIGN_DATE=rs.getDate("TASK_ASSIGN_DATE");
					String TASK_STATUS=rs.getString("STATUS_HR");
					String TASK_OWNER_REMARKS=rs.getString("TASK_OWNER_REMARKS");
					System.out.println("TASK_OWNER_REMARKS"+TASK_OWNER_REMARKS);
					
					String getdata=EMP_SEQ_NO +"^"+TASK_LIST  +"^"+  MANAGER_MAIL_ID +"^"+  TASK_ASSIGN_DATE +"^"+ TASK_STATUS +"^"+TASK_OWNER_REMARKS ;
					
					getStatus.add(getdata);
				}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		
	}
	return getStatus;
}



/* check status for due clearance in fnf settlement by hr */

public  ArrayList<String> getDueClearanceStatusfor_fnf_PDF(String sequence_no) throws SQLException
{
	System.out.println("getDueClearanceStatusfor_fnf");
	ArrayList<String> getStatus=new ArrayList<String>();
	
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
	/* String getstatusSQL="select a.EMP_SEQ_NO,a.EMP_EMP_ID,a.MANAGER_MAIL_ID,a.TASK_ASSIGN_DATE,a.STATUS_HR as Status,a.TASK_OWNER_REMARKS,A.TASK_LIST as Department,
				b.TASK_TYPE as Description,b.TASK_STATUS,b.AMOUNT
 				from TASK_ASSIGN_SEPARATION a,
				TASK_CLEARANCE_STATUS b 
			where a.emp_seq_no='106' and a.MANAGER_MAIL_ID=b.MANAGER_MAIL_ID and a.status_hr in('Initiate','Inprocess','Rejected')";*/
	//String getstatusSQL="select EMP_SEQ_NO from TASK_ASSIGN_SEPARATION where emp_seq_no='"+sequence_no+"' and status_hr in('Initiate','Inprocess','Rejected')";
	
		String getstatusSQL = "select a.EMP_SEQ_NO,a.MANAGER_MAIL_ID,a.TASK_ASSIGN_DATE,a.STATUS_HR as Status,a.TASK_OWNER_REMARKS,A.TASK_LIST as Department,b.TASK_TYPE as Description,b.TASK_STATUS,b.AMOUNT from TASK_ASSIGN_SEPARATION a,TASK_CLEARANCE_STATUS b where a.emp_seq_no='"+sequence_no+"' and a.MANAGER_MAIL_ID=b.MANAGER_MAIL_ID and a.status_hr in('Initiate','Inprocess','Rejected')";
	
	
	System.out.println("getDueClearanceStatusfor_fnf.."+getstatusSQL);
	try{
		con=GetConnection.getConnection();
		st=con.createStatement();
		rs=st.executeQuery(getstatusSQL);
				
				while(rs.next()){
					
					String EMP_SEQ_NO=rs.getString(1);
					String MANAGER_MAIL_ID=WordUtils.capitalizeFully(rs.getString(2));
					Date TASK_ASSIGN_DATE=rs.getDate(3);
					String STATUS=rs.getString(4);
					String TASK_OWNER_REMARKS=rs.getString(5);
					System.out.println("TASK_OWNER_REMARKS"+TASK_OWNER_REMARKS);
					String TASK_LIST=WordUtils.capitalizeFully(rs.getString(6));
					String TASK_TYPE=WordUtils.capitalizeFully(rs.getString(7));
					String TASK_STATUS=rs.getString(8);
					float AMOUNT=rs.getFloat(9);
					
					String getdata=EMP_SEQ_NO +"^"+MANAGER_MAIL_ID  +"^"+  TASK_ASSIGN_DATE +"^"+  STATUS +"^"+ TASK_OWNER_REMARKS +"^"+TASK_LIST +"^"+  TASK_TYPE +"^"+  TASK_STATUS  +"^"+ AMOUNT;
					
					getStatus.add(getdata);
				}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		
	}
	return getStatus;
}




/* check status of due clearance by Employee */

public static ArrayList<String> getDueClearanceStatusforEmp() throws SQLException
{
	ArrayList<String> getStatus=new ArrayList<String>();
	
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
	Map<String,Object> session = ActionContext.getContext().getSession();
	String emp_id = (String) session.get("empid");
	System.out.println();
	
	/*String getstatusSQL="select a.EMP_SEQ_NO,a.TASK_LIST as  Department,a.MANAGER_MAIL_ID,b.TASK_TYPE, b.REMARKS,b.AMOUNT,b.TASK_STATUS from TASK_ASSIGN_SEPARATION a,TASK_CLEARANCE_STATUS b where a.EMP_SEQ_NO=106 and a.TASK_LIST='PAYROLL TEAM' and a.MANAGER_MAIL_ID=b.MANAGER_MAIL_ID ";*/
	String getstatusSQL="select TASK_LIST as  Department,MANAGER_MAIL_ID,STATUS_HR from TASK_ASSIGN_SEPARATION where EMP_EMP_ID='"+emp_id+"' ";
	
	try{
		con=GetConnection.getConnection();
		st=con.createStatement();
		rs=st.executeQuery(getstatusSQL);
			System.out.println(getstatusSQL);
				
				while(rs.next()){
					
//					String EMP_SEQ_NO=rs.getString(1);
					String TASK_LIST=WordUtils.capitalizeFully(rs.getString(1));
					String MANAGER_MAIL_ID=WordUtils.capitalizeFully(rs.getString(2));
//					String TASK_TYPE=rs.getString(4);
//					String REMARKS=rs.getString(5);
//					String AMOUNT=rs.getString(6);
					String STATUS_HR=rs.getString(3);
					
					/*String getdata=EMP_SEQ_NO +"^"+TASK_LIST  +"^"+  MANAGER_MAIL_ID +"^"+  TASK_TYPE +"^"+ REMARKS +"^"+  AMOUNT +"^"+   TASK_STATUS;*/
					String getdata=TASK_LIST  +"^"+  MANAGER_MAIL_ID +"^"+  STATUS_HR;
					getStatus.add(getdata);
				}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		
	}
	return getStatus;
}

	 public static void main(String[] args) throws SQLException {
		ArrayList<String> aa=DueClearance.department_based_department();
		System.out.println(aa);
	}





}
