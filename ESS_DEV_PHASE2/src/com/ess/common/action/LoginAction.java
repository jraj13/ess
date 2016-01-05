package com.ess.common.action;

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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;
import javax.sql.DataSource;






import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;



public class LoginAction extends ActionSupport implements SessionAware
{
  private static final long serialVersionUID = 1L;
  private Map<String, String> session;
  private LoginActionBean loginBean;
  public static final String ADMIN = "admin";
  public static final String HR = "hr";
  public static final String EMPLOYEE = "employee";
  public static final String MANAGER = "manager";
  public static final String SANCTIONING_AUTHORITY="sanctioning_authority";
  public static final String ACCOUNTANT="accountant";
  
 // private String LoginSQL = "SELECT * FROM NCSS_RBA r,NCSS_EMP_MASTER m where r.ROLE_ID=m.ROLE_ID and m.EMP_MAIL=? and m.PASSWORD=?";
 /* private String LoginSQL = "SELECT * FROM NCSS_RBA r,NCSS_EMP_MASTER_INFO m where r.ROLE_ID=m.ROLE_ID and m.EMP_MAILID=? and m.EMP_ID=? and STATUS='Active' ";
  public String login() {
    System.out.println("Calling Login method for loginAction  ");
    String ret = "success";
    Connection conn = null;
    
    try
    {
      DataSource dataSource = MyDataSource.getInstance();
      conn = GetConnection.getConnection();
      PreparedStatement st = conn.prepareStatement(this.LoginSQL);
      st.setString(1, this.loginBean.getUserId().toUpperCase());
      st.setString(2, this.loginBean.getPassword().toUpperCase());
      Object id=session.put("loginid",loginBean.getUserId().toUpperCase());
      Object id1=session.put("empid",loginBean.getPassword().toUpperCase());
      
      ResultSet rs = st.executeQuery();
      if (!rs.next())
      {

			 addActionError("User Name And Password are wrong ! Try Again");
			    System.out.println("User Name And Password are wrong ! Try Again");
			
        ret = "error";
      } else {
    	  session.put("loginid",loginBean.getUserId().toUpperCase());
    	  System.out.println("xzvcczxvxz"+loginBean.getUserId());
        ((SessionMap)this.session).invalidate();
        this.session = ActionContext.getContext().getSession();
        this.session.put("AUTHENTICATED", new Boolean(true));
    	  
        if (rs.getString("ROLE_NAME").equals("HR"))
        {
        	 Object hrsession= session.put("rolesession",rs.getString("ROLE_NAME").toUpperCase());
        	 System.out.println("hrsession..."+hrsession);  
        	 
        	 System.out.println("hr data");
          ret = "hr";
         
        }
        else if (rs.getString("ROLE_NAME").equals("ADMIN"))
        {
        	 Object adminsession= session.put("rolesession",rs.getString("ROLE_NAME").toUpperCase());
           	System.out.println("adminsession..."+adminsession);
          System.out.println("admin data");
          ret = "admin";
          
        }
        else if (rs.getString("ROLE_NAME").equals("MANAGER"))
        {
        	Object managersession= session.put("rolesession",rs.getString("ROLE_NAME").toUpperCase());
        	System.out.println("managersession..."+managersession);
          System.out.println("manager data");
          ret = "manager";
        }
        
        else if (rs.getString("ROLE_NAME").equals("SANCTIONING AUTHORITY"))
        {
        	Object sanctioning_authority_session= session.put("rolesession",rs.getString("ROLE_NAME").toUpperCase());
        	System.out.println("sanctioning_authority_session..."+sanctioning_authority_session);
          System.out.println("sanctioning_authority_session");
          ret = "sanctioning_authority";
        }
        
        else if (rs.getString("ROLE_NAME").equals("ACCOUNTANT"))
        {
        	Object accountant_session= session.put("rolesession",rs.getString("ROLE_NAME").toUpperCase());
        	System.out.println("accountant_session..."+accountant_session);
          System.out.println("accountant_session");
          ret = "accountant";
        }
        
        else
        {
        Object employeesession= session.put("rolesession",rs.getString("ROLE_NAME").toUpperCase());
        Object empdesign_session= session.put("design_session",rs.getString("EMP_DESIG").toUpperCase());
        	System.out.println("employeesession..."+employeesession);
        	System.out.println("empdesign_session..."+empdesign_session);
          System.out.println("employee data");
          ret = "employee";
        }
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
  */
  
  
  
  
  
