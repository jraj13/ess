package com.ess.common.eseparation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class E_separation_ADMIN {

	public String geTotla_counts() throws SQLException
	{
		System.out.println(" count emp id in e-separation admin class");  
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
	String admin_sql="select count(emp_id) as count_id from E_SEPARATION_EMP where  RM_APPROVE='Inprocess' and EMP_APPROVEL='Initiate' and HR_APPROVE='Inprocess' and ADMIN_APPROVE='Pending'";
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
	
	
	/* E-seperation employee search */
	
	public static ArrayList<String> esepEmpSearch() throws SQLException {
		System.out.println(" serach based on emp id in e-separation admin class"); 
		
		ArrayList<String> esepEmpSearch_array = new ArrayList<String>();
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String empid = request.getParameter("empid");
	
		
		String getesepEmpSearchQry="select emp_id,REASION_RESIGN,DETAILED_REASON,CREATION_DATE,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD,RM_NAME,SEPARATION_NOTE,RM_COMMENTS,HR_COMMENTS from E_SEPARATION_EMP where  RM_APPROVE='Inprocess' and EMP_APPROVEL='Initiate' and HR_APPROVE='Inprocess' and ADMIN_APPROVE='Pending' and emp_id='"+empid+"'";
		
		/*String getesepEmpSearchQry ="select sep.emp_id as employeeid,sep.REASION_RESIGN,sep.DETAILED_REASON,sep.CREATION_DATE,sep.RELEVING_DATE,sep.ACTUAL_NOTICE_PERIOD,sep.GIVEN_NOTICE_PERIOD,sep.RM_NAME,"
				+ "sep.SEPARATION_NOTE, sep.RM_COMMENTS,sep.HR_COMMENTS,e.EMP_MAILID from E_SEPARATION_EMP sep,NCSS_EMP_MASTER_INFO e  "
				+ "where sep.emp_id=e.emp_id and sep.RM_APPROVE='Pending' and sep.EMP_APPROVEL='Initiate' and sep.HR_APPROVE='Pending' and sep.ADMIN_APPROVE='Pending' and sep.emp_id='"+empid+"'";*/
		
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;
	try{
		rst = stmt.executeQuery(getesepEmpSearchQry);
		
		String emp_id = "";
		String REASION_RESIGN = "";
		String DETAILED_REASON = "";
		Date CREATION_DATE;
		Date RELEVING_DATE;
		String ACTUAL_NOTICE_PERIOD = "";
		String GIVEN_NOTICE_PERIOD = "";
		String RM_NAME = "";
		String SEPARATION_NOTE = "";
		String RM_COMMENTS="";
		String HR_COMMENTS="";
		if (rst.next()) {

			emp_id = rst.getString("emp_id");
			REASION_RESIGN = rst.getString("REASION_RESIGN");
			DETAILED_REASON = rst.getString("DETAILED_REASON");
			
			CREATION_DATE = rst.getDate("CREATION_DATE");
			RELEVING_DATE = rst.getDate("RELEVING_DATE");
			
			ACTUAL_NOTICE_PERIOD = rst.getString("ACTUAL_NOTICE_PERIOD");
			GIVEN_NOTICE_PERIOD = rst.getString("GIVEN_NOTICE_PERIOD");
			RM_NAME = rst.getString("RM_NAME");
			
			SEPARATION_NOTE = rst.getString("SEPARATION_NOTE");
			RM_COMMENTS=rst.getString("RM_COMMENTS");
			HR_COMMENTS=rst.getString("HR_COMMENTS");
		

			String finalResponse_admin = emp_id + "^" + REASION_RESIGN + "^" + DETAILED_REASON + "^"
					+ CREATION_DATE + "^" + RELEVING_DATE + "^" + ACTUAL_NOTICE_PERIOD + "^"
					+ GIVEN_NOTICE_PERIOD + "^" + RM_NAME + "^" + SEPARATION_NOTE  + "^" + RM_COMMENTS +"^"+ HR_COMMENTS;

 
			esepEmpSearch_array.add(finalResponse_admin);
		}
		} catch (SQLException e) {
			System.out.println("problem in serch  in e-separation admin");
			System.out.println(e.getMessage());
 
		} finally {
			con.close();
		}
		
		return esepEmpSearch_array;
	}

	
	public String save_admin_context(String emp_id,Object r_date,String gnp,String admin_note,String status) throws SQLException
	{
		System.out.println(" save the status in e-separation admin class"); 
		String master_status="Resign";
		Connection con=null;
		Statement st=null;
		String accept_sql="Update E_SEPARATION_EMP set RELEVING_DATE='"+r_date+"',ADMIN_COMMENTS='"+admin_note+"',ADMIN_APPROVE='"+status+"' where EMP_ID='"+emp_id+"' ";
		
		String master_sql="update NCSS_EMP_MASTER_INFO set STATUS='"+master_status+"' where EMP_ID='"+emp_id+"' ";
		String res_msg="no";
		
		System.out.println(master_sql); 
		System.out.println(accept_sql); 
		try{
			
			con=GetConnection.getConnection();
			st=con.createStatement();
			
			st.addBatch(accept_sql);
			st.addBatch(master_sql);
			
			con.setAutoCommit(false);
			int[] count = st.executeBatch();
			System.out.println(count);
				res_msg="yes";
				con.commit();
		}
			catch(Exception e)
			{
				System.out.println("problem in updating the admin_acceptance");
				e.printStackTrace();
			}
			finally{
				st.close();
				con.close();
			}
	return res_msg;
	}
	
	
	
	public static ArrayList<String> emp_status_check(String seqid) throws SQLException {
		System.out.println(" check the status of  emp id in e-separation phases in admin class"); 
		
		/*Map<String,Object> session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");*/
		
		ArrayList<String> check_status = new ArrayList<String>();
		
		
		
		String getesepEmpSearchQry="select emp_id,REASION_RESIGN,DETAILED_REASON,CREATION_DATE,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD,"
				+ "RM_NAME,SEPARATION_NOTE,RM_COMMENTS,HR_COMMENTS,RM_APPROVE,HR_APPROVE,ADMIN_APPROVE,ADMIN_COMMENTS from E_SEPARATION_EMP where SEQUENCE_NO='"+seqid+"'";
		System.out.println("getesepEmpSearchQry.."+getesepEmpSearchQry);
		
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rst = null;
	try{
		rst = stmt.executeQuery(getesepEmpSearchQry);
		
		String emp_id = "";
		String REASION_RESIGN = "";
		String DETAILED_REASON = "";
		Date CREATION_DATE;
		Date RELEVING_DATE;
		
		String ACTUAL_NOTICE_PERIOD = "";
		String GIVEN_NOTICE_PERIOD = "";
		String SEPARATION_NOTE = "";
		
		String RM_NAME = "";
		String RM_APPROVE = ""; 
		String RM_COMMENTS="";
		
		String HR_APPROVE="";
		String HR_COMMENTS="";
		
		String ADMIN_APPROVE="";
		String ADMIN_COMMENTS="";
		
		if (rst.next()) {

			emp_id = rst.getString("emp_id");
			REASION_RESIGN = rst.getString("REASION_RESIGN");
			DETAILED_REASON = rst.getString("DETAILED_REASON");
			
			CREATION_DATE = rst.getDate("CREATION_DATE");
			RELEVING_DATE = rst.getDate("RELEVING_DATE");
			
			ACTUAL_NOTICE_PERIOD = rst.getString("ACTUAL_NOTICE_PERIOD");
			GIVEN_NOTICE_PERIOD = rst.getString("GIVEN_NOTICE_PERIOD");
			RM_NAME = rst.getString("RM_NAME");
			
			SEPARATION_NOTE = rst.getString("SEPARATION_NOTE");
			RM_COMMENTS=rst.getString("RM_COMMENTS");
			HR_COMMENTS=rst.getString("HR_COMMENTS");
		
			RM_APPROVE = rst.getString("RM_APPROVE");
			HR_APPROVE=rst.getString("HR_APPROVE");
			ADMIN_APPROVE=rst.getString("ADMIN_APPROVE");
			ADMIN_COMMENTS=rst.getString("ADMIN_COMMENTS");
			

			String emp_status = emp_id + "^" + REASION_RESIGN + "^" + DETAILED_REASON + "^"
					+ CREATION_DATE + "^" + RELEVING_DATE + "^" + ACTUAL_NOTICE_PERIOD + "^"
					+ GIVEN_NOTICE_PERIOD + "^" + SEPARATION_NOTE  +"^" + RM_NAME + "^" + RM_APPROVE+"^"+RM_COMMENTS +"^"+HR_APPROVE+"^"+ HR_COMMENTS+
					"^"+ADMIN_APPROVE+"^"+ADMIN_COMMENTS;

 
			check_status.add(emp_status);
		}
		} catch (SQLException e) {
			System.out.println(" problem in check the status of  emp id in e-separation phases in admin class"); 
			System.out.println(e.getMessage());
 
		} finally {
			con.close();
		}
		
		return check_status;
	}
	
	/*
	 * 
	 * mailing in admin status
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
	   public String mail_admin_status(String emp_id,String rm_id,String status_mail,String rel_date_mail) 
	   {
		   
		   
		   
	      String ret = "mail success";
	      try
	      {
	    	  System.out.println(" sending the mail  in e-separation phases in admin class"); 
	         Session session = Session.getDefaultInstance(properties,  
	            new javax.mail.Authenticator() {
	            protected PasswordAuthentication 
	            getPasswordAuthentication() {
	            return new 
	            PasswordAuthentication("essadmin@Clocksoft.info", "admin@123");
	            }});

	         Message message = new MimeMessage(session);
	         message.setFrom(new InternetAddress("essadmin@Clocksoft.info"));//sender information
	         message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emp_id));
	      //   message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(rm_id));//cc persons names
	         message.addRecipients(Message.RecipientType.CC, InternetAddress.parse("yogesh@clocksoft.info"));//cc persons names
	         
	         
	         message.setSubject("e-Separation:Resignation status from admin");
	         
	         message.setText("Resignation from "+emp_id+",\n Releving Date is "+rel_date_mail+",\n status is "+status_mail+" \n\nThanks & Regards"+"\n Admin Team ");
	         Transport.send(message);
	      }
	      catch(Exception e)
	      {
	    	  System.out.println(" probelm sending the mail  in e-separation phases in admin class"); 
	         e.printStackTrace();
	      }
	      return ret;
	   }
	
	
	/*
	 * select employee mailid from table
	 */
	
	   
	   public String find_emp_mailid(String emp_id) throws SQLException
	   {
		   
		   System.out.println(" select emp mailid  in e-separation phases in admin class"); 
		   Connection con=null;
		   Statement st=null;
		   ResultSet rs=null;
		   String fetchEmp_mailid_sql="select EMP_MAILID  from NCSS_EMP_MASTER_INFO where EMP_ID='"+emp_id+"'"; 
		   String emp_mail_id=null;
		   try{
			   con=GetConnection.getConnection();
			   st=con.createStatement();
			   rs=st.executeQuery(fetchEmp_mailid_sql);
			   if(rs.next()){
				   emp_mail_id=rs.getString("EMP_MAILID").trim();
			   }
			   
		   }catch(Exception e)
		   {
			   System.out.println("problem in select employee  mailid when emp_id is passed");
			   e.printStackTrace();
		   }finally{
			   rs.close();
			   st.close();
			   con.close();
		   }
		   return emp_mail_id;
	   }
}







/*public String save_admin_context(String emp_id,Object r_date,String gnp,String admin_note,String status) throws SQLException
{
	System.out.println(" save the status in e-separation admin class"); 
	Connection con=null;
	PreparedStatement st=null;
	String accept_sql="Update E_SEPARATION_EMP set RELEVING_DATE=?,GIVEN_NOTICE_PERIOD=?,ADMIN_COMMENTS=?,ADMIN_APPROVE=? where EMP_ID=?";
	
	String res_msg="no";
	try{
		con=GetConnection.getConnection();
		st=con.prepareStatement(accept_sql);
		st.setObject(1, r_date);
		st.setString(2, gnp);
		st.setString(3, admin_note);
		st.setString(4, status);
		st.setString(5, emp_id);
		int rs=st.executeUpdate();
		if(rs>0)
		{
			res_msg="yes";
		}
	}
		catch(Exception e)
		{
			System.out.println("problem in updating the admin_acceptance");
			e.printStackTrace();
		}
		finally{
			st.close();
			con.close();
		}
return res_msg;
}*/