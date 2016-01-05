package com.ess.common.eseparation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;


import com.ess.util.GetConnection;

public class Temporary_saving_Draft {

	
	//inserting the leave summary details into temporary table 
	
	
	
	
	public String insert_leave_summary(String seq_no,float AVA_PL_COLUMN1,float ADVANCE_PL_COLUMN1,float AVA_SL_COLUMN1,float ADVANCE_SL_COLUMN1,
			float AVA_PL_COLUMN2,float ADVANCE_PL_COLUMN2,float AVA_SL_COLUMN2,float ADVANCE_SL_COLUMN2,float SHORT_FALL,float cl_days) throws SQLException
			
			{
		Connection con=null;
		Statement st=null;
		
		Connection con_catch=null;
		Statement st_catch=null;
		
		String res_status_report="No";
		String insert_leave_summary_temporary_Sql="insert into TEMPORARY_TIME_ACCOUNTS values('"+seq_no+"','"+AVA_PL_COLUMN1+"','"+ADVANCE_PL_COLUMN1+"','"+AVA_SL_COLUMN1+"',"
						+ "'"+ADVANCE_SL_COLUMN1+"','"+AVA_PL_COLUMN2+"','"+ADVANCE_PL_COLUMN2+"','"+AVA_SL_COLUMN2+"','"+ADVANCE_SL_COLUMN2+"','"+SHORT_FALL+"','"+cl_days+"')";
			
		
		
		
		String update_sql="update TEMPORARY_TIME_ACCOUNTS set AVA_PL_COLUMN1='"+AVA_PL_COLUMN1+"',ADVANCE_PL_COLUMN1='"+ADVANCE_PL_COLUMN1+"',AVA_SL_COLUMN1='"+AVA_SL_COLUMN1+"'"
				+ ",ADVANCE_SL_COLUMN1='"+ADVANCE_SL_COLUMN1+"',AVA_PL_COLUMN2='"+AVA_PL_COLUMN2+"',ADVANCE_PL_COLUMN2='"+ADVANCE_PL_COLUMN2+"',AVA_SL_COLUMN2='"+AVA_SL_COLUMN2+"'"
						+ ",ADVANCE_SL_COLUMN2='"+ADVANCE_SL_COLUMN2+"',SHORT_FALL='"+SHORT_FALL+"',cl_days='"+cl_days+"' where ESEP_SEQ_NO='"+seq_no+"'";
		
		
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			int res=st.executeUpdate(insert_leave_summary_temporary_Sql);
			if(res>0)
			{
				res_status_report="Yes";
			}
			
		}catch(Exception e)
		{
			System.out.println("catch  in inset leaves summary details");
			
			con_catch=GetConnection.getConnection();
			st_catch=con_catch.createStatement();
			int res_catch=st_catch.executeUpdate(update_sql);
			if(res_catch>0){
				res_status_report="yes";
				//e.printStackTrace();
			}
			else
			{
			res_status_report="No";
			System.out.println("Problem in inset leaves summary details");
			//e.printStackTrace();
			}
		}
		finally
		{
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
				return res_status_report;
		
			}
	
	
	public ArrayList<String> getting_recovery_balance(String seq_no) throws SQLException
	{
			 
		ArrayList<String> recovery=new ArrayList<String>();
		
		CallableStatement cstmt = null;
		Connection con=null;
		String recovery_payable = "{call RECOVERY_PAYABLE(?,?,?,?,?,?,?,?)}";
		
		float before_pl=0.0f;
		float before_sl=0.0f;
		
		float after_pl=0.0f;
		float after_sl=0.0f;
		
		float short_fall=0.0f;
		float cl=0.0f;
		
		float net_amt=0.0f;
		
		float net_pl=0.0f;
		float net_sl=0.0f;
		
		
		try {
			con=GetConnection.getConnection();
		   
		   cstmt = con.prepareCall (recovery_payable);
		   cstmt.setString(1,seq_no);
		   cstmt.registerOutParameter(2, java.sql.Types.FLOAT);
		   cstmt.registerOutParameter(3, java.sql.Types.FLOAT);
		   cstmt.registerOutParameter(4, java.sql.Types.FLOAT);
		   cstmt.registerOutParameter(5, java.sql.Types.FLOAT);
		   
		   cstmt.registerOutParameter(6, java.sql.Types.FLOAT);
		   cstmt.registerOutParameter(7, java.sql.Types.FLOAT);
		   cstmt.registerOutParameter(8, java.sql.Types.FLOAT);
		  
		   cstmt.executeUpdate();
		
		   before_pl=cstmt.getFloat(2);
		   before_sl=cstmt.getFloat(3);
		   
		   after_pl=cstmt.getFloat(4);
		   after_sl=cstmt.getFloat(5);
		   
		   short_fall=cstmt.getFloat(6);
		   cl=cstmt.getFloat(7);
		   net_amt=cstmt.getFloat(8);
		   
		   net_pl=(float) Math.floor(before_pl+after_pl);
		   
		   
		   net_sl=(float) Math.floor(before_sl+after_sl);
		   
		   
			String final_data=before_pl+"^"+before_sl+"^"+after_pl+"^"+after_sl+"^"+net_pl+"^"+net_sl+
					"^"+short_fall+"^"+cl+"^"+net_amt;
			
			recovery.add(final_data);
			
		
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in recovery balance");
		e.printStackTrace();
	}
		   
		finally{
			cstmt.close();
			con.close();
		}
		//System.out.println("final result is settlement initial page"+recovery);
		return recovery;
		}	
		
		
		
		
	public ArrayList<String> getting_leave_balance(String seq_no) throws SQLException
	{
			 
		ArrayList<String> leaves=new ArrayList<String>();
		
		CallableStatement cstmt_leaves = null;
		Connection con_leaves=null;
		String getting_leaves = "{call LEAVE_SUMMARY_GETTING(?,?,?,?,?,?,?,?,?,?)}";
		
		float ava_pl_before=0.0f;
		float adv_pl_before=0.0f;
		
		float ava_sl_before=0.0f;
		float adv_sl_before=0.0f;
		
		float ava_pl_after=0.0f;
		float adv_pl_after=0.0f;
		
		float ava_sl_after=0.0f;
		float adv_sl_after=0.0f;
		
		float cl_days=0.0f;
		
		
		try {
			con_leaves=GetConnection.getConnection();
		   
			cstmt_leaves = con_leaves.prepareCall (getting_leaves);
			cstmt_leaves.setString(1,seq_no);
			cstmt_leaves.registerOutParameter(2, java.sql.Types.FLOAT);
			cstmt_leaves.registerOutParameter(3, java.sql.Types.FLOAT);
			
			cstmt_leaves.registerOutParameter(4, java.sql.Types.FLOAT);
			cstmt_leaves.registerOutParameter(5, java.sql.Types.FLOAT);
		   
			cstmt_leaves.registerOutParameter(6, java.sql.Types.FLOAT);
			cstmt_leaves.registerOutParameter(7, java.sql.Types.FLOAT);
			
			cstmt_leaves.registerOutParameter(8, java.sql.Types.FLOAT);
			cstmt_leaves.registerOutParameter(9, java.sql.Types.FLOAT);
			
			cstmt_leaves.registerOutParameter(10, java.sql.Types.FLOAT);
			
		  
			cstmt_leaves.executeUpdate();
		
			ava_pl_before=cstmt_leaves.getFloat(2);
			adv_pl_before=cstmt_leaves.getFloat(3);
		   
			ava_sl_before=cstmt_leaves.getFloat(4);
			adv_sl_before=cstmt_leaves.getFloat(5);
		   
			ava_pl_after=cstmt_leaves.getFloat(6);
			adv_pl_after=cstmt_leaves.getFloat(7);
		   
			ava_sl_after=cstmt_leaves.getFloat(8);
			adv_sl_after=cstmt_leaves.getFloat(9);
			
			cl_days=cstmt_leaves.getFloat(10);
			
		   
		   
			String final_data=ava_pl_before+"^"+adv_pl_before+"^"+ava_sl_before+"^"+adv_sl_before+"^"+ava_pl_after+"^"+adv_pl_after+
					"^"+ava_sl_after+"^"+adv_sl_after+"^"+cl_days;
			
			leaves.add(final_data);
			
		
		
	}catch(Exception e)
	{
		System.out.println("Problem in geeting data in recovery leave balance");
		e.printStackTrace();
	}
		   
		finally{
			cstmt_leaves.close();
			con_leaves.close();
		}
		return leaves;
		}	
	
