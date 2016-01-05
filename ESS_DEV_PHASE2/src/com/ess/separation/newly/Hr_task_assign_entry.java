package com.ess.separation.newly;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.dao.GetConnection;

public class Hr_task_assign_entry {

	
	
	/*
	 * checking the count on TASK_ASSIGN_SEPARATION table for task assign or check status
	 * 
	 */
	
	
	public int calculateTotal(String sequence_number) throws SQLException
	{
		 
				System.out.println(" count emp id in e-separation manager class");  
				Connection con=null;
				Statement st=null;
				ResultSet rs=null;
			String count_task_assign="select count(EMP_SEQ_NO) as count_esep_task from TASK_ASSIGN_SEPARATION where EMP_SEQ_NO='"+sequence_number+"'";
				int tot_count=0;
				try{
					
					con=GetConnection.getConnection();
					st=con.createStatement();
					rs=st.executeQuery(count_task_assign);
					if(rs.next())
					{
						tot_count=rs.getInt("count_esep_task");
						
					}
				}catch(Exception e)
				{
					System.out.println("problem in count in e-separation task assing checking");
					e.printStackTrace();
				}
				finally
				{
					st.close();
					con.close();
				}
				return tot_count;
			}
		
		
	
	
	
	
	/*public String entry_task_assign(String values,String emp_id,String seq_no) throws SQLException{
		
		String[] str1=values.split(";");
		 int size = str1.length;
		 System.out.println("size..."+size);
		 String displaymsg="Sorry Please Try Again";
		 if(size==1)
		 {
			 String[] str_if_value=values.split(",");
			 System.out.println("inside if condition in hr_task assign");
			 String task_name = str_if_value[0];
			 String mail_id = str_if_value[1];
			 
			 Connection con_if_task=null;
			 Statement st_if_task=null;
			 
			 String if_sql_query="insert into TASK_ASSIGN_SEPARATION(EMP_SEQ_NO,EMP_EMP_ID,TASK_LIST,MANAGER_MAIL_ID,DASK_ASSIGN_DATE) values('"+seq_no+"','"+emp_id+"','"+task_name+"','"+mail_id+"',to_date(sysdate,'DD/MM/YY'))";
			 
			 try{
			con_if_task=GetConnection.getConnection();
			st_if_task=con_if_task.createStatement();
			int res_data=st_if_task.executeUpdate(if_sql_query);
			if(res_data>0){
				
				displaymsg="Successfully Task is Assigned";
				Hr_task_assign_entry.assign_task_mail(emp_id,seq_no,task_name,mail_id);
				
			}
			 
			 }catch(Exception e){
				 System.out.println("problem in inside if condition in hr_task assign");
				 e.printStackTrace();
			 }finally{
				 st_if_task.close();
				 con_if_task.close();
			 }
			 
		 }
		 

		 else
		 {
			 Connection con_else_task=null;
			 Statement st_else_task=null;
				try {
			 String[] str_els=values.split(";");
			 
			 System.out.println("lenth in else"+str_els.length);
			 for(int i=0;i<str_els.length;i++)
				{
				 String sql_name="sql_query_else"+i;
				 
				 String[] inner = str_els[i].split(",");
				 if(i==0){
					
		 				System.out.println("else 1 ---"+inner[0]);
					 
					 	System.out.println(" else 2---"+inner[1]);
					 	System.out.println(" sql"+sql_name);
					 	sql_name="insert into table values"+inner[0]+inner[1];
					 	System.out.println("this is the insert statement in else if part"+sql_name);
				 }
				 else
				 {
					 System.out.println("else 1 ---"+inner[0]);
					 
					 	System.out.println(" else 2---"+inner[1]);
					 	
					 	System.out.println(" else 3---"+inner[2]);
					 	System.out.println(" sql"+sql_name);
					 	sql_name="insert into table values"+inner[1]+inner[2];
					 	System.out.println("this is the insert statement in else else part"+sql_name);
					 	
				 }
				 
				 
					 
									
						}	
				

						} catch (Exception e) {

							System.out.println("problem to insert the clearance in else part");
							e.getMessage();
						}
		 
				
						
						finally{
							System.out.println("finally block");
						}

		 }
		return displaymsg;
		
		
	}*/
	
public String entry_task_assign(String values,String emp_id,String seq_no,String hr_status) throws SQLException{
		
		String[] str1=values.split(";");
		 int size = str1.length;
		 System.out.println("size..."+size);
		 String displaymsg="Sorry Please Try Again";
		 if(size==1)
		 {
			 String[] str_if_value=values.split(",");
			 System.out.println("inside if condition in hr_task assign");
			 String task_name = str_if_value[0];
			 String mail_id = str_if_value[1];
			 
			 Connection con_if_task=null;
			 Statement st_if_task=null;
			 
			 String if_sql_query="insert into TASK_ASSIGN_SEPARATION(EMP_SEQ_NO,EMP_EMP_ID,TASK_LIST,MANAGER_MAIL_ID,STATUS_HR,TASK_ASSIGN_DATE) values('"+seq_no+"','"+emp_id+"','"+task_name+"','"+mail_id+"','"+hr_status+"',to_date(sysdate,'DD/MM/YY'))";
			 
			 try{
			con_if_task=GetConnection.getConnection();
			st_if_task=con_if_task.createStatement();
			int res_data=st_if_task.executeUpdate(if_sql_query);
			if(res_data>0){
				
				displaymsg="Successfully Task is Assigned";
				Hr_task_assign_entry.assign_task_mail(emp_id,seq_no,task_name,mail_id);
				
			}
			 
			 }catch(Exception e){
				 System.out.println("problem in inside if condition in hr_task assign");
				 e.printStackTrace();
			 }finally{
				 st_if_task.close();
				 con_if_task.close();
			 }
			 
		 }
		 

		 else
		 {
			 Connection con_else_task=null;
			 Statement st_else_task=null;
				try {
			 String[] str_els=values.split(";");
			
			 con_else_task=GetConnection.getConnection();
			 st_else_task=con_else_task.createStatement(); 
			 con_else_task.setAutoCommit(false);
			 
			 for(int i=0;i<str_els.length;i++)
				{
				 String sql_name="sql_query_else"+i;
				 
				 String[] inner = str_els[i].split(",");
				 if(i==0){
					 
					  sql_name="insert into TASK_ASSIGN_SEPARATION(EMP_SEQ_NO,EMP_EMP_ID,TASK_LIST,MANAGER_MAIL_ID,STATUS_HR,TASK_ASSIGN_DATE) values('"+seq_no+"','"+emp_id+"','"+inner[0]+"','"+inner[1]+"','"+hr_status+"',to_date(sysdate,'DD/MM/YY'))";
					
					 	System.out.println("this is the insert statement in else if part"+sql_name);
					 	Hr_task_assign_entry.assign_task_mail(emp_id,seq_no,inner[0],inner[1]);
					 	st_else_task.addBatch(sql_name);
				 }
				 else
				 {
					 
					 sql_name="insert into TASK_ASSIGN_SEPARATION(EMP_SEQ_NO,EMP_EMP_ID,TASK_LIST,MANAGER_MAIL_ID,STATUS_HR,TASK_ASSIGN_DATE) values('"+seq_no+"','"+emp_id+"','"+inner[1]+"','"+inner[2]+"','"+hr_status+"',to_date(sysdate,'DD/MM/YY'))";
					 
					 	System.out.println("this is the insert statement in else else part"+sql_name);
					 	Hr_task_assign_entry.assign_task_mail(emp_id,seq_no,inner[1],inner[2]);
					 	st_else_task.addBatch(sql_name);
				 }
				 
				 int[] counter = st_else_task.executeBatch();
				 System.out.println("counter in hr task assign"+counter);
				 con_else_task.commit();
				 displaymsg="Successfully Tasks are Assigned";
					 
						}	

						} catch (Exception e) {
							con_else_task.rollback();
							displaymsg="Sorry Please Try Again";
							System.out.println("problem to insert the clearance in else part");
							e.getMessage();
						}
		 
						finally{
							
							st_else_task.close();
							con_else_task.close();
							System.out.println("finally block");
						}

		 }
		return displaymsg;
		
		
	}
	
	
	/*
	 * sending mail to all
	 */
	
