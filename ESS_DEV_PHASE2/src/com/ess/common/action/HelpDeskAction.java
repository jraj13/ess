package com.ess.common.action;

import com.ess.common.bean.HelpDeskBean;
import com.ess.common.bean.LoginActionBean;
import com.ess.common.util.MyDataSource;
import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.io.IOException;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
import javax.sql.DataSource;




import javax.xml.bind.DatatypeConverter;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;


public class HelpDeskAction extends ActionSupport implements SessionAware{

  private static final long serialVersionUID = 1L;
  private Map<String, String> session;
  private HelpDeskBean helpdeskBean;

public static final String ADMIN = "admin";
  public static final String HR = "hr";
  public static final String EMPLOYEE = "employee";
  public static final String MANAGER = "manager";
  public static final String SANCTIONING_AUTHORITY="sanctioning_authority";
  public static final String ACCOUNTANT="accountant";
  
  
  private String hdCategory;
	private String hdQuery;
	private String hdAttachment;
	private String mailid;
	private String empid;
	
	
	
 public String getHdCategory() {
		return hdCategory;
	}

	public void setHdCategory(String hdCategory) {
		this.hdCategory = hdCategory;
	}


	public String getHdQuery() {
		return hdQuery;
	}


	public void setHdQuery(String hdQuery) {
		this.hdQuery = hdQuery;
	}
	public String getHdAttachment() {
		return hdAttachment;
	}

	public void setHdAttachment(String hdAttachment) {
		this.hdAttachment = hdAttachment;
	}


	public String getMailid() {
		return mailid;
	}


	public void setMailid(String mailid) {
		this.mailid = mailid;
	}

	public String getEmpid() {
		return empid;
	}

	public void setEmpid(String empid) {
		this.empid = empid;
	}



// private String LoginSQL = "SELECT * FROM NCSS_RBA r,NCSS_EMP_MASTER_INFO m where r.ROLE_ID=m.ROLE_ID and m.EMP_MAILID=? and m.EMP_ID=? and STATUS='Active' ";
  private String HelpDeskSQL = "insert into NCSS_EMP_HELP_DESK(HELP_DESK_CATEGORY,HELP_DESK_QUERY,ATTACHMENT,EMP_ID,EMP_MAILID) values(?,?,?,?,?)";
 
  public String helpdesk() {
    System.out.println("Calling Login method for loginAction  ");
    String ret = "success";
    Connection conn = null;
    
    try
    {
      DataSource dataSource = MyDataSource.getInstance();
      conn = GetConnection.getConnection();
      System.out.println("HelpDeskSQL.."+HelpDeskSQL);
      PreparedStatement st = conn.prepareStatement(this.HelpDeskSQL);
      
      System.out.println("getHdCategory.."+getHdCategory());
      System.out.println("getHdQuery.."+getHdQuery());
      System.out.println("getHdAttachment.."+getHdAttachment());
      System.out.println("getEmpid.."+getEmpid());
      System.out.println("getMailid.."+getMailid());
    
      st.setString(1, getHdCategory());
      st.setString(2, getHdQuery().trim());
      st.setString(3, getHdAttachment());
      st.setString(4, getEmpid());
      st.setString(5, getMailid());
      
      
     /* Object id=session.put("loginid",getHdCategory());
      System.out.println("getHdCategory.."+id);
      Object id2=session.put("loginid",getHdQuery());
      System.out.println("getHdQuery.."+id2);
      Object id3=session.put("loginid",getHdAttachment());
      System.out.println("getHdAttachment.."+id3);
      Object id4=session.put("loginid",getEmpid().toUpperCase());
      System.out.println("getEmpid.."+id4);
      Object id5=session.put("loginid",getMailid().toUpperCase());
      System.out.println("getMailid.."+id5);*/
      
      int rs = st.executeUpdate();
    		  
    		  if(rs>0){
    			  
    			  ret = "hr";
    			 // ret = "success"; 
    		  }
    		  else 
    		  {

			/* addActionError("User Name And Password are wrong ! Try Again");
			    System.out.println("User Name And Password are wrong ! Try Again");*/
			
			    ret = "error";
    		  } 
    }
    catch (Exception e) {
      e.printStackTrace();
      ret = "error";
    } finally {
      if (conn != null)
        try {
          conn.close();
        }
        catch (Exception localException2) {
        }
    }
    return ret;
  }
  
  

  
  
