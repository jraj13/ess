package com.ess.common.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.sql.DataSource;

import com.ess.common.bean.LoginActionBean;
import com.ess.common.bean.RegistrationActionBean;
import com.ess.common.util.MyDataSource;
import com.opensymphony.xwork2.ActionSupport;

public class RegistrationAction extends ActionSupport
{
	
	private static final long serialVersionUID = 1L;
	public static final String SUCCESS = "success";
	public static final String ERROR = "error";
	public static final String DISPLAY = "display";
	
	private RegistrationActionBean regBean;
	
	public RegistrationActionBean getRegBean() {
		return regBean;
	}
	public void setRegBean(RegistrationActionBean regBean) {
		this.regBean = regBean;
	}
    public String display()
	{
		return DISPLAY;
	}
	
	public String register()
	{
		return SUCCESS;
			 
	}
	private String from;
	private String password;
	private String to;
	   private String subject;
	   private String body;
	   public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	 public String getTo() {
	      return to;
	   }

	   public void setTo(String to) {
	      this.to = to;
	   }

	   public String getSubject() {
	      return subject;
	   }

	   public void setSubject(String subject) {
	      this.subject = subject;
	   }

	   public String getBody() {
	      return body;
	   }
	
	static Properties properties = new Properties();
	   static
	   {
	      /*properties.put("mail.smtp.host", "smtp.gmail.com");
	      properties.put("mail.smtp.socketFactory.port", "465");
	      properties.put("mail.smtp.socketFactory.class",
	                     "javax.net.ssl.SSLSocketFactory");
	      properties.put("mail.smtp.auth", "true");
	      properties.put("mail.smtp.port", "465");*/
		   properties.put("mail.smtp.host", "smtp.office365.com");
		   properties.put("mail.smtp.socketFactory.port", "587");
		      properties.put("mail.smtp.socketFactory.class","javax.net.tls.TLSSocketFactory");
		      properties.put("mail.smtp.auth", "true");
		      properties.put("mail.smtp.port", "587");
	   }
	public String email()
	{
		 String ret = SUCCESS;
	      try
	      {
	         Session session = Session.getDefaultInstance(properties,  
	            new javax.mail.Authenticator() {
	            protected PasswordAuthentication 
	            getPasswordAuthentication() {
	            return new 
	            PasswordAuthentication("ramanji@clocksoft.info", "RamVenkat_007");
	            }});

	         Message message = new MimeMessage(session);
	         message.setFrom(new InternetAddress("ramanji@clocksoft.info"));
	         message.setRecipients(Message.RecipientType.TO, 
	            InternetAddress.parse(regBean.getEmailid()));
	         message.setSubject("New Employee Registration Details");
	         message.setText("Successfully created"+regBean.getFname()+" Details");
	         System.out.println("from mail:"+from);
	         System.out.println("to mail:"+to);
	         Transport.send(message);
	      }
	      catch(Exception e)
	      {
	         ret = ERROR;
	         e.printStackTrace();
	      }
	      return ret;
			 
	}
	
	
	//private String RegSQL = "INSERT INTO NCSS_EMP_REG_INFO VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?) INTO NCSS_EMP_PERSONAL_INFO VALUES(?,?,?,?,?,?,?,?) INTO NCSS_EMP_EDUCATION VALUES(?,?,?,?) INTO NCSS_EMP_PREV_ORG_INFO VALUES(?,?,?,?,?)";
	
	
	
