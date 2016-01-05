package com.ess.common.action;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class RegularizationMailsend {
	
	static Properties properties = new Properties();
	   static
	   {
	     
		   properties.put("mail.smtp.auth", "true");
		   properties.put("mail.smtp.starttls.enable", "true");
		   properties.put("mail.smtp.host", "smtp.office365.com");
		   properties.put("mail.smtp.port", "587");
		 
	   }
 public static void executeMail_leave(String empid,Object startdate,String e_mailid,String rm_mailid,String status) 
	   
	   {
	try{
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
	         message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(e_mailid));
	         message.addRecipients(Message.RecipientType.CC, InternetAddress.parse("yogesh@clocksoft.info"));//cc persons names
	         
	         
	         //System.out.println("to address:"+toAddress);
	         message.setSubject("Regularization Status");
	         System.out.println("personal mail id"+e_mailid);
	         System.out.println("manager mail id"+rm_mailid);
	         
	         message.setText("Regularization Reply:\n\n Empid=  "+empid+",\n Date is="+startdate+",\n Status is="+status+".\n\n\nThanks & Regards"+"\n "+rm_mailid+" ");
	         Transport.send(message);
	      }
	      catch(Exception e)
	      {
	         System.out.println("problem to send a mail");
	         e.printStackTrace();
	      }
	}
	 
	 

public static void main(String args[])
{
	RegularizationMailsend.executeMail_leave("CSSE150059","2015-10-10","amaranath@clocksoft.info", "yogesh@clocksoft.info","Approved");
}
}