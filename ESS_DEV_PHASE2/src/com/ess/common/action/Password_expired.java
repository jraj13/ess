package com.ess.common.action;

import com.ess.common.action.CryptoUtil;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class Password_expired {
	
	private Map<String, Object> session;
	private String old_password;
	private String new_first_password;
	private String new_second_password;
	public String getOld_password() {
		return old_password;
	}
	public void setOld_password(String old_password) {
		this.old_password = old_password;
	}
	public String getNew_first_password() {
		return new_first_password;
	}
	public void setNew_first_password(String new_first_password) {
		this.new_first_password = new_first_password;
	}
	public String getNew_second_password() {
		return new_second_password;
	}
	public void setNew_second_password(String new_second_password) {
		this.new_second_password = new_second_password;
	}
	
	 public Map<String,Object> getSession()
	  {
	    return this.session;
	  }

	  public void setSession(Map<String,Object> session) {
	    this.session = session;
	  }
	
	public String password_expired_change() throws SQLException, InvalidKeyException, NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidAlgorithmParameterException, UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException
	{
		String result_status="ERROR";
		Connection con=null;
		Statement st=null;
		int result_sql=0;
		
		
		
		System.out.println("getNew_first_password()"+getNew_first_password());
		System.out.println("getNew_second_password()"+getNew_second_password());
		
		if(getNew_first_password().equalsIgnoreCase(getNew_second_password()))
		{
			
		Map<String,Object> session = ActionContext.getContext().getSession();
		String login_mail_id = (String) session.get("loginid");
		System.out.println("the login mail id is"+login_mail_id);
		
		String encrpted_old_password = (String) session.get("encrpted_old_password");
		System.out.println("the login password is"+encrpted_old_password);
		
		CryptoUtil crpto_password=new CryptoUtil();
		  String key="NCSS_Bangalore";   
		    String plain=getNew_second_password().toUpperCase();
		    
		String enc=crpto_password.encrypt(key, plain);
		
		
		DateFormat dateFormat = new SimpleDateFormat("dd/MMM/yyyy");
		Date date = new Date();
		String current_date = dateFormat.format(date);
		
		System.out.println("new date is"+current_date);
		System.out.println("old password is"+getOld_password());
		
		
		
		String password_query="update NCSS_EMP_MASTER_INFO set PWD_MODIFY_DATE='"+current_date+"',ACTUAL_PASSWORD='"+enc+"' where "
				+ "EMP_MAILID='"+login_mail_id+"' and ACTUAL_PASSWORD='"+encrpted_old_password+"'and STATUS='Active'";
		
		
		
		System.out.println("the password expired query is"+password_query);
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			result_sql=st.executeUpdate(password_query);
			if(result_sql>0)
			{
				result_status="SUCCESS";
			}
			else
			{
				result_status="ERROR";
			}
		}
		catch(Exception e)
		{
			System.out.println("the problem in changing password method");
			e.printStackTrace();
		}
		finally
		{
			st.close();
			con.close();
		}
		return result_status;
	}
		else
		{
			System.out.println("Please enter same new passwords");
			result_status="ERROR";
			return result_status;
		}

}
}
