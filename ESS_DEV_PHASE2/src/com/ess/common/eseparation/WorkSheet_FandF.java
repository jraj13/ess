package com.ess.common.eseparation;

import java.sql.CallableStatement;
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

public class WorkSheet_FandF {
	
	public ArrayList<String> deciding_months(String seq_no) throws SQLException
	{
		ArrayList<String> decide=new ArrayList<String>();
		Connection con=null;
		CallableStatement stmt=null;
		String decide_procedure="{call DECIDINGFANDF_SETTLEMENT(?,?,?,?)}";
		int emp_serve_days=0;
		int deduction_days=0;
		int month=0;
		String final_decide=null;
		
		try{
			con=GetConnection.getConnection();
			stmt=con.prepareCall(decide_procedure);
			stmt.setString(1, seq_no);

			stmt.registerOutParameter(2, java.sql.Types.INTEGER);
			stmt.registerOutParameter(3, java.sql.Types.INTEGER);
			stmt.registerOutParameter(4, java.sql.Types.INTEGER);
			stmt.executeUpdate();
			emp_serve_days=stmt.getInt(2);
			deduction_days=stmt.getInt(3);
			month=stmt.getInt(4);
					
		}
		catch(Exception e)
		{
			System.out.println("Problem to call DECIDINGFANDF_SETTLEMENT(?,?,?,?)} ");
			e.printStackTrace();
		}
		final_decide=emp_serve_days+"^"+deduction_days+"^"+month;
		decide.add(final_decide);
		
		return decide;
		
	}
	
	
	
	
	
	
	
	

