package com.ess.common.eseparation;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Admin_Comments_Mail {

	static Properties properties = new Properties();
	   static
	   {
		   properties.put("mail.smtp.auth", "true");
		   properties.put("mail.smtp.starttls.enable", "true");
		   properties.put("mail.smtp.host", "smtp.office365.com");
		   properties.put("mail.smtp.port", "587");
		 
	   }
	   public String mail_admin_status(String emp_mail,String comments) 
	   {
		   
		   
	      String ret = "no";
	      try
	      {
	    	  System.out.println(" sending the mail  in e-separation phases in admin class only commetns "); 
	         Session session = Session.getDefaultInstance(properties,  
	            new javax.mail.Authenticator() {
	            protected PasswordAuthentication 
	            getPasswordAuthentication() {
	            return new 
	            PasswordAuthentication("essadmin@Clocksoft.info", "admin@123");
	            }});

	         Message message = new MimeMessage(session);
	         message.setFrom(new InternetAddress("essadmin@Clocksoft.info"));//sender information
	         message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emp_mail));
	         //message.addRecipients(Message.RecipientType.CC, InternetAddress.parse("amaranath@clocksof));//cc persons names
	         
	         
	         message.setSubject("e-Separation:mail from Admin");
	         
	         message.setText("Mail from  Admin ,\n comments is "+comments+" \n\nThanks & Regards"+"\n Admin Team ");
	         Transport.send(message);
	         ret = "yes";
	      }
	      catch(Exception e)
	      {
	    	  ret = "no";
	    	  System.out.println(" probelm sending the mail  in e-separation phases in admin class"); 
	         e.printStackTrace();
	      }
	      return ret;
	   }
}
