package com.ess.common.eseparation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/*import javax.servlet.http.HttpServlet;*/



//import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class E_separation_HR {

	public  List<String> getstatus_info() throws SQLException
	{
		 System.out.println(" getting initial info  in HR phase"); 
		List<String> getinfo=new LinkedList<String>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String hr_sql="select emp_id,CREATION_DATE,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD,SEPARATION_NOTE,RM_COMMENTS,SEQUENCE_NO from E_SEPARATION_EMP where  RM_APPROVE='Inprocess' and EMP_APPROVEL='Initiate' and ADMIN_APPROVE='Pending' and HR_APPROVE='Pending'";
		
		System.out.println(hr_sql);
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(hr_sql);
			while(rs.next())
			{
				String emp_id=rs.getString("emp_id");
				Date creation_date=rs.getDate("CREATION_DATE");
				Date rele_date=rs.getDate("RELEVING_DATE");
				String act_notice=rs.getString("ACTUAL_NOTICE_PERIOD");
				String given_notice=rs.getString("GIVEN_NOTICE_PERIOD");
				String emp_note=rs.getString("SEPARATION_NOTE");
				String rm_comments=rs.getString("RM_COMMENTS");
				String SEQUENCE_NO=rs.getString("SEQUENCE_NO");
				
			String data_hr=emp_id+"^"+creation_date+"^"+rele_date+"^"+act_notice+"^"+given_notice+"^"+emp_note+"^"+rm_comments +"^"+ SEQUENCE_NO;
			getinfo.add(data_hr);
			}
			
		}catch(Exception e)
		{
			System.out.println("Problem in getting data in hr module");
			e.printStackTrace();
			}finally
		{
			rs.close();
			st.close();
			con.close();
		}
		
		return getinfo;
	}
	
	public String save_hr_data(String emp_id,String np,String hr_comments,String status)
	{
		 System.out.println(" update the result  in HR phase"); 
		Connection con=null;
		Statement st=null;
		String hr_result="no";
		
		String hr_insert="Update E_SEPARATION_EMP set GIVEN_NOTICE_PERIOD='"+np+"',HR_APPROVE='"+status+"',HR_COMMENTS='"+hr_comments+"' where EMP_ID='"+emp_id+"'";
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			int rs=st.executeUpdate(hr_insert);
			if(rs>0)
			{
				hr_result="yes";
			}
			
		}catch(Exception e)
		{
			hr_result="no";
			System.out.println("Problem in inserting the hr e-separation details");
			e.printStackTrace();
		}
		
		return hr_result;
	}
	
	
	
	
	public  List<String> getempinfobyHR() throws SQLException
	{
		 System.out.println(" getempinfobyHR"); 
		List<String> getinfo=new LinkedList<String>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String empidreq = request.getParameter("empid").toUpperCase();
		
		String hr_sql="select emp_id,emp_fname,emp_lname,emp_rm,EMP_MAILID from ncss_emp_master_info where  emp_id='"+empidreq+"' and status='Active'";
		
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(hr_sql);
			while(rs.next())
			{
				String emp_id=rs.getString("emp_id");
				String emp_fname=rs.getString("emp_fname");
				String emp_lname=rs.getString("emp_lname");
				String emp_rm=rs.getString("emp_rm");
				String emp_mailid=rs.getString("EMP_MAILID");
				
				
			String data_hr=emp_id+"^"+emp_fname+"^"+emp_lname +"^"+ emp_rm +"^"+ emp_mailid;
			getinfo.add(data_hr);
			}
			
		}catch(Exception e)
		{
			System.out.println("Problem in getting data in hr module");
			e.printStackTrace();
			}finally
		{
			rs.close();
			st.close();
			con.close();
		}
		
		return getinfo;
	}
	
	
	
