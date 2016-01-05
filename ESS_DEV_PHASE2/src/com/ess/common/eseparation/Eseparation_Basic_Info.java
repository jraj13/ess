package com.ess.common.eseparation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
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
public class Eseparation_Basic_Info {

	 /*
	  * Basic information related to the e-separation new jsp page
	  * 
	  */
	public  ArrayList<String> getBasicInfo_eseparation() throws SQLException {
		System.out.println("Basic information related to the e-separation emp class");
		ArrayList<String> emp_initial = new ArrayList<String>();
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		
		String id=(String)session.get("empid");
		
		String sql = "select EMP_ID,EMP_FNAME,EMP_LNAME,EMP_DESIG,EMP_RM from NCSS_EMP_MASTER_INFO where EMP_ID='"+id+"'";
		
	    ResultSet rst = null;
	    Connection con=null;
	    try {
			 con = GetConnection.getConnection();
			Statement stmt = con.createStatement();

			rst = stmt.executeQuery(sql);

			String emp_Id = "";
			String emp_Fname = "";
			String emp_Lname = "";
			
			String emp_Desig = "";
			String emp_Rm = "";
			
			while (rst.next()) {

				emp_Id = rst.getString("EMP_ID");
				emp_Fname = rst.getString("EMP_FNAME");
				emp_Lname = rst.getString("EMP_LNAME");
				
				emp_Desig = rst.getString("EMP_DESIG");
				emp_Rm = rst.getString("EMP_RM");
				
				String emp_initial_data = emp_Id + "^" + emp_Fname + "^" + emp_Lname + "^"+ emp_Desig+ "^"+ emp_Rm;
				emp_initial.add(emp_initial_data);
			
			}
			
		} catch (Exception e) {
			System.out.println("problem in Basic information related to the e-separation emp class");
			e.printStackTrace();
		}
	    
	    
		return emp_initial;
	}
	
	
	 /*
	  * getting 30th day date to the e-separation new jsp page
	  * 
	  */
	
		
	public String getthirtyDaysAfter() throws SQLException
	{
		System.out.println("getting 30 days date in  the e-separation emp class");
		Connection conn=null;
		CallableStatement cal=null;
		Date date_next;
		String date_month=null;
		String thirty="{call NEXTTHIRTY(?)}";
		

		try{
			conn=GetConnection.getConnection();
			cal = conn.prepareCall(thirty);
			cal.registerOutParameter(1, java.sql.Types.DATE);
			
			cal.executeUpdate();
			
			 date_next = cal.getDate(1);
			 System.out.println(date_next);
			 date_month=String.valueOf(date_next);
		}finally{
			cal.close();
			conn.close();
			
		}
		return date_month;
	}
	
	 /*
	  * inserting the data in e-separation new jsp page
	  * 
	  */
	
	public String insert_Eseparation_Details(String reasion_action,String detailed_reason,String rel_date,String actual_notice,String given_notice,
			String cration_date,String note,String rm) throws SQLException
			{
		System.out.println("Inserting the details in e-separation emp class");
		Map<String,Object> session = ActionContext.getContext().getSession();
		String EMP_ID=(String)session.get("empid");
		
		//String EMP_ID = null;
		String REASION_RESIGN = reasion_action;
		String DETAILED_REASON = detailed_reason;
		String RELEVING_DATE = rel_date;
		
		
		String ACTUAL_NOTICE_PERIOD = actual_notice;
		String GIVEN_NOTICE_PERIOD = given_notice;
		
		
		String EMP_APPROVEL = "Initiate";
		String RM_APPROVE = "Pending";
		
		String ADMIN_APPROVE = "Pending";
		String CREATION_DATE = cration_date;
		String HR_APPROVE="Pending";
		
		String esep_note=note;
		
		
		
		String eseparation_insert = "insert into E_SEPARATION_EMP (EMP_ID,REASION_RESIGN,DETAILED_REASON,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,"
				+ "GIVEN_NOTICE_PERIOD,EMP_APPROVEL,RM_APPROVE,ADMIN_APPROVE,CREATION_DATE,SEPARATION_NOTE,RM_NAME,HR_APPROVE)"
				+ "   values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
		
	   
	    Connection con=null;
	    PreparedStatement psd=null;
	   // int rs=0;
	    String result_str=null;
	    
	    try {
			 con = GetConnection.getConnection();
			psd = con.prepareStatement(eseparation_insert);
			psd.setString(1, EMP_ID);
			psd.setString(2, REASION_RESIGN);
			psd.setString(3,DETAILED_REASON);
			psd.setString(4, RELEVING_DATE);
			
			psd.setString(5, ACTUAL_NOTICE_PERIOD);
			psd.setString(6, GIVEN_NOTICE_PERIOD);
			psd.setString(7, EMP_APPROVEL);
			psd.setString(8, RM_APPROVE);
			
			psd.setString(9, ADMIN_APPROVE);
			psd.setString(10, CREATION_DATE);
			
			
			psd.setString(11, esep_note);
			psd.setString(12, rm);
			psd.setString(13, HR_APPROVE);
			psd.executeUpdate();
			result_str="Request is submitted to RM Successfully";
			
			
	    }
	    
	    catch(SQLIntegrityConstraintViolationException e) 
	    {
	    	result_str="You are Already Submitted";
	    }
	    catch(NullPointerException e)
	    {
	    	result_str="Sorry! Try Again";
	    }
	   
		catch(Exception e)
		{
			if(e.getMessage().indexOf("unique constraint")!=0){
				result_str="You are Already Submitted";
			}else
			{
			System.out.println("problem in inserting the values in e-separation new request");
			result_str="Sorry! Try Again";
			e.printStackTrace();
			}
		}
	    finally{
	    	if(psd!=null)
				psd.close();
			} 
	    	if(con!=null){
				con.close();
			}
			return result_str; 
		}
		