  public String home()
  {
	  System.out.println("calling  home method");
	/* ((SessionMap)this.session).invalidate();*/
	  return SUCCESS;
  }
  
 public String helpdesk1(){
	 System.out.println("calling helpdesk1 method");
	 return SUCCESS;
 }
 
  public Map getSession()
  {
    return this.session;
  }

  public void setSession(Map session) {
    this.session = session;
  }


public void setHelpdeskBean(HelpDeskBean helpdeskBean) {
	this.helpdeskBean = helpdeskBean;
}


public String helpdeskreportSave(String hdCategory,String hdQuery,String hdAttachment,String mailid,String empid,Object current_date,String status) throws UnsupportedEncodingException{
	
	System.out.println("helpdeskreportSave method calling");
	String helpdesksave="";
	System.out.println("hdAttachment.."+hdAttachment);
	
	Connection con=null;
	Statement stmt=null;
	
	/*  byte[] message = hdAttachment.getBytes("UTF-8");
	     String encoded = DatatypeConverter.printBase64Binary(message);*/
	     
	String sql="insert into NCSS_EMP_HELP_DESK(HELP_DESK_CATEGORY,HELP_DESK_QUERY,ATTACHMENT,EMP_MAILID,EMP_ID,QUERY_DATE,STATUS) values('"+hdCategory+"', '"+hdQuery+"', utl_raw.cast_to_raw('"+hdAttachment+"'), '"+mailid+"', '"+empid+"','"+current_date+"','"+status+"')";
	/*String sql="insert into NCSS_EMP_HELP_DESK(ATTACHMENT) values(utl_raw.cast_to_raw('"+encoded+"'))";*/
	System.out.println("sql.."+sql);
	try {
		
		con=GetConnection.getConnection();
		stmt=con.createStatement();
		
		int rs=stmt.executeUpdate(sql);
		
		if(rs>0){
			helpdesksave="Query submitted successfully";
			
			HelpDeskAction obj=new HelpDeskAction();
			obj.executeMailHelpDeskReq(mailid, hdCategory);
			
			
		}
		else{
			helpdesksave="please try again";
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		helpdesksave="internal problem";
	}
	
	return helpdesksave;
	
}

public String helpdesk_reviewUpdate(int sno, String helpdeskcat, String status, String remarks, String mailid) throws UnsupportedEncodingException{
	
	System.out.println("helpdesk_reviewUpdate method calling");
	String helpdesksave="";
	
	Connection con=null;
	Statement stmt=null;
	
	String sql="update NCSS_EMP_HELP_DESK set STATUS='"+status+"',REMARKS='"+remarks+"' where SNO='"+sno+"'";
	System.out.println("sql.."+sql);
	try {
		
		con=GetConnection.getConnection();
		stmt=con.createStatement();
		
		int rs=stmt.executeUpdate(sql);
		
		if(rs>0){
			helpdesksave="Help desk review updated";
			
			HelpDeskAction obj=new HelpDeskAction();
			obj.MailHelpDesk_reviewupdate(mailid, helpdeskcat,status,remarks);
		}
		else{
			helpdesksave="please try again";
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		helpdesksave="internal problem";
	}
	
	return helpdesksave;
	
}




static Properties properties = new Properties();
static
{
   /*properties.put("mail.smtp.host", "smtp.gmail.com");
   properties.put("mail.smtp.socketFactory.port", "465");
   properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
   properties.put("mail.smtp.auth", "true");
   properties.put("mail.smtp.port", "465");*/
	   properties.put("mail.smtp.auth", "true");
	   properties.put("mail.smtp.starttls.enable", "true");
	   properties.put("mail.smtp.host", "smtp.office365.com");
	   properties.put("mail.smtp.port", "587");
	 
}
public String executeMailHelpDeskReq(String mailid,String hdCategory)
{
   String ret = SUCCESS;
   try
   {
      Session session = Session.getDefaultInstance(properties,  
         new javax.mail.Authenticator() {
         protected PasswordAuthentication 
         getPasswordAuthentication() {
         return new 
         		
         		PasswordAuthentication("essadmin@Clocksoft.info", "admin@123");
         }});

      Message message = new MimeMessage(session);
      message.setFrom(new InternetAddress("essadmin@Clocksoft.info"));
      Map session1 = ActionContext.getContext().getSession();  
			//Map session =(Map) ActionContext.getContext().get("session");  

      /*  String id= (String) session1.get("new_mail");
		      String names[]=id.split("\\@");
		      String id1=names[0];
		      */
		     
      message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailid));
      message.addRecipients(Message.RecipientType.CC, InternetAddress.parse("yogesh@clocksoft.info"));
      
      message.setSubject("Help Desk Initiated");
     
      message.setText(" \nHi Dear,  \n       Your request is submit related to "+hdCategory+", we will try to solve ASAP.  "+"\n\n\n\n\n\n Regards"+"\n ESS Team. ");
      
      Transport.send(message);
      
   }
   catch(Exception e)
   {
      ret = ERROR;
      e.printStackTrace();
   }
   return ret;
}


public String MailHelpDesk_reviewupdate(String mailid, String helpdeskcat,String status,String remarks)
{
   String ret = SUCCESS;
   try
   {
      Session session = Session.getDefaultInstance(properties,  
         new javax.mail.Authenticator() {
         protected PasswordAuthentication 
         getPasswordAuthentication() {
         return new 
         		
         		PasswordAuthentication("essadmin@Clocksoft.info", "admin@123");
         }});

      Message message = new MimeMessage(session);
      message.setFrom(new InternetAddress("essadmin@Clocksoft.info"));
      Map session1 = ActionContext.getContext().getSession();  
			//Map session =(Map) ActionContext.getContext().get("session");  

      /*  String id= (String) session1.get("new_mail");
		      String names[]=id.split("\\@");
		      String id1=names[0];
		      */
		     
      message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailid));
      message.addRecipients(Message.RecipientType.CC, InternetAddress.parse("yogesh@clocksoft.info"));
      