/* HR SEPARATION METHODS  */
	
	
	public  ArrayList<String> gettinge_requestDetails() throws SQLException {
		System.out.println("Home page information related to the e-separation emp class IN HR");
		ArrayList<String> homepage = new ArrayList<String>();
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String sequence_id = request.getParameter("SEQUENCE_NO");
		System.out.println("hrseparation.."+sequence_id);
	
	//String fetch_initail_eseparation = "select EMP_ID,REASION_RESIGN,RELEVING_DATE,CREATION_DATE,rm_name from E_SEPARATION_EMP  where SEQUENCE_NO='"+sequence_id+"'";		
	/*	String fetch_initail_eseparation ="select e.EMP_ID,EMP_FNAME,EMP_LNAME,EMP_DESIG,EMP_MAILID,EMP_CTC,EMP_JOINING_DATE from NCSS_EMP_MASTER_INFO e where EMP_ID in(select r.EMP_ID from E_SEPARATION_EMP r  where SEQUENCE_NO='"+sequence_id+"')";*/
	 
	  	String fetch_initail_eseparation ="select e.EMP_ID,EMP_FNAME,EMP_LNAME,EMP_DESIG,EMP_MAILID,EMP_CTC,EMP_JOINING_DATE,EMP_RM,PHONENUM1  from NCSS_EMP_MASTER_INFO e where EMP_ID in(select r.EMP_ID from E_SEPARATION_EMP r  where  SEQUENCE_NO='"+sequence_id+"')";
	 
		System.out.println("fetch_initail_eseparation.."+fetch_initail_eseparation);
		
		String empDetails_eseparation = null;
	
    Connection con=null;
    Statement st=null;
    ResultSet rs_ini=null;
    
    
    try {
		 con = GetConnection.getConnection();
		  st = con.createStatement();

		 rs_ini = st.executeQuery(fetch_initail_eseparation);
		 //String sequence_no=null;
		 //String emp_approve =null;
		 
		 String empid=null;
		 String EMP_FNAME=null;
		 String EMP_LNAME=null;
		 String EMP_DESIG=null;
		 String EMP_MAILID=null;
		 Date doj;
		 String EMP_CTC=null;
		 
		 String rm_name=null;
		 String phno=null;
		 
		 if(rs_ini.next())
		 {
		 empid=rs_ini.getString(1);
		 EMP_FNAME=rs_ini.getString("EMP_FNAME").toString();
		 EMP_LNAME=rs_ini.getString("EMP_LNAME").toString();
		 EMP_DESIG=rs_ini.getString("EMP_DESIG").toString();
		 EMP_MAILID=rs_ini.getString("EMP_MAILID");
		 doj=rs_ini.getDate("EMP_JOINING_DATE");
		 EMP_CTC=rs_ini.getString("EMP_CTC").toString();
		 
		 rm_name=rs_ini.getString("EMP_RM").toString();
		 phno=rs_ini.getString("PHONENUM1").toString();
		 
		empDetails_eseparation=empid+"^"+EMP_FNAME+"^"+EMP_LNAME+"^"+EMP_DESIG+"^"+EMP_MAILID+"^"+doj+"^"+EMP_CTC  +"^"+rm_name+"^"+phno;
		homepage.add(empDetails_eseparation);
		 }
		
	} catch (Exception e) {
		System.out.println("problem in Home page information related to the e-separation emp class IN HR");
		e.printStackTrace();
	}
	
	return homepage;
}
		
	
	
	
	
	public ArrayList<String> e_separation_hr() throws SQLException	{
		 System.out.println(" getting e_separation_manager info  in s new class IN HR"); 
		 
		ArrayList<String> e_sep_manager=new ArrayList<String>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		//String sequence_id = request.getParameter("emp_id");
	//	System.out.println("sequence_id..."+sequence_id);
		String SEQUENCE_NO=request.getParameter("SEQUENCE_NO");
		System.out.println("SEQUENCE_NO.."+SEQUENCE_NO);
		
		
		/*String man_Sql="select emp_id,SEQUENCE_NO,CREATION_DATE,REASION_RESIGN,DETAILED_REASON,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD from E_SEPARATION_EMP where emp_id='"+sequence_id+"'";*/
		
		String man_Sql="select emp_id,SEQUENCE_NO,CREATION_DATE,REASION_RESIGN,DETAILED_REASON,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD,ACTION_TYPE_RM,REASON_FOR_ACTION_RM,DETAILED_REASON_RM,PHY_REL_DATE_RM from E_SEPARATION_EMP where  SEQUENCE_NO='"+SEQUENCE_NO+"'";
		
		
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(man_Sql);
			String emp_id=null;
			String req_no=null;
			Date creation_date;
			String reason_action=null;
			String detailed_reason=null;
			Date rileaving_date;
			String actual_notice_period=null;
			String given_notice_period=null;
			
			String ACTION_TYPE_RM=null;
			String REASON_FOR_ACTION_RM=null;
			String DETAILED_REASON_RM=null;
			Date PHY_REL_DATE_RM;
			
			while(rs.next())
			{
				emp_id=rs.getString(1);
				req_no=rs.getString("SEQUENCE_NO");
				creation_date=rs.getDate("CREATION_DATE");
				reason_action=rs.getString("REASION_RESIGN");
				
				detailed_reason=rs.getString("DETAILED_REASON");
				rileaving_date=rs.getDate("RELEVING_DATE");
				actual_notice_period=rs.getString("ACTUAL_NOTICE_PERIOD");
				given_notice_period=rs.getString("GIVEN_NOTICE_PERIOD");
				
				ACTION_TYPE_RM=rs.getString("ACTION_TYPE_RM");
				REASON_FOR_ACTION_RM=rs.getString("REASON_FOR_ACTION_RM");
				DETAILED_REASON_RM=rs.getString("DETAILED_REASON_RM");
				PHY_REL_DATE_RM=rs.getDate("PHY_REL_DATE_RM");
				
				String man_data=emp_id+"^"+req_no+"^"+creation_date+"^"+reason_action+"^"+detailed_reason+"^"+rileaving_date+"^" +actual_notice_period+"^"
						+given_notice_period +"^"+ ACTION_TYPE_RM +"^"+  REASON_FOR_ACTION_RM  +"^"+ DETAILED_REASON_RM +"^"+ PHY_REL_DATE_RM;
				e_sep_manager.add(man_data);
			}
			
		
		}catch(Exception e){
			System.out.println("Problem in reults in e-Separation Mnager side");
			e.printStackTrace();
		}
		finally{
			rs.close();
			st.close();
			con.close();
		}
		return e_sep_manager;
	}
	
	
	
	public String saveManagerStatus(String emp_id,String action_type,String reason_action,String detailed_reason,Object phy_relev_date,Object r_date,String status_rm,String short_notes,String big_notes) throws SQLException
	{
		System.out.println(" update the status in Manager class newly");
		Connection con=null;
		Statement st=null;
		String res_status_report="";
		String status_update="update E_SEPARATION_EMP set ACTION_TYPE_RM='"+action_type+"', REASON_FOR_ACTION_RM='"+reason_action+"', DETAILED_REASON_RM='"+detailed_reason+"',  PHY_REL_DATE_RM='"+phy_relev_date+"',REL_DATE_RM='"+r_date+"',RM_APPROVE='"+status_rm+"',RM_SHOT_NOTE='"+short_notes+"',RM_COMMENTS='"+big_notes+"' where EMP_ID='"+emp_id+"'";
		System.out.println("the query in update is"+status_update);
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			int res=st.executeUpdate(status_update);
			if(res>0)
			{
				res_status_report="Yes";
			}
			
		}catch(Exception e)
		{
			res_status_report="No";
			System.out.println("Problem in update record after rm approves/reject");
			e.printStackTrace();
		}
		finally
		{
			st.close();
			con.close();
		}
		return res_status_report;
		
	}
	
	public String saveHrStatus(String emp_id,String sequence_no,Object r_date1,String recomended_status,String comments_approve,String note,String hr_withdraw_action) throws SQLException
	{
		System.out.println(" update the status in HR class");
		Connection con=null;
		Statement st=null;
		String res_status_report="";
		String HR_CLEARANCE_PROCCESS_STATUS="New";
		/*String status_update="update E_SEPARATION_EMP set RM_APPROVE='"+status+"', GIVEN_NOTICE_PERIOD='"+given_notice+"', RM_COMMENTS='"+comments_text+"',  RELEVING_DATE='"+r_date+"' where EMP_ID='"+emp_id+"' and SEQUENCE_NO='"+seq_id+"'";*/
		
		String status_update="update E_SEPARATION_EMP set HR_APPROVE='"+recomended_status+"', HR_COMMENTS='"+note+"', HR_NOTES='"+comments_approve+"',  HR_RELIEVING_DATE='"+r_date1+"',HR_WITHDRAW_ACTION='"+hr_withdraw_action+"',HR_CLEARANCE_PROCCESS_STATUS='"+HR_CLEARANCE_PROCCESS_STATUS+"' where EMP_ID='"+emp_id+"' and SEQUENCE_NO='"+sequence_no+"'";
		
	
	
		System.out.println("the query in update is"+status_update);
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			int res=st.executeUpdate(status_update);
			if(res>0)
			{
				res_status_report="Yes";
			}
			
		}catch(Exception e)
		{
			res_status_report="No";
			System.out.println("Problem in update record after rm approves/reject");
			e.printStackTrace();
		}
		finally
		{
			st.close();
			con.close();
		}
		return res_status_report;
		
	}
	
	
	
	/*
	 * Sending mail to ADmin and HR manager
	 * 
	 */
	
	/*static Properties properties = new Properties();
	   static
	   {
		   properties.put("mail.smtp.auth", "true");
		   properties.put("mail.smtp.starttls.enable", "true");
		   properties.put("mail.smtp.host", "smtp.office365.com");
		   properties.put("mail.smtp.port", "587");
		 
	   }
	   public void mail_from_manager(String emp_id,String given_notice,String comments_text) 
	   {
	      try
	      {
	    	  System.out.println(" sending mail  in Manager class");
	         Session session = Session.getDefaultInstance(properties,  
	            new javax.mail.Authenticator() {
	            protected PasswordAuthentication 
	            getPasswordAuthentication() {
	            return new 
	            PasswordAuthentication("essadmin@Clocksoft.info", "admin@123");
	            }});

	         Message message = new MimeMessage(session);
	         message.setFrom(new InternetAddress("essadmin@Clocksoft.info"));//sender information
	         //message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emp_mailid));
	         message.addRecipients(Message.RecipientType.CC, InternetAddress.parse("essadmin@Clocksoft.info"));//cc persons names
	         
	         
	         message.setSubject("e-Separation:Resignation In process from Reporting Manager");
	         
	         message.setText("Resignation from "+emp_id+",\n Giving Notice Period is "+given_notice+",\n Reporting Manager Comments is "+comments_text+" \n\nThanks & Regards"+"\nHR Team ");
	         Transport.send(message);
	      }
	      catch(Exception e)
	      {
	    	  System.out.println(" problem  in sending mail  in Manager class");
	         e.printStackTrace();
	      }
	      
	   }*/
	
	
	
	static Properties properties = new Properties();
	   static
	   {
		   properties.put("mail.smtp.auth", "true");
		   properties.put("mail.smtp.starttls.enable", "true");
		   properties.put("mail.smtp.host", "smtp.office365.com");
		   properties.put("mail.smtp.port", "587");
	   }
	/*public  void sending_empterminate_byhr_mail(String type_of_reg,Object reg_date,String reg_note,String reporting_man,String emp_id)*/
	
	public void sending_empterminate_byhr_mail(String empid, String  reason_action, String dreason, Object rel_date2, String actual_np, String given_np, Object pre_sep_date2, String emp_rm,String emp_mailid)
	
	{
		System.out.println("come in mail sending");
		/*Map<String,Object> session1 = ActionContext.getContext().getSession(); 
	      String id= (String) session1.get("loginid");*/
	      String id=emp_mailid;
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
	        /* message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(reporting_man));//keep rm mail id */
	           message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emp_mailid));//keep rm mail id
	         message.addRecipients(Message.RecipientType.CC, InternetAddress.parse("yogesh@clocksoft.info"));//cc persons names(put mgr here)
	         
	         
	         //System.out.println("to address:"+toAddress);
	         message.setSubject("Employee Termination");
	         
	         message.setText("Dear "+id1+",\n\n We are Terminating you. \n\n Reason Action : "+reason_action+",\n Detailed Reason :  "+dreason+",\n Relieving Date : "+rel_date2+", \n Given Notice Period : "+given_np+",\n Pre Separation Date : "+pre_sep_date2+",  \n\n\n\nThanks & Regards ,  \n HR Team ");
	         Transport.send(message);
	      }
	      catch(Exception e)
	      {
	         System.out.println("problem to send a mail");
	         e.printStackTrace();
	      }
	   
	   }
	
	
	
	/* ESEPARATION CLEARANCE  */
	
	public ArrayList<String> esepHrClearance_data() throws SQLException{
		
		 System.out.println(" getting esepHrClearance_data info  in s new class IN HR"); 
		 
			ArrayList<String> e_sep_clearance=new ArrayList<String>();
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			//  HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
			//String sequence_id = request.getParameter("emp_id");
		//	System.out.println("sequence_id..."+sequence_id);
			//String SEQUENCE_NO=request.getParameter("SEQUENCE_NO");
			//System.out.println("SEQUENCE_NO.."+SEQUENCE_NO);
			
			/*String man_Sql="select emp_id,SEQUENCE_NO,CREATION_DATE,REASION_RESIGN,DETAILED_REASON,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD,ACTION_TYPE_RM,REASON_FOR_ACTION_RM,DETAILED_REASON_RM,PHY_REL_DATE_RM from E_SEPARATION_EMP where  SEQUENCE_NO='"+SEQUENCE_NO+"'";*/
			
			String hr_sql="select emp_id,CREATION_DATE,RELEVING_DATE,REASION_RESIGN,DETAILED_REASON,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD,ACTION_TYPE_RM,REASON_FOR_ACTION_RM,DETAILED_REASON_RM,PHY_REL_DATE_RM,SEPARATION_NOTE,RM_COMMENTS,SEQUENCE_NO,RM_APPROVE,HR_APPROVE,ADMIN_APPROVE from E_SEPARATION_EMP where HR_APPROVE='Inprocess' and EMP_APPROVEL='Initiate' order by SEQUENCE_NO ";
			System.out.println(hr_sql);
			
			try{
				con=GetConnection.getConnection();
				st=con.createStatement();
				rs=st.executeQuery(hr_sql);
				String emp_id=null;
				String req_no=null;
				Date creation_date;
				String reason_action=null;
				String detailed_reason=null;
				Date rileaving_date;
				String actual_notice_period=null;
				String given_notice_period=null;
				
				String ACTION_TYPE_RM=null;
				String REASON_FOR_ACTION_RM=null;
				String DETAILED_REASON_RM=null;
				Date PHY_REL_DATE_RM;
				String rm_approve=null;
				String hr_approve=null;
				String admin_approve=null;
				
				while(rs.next())
				{
					System.out.println("inside while");
					emp_id=rs.getString(1);
					System.out.println("emp_id..."+emp_id);
					req_no=rs.getString("SEQUENCE_NO");
					System.out.println("req_no..."+req_no);
					creation_date=rs.getDate("CREATION_DATE");
					System.out.println("creation_date..."+creation_date);
					reason_action=rs.getString("REASION_RESIGN");
					System.out.println("reason_action..."+reason_action);
					
					detailed_reason=rs.getString("DETAILED_REASON");
					System.out.println("detailed_reason..."+detailed_reason);
					rileaving_date=rs.getDate("RELEVING_DATE");
					System.out.println("rileaving_date..."+rileaving_date);
					actual_notice_period=rs.getString("ACTUAL_NOTICE_PERIOD");
					System.out.println("actual_notice_period..."+actual_notice_period);
					given_notice_period=rs.getString("GIVEN_NOTICE_PERIOD");
					System.out.println("given_notice_period..."+given_notice_period);
					
					ACTION_TYPE_RM=rs.getString("ACTION_TYPE_RM");
					System.out.println("ACTION_TYPE_RM..."+ACTION_TYPE_RM);
					
					REASON_FOR_ACTION_RM=rs.getString("REASON_FOR_ACTION_RM");
					System.out.println("REASON_FOR_ACTION_RM..."+REASON_FOR_ACTION_RM);
					DETAILED_REASON_RM=rs.getString("DETAILED_REASON_RM");
					System.out.println("DETAILED_REASON_RM..."+DETAILED_REASON_RM);
					PHY_REL_DATE_RM=rs.getDate("PHY_REL_DATE_RM");
					System.out.println("PHY_REL_DATE_RM..."+PHY_REL_DATE_RM);
					
					rm_approve=rs.getString("RM_APPROVE");
					hr_approve=rs.getString("HR_APPROVE");
					admin_approve=rs.getString("ADMIN_APPROVE");
					
					String hr_data=emp_id+"^"+req_no+"^"+creation_date+"^"+reason_action+"^"+detailed_reason+"^"+rileaving_date+"^" +actual_notice_period+"^"
							+given_notice_period +"^"+ ACTION_TYPE_RM +"^"+  REASON_FOR_ACTION_RM  +"^"+ DETAILED_REASON_RM +"^"+ PHY_REL_DATE_RM +"^"+ rm_approve +"^"+ hr_approve +"^"+admin_approve;
					System.out.println("hr_data."+hr_data);
					e_sep_clearance.add(hr_data);
				}
				
			
			}catch(Exception e){
				System.out.println("Problem in reults in e-Separation Mnager side");
				e.printStackTrace();
			}
			finally{
				rs.close();
				st.close();
				con.close();
			}
			return e_sep_clearance;
		
	}
	
	
	/* 

	 public ArrayList<String> dqueclearance_initialdate() throws SQLException{
		LOGGER.warn("dueclearnce basic page");
	ArrayList<String> al_due_clearance=new ArrayList<String>();
	Connection con_due_clearance=null;
	Statement st_due_clearance=null;
	ResultSet rs_due_clerance=null;
	String due_clerance_hr_sql_query="Select EMP_ID,SEQUENCE_NO,CREATION_DATE,HR_RELIEVING_DATE,HR_APPROVE from E_SEPARATION_EMP where HR_APPROVE='Inprocess' and EMP_APPROVEL='Initiate' order by SEQUENCE_NO";
	String emp_Id=null;
	String sequence_no=null;
	Date creation_date;
	Date hr_relieving_date;
	String hr_status=null;
	try
	{
		con_due_clearance=GetConnection.getConnection();
		st_due_clearance=con_due_clearance.createStatement();
		rs_due_clerance=st_due_clearance.executeQuery(due_clerance_hr_sql_query);
		while(rs_due_clerance.next())
		{
			emp_Id=rs_due_clerance.getString("EMP_ID");
			sequence_no=rs_due_clerance.getString("SEQUENCE_NO");
			creation_date=rs_due_clerance.getDate("CREATION_DATE");
			hr_relieving_date=rs_due_clerance.getDate("HR_RELIEVING_DATE");
			
			hr_status=rs_due_clerance.getString("HR_APPROVE");
			String final_data=emp_Id+"^"+sequence_no+"^"+creation_date+"^"+hr_relieving_date+"^"+hr_status;
			al_due_clearance.add(final_data);
			System.out.println("final result is"+al_due_clearance);
			
		}
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in e-separation hr level");
		e.printStackTrace();
	}
	
	return al_due_clearance;
	
}

	 */
	

	
	
	/*
	 * esepartion hr overview on 9-11-2015 by amar
	 * 
	 */
	
	public ArrayList<String> hr_overview() throws SQLException	{
		 System.out.println(" getting e_separation_manager info  in s new class IN HR"); 
		 
		ArrayList<String> e_sep_manager=new ArrayList<String>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		//String sequence_id = request.getParameter("emp_id");
	//	System.out.println("sequence_id..."+sequence_id);
		String SEQUENCE_NO=request.getParameter("SEQUENCE_NO");
		System.out.println("SEQUENCE_NO.."+SEQUENCE_NO);
		
		
		/*String man_Sql="select emp_id,SEQUENCE_NO,CREATION_DATE,REASION_RESIGN,DETAILED_REASON,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD from E_SEPARATION_EMP where emp_id='"+sequence_id+"'";*/
		
		String man_Sql="select emp_id,SEQUENCE_NO,CREATION_DATE,REASION_RESIGN,DETAILED_REASON,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD,ACTION_TYPE_RM,REASON_FOR_ACTION_RM,DETAILED_REASON_RM,PHY_REL_DATE_RM,HR_RELIEVING_DATE from E_SEPARATION_EMP where  SEQUENCE_NO='"+SEQUENCE_NO+"'";
		
		
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(man_Sql);
			String emp_id=null;
			String req_no=null;
			Date creation_date;
			String reason_action=null;
			String detailed_reason=null;
			Date rileaving_date;
			String actual_notice_period=null;
			String given_notice_period=null;
			
			String ACTION_TYPE_RM=null;
			String REASON_FOR_ACTION_RM=null;
			String DETAILED_REASON_RM=null;
			Date PHY_REL_DATE_RM;
			Date HR_RELIEVING_DATE;
			
			while(rs.next())
			{
				emp_id=rs.getString(1);
				req_no=rs.getString("SEQUENCE_NO");
				creation_date=rs.getDate("CREATION_DATE");
				reason_action=rs.getString("REASION_RESIGN");
				
				detailed_reason=rs.getString("DETAILED_REASON");
				rileaving_date=rs.getDate("RELEVING_DATE");
				actual_notice_period=rs.getString("ACTUAL_NOTICE_PERIOD");
				given_notice_period=rs.getString("GIVEN_NOTICE_PERIOD");
				
				ACTION_TYPE_RM=rs.getString("ACTION_TYPE_RM");
				REASON_FOR_ACTION_RM=rs.getString("REASON_FOR_ACTION_RM");
				DETAILED_REASON_RM=rs.getString("DETAILED_REASON_RM");
				PHY_REL_DATE_RM=rs.getDate("PHY_REL_DATE_RM");
				HR_RELIEVING_DATE=rs.getDate("HR_RELIEVING_DATE");
				
				String man_data=emp_id+"^"+req_no+"^"+creation_date+"^"+reason_action+"^"+detailed_reason+"^"+rileaving_date+"^" +actual_notice_period+"^"
						+given_notice_period +"^"+ ACTION_TYPE_RM +"^"+  REASON_FOR_ACTION_RM  +"^"+ DETAILED_REASON_RM +"^"+ PHY_REL_DATE_RM+"^"+HR_RELIEVING_DATE;
				e_sep_manager.add(man_data);
			}
			
		
		}catch(Exception e){
			System.out.println("Problem in reults in e-Separation Mnager side");
			e.printStackTrace();
		}
		finally{
			rs.close();
			st.close();
			con.close();
		}
		return e_sep_manager;
	}
	
}