	static Properties properties = new Properties();
	   static
	   {
		   properties.put("mail.smtp.auth", "true");
		   properties.put("mail.smtp.starttls.enable", "true");
		   properties.put("mail.smtp.host", "smtp.office365.com");
		   properties.put("mail.smtp.port", "587");
		 
	   }
	   public static String assign_task_mail(String emp_id,String seq_no,String task_name,String mail_id) 
	   {
		   
	      String ret = "mail success";
	      try
	      {
	    	  System.out.println("mail in hr_task assign process");
	         Session session = Session.getDefaultInstance(properties,  
	            new javax.mail.Authenticator() {
	            protected PasswordAuthentication 
	            getPasswordAuthentication() {
	            return new 
	            PasswordAuthentication("essadmin@Clocksoft.info", "admin@123");
	            }});

	         Message message = new MimeMessage(session);
	         message.setFrom(new InternetAddress("essadmin@Clocksoft.info"));//sender information
	         message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail_id));
	         //message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(rm));//cc persons names
	         
	         
	         //System.out.println("to address:"+toAddress);
	         message.setSubject("e-Separation:Resignation initiate");
	         
	         message.setText("Resignation from "+emp_id+",\n Your Role is "+task_name+",Please Check the Details for Perticular Department, \n\nThanks & Regards"+"\nHR Team ");
	         Transport.send(message);
	      }
	      catch(Exception e)
	      {
	         System.out.println("problem to send a mail to the e-separation emp class");
	         e.printStackTrace();
	      }
	      return ret;
	   }
}
