package com.ess.common.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.struts2.interceptor.SessionAware;

import com.ess.common.bean.LoginActionBean;


import com.ess.common.util.MyDataSource;
import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionSupport;

public class LoginActionClock extends ActionSupport implements SessionAware {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public static final String SUCCESS = "success";
	public static final String ERROR = "error";
	public static final String ADMIN = "admin";
	public static final String HR = "hr";
	public static final String EMPLOYEE = "employee";
	
	public Map<String, String> session;
	//private Map sessionMap;

	private LoginActionBean loginBean;

	//private String LoginSQL = "SELECT * FROM EMP_LOGIN_TEMP where USER_NAME=? and PASSWORD=?";
	private String LoginSQL = "SELECT * FROM NCSS_RBA r,NCSS_EMP_MASTER m where r.ROLE_ID=m.ROLE_ID and m.EMP_MAIL=? and m.PASSWORD=?";
	
	public String login() {
		System.out.println("Calling Login method");
		String ret = SUCCESS;
		Connection conn = null;
		
		try {
			DataSource dataSource = MyDataSource.getInstance();
			
			conn = GetConnection.getConnection();
			PreparedStatement st = conn.prepareStatement(LoginSQL);
			
			System.out.println("userId......."+loginBean.getUserId().toUpperCase());
			System.out.println("password....."+loginBean.getPassword().toUpperCase());
			
			st.setString(1, loginBean.getUserId().toUpperCase());
			st.setString(2, loginBean.getPassword().toUpperCase());
			ResultSet rs = st.executeQuery();
			
			if (!rs.next()) {
				
				 addActionError("User Name And Password are wrong ! Try Again");
				    System.out.println("User Name And Password are wrong ! Try Again");
				
				
				ret = ERROR;
			}
			
			
			else if (rs.getString("USER_NAME").equals("ESSADMIN@CLOCKSOFT.INFO") )
			
	        { 
				System.out.println("ADMIN CHECKING.............."+loginBean.getUserId());
				Object id=session.put("loginid",loginBean.getUserId().toUpperCase());
				System.out.println("admin session id===="+id);
				Object id1=session.put("empid",loginBean.getPassword().toUpperCase());
				System.out.println("employee password====="+id1);
	          ret = "admin";
	        }
			
			else if (rs.getString("USER_NAME").equals("SYED@CLOCKSOFT.INFO") )
				
	        { 
				System.out.println("ADMIN CHECKING.............."+loginBean.getUserId());
				Object id=session.put("loginid",loginBean.getUserId().toUpperCase());
				System.out.println("admin session id===="+id);
				Object id1=session.put("empid",loginBean.getPassword().toUpperCase());
				System.out.println("employee password====="+id1);
	          ret = HR;
	        }
				
			
			
			else {
				
				
				@SuppressWarnings("unchecked")
				
				 Object id=session.put("loginid",loginBean.getUserId().toUpperCase());
				
				System.out.println("printing session id............."+id);
				 System.out.println("uid putting into session.........."+loginBean.getUserId());
				 Object id1=session.put("empid",loginBean.getPassword().toUpperCase());

					System.out.println("employee password====="+id1);
				ret= EMPLOYEE;
				 
				
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
			ret = ERROR;
		} finally {
			if (conn != null)
			{
				try {
						conn.close();
					} 
					catch (Exception e) {
						
					}
			}
		}
		return ret;	
	}

	
	
	// logout method 
	
	public String logout() {
	    System.out.println("Calling logout method");
	   /* ((SessionMap)this.session).invalidate();*/
	    
	    
	    if(session.remove("loginid") != null)
	    {
	    return "success";
	    }
	    return "error";
	  }
	 
	/* home() mehtod */
	public String home()
	{
		System.out.println("Calling homepage method");
		//((SessionMap) this.session).invalidate();
		
		return SUCCESS;
	}
	

	
   // setter/getter methods 
	public Map getSession(String string) {
	
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

public LoginActionBean getLoginBean() {
		return loginBean;
	}

	public void setLoginBean(LoginActionBean loginBean) {
		this.loginBean = loginBean;
	}
	

}
