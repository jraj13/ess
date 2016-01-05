package com.ess.common.action;

import java.io.IOException;
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
import java.util.Properties;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;



import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.ess.util.GetConnection;

public class CryptoUtil {
	
	static Properties properties = new Properties();
	   static
	   {
		   properties.put("mail.smtp.auth", "true");
		   properties.put("mail.smtp.starttls.enable", "true");
		   properties.put("mail.smtp.host", "smtp.office365.com");
		   properties.put("mail.smtp.port", "587");
		 
	   }
	
	



Cipher ecipher;
Cipher dcipher;
// 8-byte Salt
byte[] salt = {
    (byte) 0xA9, (byte) 0x9B, (byte) 0xC8, (byte) 0x32,
    (byte) 0x56, (byte) 0x35, (byte) 0xE3, (byte) 0x03
};
// Iteration count
int iterationCount = 19;

	
public String result="SUCCESS";






	
public String execute(String emp_id_pswod) throws InvalidKeyException, NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException, IOException, SQLException
{
	
	
	//registation the employee

    CryptoUtil cryptoUtil=new CryptoUtil();
    String key="NCSS_Bangalore";   
    String plain=emp_id_pswod;
    
    String enc=cryptoUtil.encrypt(key, plain);
    System.out.println("Original text: "+plain);
    System.out.println("Encrypted text: "+enc);
    
    
   /* 
    String plainAfter=cryptoUtil.decrypt(key, enc);
    System.out.println("Original text after decryption: "+plainAfter);*/
    
   /* Connection con=null;
	Statement st=null;
    int rs=0;
	
	String insert_sql="insert into LOGIN_TABLE(USER_MAIL_ID,PASSWORD,ORIGINAL_PASSWORD,MODIFIED_DATE) values('"+getUname()+"','"+enc+"','"+getPassword()+"',sysdate)";
	 * 
    
    String insert_sql="insert into NCSS_EMP_MASTER_INFO(USER_MAIL_ID,PASSWORD,ORIGINAL_PASSWORD,MODIFIED_DATE) values('"+getUname()+"','"+enc+"','"+getPassword()+"',sysd"
    		+ "ate)";
    
    try{
    	
    	con=GetConnection.getConnection();
    	st=con.createStatement();
    	rs=st.executeUpdate(insert_sql);
    	if(rs>0)
    	{
    		result="SUCCESS";
    		System.out.println("Registation successfully in a table");
    	}
    	
    }
    
    catch(Exception e)
    {
    	result="EROOR";
    	System.out.println("Registation successfully");
    	e.printStackTrace();
    }
    
    finally{
    st.close();
    con.close();
    }
    */
    
    
	
	return enc;
}


/**
 * 
 * @param secretKey Key used to encrypt data
 * @param plainText Text input to be encrypted
 * @return Returns encrypted text
 * 
 */
public String encrypt(String secretKey, String plainText) 
        throws NoSuchAlgorithmException, 
        InvalidKeySpecException, 
        NoSuchPaddingException, 
        InvalidKeyException,
        InvalidAlgorithmParameterException, 
        UnsupportedEncodingException, 
        IllegalBlockSizeException, 
        BadPaddingException{
    //Key generation for enc and desc
    KeySpec keySpec = new PBEKeySpec(secretKey.toCharArray(), salt, iterationCount);
    SecretKey key = SecretKeyFactory.getInstance("PBEWithMD5AndDES").generateSecret(keySpec);        
     // Prepare the parameter to the ciphers
    AlgorithmParameterSpec paramSpec = new PBEParameterSpec(salt, iterationCount);

    //Enc process
    ecipher = Cipher.getInstance(key.getAlgorithm());
    ecipher.init(Cipher.ENCRYPT_MODE, key, paramSpec);  
    String charSet="UTF-8";       
    byte[] in = plainText.getBytes(charSet);
    byte[] out = ecipher.doFinal(in);
    String encStr=new sun.misc.BASE64Encoder().encode(out);
    return encStr;
}
 /**     
 * @param secretKey Key used to decrypt data
 * @param encryptedText encrypted text input to decrypt
 * @return Returns plain text after decryption
 */
public String decrypt(String secretKey, String encryptedText)
 throws NoSuchAlgorithmException, 
        InvalidKeySpecException, 
        NoSuchPaddingException, 
        InvalidKeyException,
        InvalidAlgorithmParameterException, 
        UnsupportedEncodingException, 
        IllegalBlockSizeException, 
        BadPaddingException, 
        IOException{
     //Key generation for enc and desc
    KeySpec keySpec = new PBEKeySpec(secretKey.toCharArray(), salt, iterationCount);
    SecretKey key = SecretKeyFactory.getInstance("PBEWithMD5AndDES").generateSecret(keySpec);        
     // Prepare the parameter to the ciphers
    AlgorithmParameterSpec paramSpec = new PBEParameterSpec(salt, iterationCount);
    //Decryption process; same key will be used for decr
    dcipher=Cipher.getInstance(key.getAlgorithm());
   dcipher.init(Cipher.DECRYPT_MODE, key,paramSpec);
    byte[] enc = new sun.misc.BASE64Decoder().decodeBuffer(encryptedText);
    byte[] utf8 = dcipher.doFinal(enc);
    String charSet="UTF-8";     
    String plainStr = new String(utf8, charSet);
    return plainStr;
}    




/*
public String login_encrypt_data() throws SQLException, InvalidKeyException, NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidAlgorithmParameterException, UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException
{
	System.out.println("login information by ********************** employee");
	
	Connection con=null;
	Statement  pst=null;
    ResultSet rs=null;
    
    CryptoUtil cryptoUtil=new CryptoUtil();
    String key="NCSS_Bangalore";   
   // String plain="CSSE150059";
    String plain=getPassword();
    
    String enc=cryptoUtil.encrypt(key, plain);
    System.out.println("Original text: "+plain);
    System.out.println("Encrypted text: "+enc);
    
	
	String select_sql="select EMP_ID,(sysdate-MODIFIED_DATE) as diff from LOGIN_TABLE where USER_MAIL_ID='"+getUname()+"' and PASSWORD='"+enc+"'";
    try{
    	
    	con=GetConnection.getConnection();
    	pst=con.createStatement();
    	
    	rs=pst.executeQuery(select_sql);
    	
    	
    	System.out.println("the query is"+select_sql);
    	
    	System.out.println("rs is"+rs);
    	
    	if(rs.next() && rs.getInt(1)>0)
    	if(rs.next())
    	{
    		result="SUCCESS";
    		System.out.println("User exist login successfully");
    		String sequence_id=rs.getString(1);
    		System.out.println("sequence id is"+sequence_id);
    		
    		int difference=rs.getInt(2);
    		System.out.println("Date difference is"+difference);
    		if(difference>30)
    		{
    			System.out.println("your password is expired");
    			
    		}
    		else
    		{
    			System.out.println("not expired cary on");
    		}
    		
    	}
    	
    	else
    	{
    		System.out.println("user not exist in login information");
    	}
    }
    
    catch(Exception e)
    {
    	result="EROOR";
    	System.out.println("problem in login insertion");
    	e.printStackTrace();
    }
    
    finally{
    	pst.close();
    con.close();
    }
    
	
	return result;
}



public String forgot_data() throws SQLException, InvalidKeyException, NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidAlgorithmParameterException, UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException
{
	System.out.println("this is forgot password information");
	
	Connection con=null;
	PreparedStatement  pst=null;
    ResultSet rs=null;
    
    CryptoUtil cryptoUtil=new CryptoUtil();
    String key="NCSS_Bangalore";   
   // String plain="CSSE150059";
   
    
    String enc=cryptoUtil.encrypt(key, plain);
    System.out.println("Original text: "+plain);
    System.out.println("Encrypted text: "+enc);
    
    
	
	String select_sql="select SEQ_ID,PASSWORD from LOGIN_TABLE where USER_MAIL_ID=? ";
    try{
    	
    	con=GetConnection.getConnection();
    	pst=con.prepareStatement(select_sql);
    	
    	pst.setString(1, getUname());
    	
    	
    	rs=pst.executeQuery();
    	
    	String password_first=null;
    	
    	if(rs.next() && rs.getInt("SEQ_ID")>0)
    	{
    		password_first=rs.getString("PASSWORD");
    		
    		System.out.println("table existing password"+password_first);
    		
    		String passord_password=cryptoUtil.decrypt(key, password_first );
    		
    		String mail_reply=cryptoUtil.mail_admin_status(getUname(), passord_password);
    		
    		System.out.println("mail reply"+mail_reply);
    		result= "SUCCESS";
    		
    	}
    	
    	else
    	{
    		System.out.println("in forgot password user not exist");
    	}
    }
    
    catch(Exception e)
    {
    	result="EROOR";
    	System.out.println("error in forgot password");
    	e.printStackTrace();
    }
    
    finally{
    	pst.close();
    con.close();
    }
	return result;
}


public String mail_admin_status(String emp_mail,String original_password) 
{
	   
   String ret = "no";
   
   String emp_names[]=emp_mail.split("\\@");
   String emp_name=emp_names[0];
   
   try
   {
 	  System.out.println(" sending the mail  in in forgort password mail "); 
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
      
      message.setSubject("forgot password");
      
      message.setText("Dear "+emp_name+",\n your password is : "+original_password+" \n\nThanks & Regards"+"\n Admin Team ");
      Transport.send(message);
      ret = "yes";
   }
   catch(Exception e)
   {
 	  ret = "no";
 	  System.out.println(" probelm sending the mail  in forgot password"); 
      e.printStackTrace();
   }
   return ret;
}
*/
}