	public ArrayList<String> step1_work_sheet(String seq_no,int service_days,int deduction_days,int month_in) throws SQLException
	{
		ArrayList<String> work_sheet1=new ArrayList<String>();
		
		Connection con_sheet1=null;
		CallableStatement st_sheet1=null;
		String call_procedure= "{call FandF_step1(?,?,?,?,?,"
				+ "?,?,?,?,?,"
				+ "?,?,?,?,?,"
				+ "?,?,?,?,?,"
				+ "?,?,?,?,?,"
				+ "?,?,?,?,?,"
				+ "?,?,?)}";
		
		float basic_salary=0.0f;
		float convey_allowance=0.0f;
		float hra=0.0f;
		float spa=0.0f;
		float fuel_maint=0.0f;
		
		float pl_encash=0.0f;
		float el_encash=0.0f;
		float sl_encash=0.0f;
		float actual_reimburse=0.0f;
		float management_medical=0.0f;
		
		float hold_salary=0.0f;
		float pf=0.0f;
		float profession_tax=0.0f;
		float ess_claim=0.0f;
		float notice_period=0.0f;
		
		float impress=0.0f;
		float id_card=0.0f;
		float notice_peroid_previous=0.0f;
		float white_goods_recovery=0.0f;
		float vat_white_goods=0.0f;
		
		
		float complint_triggered=0.0f;
		float incometax=0.0f;
		float labour_welfare=0.0f;
		float esic=0.0f;
		float lease_car_emi=0.0f;
		
		float residual_value=0.0f;
		float excess_cl_recovery=0.0f;
		float bmp_recovery=0.0f;
		
		
		float gratuty=0.0f;
		
		float total_earnings=0.0f;
		float total_deductions=0.0f;
		float net_amount=0.0f;
		
		float non_taxable_leaves=0.0f;
		
		float no_tax_pl=0.0f;
		float no_tax_el=0.0f;
		float no_tax_sl=0.0f;
		
		String final_data;
		try{
			con_sheet1=GetConnection.getConnection();
			st_sheet1=con_sheet1.prepareCall(call_procedure);
			st_sheet1.setString(1,seq_no);
			st_sheet1.setInt(2, service_days);
			
			st_sheet1.registerOutParameter(3, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(4, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(5, java.sql.Types.FLOAT);
			
			st_sheet1.registerOutParameter(6, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(7, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(8, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(9, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(10, java.sql.Types.FLOAT);
			
			st_sheet1.registerOutParameter(11, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(12, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(13, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(14, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(15, java.sql.Types.FLOAT);
			
			st_sheet1.registerOutParameter(16, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(17, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(18, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(19, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(20, java.sql.Types.FLOAT);
			
			st_sheet1.registerOutParameter(21, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(22, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(23, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(24, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(25, java.sql.Types.FLOAT);
			
			st_sheet1.registerOutParameter(26, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(27, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(28, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(29, java.sql.Types.FLOAT);
			st_sheet1.registerOutParameter(30, java.sql.Types.FLOAT);
			
			st_sheet1.registerOutParameter(31, java.sql.Types.FLOAT);
			
			
			st_sheet1.setInt(32,deduction_days);
			st_sheet1.setInt(33,month_in);
			
			st_sheet1.executeUpdate();
			
			basic_salary=st_sheet1.getFloat(3);
			convey_allowance=st_sheet1.getFloat(4);
			hra=st_sheet1.getFloat(5);
			spa=st_sheet1.getFloat(6);
			fuel_maint=st_sheet1.getFloat(7);
			
			
			 pl_encash=st_sheet1.getFloat(8);
			 el_encash=st_sheet1.getFloat(9);
			 sl_encash=st_sheet1.getFloat(10);
			 actual_reimburse=st_sheet1.getFloat(11);
			 management_medical=st_sheet1.getFloat(12);
			
			
			  	hold_salary=st_sheet1.getFloat(13);
			  pf=st_sheet1.getFloat(14);
			  profession_tax=st_sheet1.getFloat(15);
			  ess_claim=st_sheet1.getFloat(16);
			 notice_period=st_sheet1.getFloat(17);
			 
			  	impress=st_sheet1.getFloat(18);
				 id_card=st_sheet1.getFloat(19);
				 notice_peroid_previous=st_sheet1.getFloat(20);
				 white_goods_recovery=st_sheet1.getFloat(21);
				 vat_white_goods=st_sheet1.getFloat(22);
				
			
				  	complint_triggered=st_sheet1.getFloat(23);
					 incometax=st_sheet1.getFloat(24);
					 labour_welfare=st_sheet1.getFloat(25);
					 esic=st_sheet1.getFloat(26);
					 lease_car_emi=st_sheet1.getFloat(27);
					
					 residual_value=st_sheet1.getFloat(28);
					 excess_cl_recovery=st_sheet1.getFloat(29);
					 bmp_recovery=st_sheet1.getFloat(30);
					  gratuty=st_sheet1.getFloat(31);
					  
					  

					  if(pl_encash>=0.0)
					  {
						  System.out.println("pl encashment"+pl_encash);
						  no_tax_pl=pl_encash;
					  }
						
					  if(el_encash>=0.0)
					  {
						  no_tax_el=el_encash;
					  }
					  if(sl_encash>=0.0)
					  {
						  System.out.println("sl encashment"+sl_encash);
						  no_tax_sl=sl_encash;
					  }
						
					  non_taxable_leaves=no_tax_pl+no_tax_el+no_tax_sl;
					  System.out.println("non_taxable_leaves"+non_taxable_leaves);
					  
					   total_earnings=(basic_salary+convey_allowance+hra+spa+fuel_maint+pl_encash+el_encash+sl_encash+actual_reimburse+management_medical+hold_salary);
							   
							   
							   
					   total_deductions=pf+profession_tax+ess_claim+notice_period+impress+id_card+notice_peroid_previous+white_goods_recovery+vat_white_goods+complint_triggered+incometax+labour_welfare+esic+lease_car_emi+residual_value+excess_cl_recovery+bmp_recovery;
					 net_amount=total_earnings-total_deductions;
						
						
					  
					   
		}
		catch(Exception e)
		{
			System.out.println("problem in calling FANDF Settlement Procedure");
			e.printStackTrace();
		}
		
		finally{
			st_sheet1.close();
			con_sheet1.close();
		}
		final_data=basic_salary+"^"+convey_allowance+"^"+hra+"^"+spa+"^"+fuel_maint+"^"+pl_encash+"^"+el_encash+"^"+sl_encash+"^"+actual_reimburse+"^"+management_medical+"^"+
				 hold_salary+"^"+pf+"^"+profession_tax+"^"+ess_claim+"^"+notice_period+"^"+impress+"^"
						 +id_card+"^"+notice_peroid_previous+"^"+white_goods_recovery+"^"+
				 vat_white_goods+"^"+complint_triggered+"^"+incometax+"^"+labour_welfare+"^"+esic+"^"+lease_car_emi+"^"+residual_value+"^"+excess_cl_recovery+"^"+bmp_recovery+"^"+gratuty+
				 "^"+non_taxable_leaves+"^"+total_earnings+"^"+total_deductions+"^"+net_amount;
				 work_sheet1.add(final_data);	
		
				 System.out.println("final data"+final_data);
		
		return work_sheet1;
		
	}
	
	
	
	//inserting data first time coming from procedure
	
	
	
	public String Insert_step1_values(float basic_salary,float convey_allowance,float hra,float spa,float fuel_maint,
	
			float pl_encash,float el_encash,float sl_encash,float actual_reimburse,float management_medical,
			float hold_salary,
	
			float pf,float profession_tax,float ess_claim,float notice_period,float impress,
			float id_card,float notice_peroid_previous,float white_goods_recovery,float vat_white_goods,float complint_triggered,
			float incometax,float labour_welfare,float esic,float lease_car_emi,float residual_value,
			float excess_cl_recovery,float bmp_recovery,
			
			float cumulative_basic,float gratuty,float non_taxable_leaves,float total_earnings,float total_deductions,
			float net_amount,String sequence_id,String status) throws SQLException
			
			{
		System.out.println("THis is Saving the f and f sheet1 java code");
		
		Connection con=null;
		Statement st=null;
		int rs=0;
		String reply_msg="not inserted";
		String insert_step1_values=
				
				"insert into FANDF_SETTLEMENT_PHASE1(basic_salary,CONVEY_ALLOWACE,hra,spa,fuel_maint,pl_encash,el_encash,sl_encash,actual_reimburse,"
				+ "management_medical,hold_salary,pf,profession_tax,ess_claim,notice_period,impress,id_card,notice_peroid_previous,white_goods_recovery,vat_white_goods,"
				+ "complint_triggered,incometax,labour_welfare,esic,lease_car_emi,residual_value,"
				+ "excess_cl_recovery,bmp_recovery,cumulative_basic,gratuty,non_taxable_leaves,total_earnings,total_deductions,"
				+ "net_amount,EMP_SEQUENCE_NUM,DATE_OF_INSERT,STATUS) values('"+basic_salary+"','"+convey_allowance+"','"+hra+"','"+spa+"','"+fuel_maint+"',"
						+ "'"+pl_encash+"','"+el_encash+"','"+sl_encash+"','"+actual_reimburse+"','"+management_medical+"','"+hold_salary+"','"+pf+"','"+profession_tax+"','"+ess_claim+"','"+notice_period+"','"+impress+"','"+id_card+"','"+notice_peroid_previous+"',"
								+ "'"+white_goods_recovery+"','"+vat_white_goods+"','"+complint_triggered+"',"
										+ "'"+incometax+"','"+labour_welfare+"','"+esic+"','"+lease_car_emi+"','"+residual_value+"',"
												+ "'"+excess_cl_recovery+"','"+bmp_recovery+"','"+cumulative_basic+"','"+gratuty+"',"
														+ "'"+non_taxable_leaves+"','"+total_earnings+"','"+total_deductions+"','"+net_amount+"',"
																+ "'"+sequence_id+"',sysdate,'"+status+"')";
		
	
		
		
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeUpdate(insert_step1_values);
			if(rs>0)
			{
				reply_msg="inserted";
				Full_N_Final_Settlement fnf_setttlement=new Full_N_Final_Settlement();
				String result=fnf_setttlement.fnf_submit_to_SA(sequence_id,status);
			}
		}
		
		
		catch(Exception e)
		{
			reply_msg="not inserted";
			System.out.println("Problem in inserting fandf settlement step1 ");
			e.printStackTrace();
		}
		finally{
			st.close();
			con.close();
		}
		
		
				return reply_msg;
		
			}
	
	//checking whether exist or not (step 1 settlement )
	
	public int check_existor_not(String sequence_no) throws SQLException
	{
	System.out.println("check_existor_not");
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		//int value=0;
		int value1=0;
		String count_query="select count(EMP_SEQUENCE_NUM) from FANDF_SETTLEMENT_PHASE1 where EMP_SEQUENCE_NUM='"+sequence_no+"'";
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(count_query);
			
			if(rs.next())
			{
				value1=rs.getInt(1);
			}
			else
			{
				value1=0;
			}
		}catch(Exception e)
		{
			System.out.println("This is the problem in counting fandf settlement step1 ");
			e.printStackTrace();
		}
		
		finally{
			st.close();
			con.close();
		}
		
		
		return value1;
		
	}
	
	
	
	//seleting data for viewing purpose
	
	public ArrayList<String> fetching_step1_fandF(String sequence_no) throws SQLException
	{
		ArrayList<String> data_step1 =new ArrayList<String>();
		System.out.println("fetching_step1_fandF");
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String count_query="select * from FANDF_SETTLEMENT_PHASE1 where EMP_SEQUENCE_NUM='"+sequence_no+"'";
		
		System.out.println("fetching_step1_fandF ..count_query.."+count_query);
		
		String final_data;
		float basic_salary=0.0f;
		float convey_allowance=0.0f;
		float hra=0.0f;
		float spa=0.0f;
		float fuel_maint=0.0f;
		
		float pl_encash=0.0f;
		float el_encash=0.0f;
		float sl_encash=0.0f;
		float actual_reimburse=0.0f;
		float management_medical=0.0f;
		float hold_salary=0.0f;

		float pf=0.0f;
		float profession_tax=0.0f;
		float ess_claim=0.0f;
		float notice_period=0.0f;
		float impress=0.0f;
		
		float id_card=0.0f;
		float notice_peroid_previous=0.0f;
		float white_goods_recovery=0.0f;
		float vat_white_goods=0.0f;
		float complint_triggered=0.0f;
		
		float incometax=0.0f;
		float labour_welfare=0.0f;
		float esic=0.0f;
		float lease_car_emi=0.0f;
		float residual_value=0.0f;
		
		float excess_cl_recovery=0.0f;
		float bmp_recovery=0.0f;
		
		//float cumulative_basic=0.0f;
		float gratuty=0.0f;
		float non_taxable_leaves=0.0f;
		float total_earnings=0.0f;
		float total_deductions=0.0f;
		float net_amount=0.0f;
	
		
		
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(count_query);
			while(rs.next())
			{
				
				 basic_salary=rs.getFloat("BASIC_SALARY");
				 convey_allowance=rs.getFloat("CONVEY_ALLOWACE");
				 hra=rs.getFloat("HRA");
				 spa=rs.getFloat("SPA");
				 fuel_maint=rs.getFloat("FUEL_MAINT");	
				
				 
				  pl_encash=rs.getFloat("PL_ENCASH");
					 el_encash=rs.getFloat("EL_ENCASH");
					 sl_encash=rs.getFloat("SL_ENCASH");
					 actual_reimburse=rs.getFloat("ACTUAL_REIMBURSE");
					 management_medical=rs.getFloat("MANAGEMENT_MEDICAL");
					 hold_salary=rs.getFloat("HOLD_SALARY");
				
				
					  pf=rs.getFloat("PF");
					profession_tax=rs.getFloat("PROFESSION_TAX");
						 ess_claim=rs.getFloat("ESS_CLAIM");
						 notice_period=rs.getFloat("NOTICE_PERIOD");
						 impress=rs.getFloat("IMPRESS");
				
				
						  id_card=rs.getFloat("ID_CARD");
							 notice_peroid_previous=rs.getFloat("NOTICE_PEROID_PREVIOUS");
							 white_goods_recovery=rs.getFloat("WHITE_GOODS_RECOVERY");
							 vat_white_goods=rs.getFloat("VAT_WHITE_GOODS");
							 complint_triggered=rs.getFloat("COMPLINT_TRIGGERED");
				
				
							  incometax=rs.getFloat("INCOMETAX");
								 labour_welfare=rs.getFloat("LABOUR_WELFARE");
								 esic=rs.getFloat("ESIC");
								 lease_car_emi=rs.getFloat("LEASE_CAR_EMI");
								 residual_value=rs.getFloat("RESIDUAL_VALUE");
								
								 excess_cl_recovery=rs.getFloat("EXCESS_CL_RECOVERY");
								 bmp_recovery=rs.getFloat("BMP_RECOVERY");
				
								  
									 gratuty=rs.getFloat("GRATUTY");
									 non_taxable_leaves=rs.getFloat("NON_TAXABLE_LEAVES");
									 total_earnings=rs.getFloat("TOTAL_EARNINGS");
									 total_deductions=rs.getFloat("TOTAL_DEDUCTIONS");
									 net_amount=rs.getFloat("NET_AMOUNT");
				
									 final_data=basic_salary+"^"+convey_allowance+"^"+hra+"^"+spa+"^"+fuel_maint+"^"+pl_encash+"^"+el_encash+"^"+sl_encash+"^"+actual_reimburse+"^"+management_medical+"^"+
											 hold_salary+"^"+pf+"^"+profession_tax+"^"+ess_claim+"^"+notice_period+"^"+impress+"^"
													 +id_card+"^"+notice_peroid_previous+"^"+white_goods_recovery+"^"+
											 vat_white_goods+"^"+complint_triggered+"^"+incometax+"^"+labour_welfare+"^"+esic+"^"+lease_car_emi+"^"+residual_value+"^"+excess_cl_recovery+"^"+bmp_recovery+"^"+gratuty+
											 "^"+non_taxable_leaves+"^"+total_earnings+"^"+total_deductions+"^"+net_amount;
									 data_step1.add(final_data); 
				
			}
		}catch(Exception e)
		{
			System.out.println("This is the problem in counting fandf settlement step1 ");
			e.printStackTrace();
		}
		
		finally{
			rs.close();
			st.close();
			con.close();
		}
		
			return data_step1;
	
	}
	
	
	
	//for updating after save from 2nd time onwards
	
	
	public String update_step1(float basic_salary,float convey_allowance,float hra,float spa,float fuel_maint,
			
			float pl_encash,float el_encash,float sl_encash,float actual_reimburse,float management_medical,
			float hold_salary,
	
			float pf,float profession_tax,float ess_claim,float notice_period,float impress,
			float id_card,float notice_peroid_previous,float white_goods_recovery,float vat_white_goods,float complint_triggered,
			float incometax,float labour_welfare,float esic,float lease_car_emi,float residual_value,
			float excess_cl_recovery,float bmp_recovery,
			
			float cumulative_basic,float gratuty,float non_taxable_leaves,float total_earnings,float total_deductions,
			float net_amount,String sequence_id,String status) throws SQLException
			
			{
		System.out.println("THis is Saving the f and f sheet1 java code");
		
		Connection con=null;
		Statement st=null;
		int rs=0;
		String reply_msg="not updated";
		String insert_step1_values=
				
				"update FANDF_SETTLEMENT_PHASE1 set basic_salary='"+basic_salary+"',CONVEY_ALLOWACE='"+convey_allowance+"',hra='"+hra+"',spa='"+spa+"',fuel_maint='"+fuel_maint+"'"
				+ ",pl_encash='"+pl_encash+"',el_encash='"+el_encash+"',sl_encash='"+sl_encash+"',actual_reimburse='"+actual_reimburse+"',"
				+ "management_medical='"+management_medical+"',hold_salary='"+hold_salary+"',pf='"+pf+"',profession_tax='"+profession_tax+"',"
				+ "ess_claim='"+ess_claim+"',notice_period='"+notice_period+"',impress='"+impress+"',id_card='"+id_card+"',notice_peroid_previous='"+notice_peroid_previous+"',"
				+ "white_goods_recovery='"+white_goods_recovery+"',vat_white_goods='"+vat_white_goods+"',"
				+ "complint_triggered='"+complint_triggered+"',incometax='"+incometax+"',labour_welfare='"+labour_welfare+"',"
				+ "esic='"+esic+"',lease_car_emi='"+lease_car_emi+"',residual_value='"+residual_value+"',"
				+ "excess_cl_recovery='"+excess_cl_recovery+"',bmp_recovery='"+bmp_recovery+"',cumulative_basic='"+cumulative_basic+"',"
				+ "gratuty='"+gratuty+"',non_taxable_leaves='"+non_taxable_leaves+"',total_earnings='"+total_earnings+"',"
				+ "total_deductions='"+total_deductions+"',"
				+ "net_amount='"+net_amount+"',DATE_OF_INSERT=sysdate where EMP_SEQUENCE_NUM='"+sequence_id+"'";
				
				
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeUpdate(insert_step1_values);
			if(rs>0)
			{
				reply_msg="updated";
				Full_N_Final_Settlement fnf_setttlement=new Full_N_Final_Settlement();
				String result=fnf_setttlement.fnf_submit_to_SA(sequence_id,status);
			}
		}
		
		
		catch(Exception e)
		{
			reply_msg="not updated";
			System.out.println("Problem in updating fandf settlement step1 ");
			e.printStackTrace();
		}
		finally{
			st.close();
			con.close();
		}
		
		
				return reply_msg;
		
			}
	
	/* F AND F INITIAL DATA FOR SANCTIONIGN AUTHORTITY  */
	
public ArrayList<Object> fnfSettelmentInfo_SA() throws SQLException{
		
		ArrayList<Object> datalist=new ArrayList<Object>();
		
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		
		String fandf_sql_query="";

		
		 fandf_sql_query="select mas.emp_id,mas.EMP_FNAME,mas.EMP_LNAME,mas.EMP_JOINING_DATE,sep.CREATION_DATE,sep.HR_RELIEVING_DATE,sep.SEQUENCE_NO,sep.HR_CLEARANCE_PROCCESS_STATUS "
+"from NCSS_EMP_MASTER_INFO mas,E_SEPARATION_EMP sep "
+"where mas.emp_id=sep.emp_id and  sep.HR_CLEARANCE_PROCCESS_STATUS in('Submitted to SA','Returned to HR') "
+"and sep.EMP_APPROVEL='Initiate' and sep.HR_APPROVE='Inprocess'";

		
	
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
				datalist.add(final_data);
				
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
		System.out.println("final result is"+datalist);
		return datalist;
		
}
	

	
/* F AND F INITIAL DATA FOR SANCTIONIGN AUTHORTITY  */

public ArrayList<Object> fnfSettelmentInfo_ACC() throws SQLException{
		
		ArrayList<Object> datalist=new ArrayList<Object>();
		
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		
		String fandf_sql_query="";

		
		 fandf_sql_query="select mas.emp_id,mas.EMP_FNAME,mas.EMP_LNAME,mas.EMP_JOINING_DATE,sep.CREATION_DATE,sep.HR_RELIEVING_DATE,sep.SEQUENCE_NO,sep.HR_CLEARANCE_PROCCESS_STATUS "
+"from NCSS_EMP_MASTER_INFO mas,E_SEPARATION_EMP sep "
+"where mas.emp_id=sep.emp_id and  sep.HR_CLEARANCE_PROCCESS_STATUS='Submitted to A/C' "
+"and sep.EMP_APPROVEL='Initiate' and sep.HR_APPROVE='Inprocess'";

		
	
		/*String fandf_sql_query="select mas.emp_id,mas.EMP_FNAME,mas.EMP_LNAME,mas.EMP_JOINING_DATE,sep.CREATION_DATE,sep.HR_RELIEVING_DATE,sep.SEQUENCE_NO,sep.HR_CLEARANCE_PROCCESS_STATUS from "
				+ "NCSS_EMP_MASTER_INFO mas,E_SEPARATION_EMP sep "
				+ "where mas.emp_id=sep.emp_id and sep.EMP_APPROVEL='Initiate' and sep.HR_APPROVE='Inprocess'";*/
		System.out.println("fnfSettelmentInfo_ACC..."+fandf_sql_query);
		
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
				datalist.add(final_data);
				
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
		System.out.println("final result is"+datalist);
		return datalist;
		
}


	
	/* F and f work sheet for step3 */
	
	
	public ArrayList<String> getting_initial_data_step3(String seq_no) throws SQLException
	{
		
		ArrayList<String> phase3=new ArrayList<String>();
		System.out.println("getting_initial_data_step3");
		Connection con=null;
		CallableStatement stmt=null;
		String array_data=null;
		
		String ini_fandf_step3="{ call FANDF_SETTLEMENT_STEP3(?,?,?,?,?,?,?,?,?,?,"
				+ "?,?,?,?,?,?,?,?,?,?,"
				+ "?,?,?,?,?,?,?,?,?,?,"
				+ "?,?,?,?,?,?,?,?,?,?,"
				+ "?,?,?,?,?,?,?,?,?,?,"
				+ "?,?)}";
		
		
		
			
		//22 elements in earnings parts
		
		float basic_salary=0.0f;
		float convey_allowance=0.0f;
		float hra=0.0f;
		float spa=0.0f;
		float fuel_maint=0.0f;
		
		float education=0.0f;
		float hostel=0.0f;
		float medical=0.0f;
		float one_time_payment=0.0f;
		float lta_amount=0.0f;
		
		float bonus_exgratia_amount=0.0f;
		float advance=0.0f;
		float washing=0.0f; 
		float entertainment=0.0f;
		float travel_fuel_expenses=0.0f;
		
		float food=0.0f;
		float gift=0.0f;
		float pl_encash=0.0f;
		float el_encash=0.0f;
		float sl_encash=0.0f;
		
		float actual_reimburse=0.0f;
		float hold_salary=0.0f;
		
		
		
		
				
				
		
			//27 elements in deduction part
		
		
		float pf=0.0f;
		float profession_tax=0.0f;
		float ess_claim=0.0f;
		float notice_period=0.0f;
		float mariage_loan=0.0f;
		
		float personal_loan=0.0f;
		float medical_loan=0.0f;
		float medical_reim_recovery=0.0f;
		float fuel_maint_recovery=0.0f;
		float joining_bonus=0.0f;
		
		float house_shift=0.0f;
		float black_berry=0.0f;
		float retemtion_bonus=0.0f;
		float salary_advance=0.0f;
		float domestic_travel=0.0f;
		
		
		
		
		
		
		float foreign_travel=0.0f;
		float impress=0.0f;
		float id_card=0.0f;
		float notice_peroid_previous=0.0f;
		float white_goods_recovery=0.0f;
		
		
		float incometax=0.0f;
		float labour_welfare=0.0f;
		float esic=0.0f;
		float lease_car_emi=0.0f;
		float residual_value=0.0f;
		
		float excess_cl_recovery=0.0f;
		float smp_recovery=0.0f;
		
		
		
		
		float gratuty=0.0f;
		
		float non_taxable_leaves=0.0f;
		
		float total_earnings=0.0f;
		float total_deductions=0.0f;
		float net_amount=0.0f;
		
		
		
		
		
		
		
		
		try{
			con=GetConnection.getConnection();
			stmt=con.prepareCall(ini_fandf_step3);
			
			stmt.setString(1,seq_no);
			
			stmt.registerOutParameter(2, java.sql.Types.FLOAT);
			stmt.registerOutParameter(3, java.sql.Types.FLOAT);
			stmt.registerOutParameter(4, java.sql.Types.FLOAT);
			stmt.registerOutParameter(5, java.sql.Types.FLOAT);
			
			
			stmt.registerOutParameter(6, java.sql.Types.FLOAT);
			stmt.registerOutParameter(7, java.sql.Types.FLOAT);
			stmt.registerOutParameter(8, java.sql.Types.FLOAT);
			stmt.registerOutParameter(9, java.sql.Types.FLOAT);
			stmt.registerOutParameter(10, java.sql.Types.FLOAT);
			
			stmt.registerOutParameter(11, java.sql.Types.FLOAT);
			stmt.registerOutParameter(12, java.sql.Types.FLOAT);
			stmt.registerOutParameter(13, java.sql.Types.FLOAT);
			stmt.registerOutParameter(14, java.sql.Types.FLOAT);
			stmt.registerOutParameter(15, java.sql.Types.FLOAT);
			
			stmt.registerOutParameter(16, java.sql.Types.FLOAT);
			stmt.registerOutParameter(17, java.sql.Types.FLOAT);
			stmt.registerOutParameter(18, java.sql.Types.FLOAT);
			stmt.registerOutParameter(19, java.sql.Types.FLOAT);
			stmt.registerOutParameter(20, java.sql.Types.FLOAT);
			
			
			stmt.registerOutParameter(21, java.sql.Types.FLOAT);
			stmt.registerOutParameter(22, java.sql.Types.FLOAT);
			stmt.registerOutParameter(23, java.sql.Types.FLOAT);
			
			//end of earnings
			
			//start of deductions
			
			stmt.registerOutParameter(24, java.sql.Types.FLOAT);
			stmt.registerOutParameter(25, java.sql.Types.FLOAT);
			stmt.registerOutParameter(26, java.sql.Types.FLOAT);
			stmt.registerOutParameter(27, java.sql.Types.FLOAT);
			stmt.registerOutParameter(28, java.sql.Types.FLOAT);
			
			stmt.registerOutParameter(29, java.sql.Types.FLOAT);
			stmt.registerOutParameter(30, java.sql.Types.FLOAT);
			stmt.registerOutParameter(31, java.sql.Types.FLOAT);
			stmt.registerOutParameter(32, java.sql.Types.FLOAT);
			stmt.registerOutParameter(33, java.sql.Types.FLOAT);
			
			stmt.registerOutParameter(34, java.sql.Types.FLOAT);
			stmt.registerOutParameter(35, java.sql.Types.FLOAT);
			stmt.registerOutParameter(36, java.sql.Types.FLOAT);
			stmt.registerOutParameter(37, java.sql.Types.FLOAT);
			stmt.registerOutParameter(38, java.sql.Types.FLOAT);
			
			stmt.registerOutParameter(39, java.sql.Types.FLOAT);
			stmt.registerOutParameter(40, java.sql.Types.FLOAT);
			stmt.registerOutParameter(41, java.sql.Types.FLOAT);
			stmt.registerOutParameter(42, java.sql.Types.FLOAT);
			stmt.registerOutParameter(43, java.sql.Types.FLOAT);
			
			stmt.registerOutParameter(44, java.sql.Types.FLOAT);
			stmt.registerOutParameter(45, java.sql.Types.FLOAT);
			stmt.registerOutParameter(46, java.sql.Types.FLOAT);
			stmt.registerOutParameter(47, java.sql.Types.FLOAT);
			stmt.registerOutParameter(48, java.sql.Types.FLOAT);
			
			stmt.registerOutParameter(49, java.sql.Types.FLOAT);
			stmt.registerOutParameter(50, java.sql.Types.FLOAT);
			
			//end of deductions
			
			//Gratuity
			stmt.registerOutParameter(51, java.sql.Types.FLOAT);
			//non taxable leave excemption
			
			stmt.registerOutParameter(52, java.sql.Types.FLOAT);
			stmt.executeUpdate();
			
			
			//retrieving the values of earnings 
			
			
			
			 basic_salary=stmt.getFloat(2);
			 convey_allowance=stmt.getFloat(3);
			 hra=stmt.getFloat(4);
			 spa=stmt.getFloat(5);
			 fuel_maint=stmt.getFloat(6);
			
			 education=stmt.getFloat(7);
			 hostel=stmt.getFloat(8);
			 medical=stmt.getFloat(9);
			 one_time_payment=stmt.getFloat(10);
			 lta_amount=stmt.getFloat(11);
			
			 bonus_exgratia_amount=stmt.getFloat(12);
			 advance=stmt.getFloat(13);
			 washing=stmt.getFloat(14); 
			 entertainment=stmt.getFloat(15);
			 travel_fuel_expenses=stmt.getFloat(16);
			
			 food=stmt.getFloat(17);
			 gift=stmt.getFloat(18);
			 pl_encash=stmt.getFloat(19);
			 el_encash=stmt.getFloat(20);
			 sl_encash=stmt.getFloat(21);
			
			 actual_reimburse=stmt.getFloat(22);
			 hold_salary=stmt.getFloat(23);
			
			
			//end retrieve values
			 
			 //retrieve deduction amounts
			
			 	 pf=stmt.getFloat(24);
				 profession_tax=stmt.getFloat(25);
				 ess_claim=stmt.getFloat(26);
				 notice_period=stmt.getFloat(27);
				 mariage_loan=stmt.getFloat(28);
				
				 personal_loan=stmt.getFloat(29);
				 medical_loan=stmt.getFloat(30);
				 medical_reim_recovery=stmt.getFloat(31);
				 fuel_maint_recovery=stmt.getFloat(32);
				 joining_bonus=stmt.getFloat(33);
				
				 house_shift=stmt.getFloat(34);
				 black_berry=stmt.getFloat(35);
				 retemtion_bonus=stmt.getFloat(36);
				 salary_advance=stmt.getFloat(37);
				 domestic_travel=stmt.getFloat(38);
				
				 foreign_travel=stmt.getFloat(39);
				 impress=stmt.getFloat(40);
				 id_card=stmt.getFloat(41);
				 notice_peroid_previous=stmt.getFloat(42);
				 white_goods_recovery=stmt.getFloat(43);
				
				
				 incometax=stmt.getFloat(44);
				 labour_welfare=stmt.getFloat(45);
				 esic=stmt.getFloat(46);
				 lease_car_emi=stmt.getFloat(47);
				 residual_value=stmt.getFloat(48);
				
				 excess_cl_recovery=stmt.getFloat(49);
				 smp_recovery=stmt.getFloat(50);
			
				 gratuty=stmt.getFloat(51);
				 non_taxable_leaves=stmt.getFloat(52);
			
				 total_earnings=basic_salary+convey_allowance+hra+spa+fuel_maint+education+hostel+medical+one_time_payment+lta_amount+
							
							bonus_exgratia_amount+advance+washing+entertainment+travel_fuel_expenses+
							
							food+gift+pl_encash+el_encash+sl_encash+actual_reimburse+hold_salary;
				 
				 
				 total_deductions=pf+profession_tax+ess_claim+notice_period+mariage_loan+
							
							personal_loan+medical_loan+medical_reim_recovery+fuel_maint_recovery+joining_bonus+
							
							house_shift+black_berry+retemtion_bonus+salary_advance+domestic_travel+
							foreign_travel+impress+id_card+notice_peroid_previous+white_goods_recovery+
							incometax+labour_welfare+esic+lease_car_emi+residual_value+
							excess_cl_recovery+smp_recovery;
				 
				 net_amount=total_earnings+total_deductions;
			
			
		}
		catch(Exception e)
		{
			System.out.println("The problem in getting full and final settlemetn step 3 procedures values");
			e.printStackTrace();
		}
		finally{
			stmt.close();
			con.close();
			
		}
		
		
		array_data=basic_salary+"^"+convey_allowance+"^"+hra+"^"+spa+"^"+fuel_maint+"^"+
		education+"^"+hostel+"^"+medical+"^"+one_time_payment+"^"+lta_amount+"^"+
				
				bonus_exgratia_amount+"^"+advance+"^"+washing+"^"+entertainment+"^"+travel_fuel_expenses+"^"+
				
				food+"^"+gift+"^"+pl_encash+"^"+el_encash+"^"+sl_encash+"^"+actual_reimburse+"^"+hold_salary+"^"
		
		
		+pf+"^"+profession_tax+"^"+ess_claim+"^"+notice_period+"^"+mariage_loan+"^"+
		
personal_loan+"^"+medical_loan+"^"+medical_reim_recovery+"^"+fuel_maint_recovery+"^"+joining_bonus+"^"+
		
		house_shift+"^"+black_berry+"^"+retemtion_bonus+"^"+salary_advance+"^"+domestic_travel+"^"+
		foreign_travel+"^"+impress+"^"+id_card+"^"+notice_peroid_previous+"^"+white_goods_recovery+"^"+
		incometax+"^"+labour_welfare+"^"+esic+"^"+lease_car_emi+"^"+residual_value+"^"+
		excess_cl_recovery+"^"+smp_recovery+"^"+gratuty+"^"+non_taxable_leaves+"^"+total_earnings+"^"+total_deductions+"^"+net_amount;
		
		phase3.add(array_data);
		
		
		return phase3;
		
		
	}
	
	
public String insert_step3_values(
			
			
			float basic_salary,float convey_allowance,float hra,float spa,float fuel_maint,
			float education,float hostel,float medical,float one_time_payment,float lta_amount, 
			float bonus_exgratia_amount,float advance,float washing,float entertainment,float travel_fuel_expenses,
			float food,float gift,float pl_encash,float el_encash,float sl_encash, 
			float actual_reimburse,float hold_salary, 
			
			
			float pf,float profession_tax,float ess_claim,float notice_period,float mariage_loan, 
			float personal_loan,float medical_loan,float medical_reim_recovery,float fuel_maint_recovery,float joining_bonus,
			
			float house_shift,float black_berry,float retemtion_bonus,float salary_advance,float domestic_travel,
			float foreign_travel,float impress,float id_card,float notice_peroid_previous,float white_goods_recovery,
			float incometax,float labour_welfare,float esic,float lease_car_emi,float residual_value,
			float excess_cl_recovery,float bmp_recovery,float 
			
			cumulative_basic,float 
			gratuty,float 
			non_taxable_leaves,float 
			total_earnings,float 
			total_deductions,float 
			net_amount,String seqence_no,String remarks,String status) throws SQLException
	{
		System.out.println("insert_step3_values under SA");
		
		Connection con=null;
		Statement st=null;
		String reply_msg="not insert";
		
		
		String insert_step3="insert into FANDF_SETTLEMENT_PHASE3(BASIC_SALARY,CONVEY_ALLOWANCE,HRA,SPA,FUEL_MAINT,"
				+ "EDUCATION,HOSTEL,MEDICAL,ONE_TIME_PAYMENT,LTA_AMOUNT,"
				+ "BONUS_EXGRATIA_AMOUNT,ADVANCE,WASHING,ENTERTAINMENT,TRAVEL_FUEL_EXPENSES,"
				+ "FOOD,GIFT,PL_ENCASH,EL_ENCASH,SL_ENCASH,"
				+ "ACTUAL_REIMBURSE,HOLD_SALARY,"
				+ "PF,PROFESSION_TAX,ESS_CLAIM,NOTICE_PERIOD,MARIAGE_LOAN,"
				+ "PERSONAL_LOAN,MEDICAL_LOAN,MEDICAL_REIM_RECOVERY,FUEL_MAINT_RECOVERY,JOINING_BONUS,"
				+ "HOUSE_SHIFT,BLACK_BERRY,RETEMTION_BONUS,SALARY_ADVANCE,DOMESTIC_TRAVEL,"
				+ "FOREIGN_TRAVEL,IMPRESS,ID_CARD,NOTICE_PEROID_PREVIOUS,WHITE_GOODS_RECOVERY,"
				+ "INCOMETAX,LABOUR_WELFARE,ESIC,LEASE_CAR_EMI,RESIDUAL_VALUE,"
				+ "EXCESS_CL_RECOVERY,BMP_RECOVERY,"
				
+ "CUMULATIVE_BASIC,GRATUTY,NON_TAXABLE_LEAVES,TOTAL_EARNINGS,TOTAL_DEDUCTIONS,"
+ "NET_AMOUNT,SEQENCE_NO,INSERT_DATE,REMARKS,STATUS) values('"+basic_salary+"','"+convey_allowance+"','"+hra+"','"+spa+"','"+fuel_maint+"',"
		+ "'"+education+"','"+hostel+"','"+medical+"','"+one_time_payment+"','"+lta_amount+"',"
				+ "'"+bonus_exgratia_amount+"','"+advance+"','"+washing+"','"+entertainment+"','"+travel_fuel_expenses+"',"
				+ "'"+food+"','"+gift+"','"+pl_encash+"','"+el_encash+"','"+sl_encash+"',"
				+ "'"+actual_reimburse+"','"+hold_salary+"',"
				
				+ "'"+pf+"','"+profession_tax+"','"+ess_claim+"','"+notice_period+"','"+mariage_loan+"',"
				+ "'"+personal_loan+"','"+medical_loan+"','"+medical_reim_recovery+"','"+fuel_maint_recovery+"','"+joining_bonus+"',"
				+ "'"+house_shift+"','"+black_berry+"','"+retemtion_bonus+"','"+salary_advance+"','"+domestic_travel+"',"
				+ "'"+foreign_travel+"','"+impress+"','"+id_card+"','"+notice_peroid_previous+"','"+white_goods_recovery+"',"
				+ "'"+incometax+"','"+labour_welfare+"','"+esic+"','"+lease_car_emi+"','"+residual_value+"',"
				
				+ "'"+excess_cl_recovery+"','"+bmp_recovery+"',"
				+ "'"+cumulative_basic+"','"+gratuty+"','"+non_taxable_leaves+"','"+total_earnings+"',"
				+ "'"+total_deductions+"','"+net_amount+"','"+seqence_no+"',sysdate,'"+remarks+"','"+status+"')";
				
				
try{
	con=GetConnection.getConnection();
	st=con.createStatement();
	int rs=st.executeUpdate(insert_step3);
	if(rs>=0)
	{
		reply_msg="Save as draft successfully";
		Full_N_Final_Settlement fnf_setttlement=new Full_N_Final_Settlement();
		String result=fnf_setttlement.fnf_submit_to_SA(seqence_no,status);
	}
	
	
}catch(Exception e)
{
	System.out.println("the problem exist in fandf settlement phasde 3 insertinon");
	e.printStackTrace();
}
			
			finally{
				st.close();
				con.close();
				
			}
		
		
		
		return reply_msg;
	}

	

//checking whether exist or not (step 3 settlement for SANCTIONING AUTHORITY)

	public int check_existor_not_SA(String sequence_no) throws SQLException
	{
	System.out.println("check_existor_not_SA");
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		//int value=0;
		int value1=0;
		String count_query="select count(SEQENCE_NO) from FANDF_SETTLEMENT_PHASE3 where SEQENCE_NO='"+sequence_no+"'";
		System.out.println("check_existor_not_SA...count.."+count_query);
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(count_query);
			
			if(rs.next())
			{
				value1=rs.getInt(1);
			}
			else
			{
				value1=0;
			}
		}catch(Exception e)
		{
			System.out.println("This is the problem in counting fandf settlement step1 ");
			e.printStackTrace();
		}
		
		finally{
			st.close();
			con.close();
		}
		
		return value1;
		
	}
	
	
	//fetching from table 2nd time onwords
	
	
		public ArrayList<String>  getting_phase3_values(String seq_no) throws SQLException
		{
			ArrayList<String> fetch_phase3=new ArrayList<String>();
			Connection con_ph3=null;
			Statement st_ph3=null;
			ResultSet rs_ph32=null;
			
			String fetch_phase3_sql="select * from FANDF_SETTLEMENT_PHASE3 where SEQENCE_NO='"+seq_no+"'";
			
			
			float basic_salary=0.0f;
			float convey_allowance=0.0f;
			float hra=0.0f;
			float spa=0.0f;
			float fuel_maint=0.0f;
			
			float education=0.0f;
			float hostel=0.0f;
			float medical=0.0f;
			float one_time_payment=0.0f;
			float lta_amount=0.0f;
			
			float bonus_exgratia_amount=0.0f;
			float advance=0.0f;
			float washing=0.0f; 
			float entertainment=0.0f;
			float travel_fuel_expenses=0.0f;
			
			float food=0.0f;
			float gift=0.0f;
			float pl_encash=0.0f;
			float el_encash=0.0f;
			float sl_encash=0.0f;
			
			float actual_reimburse=0.0f;
			float hold_salary=0.0f;
			
			
			
			
					
					
			
				//27 elements in deduction part
			
			
			float pf=0.0f;
			float profession_tax=0.0f;
			float ess_claim=0.0f;
			float notice_period=0.0f;
			float mariage_loan=0.0f;
			
			float personal_loan=0.0f;
			float medical_loan=0.0f;
			float medical_reim_recovery=0.0f;
			float fuel_maint_recovery=0.0f;
			float joining_bonus=0.0f;
			
			float house_shift=0.0f;
			float black_berry=0.0f;
			float retemtion_bonus=0.0f;
			float salary_advance=0.0f;
			float domestic_travel=0.0f;
			
			
			
			
			
			
			float foreign_travel=0.0f;
			float impress=0.0f;
			float id_card=0.0f;
			float notice_peroid_previous=0.0f;
			float white_goods_recovery=0.0f;
			
			
			float incometax=0.0f;
			float labour_welfare=0.0f;
			float esic=0.0f;
			float lease_car_emi=0.0f;
			float residual_value=0.0f;
			
			float excess_cl_recovery=0.0f;
			float smp_recovery=0.0f;
			
			
			
			
			float gratuty=0.0f;
			float cumulative_basic=0.0f;
			
			float non_taxable_leaves=0.0f;
			
			float total_earnings=0.0f;
			float total_deductions=0.0f;
			float net_amount=0.0f;
			String remarks="";
			
			String final_data;
			
			try{
				con_ph3=GetConnection.getConnection();
				st_ph3=con_ph3.createStatement();
				rs_ph32=st_ph3.executeQuery(fetch_phase3_sql);
				while(rs_ph32.next())
				{
					
					
					basic_salary=rs_ph32.getFloat("BASIC_SALARY");
					 convey_allowance=rs_ph32.getFloat("CONVEY_ALLOWANCE");
					 hra=rs_ph32.getFloat("HRA");
					 spa=rs_ph32.getFloat("SPA");
					 fuel_maint=rs_ph32.getFloat("FUEL_MAINT");
					
					 education=rs_ph32.getFloat("EDUCATION");
					 hostel=rs_ph32.getFloat("HOSTEL");
					 medical=rs_ph32.getFloat("MEDICAL");
					 one_time_payment=rs_ph32.getFloat("ONE_TIME_PAYMENT");
					 lta_amount=rs_ph32.getFloat("LTA_AMOUNT");
					
					 bonus_exgratia_amount=rs_ph32.getFloat("BONUS_EXGRATIA_AMOUNT");
					 advance=rs_ph32.getFloat("ADVANCE");
					 washing=rs_ph32.getFloat("WASHING"); 
					 entertainment=rs_ph32.getFloat("ENTERTAINMENT");
					 travel_fuel_expenses=rs_ph32.getFloat("TRAVEL_FUEL_EXPENSES");
					 
					
					 food=rs_ph32.getFloat("FOOD");
					 gift=rs_ph32.getFloat("GIFT");
					 pl_encash=rs_ph32.getFloat("PL_ENCASH");
					 el_encash=rs_ph32.getFloat("EL_ENCASH");
					 sl_encash=rs_ph32.getFloat("SL_ENCASH");
					
					 actual_reimburse=rs_ph32.getFloat("ACTUAL_REIMBURSE");
					 hold_salary=rs_ph32.getFloat("HOLD_SALARY");
					
					
					//end retrieve values
					 
					 //retrieve deduction amounts
					
					 	 pf=rs_ph32.getFloat("PF");
						 profession_tax=rs_ph32.getFloat("PROFESSION_TAX");
						 ess_claim=rs_ph32.getFloat("ESS_CLAIM");
						 notice_period=rs_ph32.getFloat("NOTICE_PERIOD");
						 mariage_loan=rs_ph32.getFloat("MARIAGE_LOAN");
						
						 personal_loan=rs_ph32.getFloat("PERSONAL_LOAN");
						 medical_loan=rs_ph32.getFloat("MEDICAL_LOAN");
						 medical_reim_recovery=rs_ph32.getFloat("MEDICAL_REIM_RECOVERY");
						 fuel_maint_recovery=rs_ph32.getFloat("FUEL_MAINT_RECOVERY");
						 joining_bonus=rs_ph32.getFloat("JOINING_BONUS");
						
						 house_shift=rs_ph32.getFloat("HOUSE_SHIFT");
						 black_berry=rs_ph32.getFloat("BLACK_BERRY");
						 retemtion_bonus=rs_ph32.getFloat("RETEMTION_BONUS");
						 salary_advance=rs_ph32.getFloat("SALARY_ADVANCE");
						 domestic_travel=rs_ph32.getFloat("DOMESTIC_TRAVEL");
						
						 
						 foreign_travel=rs_ph32.getFloat("FOREIGN_TRAVEL");
						 impress=rs_ph32.getFloat("IMPRESS");
						 id_card=rs_ph32.getFloat("ID_CARD");
						 notice_peroid_previous=rs_ph32.getFloat("NOTICE_PEROID_PREVIOUS");
						 white_goods_recovery=rs_ph32.getFloat("WHITE_GOODS_RECOVERY");
						
						
						 incometax=rs_ph32.getFloat("INCOMETAX");
						 labour_welfare=rs_ph32.getFloat("LABOUR_WELFARE");
						 esic=rs_ph32.getFloat("ESIC");
						 lease_car_emi=rs_ph32.getFloat("LEASE_CAR_EMI");
						 residual_value=rs_ph32.getFloat("RESIDUAL_VALUE");
						
						 
						 
						 excess_cl_recovery=rs_ph32.getFloat("EXCESS_CL_RECOVERY");
						 smp_recovery=rs_ph32.getFloat("BMP_RECOVERY");
					
						 gratuty=rs_ph32.getFloat("GRATUTY");
						 non_taxable_leaves=rs_ph32.getFloat("NON_TAXABLE_LEAVES");
					
					//extra columns list
						 cumulative_basic=rs_ph32.getFloat("CUMULATIVE_BASIC");
						 total_earnings=rs_ph32.getFloat("TOTAL_EARNINGS");
						 total_deductions=rs_ph32.getFloat("TOTAL_DEDUCTIONS");
						 net_amount=rs_ph32.getFloat("NET_AMOUNT");
						 remarks=rs_ph32.getString("REMARKS");
						 if(remarks==null || remarks==""){
							 remarks="";
						 }
					
				}
				
			}catch(Exception e)
			{
				System.out.println("problem for geeting values from fandf settlement phase3");
				e.printStackTrace();
			}
			finally{
				rs_ph32.close();
				st_ph3.close();
				con_ph3.close();
			}
			final_data=basic_salary+"^"+convey_allowance+"^"+hra+"^"+spa+"^"+fuel_maint+"^"+
					education+"^"+hostel+"^"+medical+"^"+one_time_payment+"^"+lta_amount+"^"+
							
							bonus_exgratia_amount+"^"+advance+"^"+washing+"^"+entertainment+"^"+travel_fuel_expenses+"^"+
							
							food+"^"+gift+"^"+pl_encash+"^"+el_encash+"^"+sl_encash+"^"+actual_reimburse+"^"+hold_salary+"^"
					
					
					+pf+"^"+profession_tax+"^"+ess_claim+"^"+notice_period+"^"+mariage_loan+"^"+
					
			personal_loan+"^"+medical_loan+"^"+medical_reim_recovery+"^"+fuel_maint_recovery+"^"+joining_bonus+"^"+
					
					house_shift+"^"+black_berry+"^"+retemtion_bonus+"^"+salary_advance+"^"+domestic_travel+"^"+
					foreign_travel+"^"+impress+"^"+id_card+"^"+notice_peroid_previous+"^"+white_goods_recovery+"^"+
					incometax+"^"+labour_welfare+"^"+esic+"^"+lease_car_emi+"^"+residual_value+"^"+
					excess_cl_recovery+"^"+smp_recovery+"^"+gratuty+"^"+cumulative_basic+"^"+non_taxable_leaves+"^"+total_earnings+"^"+total_deductions+"^"+
					net_amount +"^"+  remarks;
					
			fetch_phase3.add(final_data);
			return fetch_phase3;
		}

	
		//update the values after fetching SA
		
		public String update_step3_values(
					
					
					float basic_salary,float convey_allowance,float hra,float spa,float fuel_maint,
					float education,float hostel,float medical,float one_time_payment,float lta_amount, 
					float bonus_exgratia_amount,float advance,float washing,float entertainment,float travel_fuel_expenses,
					float food,float gift,float pl_encash,float el_encash,float sl_encash, 
					float actual_reimburse,float hold_salary, 
					
					
					float pf,float profession_tax,float ess_claim,float notice_period,float mariage_loan, 
					float personal_loan,float medical_loan,float medical_reim_recovery,float fuel_maint_recovery,float joining_bonus,
					
					float house_shift,float black_berry,float retemtion_bonus,float salary_advance,float domestic_travel,
					float foreign_travel,float impress,float id_card,float notice_peroid_previous,float white_goods_recovery,
					float incometax,float labour_welfare,float esic,float lease_car_emi,float residual_value,
					float excess_cl_recovery,float bmp_recovery,float 
					
					cumulative_basic,float 
					gratuty,float 
					non_taxable_leaves,float 
					total_earnings,float 
					total_deductions,float 
					net_amount,String seqence_no,String remarks,String status) throws SQLException
			{
				
				Connection con=null;
				Statement st=null;
				String reply_msg="not update";
				
				String update_query_step3=
			"update FANDF_SETTLEMENT_PHASE3 set BASIC_SALARY='"+basic_salary+"',CONVEY_ALLOWANCE='"+convey_allowance+"',HRA='"+hra+"',SPA='"+spa+"',FUEL_MAINT='"+fuel_maint+"',"
			+ "EDUCATION='"+education+"',HOSTEL='"+hostel+"',MEDICAL='"+medical+"',ONE_TIME_PAYMENT='"+one_time_payment+"',LTA_AMOUNT='"+lta_amount+"',"
			+ "BONUS_EXGRATIA_AMOUNT='"+bonus_exgratia_amount+"',ADVANCE='"+advance+"',WASHING='"+washing+"',ENTERTAINMENT='"+entertainment+"',TRAVEL_FUEL_EXPENSES='"+travel_fuel_expenses+"',"
			+ "FOOD='"+food+"',GIFT='"+gift+"',PL_ENCASH='"+pl_encash+"',EL_ENCASH='"+el_encash+"',SL_ENCASH='"+sl_encash+"',"
			+ "ACTUAL_REIMBURSE='"+actual_reimburse+"',HOLD_SALARY='"+hold_salary+"',"
			+ "PF='"+pf+"',PROFESSION_TAX='"+profession_tax+"',ESS_CLAIM='"+ess_claim+"',NOTICE_PERIOD='"+notice_period+"',MARIAGE_LOAN='"+mariage_loan+"',"
			+ "PERSONAL_LOAN='"+personal_loan+"',MEDICAL_LOAN='"+medical_loan+"',MEDICAL_REIM_RECOVERY='"+medical_reim_recovery+"',FUEL_MAINT_RECOVERY='"+fuel_maint_recovery+"',JOINING_BONUS='"+joining_bonus+"',"
			+ "HOUSE_SHIFT='"+house_shift+"',BLACK_BERRY='"+black_berry+"',RETEMTION_BONUS='"+retemtion_bonus+"',SALARY_ADVANCE='"+salary_advance+"',DOMESTIC_TRAVEL='"+domestic_travel+"',"
			+ "FOREIGN_TRAVEL='"+foreign_travel+"',IMPRESS='"+impress+"',ID_CARD='"+id_card+"',NOTICE_PEROID_PREVIOUS='"+notice_peroid_previous+"',WHITE_GOODS_RECOVERY='"+white_goods_recovery+"',"
			+ "INCOMETAX='"+incometax+"',LABOUR_WELFARE='"+labour_welfare+"',ESIC='"+esic+"',LEASE_CAR_EMI='"+lease_car_emi+"',RESIDUAL_VALUE='"+residual_value+"',"
			+ "EXCESS_CL_RECOVERY='"+excess_cl_recovery+"',BMP_RECOVERY='"+bmp_recovery+"',"
						
		+ "CUMULATIVE_BASIC='"+cumulative_basic+"',GRATUTY='"+gratuty+"',NON_TAXABLE_LEAVES='"+non_taxable_leaves+"',TOTAL_EARNINGS='"+total_earnings+"',TOTAL_DEDUCTIONS='"+total_deductions+"',"
		+ "NET_AMOUNT='"+net_amount+"',INSERT_DATE=sysdate,REMARKS='"+remarks+"',STATUS='"+status+"' where SEQENCE_NO='"+seqence_no+"'";
				
				
				
				
			System.out.println("update_query_step3.."+update_query_step3);	
				
				
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			int rs=st.executeUpdate(update_query_step3);
			if(rs>=0)
			{
				reply_msg="update";
				Full_N_Final_Settlement fnf_setttlement=new Full_N_Final_Settlement();
				String result=fnf_setttlement.fnf_submit_to_SA(seqence_no,status);
			}
			
			
			
		}catch(Exception e)
		{
			System.out.println("the problem exist in fandf settlement phasde 3 updation");
			e.printStackTrace();
		}
					
					finally{
						st.close();
						con.close();
						
					}
				
				
				
				return reply_msg;
			}
	
	
	
	
	
	
}











