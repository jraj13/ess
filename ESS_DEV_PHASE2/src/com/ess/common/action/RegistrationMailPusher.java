package com.ess.common.action;

import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RegistrationMailPusher  extends ActionSupport{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String toAddress;
	   private String ccAddress;

	   public String getToAddress() {
		      return toAddress;
		   }

		   public void setToAddress(String toAddress) {
		      this.toAddress = toAddress;
		   }

			public String getCcAddress() {
				return ccAddress;
			}

			public void setCcAddress(String ccAddress) {
				this.ccAddress = ccAddress;
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

	   public String executeMailRegister(String emp_id,String emp_per_mailid,String emp_aff_mailid) 
	   {
	      String ret = SUCCESS;
	      String id=emp_id;
	      System.out.println("id.."+id);
	      String old_mail=emp_per_mailid;
	      System.out.println("old_mail.."+old_mail);
	      String new_mail=emp_aff_mailid;
	      System.out.println("new_mail.."+new_mail);
	      
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
			     
	         message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(old_mail));
	         message.addRecipients(Message.RecipientType.CC, InternetAddress.parse("amaranath@clocksoft.info"));
	         
	         /*System.out.println("to address:"+toAddress); */	  
	         message.setSubject("Welcom To NCSS");
	         
	         message.setText("Registration Successfully ! "+"\n\nHi  Your new User name "+new_mail+",\n\n And your  password is "+id+"  "+"\n\n\n\n\n\nThanks & Regards"+"\nHR Team. ");
	         
	         Transport.send(message);
	         
	      }
	      catch(Exception e)
	      {
	         ret = ERROR;
	         e.printStackTrace();
	      }
	      return ret;
	   }

	
}