  Cipher ecipher;
  Cipher dcipher;
  // 8-byte Salt
  byte[] salt = {
      (byte) 0xA9, (byte) 0x9B, (byte) 0xC8, (byte) 0x32,
      (byte) 0x56, (byte) 0x35, (byte) 0xE3, (byte) 0x03
  };
  // Iteration count
  int iterationCount = 19;
  
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



  
  public String login() throws SQLException, InvalidKeyException, NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException, IOException{
  
    System.out.println("Calling Login method for loginAction  ");
    
    LoginAction cryptoUtil=new LoginAction();
    String key="NCSS_Bangalore";   
    String plain=loginBean.getPassword().toUpperCase();
    
    String enc=cryptoUtil.encrypt(key, plain);
    System.out.println("Original text: "+plain);
    System.out.println("Encrypted text: "+enc);
    
    
    
    String plainAfter=cryptoUtil.decrypt(key, enc);
    System.out.println("Original text after decryption: "+plainAfter);
    
    
    String ret = "success";
    Connection conn = null;
    Statement pst=null;
    
    DateFormat dateFormat = new SimpleDateFormat("dd/MMM/yyyy");
	Date date = new Date();
	String current_date = dateFormat.format(date);
    
    //String select_sql="select * from LOGIN_TABLE where USER_MAIL_ID='"+loginBean.getUserId()+"' and PASSWORD='"+enc+"'";
    
    //String LoginSQL = "SELECT EMP_ID,ROLE_NAME,(to_date('"+current_date+"','DD-Mon-YYYY')-PWD_MODIFY_DATE) as diff,EMP_DESIG  as designation FROM NCSS_RBA r,NCSS_EMP_MASTER_INFO m where r.ROLE_ID=m.ROLE_ID and m.EMP_MAILID='"+loginBean.getUserId().toUpperCase()+"' and m.ACTUAL_PASSWORD='"+enc+"' and STATUS='Active' ";
	  String LoginSQL = "SELECT m.EMP_ID,r.ROLE_NAME,m.EMP_DESIG ,(to_date('"+current_date+"','DD-Mon-YYYY')-m.PWD_MODIFY_DATE) FROM NCSS_RBA r,NCSS_EMP_MASTER_INFO m where r.ROLE_ID=m.ROLE_ID and m.EMP_MAILID='"+loginBean.getUserId().toUpperCase()+"' and m.ACTUAL_PASSWORD='"+enc+"' and STATUS='Active' ";
    System.out.println("select_sql.."+LoginSQL);
    try
    {
      conn = GetConnection.getConnection();
      pst=conn.createStatement();
      ResultSet rs=pst.executeQuery(LoginSQL);
  	
      
      if (!rs.next())
      {

			 addActionError("User Name And Password are wrong ! Try Again");
			    System.out.println("User Name And Password are wrong ! Try Again");
			
        ret = "error";
      } else {
    	  String EMP_ID=rs.getString(1).toUpperCase();
    	  String designation_emp=rs.getString(2);
    	  System.out.println("designation_emp.."+designation_emp);

    	  String designation=rs.getString(3);
      	 int difference=rs.getInt(4);
    	  System.out.println("the designation is"+designation);
    	  session.put("loginid",loginBean.getUserId().toUpperCase());
    	  session.put("empid",EMP_ID);
    	  session.put("encrpted_old_password", enc);
    	  
    	  
    	  System.out.println("session.."+loginBean.getUserId());
  		System.out.println("Date difference is"+difference);
  		if(difference>=30.0)
  		{
  			System.out.println("your password is expired");
  			ret = "INPUT";
  		}
  		else{
    	  
    	  
        if (designation_emp.equals("HR"))
        {
        	 Object hrsession= session.put("rolesession",rs.getString("ROLE_NAME").toUpperCase());
        	 System.out.println("hrsession..."+hrsession);  
        	 
        	 System.out.println("hr data");
          ret = "hr";
         
        }
       else if (designation_emp.equals("ADMIN"))
        {
        	 Object adminsession= session.put("rolesession",rs.getString("ROLE_NAME").toUpperCase());
           	System.out.println("adminsession..."+adminsession);
          System.out.println("admin data");
          ret = "admin";
          
        }
        else if (designation_emp.equals("MANAGER"))
        {
        	Object managersession= session.put("rolesession",rs.getString("ROLE_NAME").toUpperCase());
        	System.out.println("managersession..."+managersession);
          System.out.println("manager data");
          ret = "manager";
        }
        
        else if (designation_emp.equals("SANCTIONING AUTHORITY"))
        {
        	Object sanctioning_authority_session= session.put("rolesession",rs.getString("ROLE_NAME").toUpperCase());
        	System.out.println("sanctioning_authority_session..."+sanctioning_authority_session);
          System.out.println("sanctioning_authority_session");
          ret = "sanctioning_authority";
        }
        
        else if (designation_emp.equals("ACCOUNTANT"))
        {
        	Object accountant_session= session.put("rolesession",rs.getString("ROLE_NAME").toUpperCase());
        	System.out.println("accountant_session..."+accountant_session);
          System.out.println("accountant_session");
          ret = "accountant";
        }
        
        else
        {
        	
            Object employeesession= session.put("rolesession",rs.getString("ROLE_NAME").toUpperCase());
            Object empdesign_session= session.put("design_session",rs.getString("EMP_DESIG").toUpperCase());
            	System.out.println("employeesession..."+employeesession);
            	System.out.println("empdesign_session..."+empdesign_session);
              System.out.println("employee data");
              ret = "employee";
            
        }
      }
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
  
  
  
  
  
  
  
  
  
 // CryptoUtil cryptObj=new CryptoUtil();
	// String encrypt_pwd=cryptObj.execute(4);
	 
  
  
 /* *//**
   * 
   * @param secretKey Key used to encrypt data
   * @param plainText Text input to be encrypted
   * @return Returns encrypted text
   * 
   *//*
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
   *//**     
   * @param secretKey Key used to decrypt data
   * @param encryptedText encrypted text input to decrypt
   * @return Returns plain text after decryption
   *//*
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


*/


  /*public String login_encrypt_data() throws SQLException, InvalidKeyException, NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidAlgorithmParameterException, UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException
  {
  	System.out.println("login information by ********************** employee");
  	
  	Connection con=null;
  	Statement  pst=null;
      ResultSet rs=null;
      
      CryptoUtil cryptoUtil=new CryptoUtil();
      String key="NCSS_Bangalore";   
     // String plain="CSSE150059";
      String plain=this.loginBean.getPassword();
      
      String enc=cryptoUtil.encrypt(key, plain);
      System.out.println("Original text: "+plain);
      System.out.println("Encrypted text: "+enc);
      
  	
  	String select_sql="select EMP_ID,(sysdate-MODIFIED_DATE) as diff from LOGI"
  			+ "N_TABLE where USER_MAIL_ID='"+loginBean.getPassword()+"' and PASSWORD='"+enc+"'";
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


*/
  
  
  
  
  
  
  
  
  
    

  public String logout() {
    System.out.println("Calling logout method");
   /* ((SessionMap)this.session).invalidate();*/
    
    
    if(session.remove("loginid") != null)
    {
    return "success";
    }
    return "error";
  }
  
  public String home()
  {
	/* ((SessionMap)this.session).invalidate();*/
	  return SUCCESS;
  }
  
  public String hrhome()
  {
	/* ((SessionMap)this.session).invalidate();*/
	  return SUCCESS;
  }
  
  public String adminhome()
  {
	/* ((SessionMap)this.session).invalidate();*/
	  return SUCCESS;
  }
  public String managerhome()
  {
	/* ((SessionMap)this.session).invalidate();*/
	  return SUCCESS;
  }

  public Map getSession()
  {
    return this.session;
  }

  public void setSession(Map session) {
    this.session = session;
  }

  public LoginActionBean getLoginBean() {
    return this.loginBean;
  }

  public void setLoginBean(LoginActionBean loginBean) {
    this.loginBean = loginBean;
  }
}