	/*
	 * Getting information to e-request home page  
	 */
	
	public  ArrayList<String> gettinge_requestDetails() throws SQLException {
		System.out.println("Home page information related to the e-separation emp class");
		ArrayList<String> homepage = new ArrayList<String>();
	
		Map<String,Object> session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		
		//String fetch_initail_eseparation = "select e.SEQUENCE_NO,e.EMP_APPROVEL,e.CREATION_DATE,m.emp_rm from E_SEPARATION_EMP e,NCSS_EMP_MASTER_INFO m where e.emp_id='"+id+"' and m.emp_id='"+id+"'";
				
		String fetch_initail_eseparation = "select SEQUENCE_NO,EMP_APPROVEL,CREATION_DATE,rm_name from E_SEPARATION_EMP  where emp_id='"+id+"' order by SEQUENCE_NO desc";		
		String empDetails_eseparation = null;
		
	    Connection con=null;
	    Statement st=null;
	    ResultSet rs_ini=null;
	    
	    
	    try {
			 con = GetConnection.getConnection();
			  st = con.createStatement();

			 rs_ini = st.executeQuery(fetch_initail_eseparation);
			 String sequence_no=null;
			 String emp_approve =null;
			 Date creation;
			 String rm=null;
			 
			 while(rs_ini.next())
			 {
			 sequence_no=rs_ini.getString("SEQUENCE_NO");
			 emp_approve=rs_ini.getString("EMP_APPROVEL");
			
			 creation=rs_ini.getDate("CREATION_DATE");
			
			 
			 rm=rs_ini.getString("rm_name");
			
			empDetails_eseparation=sequence_no+"^"+emp_approve+"^"+creation+"^"+rm;
			homepage.add(empDetails_eseparation);
			
			 }
			
		} catch (Exception e) {
			System.out.println("problem in Home page information related to the e-separation emp class");
			e.printStackTrace();
		}
	    
	    
		
		return homepage;
	}
		
		
	
	/*
	 * Sending mail to in e-separation page
	 */
		
