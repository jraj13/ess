package com.ess.common.eseparation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class FandFsettlement_HR {
	/*
	 * Getting Initial information to F and F settlement
	 */
		
		public ArrayList<String> f_f_settlement() throws SQLException, ParseException{
			 System.out.println("come in f and f page initial page");
			ArrayList<String> f_f_data=new ArrayList<String>();
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			
			HttpServletRequest request = (HttpServletRequest) ActionContext
					.getContext().get(ServletActionContext.HTTP_REQUEST);
			
			String fdate=request.getParameter("fdate");
			
			SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			Date tempDate1 = simpleDateFormat1.parse(fdate);
			SimpleDateFormat outputDateFormat1 = new SimpleDateFormat("dd/MMM/YYYY");
			Object fdate1 = outputDateFormat1.format(tempDate1);
			//System.out.println("fdate1 Date.." + fdate1);

			String tdate=request.getParameter("tdate");
			
			SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
			Date tempDate2 = simpleDateFormat2.parse(tdate);
			SimpleDateFormat outputDateFormat2 = new SimpleDateFormat("dd/MMM/YYYY");
			Object tdate1 = outputDateFormat2.format(tempDate2);
			//System.out.println("tdate1 Date.." + tdate1);
			
			String status=request.getParameter("status").trim();
			
			System.out.println("fdate1..."+fdate1+ "tdate1..."+tdate1+  "status..."+status);
			String fandf_sql_query="";
			
			
			
		
			if(status.equalsIgnoreCase("New")){
			//	System.out.println("status==New");
			
			 fandf_sql_query="select mas.emp_id,mas.EMP_FNAME,mas.EMP_LNAME,mas.EMP_JOINING_DATE,sep.CREATION_DATE,sep.HR_RELIEVING_DATE,sep.SEQUENCE_NO,sep.HR_CLEARANCE_PROCCESS_STATUS "
 +"from NCSS_EMP_MASTER_INFO mas,E_SEPARATION_EMP sep "
 +"where mas.emp_id=sep.emp_id and sep.CREATION_DATE  between '"+fdate1+"' and '"+tdate1+"' "
 +"and sep.HR_CLEARANCE_PROCCESS_STATUS ='"+status+"' "
 +"and sep.EMP_APPROVEL='Initiate' and sep.HR_APPROVE='Inprocess'";
			}
			
			else if(status.equalsIgnoreCase("Submitted to SA")){
			//	System.out.println("status==Submitted to SA");
				 fandf_sql_query="select mas.emp_id,mas.EMP_FNAME,mas.EMP_LNAME,mas.EMP_JOINING_DATE,sep.CREATION_DATE,sep.HR_RELIEVING_DATE,sep.SEQUENCE_NO,sep.HR_CLEARANCE_PROCCESS_STATUS "
	 +"from NCSS_EMP_MASTER_INFO mas,E_SEPARATION_EMP sep "
	 +"where mas.emp_id=sep.emp_id and sep.CREATION_DATE  between '"+fdate1+"' and '"+tdate1+"' "
	 +"and sep.HR_CLEARANCE_PROCCESS_STATUS ='"+status+"' "
	 +"and sep.EMP_APPROVEL='Initiate' and sep.HR_APPROVE='Inprocess'";
				}
			else if(status.equalsIgnoreCase("Submitted to A/C")){
			//	System.out.println("status==Submitted to A/C");
				 fandf_sql_query="select mas.emp_id,mas.EMP_FNAME,mas.EMP_LNAME,mas.EMP_JOINING_DATE,sep.CREATION_DATE,sep.HR_RELIEVING_DATE,sep.SEQUENCE_NO,sep.HR_CLEARANCE_PROCCESS_STATUS "
	 +"from NCSS_EMP_MASTER_INFO mas,E_SEPARATION_EMP sep "
	 +"where mas.emp_id=sep.emp_id and sep.CREATION_DATE  between '"+fdate1+"' and '"+tdate1+"' "
	 +"and sep.HR_CLEARANCE_PROCCESS_STATUS ='"+status+"' "
	 +"and sep.EMP_APPROVEL='Initiate' and sep.HR_APPROVE='Inprocess'";
				}
			
			else if(status.equalsIgnoreCase("Returned to HR")){
			//	System.out.println("status==Returned to HR");
				 fandf_sql_query="select mas.emp_id,mas.EMP_FNAME,mas.EMP_LNAME,mas.EMP_JOINING_DATE,sep.CREATION_DATE,sep.HR_RELIEVING_DATE,sep.SEQUENCE_NO,sep.HR_CLEARANCE_PROCCESS_STATUS "
	 +"from NCSS_EMP_MASTER_INFO mas,E_SEPARATION_EMP sep "
	 +"where mas.emp_id=sep.emp_id and sep.CREATION_DATE  between '"+fdate1+"' and '"+tdate1+"' "
	 +"and sep.HR_CLEARANCE_PROCCESS_STATUS ='"+status+"' "
	 +"and sep.EMP_APPROVEL='Initiate' and sep.HR_APPROVE='Inprocess'";
				}
			
			else {
			//	System.out.println("status==All");
				 fandf_sql_query="select mas.emp_id,mas.EMP_FNAME,mas.EMP_LNAME,mas.EMP_JOINING_DATE,sep.CREATION_DATE,sep.HR_RELIEVING_DATE,sep.SEQUENCE_NO,sep.HR_CLEARANCE_PROCCESS_STATUS "
	 +"from NCSS_EMP_MASTER_INFO mas,E_SEPARATION_EMP sep "
	 +"where mas.emp_id=sep.emp_id and sep.CREATION_DATE  between '"+fdate1+"' and '"+tdate1+"' "
	 +"and sep.EMP_APPROVEL='Initiate' and sep.HR_APPROVE='Inprocess'";
				}
			
			/*String fandf_sql_query="select mas.emp_id,mas.EMP_FNAME,mas.EMP_LNAME,mas.EMP_JOINING_DATE,sep.CREATION_DATE,sep.HR_RELIEVING_DATE,sep.SEQUENCE_NO,sep.HR_CLEARANCE_PROCCESS_STATUS from "
					+ "NCSS_EMP_MASTER_INFO mas,E_SEPARATION_EMP sep "
					+ "where mas.emp_id=sep.emp_id and sep.EMP_APPROVEL='Initiate' and sep.HR_APPROVE='Inprocess'";*/
			System.out.println(fandf_sql_query);
			
			String emp_id=null;
			String fname="";
			String lname="";
			Date emp_jd;
			Date leaving;
			Date resignation_date;
			String seq_no="";
			String HR_CLEARANCE_PROCCESS_STATUS="";
			try
			{
				con=GetConnection.getConnection();
				st=con.createStatement();
				rs=st.executeQuery(fandf_sql_query);
				while(rs.next())
				{
					emp_id=rs.getString(1);
					fname=rs.getString(2);
					lname=rs.getString(3);
					emp_jd=rs.getDate(4);
					leaving=rs.getDate(5);
					resignation_date=rs.getDate(6);
					seq_no=rs.getString(7);
					HR_CLEARANCE_PROCCESS_STATUS=rs.getString("HR_CLEARANCE_PROCCESS_STATUS");
					//System.out.println("sequence number"+seq_no);
					String final_data=emp_id+"^"+fname+"^"+lname+"^"+emp_jd+"^"+leaving+"^"+resignation_date+"^"+seq_no+"^"+HR_CLEARANCE_PROCCESS_STATUS;
					f_f_data.add(final_data);
					
				}
				
			}catch(Exception e)
			{
				System.out.println("Problem in geeting data in e-separation hr level");
				e.printStackTrace();
			}
			finally{
				rs.close();
				st.close();
				con.close();
			}
			System.out.println("final result is"+f_f_data);
			return f_f_data;
			
	}
		
		
			
			/*HttpServletRequest request = (HttpServletRequest) ActionContext
					.getContext().get(ServletActionContext.HTTP_REQUEST);
			
			String fdate=request.getParameter("fdate");
			String tdate=request.getParameter("tdate");
			String status=request.getParameter("status");
			
			String fandf_sql_query="select mas.emp_id,mas.EMP_FNAME,mas.EMP_LNAME,mas.EMP_JOINING_DATE,sep.CREATION_DATE,sep.HR_RELIEVING_DATE,sep.SEQUENCE_NO,sep.HR_CLEARANCE_PROCCESS_STATUS"
 +"from NCSS_EMP_MASTER_INFO mas,E_SEPARATION_EMP sep "
 +"where mas.emp_id=sep.emp_id and sep.CREATION_DATE  between '25-OCT-2015' and '30-NOV-2015'"
 +"and sep.HR_CLEARANCE_PROCCESS_STATUS ='New'"
 +"and sep.EMP_APPROVEL='Initiate' and sep.HR_APPROVE='Inprocess'";*/
		
		
		/*
		 * Settlement page initial information
		 */
		
		public ArrayList<String> fullsettlement_basicinfo() throws SQLException{
			 
			ArrayList<String> settlement_data=new ArrayList<String>();
			Connection con_set=null;
			Statement st_set=null;
			ResultSet rs_set=null;
			String fandf_sql_query="select mas.emp_id,mas.EMP_FNAME,mas.EMP_LNAME,mas.EMP_JOINING_DATE,sep.CREATION_DATE,sep.HR_RELIEVING_DATE,sep.SEQUENCE_NO from "
					+ "NCSS_EMP_MASTER_INFO mas,E_SEPARATION_EMP sep "
					+ "where mas.emp_id=sep.emp_id and sep.EMP_APPROVEL='Initiate' and sep.HR_APPROVE='Inprocess'";
			System.out.println(fandf_sql_query);
			
			String emp_id=null;
			String fname="";
			String lname="";
			Date emp_jd;
			Date leaving;
			Date resignation_date;
			String seq_no="";
			try
			{
				con_set=GetConnection.getConnection();
				st_set=con_set.createStatement();
				rs_set=st_set.executeQuery(fandf_sql_query);
				while(rs_set.next())
				{
					emp_id=rs_set.getString(1);
					fname=rs_set.getString(2);
					lname=rs_set.getString(3);
					emp_jd=rs_set.getDate(4);
					leaving=rs_set.getDate(5);
					resignation_date=rs_set.getDate(6);
					seq_no=rs_set.getString(7);
					
					String final_data=emp_id+"^"+fname+"^"+lname+"^"+emp_jd+"^"+leaving+"^"+resignation_date+"^"+seq_no;
					settlement_data.add(final_data);
					
				}
				
			}catch(Exception e)
			{
				System.out.println("Problem in geeting data in e-separation hr level");
				e.printStackTrace();
			}
			finally{
				rs_set.close();
				st_set.close();
				con_set.close();
			}
			System.out.println("final result is settlement initial page"+settlement_data);
			return settlement_data;
			
	}
		
		
		/*
		 * e-separation settlement page initioal information
		 */
		public ArrayList<String> setlement_info(String seq_no) throws SQLException{
			 
			System.out.println("CALLING hr level PROCEDURE");
			ArrayList<String> settle_data=new ArrayList<String>();
		
		CallableStatement cstmt = null;
		Connection con=null;
		String initial_data_procedure = "{call E_SEPARATION_HR_CLEARANCE.PERSONNEL_INFO (?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		String emp_id=""; 
		String fname="";
		String lname="";
		String designation="";
		Date join_date;
		
		Date resig_date;
		Date hold_sal_Date;
		float ctc=0.0f;
		float basic=0.0f;
		String tot_exp="";
		String reason="";
		Date hr_rel_date;
		
		try {
			con=GetConnection.getConnection();
		   
		   cstmt = con.prepareCall (initial_data_procedure);
		   cstmt.setString(1,seq_no);
		   cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
		   cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
		   cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
		   cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
		   
		   cstmt.registerOutParameter(6, java.sql.Types.DATE);
		   cstmt.registerOutParameter(7, java.sql.Types.DATE);
		   cstmt.registerOutParameter(8, java.sql.Types.DATE);
		   
		   cstmt.registerOutParameter(9, java.sql.Types.FLOAT);
		   cstmt.registerOutParameter(10, java.sql.Types.FLOAT);
		   cstmt.registerOutParameter(11, java.sql.Types.VARCHAR);
		   cstmt.registerOutParameter(12, java.sql.Types.VARCHAR);
		   cstmt.registerOutParameter(13, java.sql.Types.DATE);
		   cstmt.executeUpdate();
		
		   emp_id=cstmt.getString(2);
		   fname=cstmt.getString(3);
		   lname=cstmt.getString(4);
		   designation=cstmt.getString(5);
		   join_date=cstmt.getDate(6);
		   
		   resig_date=cstmt.getDate(7);
		   hold_sal_Date=cstmt.getDate(8);
		   ctc=cstmt.getFloat(9);
		   basic=cstmt.getFloat(10);
		   tot_exp=cstmt.getString(11);	   
		   reason=cstmt.getString(12);
		   hr_rel_date=cstmt.getDate(13);
		   
			String final_data=emp_id+"^"+fname+"^"+lname+"^"+designation+"^"+join_date+"^"+resig_date+
					"^"+hold_sal_Date+"^"+ctc+"^"+basic+"^"+tot_exp+"^"+reason+"^"+hr_rel_date;
			
			settle_data.add(final_data);
			
		
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in e-separation hr level PROCEDURE");
		e.printStackTrace();
	}
		   
		finally{
			cstmt.close();
			con.close();
		}
		System.out.println("final result is settlement initial page"+settle_data);
		return settle_data;
		}	
		
		/*
		 * e-separation settlement page initioal information
		 */
		public ArrayList<String> leave_info(String seq_no) throws SQLException{
			 
			ArrayList<String> leaves_data=new ArrayList<String>();
		
		CallableStatement cstmt = null;
		Connection con=null;
		String leave_data_procedure = "{call E_SEPARATION_HR_CLEARANCE.leave_summary_firstpage (?,?,?,?,?,?,?,?,?,?,?,?)}";
		
		Date releving_date;
		float available_pl=0.0f;
		float advance_pl=0.0f;
		float available_sl=0.0f;
		float advance_sl=0.0f;
		float given_np=0.0f;
		float short_fall=0.0f;
		float available_pl_after=0.0f;
		float advance_pl_after=0.0f;
		float available_sl_after=0.0f;
		float advance_sl_after=0.0f;
		
		
		try {
			con=GetConnection.getConnection();
		   
		   cstmt = con.prepareCall (leave_data_procedure);
		   cstmt.setString(1,seq_no);
		   cstmt.registerOutParameter(2, java.sql.Types.DATE);
		   cstmt.registerOutParameter(3, java.sql.Types.FLOAT);
		   cstmt.registerOutParameter(4, java.sql.Types.FLOAT);
		   cstmt.registerOutParameter(5, java.sql.Types.FLOAT);
		   cstmt.registerOutParameter(6, java.sql.Types.FLOAT);
		   
		   cstmt.registerOutParameter(7, java.sql.Types.FLOAT);
		   cstmt.registerOutParameter(8, java.sql.Types.FLOAT);
		   
		   cstmt.registerOutParameter(9, java.sql.Types.FLOAT);
		   cstmt.registerOutParameter(10, java.sql.Types.FLOAT);
		   cstmt.registerOutParameter(11, java.sql.Types.FLOAT);
		   cstmt.registerOutParameter(12, java.sql.Types.FLOAT);
		   
		   cstmt.executeUpdate();
		   releving_date=cstmt.getDate(2);
		   available_pl=cstmt.getFloat(3);
		   advance_pl=cstmt.getFloat(4);
		   available_sl=cstmt.getFloat(5);
		   advance_sl=cstmt.getFloat(6);
		   given_np=cstmt.getFloat(7);
		   
		   short_fall=cstmt.getFloat(8);
		   
		   available_pl_after=cstmt.getFloat(9);
		   advance_pl_after=cstmt.getFloat(10);
		   available_sl_after=cstmt.getFloat(11);
		   advance_sl_after=cstmt.getFloat(12);
		   
		   
		   
			String final_data=releving_date+"^"+available_pl+"^"+advance_pl+"^"+available_sl+"^"+advance_sl+"^"+given_np+"^"+short_fall
					+"^"+available_pl_after+"^"+advance_pl_after+"^"+available_sl_after+"^"+advance_sl_after;
			
			leaves_data.add(final_data);
			
		
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in e-separation hr level");
		e.printStackTrace();
	}
		   
		finally{
			cstmt.close();
			con.close();
		}
		System.out.println("leaves information in fand f settlement"+leaves_data);
		return leaves_data;
		}	
}
