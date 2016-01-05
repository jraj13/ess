package com.ess.common.action;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.opensymphony.xwork2.ActionSupport;
public class MailPush extends ActionSupport {

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

	   public String execute() 
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
	         message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toAddress));
	         message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(ccAddress));
	         
	         System.out.println("to address:"+toAddress);
	         message.setSubject("SampleCode");
	         message.setText("Hi This Mail Is An Automated. So Do Not Give Reply To This Please");
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