	static Properties properties = new Properties();
	   static
	   {
		   properties.put("mail.smtp.auth", "true");
		   properties.put("mail.smtp.starttls.enable", "true");
		   properties.put("mail.smtp.host", "smtp.office365.com");
		   properties.put("mail.smtp.port", "587");
		 
	   }
	   
	   
// While sending mail over e-separation Resignation apply to RM
	   public String executeMail_eseparation(String reason,String detailed,String rel_date,String actual_notice,String given_notice,String date,String note,String rm,String emp_mailid,String empid) 
	   {
		   
	      String ret = "mail success";
	      try
	      {
	    	  
	    	 String name[]= emp_mailid.split("\\@");
	    	 String name1=name[0];
	    	  System.out.println("sending mail to the e-separation emp class");
	         Session session = Session.getDefaultInstance(properties,  
	            new javax.mail.Authenticator() {
	            protected PasswordAuthentication 
	            getPasswordAuthentication() {
	            return new 
	            PasswordAuthentication("essadmin@Clocksoft.info", "admin@123");
	            }});

	         Message message = new MimeMessage(session);
	         message.setFrom(new InternetAddress("essadmin@Clocksoft.info"));//sender information
	    
	         message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(rm));
	         
	        // message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emp_mailid));
	        // message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(rm));//cc persons names
	         
	         
	         //System.out.println("to address:"+toAddress);
	         message.setSubject("e-Separation:Resignation initiate");
	         
	         message.setText("Resignation from "+empid+",\n reason is "+reason+",\n Detailed Reason is "+detailed+",\n Releving Date is "+rel_date+",\n Actual Notice Period is "+actual_notice+",\n Giving Notice Period is "+given_notice+",\n Note is "+note+" \n\nThanks & Regards \n "+ name1+" ");
	         /*message.setText("Resignation from "+emp_mailid+",\n reason is "+reason+",\n Detailed Reason is "+detailed+",\n Releving Date is "+rel_date+",\n Actual Notice Period is "+actual_notice+",\n Giving Notice Period is "+given_notice+",\n Note is "+note+" \n\nThanks & Regards"+"\nHR Team ");*/
	         Transport.send(message);
	      }
	      catch(Exception e)
	      {
	         System.out.println("problem to send a mail to the e-separation emp class");
	         e.printStackTrace();
	      }
	      return ret;
	   }
			
	/*
	 * 
	 * Delete based on id in e-separation delete
	 */
	   public String delete_id(String emp_id)
	   {
		   System.out.println("delete resignation based on id in the e-separation emp class");
		    Connection con_delete=null;
		    int result=0;
		    String final_msg=null;
		    Statement stmt=null;
		    try {
		    	con_delete = GetConnection.getConnection();
				 stmt = con_delete.createStatement();
				//String delete_sql="delete from E_SEPARATION_EMP where EMP_ID='"+emp_id+"'  and RM_APPROVE='Pending' or RM_APPROVE='Reject'";
				
				/*String delete_sql="update  E_SEPARATION_EMP  set EMP_APPROVEL='Delete' where EMP_ID='"+emp_id+"'  and (RM_APPROVE='Pending' or RM_APPROVE='Reject')"; */
				
				String delete_sql="update  E_SEPARATION_EMP  set EMP_APPROVEL='Delete' where EMP_ID='"+emp_id+"'  and EMP_APPROVEL='Initiate' and (RM_APPROVE='Pending' or RM_APPROVE='Reject')";
				 System.out.println("delete resignation based on id in the e-separation emp class"+delete_sql);
				result = stmt.executeUpdate(delete_sql);
				System.out.println("result"+result);
				if(result==0)
				{
					final_msg= "Sorry! Contact to Reporting Manager or HR Manager";
					
				}
				else
				{
					final_msg= "Successfully Deleted";
				}
		    }catch(Exception e)
				{
		    	e.printStackTrace();
					final_msg= "Sorry! Please Try Again";
				}
		    finally{
					try {
						con_delete.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				return final_msg;
		    }
	 
	   /*
	    * After edit update the note
	    * 
	    */
	   public String update_note(String sequenceid,String note)
	   {
		   System.out.println("update the note in related to the e-separation emp class");
		   Connection con_update=null;
		    int result_update=0;
		    String final_msg_update=null;
		    try {
		    	con_update = GetConnection.getConnection();
				Statement stmt = con_update.createStatement();
				String delete_sql="update  E_SEPARATION_EMP set SEPARATION_NOTE='"+note+"' where SEQUENCE_NO='"+sequenceid+"' and RM_APPROVE='Pending' and ADMIN_APPROVE='Pending'";
				result_update = stmt.executeUpdate(delete_sql);
				if(result_update>0)
				{
					final_msg_update= "Successfully Updated";
				}
				else
				{
					final_msg_update= "Sorry! Contact to Reporting Manager or HR Manager";
				}
		    }catch(Exception e)
				{
		    	final_msg_update= "Sorry! Please Try Again";
				}
		    finally{
					try {
						con_update.close();
					} catch (SQLException e) {
						System.out.println("problem in update the note in related to the e-separation emp class");
						e.printStackTrace();
					}
				}
				return final_msg_update;
		    }
		   

	   public String withdraw_status(String emp_id)
	   {
		   System.out.println("with draw resignation based on id in the e-separation emp class");
		    Connection con_withdraw=null;
		    int result=0;
		    String final_msg="Sorry! Please Try Again";
		    try {
		    	con_withdraw = GetConnection.getConnection();
				Statement stmt = con_withdraw.createStatement();
				
				/*String delete_sql="update E_SEPARATION_EMP set EMP_APPROVEL='withdraw' where EMP_ID='"+emp_id+"' and (EMP_APPROVEL='Initiate' or RM_APPROVE='Reject' or RM_APPROVE='Pending' or HR_APPROVE='Reject'  or HR_WITHDRAW_ACTION='Yes')";*/
				String delete_sql="update E_SEPARATION_EMP set EMP_APPROVEL='Withdraw' where EMP_ID='"+emp_id+"' and EMP_APPROVEL='Initiate' and RM_APPROVE='Reject' or RM_APPROVE='Pending' or HR_APPROVE='Reject'  or HR_WITHDRAW_ACTION='Yes'"; 
				
				System.out.println(delete_sql);
				
				result = stmt.executeUpdate(delete_sql);
				System.out.println(result);
				if(result==0)
				{
					final_msg= "Sorry! Contact to Reporting Manager or HR Manager";
				}
				else
				{
					final_msg= "Request withdraw Successfully";
				}
		    }catch(Exception e)
				{
		    	
					final_msg= "Sorry! Please Try Again";
					e.printStackTrace();
				}
		    finally{
					try {
						con_withdraw.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				return final_msg;
		    }
	 
	   
	   
	   public  List<String> e_separation_withdraw() throws SQLException {
			System.out.println("Home page information related to the e-separation emp class");
			List<String> with_homepage = new LinkedList<String>();
		
			Map<String,Object> session = ActionContext.getContext().getSession();
			String id=(String)session.get("empid");
			
					
			String withdraw_eseparation = "select emp_id,REASION_RESIGN,DETAILED_REASON,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD,PHY_REL_DATE_RM,HR_RELIEVING_DATE from E_SEPARATION_EMP  where emp_id='"+id+"' and EMP_APPROVEL='Initiate' and(RM_APPROVE='Reject' or HR_APPROVE='Reject' or HR_WITHDRAW_ACTION='Yes')";
			//String withdraw_eseparation = "select emp_id,REASION_RESIGN,DETAILED_REASON,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD,PHY_REL_DATE_RM,HR_RELIEVING_DATE from E_SEPARATION_EMP  where emp_id='CSSSE1500059' and EMP_APPROVEL='Initiate' " ;
			
			String empDetails_eseparation = null;
			
		    Connection con_ini_withdraw=null;
		    Statement st=null;
		    ResultSet rs_ini=null;
		    
		    
		    try {
		    	con_ini_withdraw = GetConnection.getConnection();
				  st = con_ini_withdraw.createStatement();

				 rs_ini = st.executeQuery(withdraw_eseparation);
				 String emp_id=null;
				 String reason_resign=null;
				 String detailed_resign=null;
				 Date relieving_date;
				 String anp=null;
				 String gnp=null;
				 Date rm_rel_date;
				 Date hr_rel_date;
				 
				 while(rs_ini.next())
				 {
				 emp_id=rs_ini.getString("emp_id");
				 reason_resign=rs_ini.getString("REASION_RESIGN");
				 detailed_resign=rs_ini.getString("DETAILED_REASON");
				 
				 relieving_date=rs_ini.getDate("RELEVING_DATE");
				 anp=rs_ini.getString("ACTUAL_NOTICE_PERIOD");
				 gnp=rs_ini.getString("GIVEN_NOTICE_PERIOD");
				 
				 rm_rel_date=rs_ini.getDate("PHY_REL_DATE_RM");
				 hr_rel_date=rs_ini.getDate("HR_RELIEVING_DATE");
				
				empDetails_eseparation=emp_id+"^"+reason_resign+"^"+detailed_resign+"^"+relieving_date+"^"+anp+"^"+gnp+"^"+rm_rel_date+"^"+hr_rel_date;
				with_homepage.add(empDetails_eseparation);
				
				 }
				
			} catch (Exception e) {
				System.out.println("problem in Home page information related to the e-separation emp class");
				e.printStackTrace();
			}
			
			return with_homepage;
		}
	   
	   
	   
	   public int get_tot_before_save() throws SQLException
		{
		   Map<String,Object> session = ActionContext.getContext().getSession();
			String emp_id_count=(String)session.get("empid");
			
			System.out.println(" count sequence id before save and before delete in e-separation basic information");  
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
		String admin_sql="select count(SEQUENCE_NO) as count_seq from E_SEPARATION_EMP where EMP_ID='"+emp_id_count+"' and EMP_APPROVEL='Initiate'";
			int tot_count=0;
			try{
				
				con=GetConnection.getConnection();
				st=con.createStatement();
				rs=st.executeQuery(admin_sql);
				if(rs.next())
				{
					tot_count=rs.getInt("count_seq");
					System.out.println(" count sequence id before save and before delete in e-separation basic information"+tot_count);
				}
			}catch(Exception e)
			{
				System.out.println("problem in count in e-separation count");
				e.printStackTrace();
			}
			finally
			{
				st.close();
				con.close();
			}
			return tot_count;
		}   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	
	public static void main(String[] args) {
		
		//Eseparation_Basic_Info aa=new Eseparation_Basic_Info();
		
	}
	
	
	
	
}