      message.setSubject("Help Desk Status");

      if(status.equalsIgnoreCase("Inprocess"))
      {
      message.setText(" \nHi,  \nYour raised ticket  related to "+helpdeskcat+" is inprocess. We will try to solve ASAP.  "+"\n\n\n\n\n\n Regards"+"\n ESS Team. ");
     }
     else{
    	 message.setText(" \nHi,  \nYour raised ticket  related to "+helpdeskcat+" has been solved.  "+"\n\n\n\n\n\n Regards"+"\n ESS Team. ");
     }
      Transport.send(message);
      
   }
   catch(Exception e)
   {
      ret = ERROR;
      e.printStackTrace();
   }
   return ret;
}


public static ArrayList<Object> fetchHDTypeDetails() throws SQLException{
	ArrayList<Object> helpdesktype=new ArrayList<Object>();
	
	String empQRY="select HELP_DESK_CATEGORY, count(HELP_DESK_CATEGORY) as count from NCSS_EMP_HELP_DESK group by HELP_DESK_CATEGORY";
	Connection con = GetConnection.getConnection();
	System.out.println("connection" + con);
	Statement stmt = con.createStatement();
	ResultSet rst = null;
	
	
	try {
		System.out.println("inside the method====");
		rst = stmt.executeQuery(empQRY);
		  
		String helpdeskcat = "";
		String count="";
	
		while (rst.next()) {

			
			helpdeskcat = rst.getString("HELP_DESK_CATEGORY");
			count = rst.getString("count");
					
			
			String finalResponse = helpdeskcat + "^"
					+ count ;
			
			helpdesktype.add(finalResponse);
			// System.out.println("final result=============" + finalResponse);
		}
	} catch (Exception ex) {
		ex.printStackTrace();

	} finally {
		con.close();
	}
	
	
	return helpdesktype;
	
}

