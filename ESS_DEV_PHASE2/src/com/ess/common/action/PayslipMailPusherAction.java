/*package com.ess.common.action;

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

public class PayslipMailPusherAction111 extends ActionSupport {
	
	
	
	
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
	      properties.put("mail.smtp.host", "smtp.gmail.com");
	      properties.put("mail.smtp.socketFactory.port", "465");
	      properties.put("mail.smtp.socketFactory.class",
	                     "javax.net.ssl.SSLSocketFactory");
	      properties.put("mail.smtp.auth", "true");
	      properties.put("mail.smtp.port", "465");
		   properties.put("mail.smtp.auth", "true");
		   properties.put("mail.smtp.starttls.enable", "true");
		   properties.put("mail.smtp.host", "smtp.office365.com");
		   properties.put("mail.smtp.port", "587");
		 
	   }

	   public String executeMail111() 
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
	         
	         message.setText("Choice Pay – Intro mail "+"\n\nHi "+id1+",\n\nWe are implementing choice pay so that your taxable amount is minimized; if you are interested, please send across a mail request to the HR."+"\n\n\n"+"Points to note:"+"\n•   HRA – House Rent Agreement Copy Xerox"+"\n•   Children Education – Permissible upto 2 kids only. Birth Certificate Xerox along with fees receipt"+"\n•   Fuel/ Maintenance – Your vehicle RC Original in softcopy along with fuel bills/ maintenance bills bearing the vehicle registration no. Maintenance bills should be sealed and duly signed."+"\n•   Mobile Bills – Only 1 number per employee provided the number is registered in employee’s name."+"\n•   Choice pay cannot be cancelled mid-year. Once you opt for choice pay, for the whole fiscal year choice pay will be applicable. If necessary you can opt out of choice pay from the next fiscal year."+"\n•         If relevant documents in proper format is not submitted then that particular amount will be deducted from your present month salary as illustrated above. "+"\n\n\n\n\n\nThanks & Regards"+"\nHR Team ");
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
*/