	public ArrayList<String> bank_retrieval(String seq_no) throws SQLException
	{
		
		ArrayList<String> bak_info=new ArrayList<String>();
		
		Connection con_bank=null;
		Statement st_bank=null;
		ResultSet rs_bank=null;
		String fetch_bank_info="select BANK_NAME,ACC_NO from BANKINFO where EMP_ID in (select emp_id from E_SEPARATION_EMP where SEQUENCE_NO='"+seq_no+"')";
		String bank_name="";
		String acc_no="";
		
		try
		{
			con_bank=GetConnection.getConnection();
			st_bank=con_bank.createStatement();
			rs_bank=st_bank.executeQuery(fetch_bank_info);
			if(rs_bank.next())
			{
				bank_name=rs_bank.getString("BANK_NAME");
				if(bank_name==null)
				{
					bank_name="";
				}
				acc_no=rs_bank.getString("ACC_NO");
				if(acc_no==null)
				{
					acc_no="";
				}
				
				
				
				
			}
			else
			{
				bank_name="";
				acc_no="";
			}
			
			String total_data=bank_name+"^"+acc_no;
			bak_info.add(total_data);
			
		}
		catch(Exception e)
		{
			System.out.println("problem in fetching bank details from db");
			e.printStackTrace();
		}
		finally{
			
			rs_bank.close();
			 st_bank.close();
			 con_bank.close();
		}
		
		
		return bak_info;
		
	}
	
	
	
	
	