	private String RegSQLReginfo = "INSERT INTO NCSS_EMP_REG_INFO VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	private String RegSQLPinfo = "INSERT INTO NCSS_EMP_PERSONAL_INFO VALUES(?,?,?,?,?,?,?,?,?,?,?,?) ";
	private String RegSQLEinfo = "INSERT INTO NCSS_EMP_EDUCATION VALUES(?,?,?,?,?,?,?,?,?,?,?,?) ";
	private String RegSQLPrevinfo = "INSERT INTO NCSS_EMP_PREV_ORG_INFO VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	
    public String regsuccess()
    {
		
        System.out.println("Calling insertion method");
		String ret = SUCCESS;
		Connection conn = null;
		//ResultSet rs=null;
		int rs=0;
		
		
		
		try
		{
			DataSource dataSource = MyDataSource.getInstance();
			conn = dataSource.getConnection();
			PreparedStatement st = conn.prepareStatement(RegSQLReginfo);	
			st.setString(1,regBean.getEmployeeid());
			st.setString(2,regBean.getFname());  
			st.setString(3,regBean.getLname());  
	        st.setDate(4, regBean.getDob());
			st.setString(5,regBean.getPannum());  
			st.setString(6,regBean.getPassportnum());  
			st.setString(7,regBean.getUid());  
			st.setString(8,regBean.getPhnumone());  
			st.setString(9,regBean.getPhnumtwo());  
			st.setString(10,regBean.getDesignation());  
			st.setString(11,regBean.getRmanager());  
			st.setString(12,regBean.getCtc());  
			st.setString(13,regBean.getEmailid());  
			st.setString(14,regBean.getVisainfo()); 
			st.setBlob(15, regBean.getImage());
			//inserting personal Employee details
			
			 rs=st.executeUpdate();
			 if(rs>0)
			 {
			PreparedStatement st1 = conn.prepareStatement(RegSQLPinfo);	
			//st1.setString(1, regBean.getEmployeeid());
			st1.setString(1, regBean.getMstatus());
			st1.setString(2, regBean.getMothername());
			st1.setString(3, regBean.getMotherdob());
			st1.setString(4, regBean.getSpousename());
			st1.setString(5, regBean.getSpousedob());
			st1.setString(6, regBean.getChildname1());
			st1.setDate  (7, regBean.getChilddob1());
			st1.setString(8, regBean.getChildname2());
			st1.setDate  (9, regBean.getChilddob2());
			st1.setString(10, regBean.getCurrentaddr());
			st1.setString(11, regBean.getPermaddr());
			st1.setString(12, regBean.getEmergcontact());
			 rs=st1.executeUpdate(); 
			 }
			
		
           //inserting  Employee Education details
			
			
			PreparedStatement st2 = conn.prepareStatement(RegSQLEinfo);	
			//st1.setString(1, regBean.getEmployeeid());
			st2.setString(1,regBean.getHiqualdeg1());
			st2.setString(2,regBean.getHiqualperc1());
			st2.setString(3,regBean.getHiqualpassout1());  
			  
			st2.setString(4,regBean.getHiqualdeg2());
			st2.setString(5,regBean.getHiqualperc2());
			st2.setString(6,regBean.getHiqualpassout2());  
			  
			st2.setString(7,regBean.getHiqualdeg3());
			st2.setString(8,regBean.getHiqualperc3());
			st2.setString(9,regBean.getHiqualpassout3());  
			  
			st2.setString(10,regBean.getCertifications1());
			st2.setString(11,regBean.getCertifications2());  
			st2.setString(12,regBean.getCertifications3());  
			 rs=st2.executeUpdate();
		
			 
	           //inserting Previous  Employee  details
			
			
				PreparedStatement st3 = conn.prepareStatement(RegSQLPrevinfo);	
				
				st3.setString(1,regBean.getExperience());
				st3.setString(2,regBean.getPreorgname1());  
				st3.setString(3,regBean.getYearsworked1());  
		        st3.setString(4, regBean.getRefname1());
				st3.setString(5,regBean.getRefmailid1());  
				st3.setString(6,regBean.getRefphnumber1());  
				st3.setString(7,regBean.getPreorgname2());  
				st3.setString(8,regBean.getYearsworked2());  
		        st3.setString(9, regBean.getRefname2());
				st3.setString(10,regBean.getRefmailid2());  
				st3.setString(11,regBean.getPreorgname3());  
				st3.setString(12,regBean.getYearsworked3());  
		        st3.setString(13, regBean.getRefname3());
				st3.setString(14,regBean.getRefmailid3());  
				 rs=st3.executeUpdate(); 
				
				
			
			
			//ResultSet rs = st.executeUpdate();
			System.out.println("resultset is:"+rs);
			
			 if(rs>0)

			{ 
				return SUCCESS;
		    }   
			else
			{
				return ERROR;
				//ret=ERROR;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ret;
	}
}
