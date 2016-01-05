
package com.ess.common.action;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.ess.common.action.RegularizationMailsend;

public class RegularizationAction  {

	/*
	 * Geting Reporting Manager
	 * 
	 */
	public String getting_reportingManager()
	{
		Map<String,Object> session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
			
		String Reg_ini_info="Select EMP_RM from NCSS_EMP_MASTER_INFO where EMP_ID=?";
		String reportingManger="";
		Connection con_rm=null;
		PreparedStatement ps_rm=null;
		ResultSet rs=null;
		try{
			con_rm=GetConnection.getConnection();
			ps_rm=con_rm.prepareStatement(Reg_ini_info);
			ps_rm.setString(1, id);
			rs=ps_rm.executeQuery();
			if(rs.next())
			{
				reportingManger=rs.getString("EMP_RM");
			}
			
		}catch(Exception e)
		{
			System.out.println("problem in reqularization reporting manager");
		}
		
		
		return reportingManger;
	}
	
	
	

	/**
	 *Regularization Apply 
	 */
	
	public String SaveRegularizationDetails(String reg_type,Object reg_date,String reg_note,String reporing_man)
	{
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
		Date date = new Date(System.currentTimeMillis());
		System.out.println("date in regularization is"+sdf.format(date));
		
			String reg_msg="";
			Connection con_reg=null;
			PreparedStatement ps_reg=null;
			String Rm_Approve="Initiate";
			String reg_sql="insert into REGULARIZATION_APPLY (REGULARIZATION_TYPE,REGULARIZATION_DATE,REGULARIZATION_NOTE,RM_APPROVE,EMP_RM,EMP_ID,CREATION_DATE) VALUES(?,?,?,?,?,?,?)";
			Map<String,Object> session = ActionContext.getContext().getSession();
			String emp_id=(String)session.get("empid");
		try{
			
			con_reg=GetConnection.getConnection();
			ps_reg=con_reg.prepareStatement(reg_sql);
			ps_reg.setString(1, reg_type);
			ps_reg.setObject(2, reg_date);
			ps_reg.setString(3, reg_note);
			ps_reg.setString(4, Rm_Approve);
			ps_reg.setString(5, reporing_man);
			ps_reg.setString(6, emp_id);
			
			ps_reg.setObject(7,sdf.format(date));
			
			int rs=ps_reg.executeUpdate();
			if(rs>0){
				
				//sending mail
				RegularizationAction reg_mail=new RegularizationAction();
				reg_mail.sending_regularization_mail(reg_type,reg_date,reg_note,reporing_man,emp_id);
				reg_msg="Regularization Successfully Applied";
			}
			else
			{
				reg_msg="Please try Again!";
			}
			
		}catch(Exception e)
		{
			reg_msg="Please try Again!";
			System.out.println("problem in reqularization");
			e.printStackTrace();
		}
		finally{
			try {
				ps_reg.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con_reg.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return reg_msg;
	}
	
	/*
	 * Sending Regularization Mail
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
	public  void sending_regularization_mail(String type_of_reg,Object reg_date,String reg_note,String reporting_man,String emp_id)
	{
		Map<String,Object> session1 = ActionContext.getContext().getSession(); 
	      String id= (String) session1.get("loginid");
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
	         message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(reporting_man));//keep rm mail id
	         message.addRecipients(Message.RecipientType.CC, InternetAddress.parse("yogesh@clocksoft.info"));//cc persons names
	         
	         
	         //System.out.println("to address:"+toAddress);
	         message.setSubject("Regularization Apply");
	         
	         message.setText("Regularization  from "+emp_id+",\n Regularization Type "+type_of_reg+",\n Date is "+reg_date+",\n Reason is "+reg_note+", \n\nThanks & Regards"+"\n "+id1+" ");
	         Transport.send(message);
	      }
	      catch(Exception e)
	      {
	         System.out.println("problem to send a mail");
	         e.printStackTrace();
	      }
	   
	   }
	/*
	 * 
	 * Regularization Initail data	
	 */
		
public ArrayList<String> GettingManger_Regularization() throws SQLException
{
	ArrayList<String> info_regularization=new ArrayList<String>();
	Connection con_reg_manager=null;
	
	Statement st_reg_manger=null;
	
	Map<String,Object> session1 = ActionContext.getContext().getSession(); 
    String mangermailid= (String) session1.get("loginid");
    System.out.println("manager id in regularization:"+mangermailid);
    String status="Initiate";
	
	String reg_man_sql="select EMP_ID,REGULARIZATION_TYPE,REGULARIZATION_DATE,REGULARIZATION_NOTE,REG_SEQUENCE from REGULARIZATION_APPLY where EMP_RM='"+mangermailid+"'and RM_APPROVE='"+status+"'";
	
	 System.out.println("sql query regularization:"+reg_man_sql);
	try{
		con_reg_manager = GetConnection.getConnection();
		st_reg_manger=con_reg_manager.createStatement();
		ResultSet rs_reg_manager=st_reg_manger.executeQuery(reg_man_sql);
		while (rs_reg_manager.next()) {
			
			String emp_id=rs_reg_manager.getString("EMP_ID");
			String reg_type=rs_reg_manager.getString("REGULARIZATION_TYPE");
			Date reg_date=rs_reg_manager.getDate("REGULARIZATION_DATE");
			String note=rs_reg_manager.getString("REGULARIZATION_NOTE");
			String seq_no=rs_reg_manager.getString("REG_SEQUENCE").trim();
			
			String man_info=emp_id+"^"+reg_type+"^"+reg_date+"^"+note+"^"+seq_no;
			info_regularization.add(man_info);
		}
		
		
	}catch(Exception e)
	{
		
		System.out.println("Problem exist to getting regularization details");
		e.printStackTrace();
	}
	finally{
		
		st_reg_manger.close();
		con_reg_manager.close();
		
	}
	
	
	return info_regularization;
}
	
	
/*
 * Regularization Acceptance or Reject state
 * 	
 */


public String regularization_Approve(String seq_id,String reg_status) throws SQLException 
{
	
	Map<String,Object> session1 = ActionContext.getContext().getSession(); 
    String Reportmanagerid= (String) session1.get("loginid");
    
    System.out.println("status in java code"+reg_status);
    
    Connection con_reg_accept=null;
	
	Statement st_reg_accept=null;
	String return_msg=null;
	
	String reg_approve="select e.EMP_MAILID,r.EMP_ID,r.REGULARIZATION_DATE from NCSS_EMP_MASTER_INFO e,REGULARIZATION_APPLY r where r.REG_SEQUENCE='"+seq_id+"' and e.EMP_ID in (select r.EMP_ID from REGULARIZATION_APPLY r  where r.REG_SEQUENCE='"+seq_id+"')";
	
	try{
		con_reg_accept = GetConnection.getConnection();
		
		st_reg_accept=con_reg_accept.createStatement();
		ResultSet rs_reg_accept=st_reg_accept.executeQuery(reg_approve);
		
		if (rs_reg_accept.next()) {
			
			String emp_mailid=rs_reg_accept.getString(1);
			System.out.println("emp_mailid in java code"+emp_mailid);
			
			String emp_id=rs_reg_accept.getString(2);
			System.out.println("emp_id in java code"+emp_id);
			
			Object date=rs_reg_accept.getDate(3);
			System.out.println("date in java code"+date);
			
			RegularizationAction reg_action=new RegularizationAction();
			String final_msg=reg_action.update_attandance_regularization(emp_id,date,reg_status,seq_id);
			
			if(final_msg.equalsIgnoreCase("Update successfully"))
			{
				return_msg="Update successfully";
				
		RegularizationMailsend.executeMail_leave(emp_id,date,emp_mailid, Reportmanagerid,reg_status);
				
				
			}
			else
			{
				return_msg="Update Fail";
			}
			
			
		}
		
		
	}catch(Exception e)
	{
		
		System.out.println("Problem exist to getting regularization details");
		e.printStackTrace();
	}
	finally{
		
		st_reg_accept.close();
		con_reg_accept.close();
		
	}
	
	
	
	
	return return_msg;
	
}

/*
 * Update in attendance and regularization table
 */

public String update_attandance_regularization(String empid,Object start_date,String regularization_status,String seq_no){
	
	
	System.out.println("empid in java innecr code"+empid);
	System.out.println("start_date in java innecr code"+start_date);
	
	System.out.println("regularization_status in java innecr code"+regularization_status);
	System.out.println("seq_no in java  innecr code"+seq_no);
	
	Connection con_update=null;
	
	Statement st_update=null;
	String update_msg=null;
	
	
	try{
		con_update = GetConnection.getConnection();
		
		st_update=con_update.createStatement();
		con_update.setAutoCommit(false);
		String attandance_execute="Update NCSS_TEMP_BKP_DUMP3 set Regularization_Remarks='"+regularization_status+"',ATT_STATUS='PRS' where DB_DATE=to_date('"+start_date+"','YYYY-MM-DD') and fullid='"+empid+"' ";
		//"Update NCSS_TEMP_BKP_DUMP3 set FINAL_REMARKS='Regularization Approved' where IN_DATE='"+start_date+"' and FULLID='"+empid+"' ";
		st_update.addBatch(attandance_execute);
		
		String regularization_update="update REGULARIZATION_APPLY set RM_APPROVE='"+regularization_status+"' where EMP_ID='"+empid+"' and REG_SEQUENCE='"+seq_no+"'";
		
		st_update.addBatch(regularization_update);
		
		int[] count_sql = st_update.executeBatch();
		System.out.println("coutn in batch is"+count_sql);
		
		con_update.commit();
		
		update_msg="Update successfully";
		
	}catch(Exception e)
	{
		
		System.out.println("Problem exist to getting regularization details");
		e.printStackTrace();
		update_msg="Update not success";
	}
	finally{
		
		try {
			st_update.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con_update.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	
	return update_msg;
	
	
	
}







	
	
	
	public static void main(String[] args) {

	}
	   }


