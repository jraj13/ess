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
public class MailPusherAction extends ActionSupport {

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
	      properties.put("mail.smtp.socketFactory.class",
	                     "javax.net.ssl.SSLSocketFactory");
	      properties.put("mail.smtp.auth", "true");
	      properties.put("mail.smtp.port", "465");*/
		   properties.put("mail.smtp.auth", "true");
		   properties.put("mail.smtp.starttls.enable", "true");
		   properties.put("mail.smtp.host", "smtp.office365.com");
		   properties.put("mail.smtp.port", "587");
		 
	   }

	   public String executeMail() 
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
				

			      String id= (String) session1.get("loginid");
			      String names[]=id.split("\\@");
			      String id1=names[0];
			      
			      
			     
	         message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(id));
	         message.addRecipients(Message.RecipientType.CC, InternetAddress.parse("amaranath@clocksoft.info"));
	         
	         System.out.println("to address:"+toAddress);
	         message.setSubject("SampleCode");
	         
	         message.setText("Investment Declaration mail:"+"\n\n To be sent once employee enters all the relevant details & uploads the necessary docs"+"\n\nHi "+id1+",\n\n\n Your investment declaration along with supporting docs has been successfully saved. Incase there is any clarification, in the details you have entered/ uploaded, we will get back to you. Also please be informed that the company is in no way associated with any of your ID details. If any discrepancy is found by government then it is solely your responsibility to clarify the same."+"\n"+id+"\n\n\n\n\n\nThanks & Regards"+"\nHR Team ");
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