	public ArrayList<String> bank_info_fandf_settlement(String seq_no) throws SQLException
	{
		
		ArrayList<String> bak_info_new=new ArrayList<String>();
		
		Connection con_bank_new=null;
		Statement st_bank_new=null;
		ResultSet rs_bank_new=null;
		//String fetch_bank_info="select BANK_EMP,ACC_NO_EMP,MICR_NO_EMP,CHEQUE_ADV,BANK_ACC_ADV,BANK_NAME_ADV,AMOUNT_ADV,DATE_ADV from BANK_TABLE_FANDF_SETTLEMENT where EMP_ID in (select emp_id from E_SEPARATION_EMP where SEQUENCE_NO='"+seq_no+"')";
		
		String fetch_bank_info="select BANK_EMP,ACC_NO_EMP,MICR_NO_EMP,CHEQUE_ADV,BANK_ACC_ADV,BANK_NAME_ADV,AMOUNT_ADV,DATE_ADV from BANK_TABLE_FANDF_SETTLEMENT where EMP_ID='"+seq_no+"'";
		
		String BANK_EMP="";
		String ACC_NO_EMP="";
		String MICR_NO_EMP="";
		
		String CHEQUE_ADV="";
		String BANK_ACC_ADV="";
		String BANK_NAME_ADV="";
		
		String AMOUNT_ADV="";
		Date DATE_ADV = null;
		
		
		try
		{
			con_bank_new=GetConnection.getConnection();
			st_bank_new=con_bank_new.createStatement();
			rs_bank_new=st_bank_new.executeQuery(fetch_bank_info);
			if(rs_bank_new.next())
			{
				BANK_EMP=rs_bank_new.getString("BANK_EMP");
				if(BANK_EMP==null)
				{
					BANK_EMP="";
				}
				ACC_NO_EMP=rs_bank_new.getString("ACC_NO_EMP");
				if(ACC_NO_EMP==null)
				{
					ACC_NO_EMP="";
				}
				MICR_NO_EMP=rs_bank_new.getString("MICR_NO_EMP");
				if(MICR_NO_EMP==null)
				{
					MICR_NO_EMP="";
				}
				
				
				CHEQUE_ADV=rs_bank_new.getString("CHEQUE_ADV");
				if(CHEQUE_ADV==null)
				{
					CHEQUE_ADV="";
				}
				
				BANK_ACC_ADV=rs_bank_new.getString("BANK_ACC_ADV");
				if(BANK_ACC_ADV==null)
				{
					BANK_ACC_ADV="";
				}
				
				BANK_NAME_ADV=rs_bank_new.getString("BANK_NAME_ADV");
				if(BANK_NAME_ADV==null)
				{
					BANK_NAME_ADV="";
				}
				
				
				
				AMOUNT_ADV=rs_bank_new.getString("AMOUNT_ADV");
				if(AMOUNT_ADV==null)
				{
					AMOUNT_ADV="";
				}
				

				DATE_ADV=rs_bank_new.getDate("DATE_ADV");
				
				
			}
			else
			{
				BANK_EMP="";
				 ACC_NO_EMP="";
				 MICR_NO_EMP="";
				
				 CHEQUE_ADV="";
				 BANK_ACC_ADV="";
				 BANK_NAME_ADV="";
				
				 AMOUNT_ADV="";
			}
			String total_data=BANK_EMP+"^"+ACC_NO_EMP+"^"+MICR_NO_EMP+"^"+CHEQUE_ADV+"^"+BANK_ACC_ADV+"^"+BANK_NAME_ADV+"^"+AMOUNT_ADV+"^"+DATE_ADV+"^"+seq_no;
			bak_info_new.add(total_data);
		}
		catch(Exception e)
		{
			 
			
			System.out.println("problem in fetching bank details from db in f and f settlement");
			e.printStackTrace();
		}
		
		
		
		return bak_info_new;
	}
	
	
	
