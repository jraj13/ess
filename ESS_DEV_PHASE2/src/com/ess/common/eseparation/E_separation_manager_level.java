package com.ess.common.eseparation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class E_separation_manager_level {

	
	
	public ArrayList<String> e_separation_manager() throws SQLException	{
		 System.out.println(" getting initial info  in Manager class"); 
		ArrayList<String> e_sep_manager=new ArrayList<String>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		Map<String,Object> session = ActionContext.getContext().getSession();
		String man_login_id=(String)session.get("loginid");
		
		
		String man_Sql="select emp_id,SEQUENCE_NO,CREATION_DATE,REASION_RESIGN,DETAILED_REASON,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD from E_SEPARATION_EMP where EMP_APPROVEL='Initiate' and RM_APPROVE='Pending' and RM_NAME='"+man_login_id+"'";
		
		
		//String man_Sql="select r.emp_id,r.SEQUENCE_NO,r.emp_id,r.CREATION_DATE,r.REASION_RESIGN,r.DETAILED_REASON,r.RELEVING_DATE,r.ACTUAL_NOTICE_PERIOD,r.GIVEN_NOTICE_PERIOD from NCSS_EMP_MASTER_INFO e,E_SEPARATION_EMP r where e.emp_id=r.emp_id and r. RM_NAME='"+man_login_id+"' and r.RM_APPROVE='Pending'";
		
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
				
				String man_data=emp_id+"^"+req_no+"^"+creation_date+"^"+reason_action+"^"+detailed_reason+"^"+rileaving_date+"^"+actual_notice_period+"^"+given_notice_period;
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
	
	
	public String saveManagerStatus(String emp_id,String seq_id,String given_notice,String  comments_text,String status,Object r_date) throws SQLException
	{
		System.out.println(" update the status in Manager class");
		Connection con=null;
		Statement st=null;
		String res_status_report="";
		String status_update="update E_SEPARATION_EMP set RM_APPROVE='"+status+"', GIVEN_NOTICE_PERIOD='"+given_notice+"', RM_COMMENTS='"+comments_text+"',  RELEVING_DATE='"+r_date+"' where EMP_ID='"+emp_id+"' and SEQUENCE_NO='"+seq_id+"'";
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
	
	static Properties properties = new Properties();
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
	      
	   }
	
	
	
	   public String geTotla_counts() throws SQLException
		{
			System.out.println(" count emp id in e-separation manager class");  
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
		String admin_sql="select count(emp_id) as count_id from E_SEPARATION_EMP where  RM_APPROVE='Pending' and EMP_APPROVEL='Initiate' and HR_APPROVE='Pending' and ADMIN_APPROVE='Pending'";
			String tot_count=null;
			try{
				
				con=GetConnection.getConnection();
				st=con.createStatement();
				rs=st.executeQuery(admin_sql);
				if(rs.next())
				{
					tot_count=rs.getString("count_id");
					
				}
			}catch(Exception e)
			{
				System.out.println("problem in count in e-separation admin");
				e.printStackTrace();
			}
			finally
			{
				st.close();
				con.close();
			}
			return tot_count;
		}
	
	
	
	
	public List<String> withdrwa_bsicinfo() throws SQLException
	{
		List<String> list_withdraw_info=new LinkedList<String>();
		
		Connection con_withdraw=null;
		Statement st_withdraw=null;
		ResultSet rs_withdraw=null;
		Map<String,Object> session = ActionContext.getContext().getSession();
		String with_login_id=(String)session.get("loginid");
		
		
		String man_Sql_withdraw="select SEQUENCE_NO,REASION_RESIGN,DETAILED_REASON,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD,EMP_APPROVEL from E_SEPARATION_EMP where EMP_ID='"+with_login_id+"'";
		
		
		
		try{
			con_withdraw=GetConnection.getConnection();
			st_withdraw=con_withdraw.createStatement();
			rs_withdraw=st_withdraw.executeQuery(man_Sql_withdraw);
			String emp_id=null;
			String req_no=null;
			Date creation_date;
			String reason_action=null;
			String detailed_reason=null;
			Date rileaving_date;
			String actual_notice_period=null;
			String given_notice_period=null;
			while(rs_withdraw.next())
			{
				emp_id=rs_withdraw.getString(1);
				req_no=rs_withdraw.getString("SEQUENCE_NO");
				creation_date=rs_withdraw.getDate("CREATION_DATE");
				reason_action=rs_withdraw.getString("REASION_RESIGN");
				
				detailed_reason=rs_withdraw.getString("DETAILED_REASON");
				rileaving_date=rs_withdraw.getDate("RELEVING_DATE");
				actual_notice_period=rs_withdraw.getString("ACTUAL_NOTICE_PERIOD");
				
				given_notice_period=rs_withdraw.getString("GIVEN_NOTICE_PERIOD");
				
				String man_data=emp_id+"^"+req_no+"^"+creation_date+"^"+reason_action+"^"+detailed_reason+"^"+rileaving_date+"^"+actual_notice_period+"^"+given_notice_period;
				list_withdraw_info.add(man_data);
			}
			
		
		}catch(Exception e){
			System.out.println("Problem in reults in e-Separation Mnager side");
			e.printStackTrace();
		}
		finally{
			rs_withdraw.close();
			st_withdraw.close();
			con_withdraw.close();
		}
		return list_withdraw_info;
	}
	
	
	
	public static void main(String[] args) {

	}

}
