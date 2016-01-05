    package com.ess.common.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.ess.util.GetConnection;

public class LeaveMail {

	static Properties properties = new Properties();
	   static
	   {
		   properties.put("mail.smtp.auth", "true");
		   properties.put("mail.smtp.starttls.enable", "true");
		   properties.put("mail.smtp.host", "smtp.office365.com");
		   properties.put("mail.smtp.port", "587");
		 
	   }

	   public String executeMail_leave(String sid,String status) 
	   
	   {
	      String ret = "mail success";
	      
	      String emp_mailid=null;
	      String TYPE_OF_LEAVE=null;
	      String START_DATE=null;
	      String end_date=null;
	      String absence_day=null;
	      String note=null;
	      String mailid=null;
	      
	      Connection conn = null;
	      try
	      {
	    	  conn = GetConnection.getConnection();
	    //	  int sid_in=Integer.parseInt(sid);
	    	  
		  		 PreparedStatement ps = conn.prepareStatement("select a.emp_mailid,b.mailid,b.type_of_leave,b.start_date,b.end_date,b.absence_day,b.note,b.sid from NCSS_EMP_MASTER_INFO a,CALENDAR_LEAVE_APPLY_TEST b where b.sid='"+sid+"' and a.emp_id=(select b.mailid from CALENDAR_LEAVE_APPLY_TEST where SID='"+sid+"')");    
	            System.out.println("hello");
	           /* ps.setInt(1,sid_in);  
	            ps.setInt(2,sid_in);*/
	            
	            ResultSet rs = ps.executeQuery();  
	            if(rs.next()){
	            	
	            	emp_mailid=rs.getString(1);
	            	  System.out.println("emp_mailid"+emp_mailid);
	            	
	            	 mailid=rs.getString(2);
	            	  System.out.println("mailid"+mailid);
	            	  
	            	 TYPE_OF_LEAVE=rs.getString(3);
	            	 System.out.println("TYPE_OF_LEAVE"+TYPE_OF_LEAVE);
	            	 
	            	 START_DATE=rs.getString(4);
	            	 System.out.println("START_DATE"+START_DATE);
	            	 
	            	 end_date=rs.getString(5);
	            	 System.out.println("end_date"+end_date);
	            	 
	            	 absence_day=rs.getString(6);
	            	 System.out.println("absence_day"+absence_day);
	            	 
	            	 note=rs.getString(7);
	            	 System.out.println("note"+note);
	            	 
	            }
	            
	            System.out.println(rs);
	            
	    	  System.out.println("in to send a mail program");
	         Session session = Session.getDefaultInstance(properties,  
	            new javax.mail.Authenticator() {
	            protected PasswordAuthentication 
	            getPasswordAuthentication() {
	            return new 
	            PasswordAuthentication("essadmin@Clocksoft.info", "admin@123");
	            }});

	         Message message = new MimeMessage(session);
	         message.setFrom(new InternetAddress("essadmin@Clocksoft.info"));
	        
	         message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emp_mailid));
	         
	         message.setSubject("Leave Status Info");
	         
	         message.setText("Leave Details Are: \n\n\nYour Employee Id: "+mailid+" \n Leave Status : "+status+"  \n Leave Type : "+TYPE_OF_LEAVE+" \n Start Date : "+START_DATE+" \n End Date : "+end_date+" \n Absence Day : "+absence_day+" \n Reason : "+note+" ,\n\n\n\n\n\nRegards"+"\n Manager Team. ");
	         Transport.send(message);
	      }
	      catch(Exception e)
	      {
	         System.out.println("problem to send a mail");
	         e.printStackTrace();
	      }
	      return ret;
	   }

	  public static void main(String[] args) {
		  LeaveMail mm=new LeaveMail();
		  String ss=mm.executeMail_leave("275","success");
		  System.out.println(ss);
	}
	   
}