public static ArrayList<Object> fetch_Perticular_HDTypeDetails(String help_desk_type) throws SQLException{
	ArrayList<Object> helpdesktype=new ArrayList<Object>();
	
	String empQRY = "select SNO,HELP_DESK_CATEGORY,HELP_DESK_QUERY,ATTACHMENT,EMP_ID,EMP_MAILID,STATUS,QUERY_DATE,REMARKS from NCSS_EMP_HELP_DESK where HELP_DESK_CATEGORY='"+help_desk_type+"'  ";

	Connection con = GetConnection.getConnection();
	System.out.println("connection" + con);
	Statement stmt = con.createStatement();
	ResultSet rst = null;
	
	
	try {
		System.out.println("inside thefetch_Perticular_HDTypeDetails method===="+empQRY);
		rst = stmt.executeQuery(empQRY);
		  
		int sno;
		String helpdeskcat = "";
		String helpdeskqry = "";
		String attachment = "";
		String empid = "";
		String mailid = "";
		String status = "";
		Date qrydate;
		String remarks = "";

		while (rst.next()) {

			sno = rst.getInt("SNO");
			helpdeskcat = rst.getString("HELP_DESK_CATEGORY");
			helpdeskqry = rst.getString("HELP_DESK_QUERY");
			attachment = rst.getString("ATTACHMENT");
			empid = rst.getString("EMP_ID");
			mailid = rst.getString("EMP_MAILID");
			status = rst.getString("STATUS");
			if(status==null){
				status=" ";
			}
			System.out.println("status.."+status);
			qrydate = rst.getDate("QUERY_DATE");
			
			remarks = rst.getString("REMARKS");
			if(remarks==null){
				remarks=" ";
			}
			
			String finalResponse = sno + "^" + helpdeskcat + "^"
					+ helpdeskqry + "^" + attachment + "^" +   empid + "^" +  mailid + "^" + status + "^" +   qrydate + "^" +  remarks;
			helpdesktype.add(finalResponse);
			// System.out.println("final result=============" + finalResponse);
		}
	} catch (Exception ex) {
		ex.printStackTrace();

	} finally {
		con.close();
	}
	
	
	return helpdesktype;
	
}

public static ArrayList<Object> fetch_Perticular_HD_empdeetails(int s_no) throws SQLException{
	ArrayList<Object> helpdesktype=new ArrayList<Object>();
	
	String empQRY = "select SNO,HELP_DESK_CATEGORY,HELP_DESK_QUERY,ATTACHMENT,EMP_ID,EMP_MAILID,STATUS,QUERY_DATE,REMARKS from NCSS_EMP_HELP_DESK where SNO="+s_no+"  ";

	Connection con = GetConnection.getConnection();
	System.out.println("connection" + con);
	Statement stmt = con.createStatement();
	ResultSet rst = null;
	
	
	try {
		System.out.println("inside thefetch_Perticular_HDTypeDetails method===="+empQRY);
		rst = stmt.executeQuery(empQRY);
		  
		int sno;
		String helpdeskcat = "";
		String helpdeskqry = "";
		String attachment = "";
		String empid = "";
		String mailid = "";
		String status = "";
		Date qrydate;
		String remarks = "";

		while (rst.next()) {

			sno = rst.getInt("SNO");
			helpdeskcat = rst.getString("HELP_DESK_CATEGORY");
			helpdeskqry = rst.getString("HELP_DESK_QUERY");
			attachment = rst.getString("ATTACHMENT");
			if(attachment==null){
				attachment=" ";
			}
			empid = rst.getString("EMP_ID");
			mailid = rst.getString("EMP_MAILID");
			status = rst.getString("STATUS");
			if(status==null){
				status=" ";
			}
			qrydate = rst.getDate("QUERY_DATE");
			
			remarks = rst.getString("REMARKS");
			if(remarks==null){
				remarks=" ";
			}
			
			String finalResponse = sno + "^" + helpdeskcat + "^"
					+ helpdeskqry + "^" + attachment + "^" +   empid + "^" +  mailid + "^" + status + "^" +   qrydate + "^" +  remarks;
			helpdesktype.add(finalResponse);
			// System.out.println("final result=============" + finalResponse);
		}
	} catch (Exception ex) {
		ex.printStackTrace();

	} finally {
		con.close();
	}
	
	
	return helpdesktype;
	
}


public static String  types_of_incometax_ticket() throws SQLException{
	
	String empQRY = "select count(emp_id) as count_id from NCSS_EMP_HELP_DESK where HELP_DESK_CATEGORY='Income Tax' ";

	Connection con = GetConnection.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rst = null;
	
	String tot_count =null;
	try {
		System.out.println("inside the method===="+empQRY);
		rst = stmt.executeQuery(empQRY);
		System.out.println("rst.."+rst);
		
		if(rst.next())
		{
			tot_count=rst.getString("count_id");
			
		}
		
	} catch (Exception ex) {
		ex.printStackTrace();

	} finally {
		con.close();
	}
	
	
	return tot_count;
	
}


