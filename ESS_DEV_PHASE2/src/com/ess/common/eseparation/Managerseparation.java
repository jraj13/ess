package com.ess.common.eseparation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class Managerseparation {

	public  ArrayList<String> gettinge_requestDetails() throws SQLException {
		System.out.println("Home page information related to the e-separation emp class");
		ArrayList<String> homepage = new ArrayList<String>();
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String sequence_id = request.getParameter("sequence_id");
	
	//String fetch_initail_eseparation = "select EMP_ID,REASION_RESIGN,RELEVING_DATE,CREATION_DATE,rm_name from E_SEPARATION_EMP  where SEQUENCE_NO='"+sequence_id+"'";		
		String fetch_initail_eseparation ="select e.EMP_ID,EMP_FNAME,EMP_LNAME,EMP_DESIG,EMP_MAILID,EMP_CTC,EMP_JOINING_DATE from NCSS_EMP_MASTER_INFO e where EMP_ID in(select r.EMP_ID from E_SEPARATION_EMP r  where SEQUENCE_NO='"+sequence_id+"')";
	String empDetails_eseparation = null;
	
    Connection con=null;
    Statement st=null;
    ResultSet rs_ini=null;
    
    
    try {
		 con = GetConnection.getConnection();
		  st = con.createStatement();

		 rs_ini = st.executeQuery(fetch_initail_eseparation);
		 //String sequence_no=null;
		 //String emp_approve =null;
		 
		 String empid=null;
		 String EMP_FNAME=null;
		 String EMP_LNAME=null;
		 String EMP_DESIG=null;
		 String EMP_MAILID=null;
		 Date doj;
		 String EMP_CTC=null;
		 if(rs_ini.next())
		 {
		 empid=rs_ini.getString(1);
		 EMP_FNAME=rs_ini.getString("EMP_FNAME").toString();
		 EMP_LNAME=rs_ini.getString("EMP_LNAME").toString();
		 EMP_DESIG=rs_ini.getString("EMP_DESIG").toString();
		 EMP_MAILID=rs_ini.getString("EMP_MAILID");
		 doj=rs_ini.getDate("EMP_JOINING_DATE");
		 EMP_CTC=rs_ini.getString("EMP_CTC").toString();
		empDetails_eseparation=empid+"^"+EMP_FNAME+"^"+EMP_LNAME+"^"+EMP_DESIG+"^"+EMP_MAILID+"^"+doj+"^"+EMP_CTC;
		homepage.add(empDetails_eseparation);
		 }
		
	} catch (Exception e) {
		System.out.println("problem in Home page information related to the e-separation emp class");
		e.printStackTrace();
	}
    
    
	
	return homepage;
}
	
	
	public ArrayList<String> e_separation_manager() throws SQLException	{
		 System.out.println(" getting separation info  in Manager class new class"); 
		ArrayList<String> e_sep_manager=new ArrayList<String>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String sequence_id = request.getParameter("sequence_id");
		
		
		String man_Sql="select emp_id,SEQUENCE_NO,CREATION_DATE,REASION_RESIGN,DETAILED_REASON,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD from E_SEPARATION_EMP where SEQUENCE_NO='"+sequence_id+"'";
		
		
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(man_Sql);
			String emp_id=null;
			String req_no=null;
			Date creation_date;
			String reason_action=null;
			String detailed_reason=null;
			Date rileaving_date;
			String actual_notice_period=null;
			String given_notice_period=null;
			while(rs.next())
			{
				emp_id=rs.getString(1);
				req_no=rs.getString("SEQUENCE_NO");
				creation_date=rs.getDate("CREATION_DATE");
				reason_action=rs.getString("REASION_RESIGN");
				
				detailed_reason=rs.getString("DETAILED_REASON");
				rileaving_date=rs.getDate("RELEVING_DATE");
				actual_notice_period=rs.getString("ACTUAL_NOTICE_PERIOD");
				
				given_notice_period=rs.getString("GIVEN_NOTICE_PERIOD");
				
				String man_data=emp_id+"^"+req_no+"^"+creation_date+"^"+reason_action+"^"+detailed_reason+"^"+rileaving_date+"^"+actual_notice_period+"^"+given_notice_period;
				e_sep_manager.add(man_data);
			}
			
		
		}catch(Exception e){
			System.out.println("Problem in reults in e-Separation Mnager side");
			e.printStackTrace();
		}
		finally{
			rs.close();
			st.close();
			con.close();
		}
		return e_sep_manager;
	}
	
	
	
	public String saveManagerStatus(String emp_id,String action_type,String reason_action,String detailed_reason,Object phy_relev_date,Object r_date,String status_rm,String short_notes,String big_notes) throws SQLException
	{
		System.out.println(" update the status in Manager class newly");
		Connection con=null;
		Statement st=null;
		String res_status_report="";
		String status_update="update E_SEPARATION_EMP set ACTION_TYPE_RM='"+action_type+"', REASON_FOR_ACTION_RM='"+reason_action+"', DETAILED_REASON_RM='"+detailed_reason+"',  PHY_REL_DATE_RM='"+phy_relev_date+"',REL_DATE_RM='"+r_date+"',RM_APPROVE='"+status_rm+"',RM_SHOT_NOTE='"+short_notes+"',RM_COMMENTS='"+big_notes+"' where EMP_ID='"+emp_id+"'";
		System.out.println("the query in update is"+status_update);
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			int res=st.executeUpdate(status_update);
			if(res>0)
			{
				res_status_report="Yes";
			}
			
		}catch(Exception e)
		{
			res_status_report="No";
			System.out.println("Problem in update record after rm approves/reject");
			e.printStackTrace();
		}
		finally
		{
			st.close();
			con.close();
		}
		return res_status_report;
		
	}
	
	
	
}