	public String inserting_bank_details(String bank_emp,String acc_no_emp,String micr_no_emp,String cheque_adv,String bank_acc_adv,String bank_name_adv,
			float amout_adv,Object bank_date,String seq_no) throws SQLException
	{
		
		Connection con_bank_insert=null;
		Statement st_nank_insert=null;
		
		Connection con_bank_update=null;
		Statement st_nank_update=null;
		
		
		String insert_msg="no";
		
		//System.out.println("bank date in jsp is"+bank_date);
		
		String insert_bank_sql="insert into BANK_TABLE_FANDF_SETTLEMENT (BANK_EMP,ACC_NO_EMP,MICR_NO_EMP,CHEQUE_ADV,BANK_ACC_ADV,BANK_NAME_ADV,AMOUNT_ADV,EMP_ID) values('"+bank_emp+"','"+acc_no_emp+"','"+micr_no_emp+"','"+cheque_adv+"','"+bank_acc_adv+"','"+bank_name_adv+"','"+amout_adv+"','"+seq_no+"')";
		
		
		
		String update_bank_details="update BANK_TABLE_FANDF_SETTLEMENT set BANK_EMP='"+bank_emp  +"',ACC_NO_EMP='"+acc_no_emp +"',MICR_NO_EMP='"+micr_no_emp +"',CHEQUE_ADV='"+cheque_adv +"',BANK_ACC_ADV='"+bank_acc_adv +"',BANK_NAME_ADV='"+bank_name_adv +"',AMOUNT_ADV='"+amout_adv +"' where EMP_ID='"+seq_no +"'";
		
		//System.out.println("bank date in jsp is avove comparision"+bank_date);
		
		
		if(bank_date!=null)
			
		{
			//System.out.println("bank date in jsp in side if condtion is"+bank_date);
			
			 insert_bank_sql="insert into BANK_TABLE_FANDF_SETTLEMENT (BANK_EMP,ACC_NO_EMP,MICR_NO_EMP,"
					+ "CHEQUE_ADV,BANK_ACC_ADV,BANK_NAME_ADV,AMOUNT_ADV,DATE_ADV,"
					+ "EMP_ID) values('"+bank_emp+"','"+acc_no_emp+"','"+micr_no_emp+"','"+cheque_adv+"','"+bank_acc_adv+"','"+bank_name_adv+"','"+amout_adv+"','"+bank_date+"','"+seq_no+"')";
		
			 update_bank_details="update BANK_TABLE_FANDF_SETTLEMENT set BANK_EMP='"+bank_emp  +"',ACC_NO_EMP='"+acc_no_emp +"',MICR_NO_EMP='"+micr_no_emp +"',CHEQUE_ADV='"+cheque_adv +"',BANK_ACC_ADV='"+bank_acc_adv +"',BANK_NAME_ADV='"+bank_name_adv +"',AMOUNT_ADV='"+amout_adv +"',DATE_ADV='"+bank_date +"' where EMP_ID='"+seq_no +"'";
		}
		
		
		
		try
		{
			//System.out.println("inside try"+bank_date);
			
			con_bank_insert=GetConnection.getConnection();
			st_nank_insert=con_bank_insert.createStatement();
			int res_insert=st_nank_insert.executeUpdate(insert_bank_sql);
			if(res_insert>=0)
			{
				insert_msg="insert";
			}
		}
		catch(Exception e)
		{
			//e.printStackTrace();
			con_bank_update=GetConnection.getConnection();
			st_nank_update=con_bank_update.createStatement();
			int res_update=st_nank_update.executeUpdate(update_bank_details);
			if(res_update>=0)
			{
				insert_msg="update";
			}
			
			
		}
		
		
		
		return insert_msg;
		
	}
	
	
	
	
	
}