public static String  types_of_empinfo_ticket() throws SQLException{
	
	String empQRY = "select count(emp_id) as count_id from NCSS_EMP_HELP_DESK where HELP_DESK_CATEGORY='Employee Information' ";

	Connection con = GetConnection.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rst = null;
	
	String tot_count =null;
	try {
		System.out.println("inside the method===="+empQRY);
		rst = stmt.executeQuery(empQRY);
		System.out.println("rst.."+rst);
		
		if(rst.next())
		{
			tot_count=rst.getString("count_id");
			
		}
		
	} catch (Exception ex) {
		ex.printStackTrace();

	} finally {
		con.close();
	}
	
	
	return tot_count;
	
}

public static String  types_of_payslip_ticket() throws SQLException{
	
	String empQRY = "select count(emp_id) as count_id from NCSS_EMP_HELP_DESK where HELP_DESK_CATEGORY='Payslip'";

	Connection con = GetConnection.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rst = null;
	
	String tot_count =null;
	try {
		System.out.println("inside the method===="+empQRY);
		rst = stmt.executeQuery(empQRY);
		System.out.println("rst.."+rst);
		
		if(rst.next())
		{
			tot_count=rst.getString("count_id");
			
		}
		
	} catch (Exception ex) {
		ex.printStackTrace();

	} finally {
		con.close();
	}
	
	
	return tot_count;
	
}

public static String  types_of_atndleave_ticket() throws SQLException{
	
	String empQRY = "select count(emp_id) as count_id from NCSS_EMP_HELP_DESK where HELP_DESK_CATEGORY='Attendance/Leave'";

	Connection con = GetConnection.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rst = null;
	
	String tot_count =null;
	try {
		System.out.println("inside the method===="+empQRY);
		rst = stmt.executeQuery(empQRY);
		System.out.println("rst.."+rst);
		
		if(rst.next())
		{
			tot_count=rst.getString("count_id");
			
		}
		
	} catch (Exception ex) {
		ex.printStackTrace();

	} finally {
		con.close();
	}
	
	
	return tot_count;
	
}

public static String  types_of_travelmgmt_ticket() throws SQLException{
	
	String empQRY = "select count(emp_id) as count_id from NCSS_EMP_HELP_DESK where HELP_DESK_CATEGORY='Travel Management'";

	Connection con = GetConnection.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rst = null;
	
	String tot_count =null;
	try {
		System.out.println("inside the method===="+empQRY);
		rst = stmt.executeQuery(empQRY);
		System.out.println("rst.."+rst);
		
		if(rst.next())
		{
			tot_count=rst.getString("count_id");
			
		}
		
	} catch (Exception ex) {
		ex.printStackTrace();

	} finally {
		con.close();
	}
	
	return tot_count;
	
}

public static String  types_of_fnfsettlement_ticket() throws SQLException{
	
	String empQRY = "select count(emp_id) as count_id from NCSS_EMP_HELP_DESK where HELP_DESK_CATEGORY='F and F Settlement'";

	Connection con = GetConnection.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rst = null;
	
	String tot_count =null;
	try {
		System.out.println("inside the method===="+empQRY);
		rst = stmt.executeQuery(empQRY);
		System.out.println("rst.."+rst);
		
		if(rst.next())
		{
			tot_count=rst.getString("count_id");
			
		}
		
	} catch (Exception ex) {
		ex.printStackTrace();

	} finally {
		con.close();
	}
	
	return tot_count;
	
}

public static String  types_of_others_ticket() throws SQLException{
	
	String empQRY = "select count(emp_id) as count_id from NCSS_EMP_HELP_DESK where HELP_DESK_CATEGORY='Others'";

	Connection con = GetConnection.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rst = null;
	
	String tot_count =null;
	try {
		System.out.println("inside the method===="+empQRY);
		rst = stmt.executeQuery(empQRY);
		System.out.println("rst.."+rst);
		
		if(rst.next())
		{
			tot_count=rst.getString("count_id");
			
		}
		
	} catch (Exception ex) {
		ex.printStackTrace();

	} finally {
		con.close();
	}
	
	return tot_count;
	
}



}