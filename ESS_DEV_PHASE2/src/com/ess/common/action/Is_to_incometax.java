package com.ess.common.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;
public class Is_to_incometax {

/*
 * Investment declaration columns 
 */
	public static ArrayList<Object> investment_80c_column() throws SQLException {
		ArrayList<Object> ins_column_80c= new ArrayList<Object>();
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		String du=df.format(new java.util.Date());
		int month=Integer.parseInt(du.substring(3,5));
		int year=Integer.parseInt(du.substring(6,10));
		int h_year=year+1;
		int l_year=year-1;
		
		String date="01-APR-"+year;
		String date_h="01-APR-"+h_year;
		String date_l="01-APR-"+l_year;
		String sql=null;
		
		
		if(month>=4){
			sql="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	
	    ResultSet rs13 = null;
	    
	    try {
			Connection conn13 = GetConnection.getConnection();
			Statement st13 = conn13.createStatement();
				rs13 = st13.executeQuery(sql);
					float TOTAL_80C_GROSS=0.0f;
					String tot80c=null;
					float parent=0.0f;
					float TOTAL_80_PROPOSED_AMOUNT=0.0f;
					String total_col=null;
					String pr_medical=null;
					String tot_80d=null;
					
						if (rs13.next()) {

							TOTAL_80C_GROSS=rs13.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
							parent=rs13.getFloat("MCSC_80D_PROPOSED_AMOUNT");
							
							TOTAL_80_PROPOSED_AMOUNT=rs13.getFloat("TOTAL_80_PROPOSED_AMOUNT");
							
							if(parent>0.0){
								pr_medical="Parent Medical Insr Prem";
								ins_column_80c.add(pr_medical);
							}
							
							if(TOTAL_80C_GROSS>0.0){
								
								tot80c="Deduction Under sec 80";
								
								ins_column_80c.add(tot80c);
								
				}
							/*if(TOTAL_80_PROPOSED_AMOUNT>0.0){
								tot_80d="Deduction under sec 80dD";
								ins_column_80c.add(tot_80d);
							}*/
							if(TOTAL_80C_GROSS>0.0|| TOTAL_80_PROPOSED_AMOUNT>0.0)
							{
								total_col="Total";
								ins_column_80c.add(total_col);
							}
				
				
}
	    }
 catch (Exception e) {
			e.printStackTrace();
		}
	    
		System.out.println(ins_column_80c);
		return ins_column_80c;
		
	}




/*
 * ivestment gross
 */


	public static ArrayList<Object> investment_80c_value_Gross() throws SQLException {
		ArrayList<Object> ins_value_80c= new ArrayList<Object>();
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		
		
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		String du=df.format(new java.util.Date());
		int month=Integer.parseInt(du.substring(3,5));
		int year=Integer.parseInt(du.substring(6,10));
		int h_year=year+1;
		int l_year=year-1;
		
		String date="01-APR-"+year;
		String date_h="01-APR-"+h_year;
		String date_l="01-APR-"+l_year;
		String sql=null;
		
		
		if(month>=4){
			sql="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	
	    ResultSet rs12 = null;
	    
	    try {
			Connection conn12 = GetConnection.getConnection();
			Statement st12 = conn12.createStatement();
				rs12 = st12.executeQuery(sql);
					float TOTAL_80C_GROSS=0.0f;
					float tot80c=0.0f;
					float parent=0.0f;
					float pr_medical=0.0f;
					float tot_gross=0.0f;
					float tot_80d_gross=0.0f;
					String gross_col=null;
					float TOTAL_80_PROPOSED_AMOUNT=0.0f;
					float after_parent_deduction=0.0f;
					
						if (rs12.next()) {

							TOTAL_80C_GROSS=rs12.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
							parent=rs12.getFloat("MCSC_80D_PROPOSED_AMOUNT");
							TOTAL_80_PROPOSED_AMOUNT=rs12.getFloat("TOTAL_80_PROPOSED_AMOUNT");
							
							if(TOTAL_80C_GROSS>0.0 ||TOTAL_80_PROPOSED_AMOUNT>0.0){
								
								gross_col="Gross Amt. Rs";
								ins_value_80c.add(gross_col);
							}
							
							if(parent>0.0){
								pr_medical=parent;
								ins_value_80c.add(pr_medical);
							}
							
							if(TOTAL_80C_GROSS>0.0){
								
								tot80c=TOTAL_80C_GROSS;
								ins_value_80c.add(tot80c);
				}
							
							if(TOTAL_80_PROPOSED_AMOUNT>0.0){
								
								
								after_parent_deduction=TOTAL_80_PROPOSED_AMOUNT;
								tot_80d_gross=TOTAL_80_PROPOSED_AMOUNT-pr_medical;
								
								
								//ins_value_80c.add(tot_80d_gross);
							}
				
							if(TOTAL_80C_GROSS>0.0){
								
								tot_gross=(TOTAL_80C_GROSS+after_parent_deduction)-tot_80d_gross;
								ins_value_80c.add(tot_gross);
							}
							
}
	    }
 catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_value_80c);
		return ins_value_80c;
		
	}
	
	
	
	
	/*
	 * investment declaration qual Rs
	 */
	public static ArrayList<Object> investment_80c_value_Qual() throws SQLException {
		ArrayList<Object> ins_value_80c_ded= new ArrayList<Object>();
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		
		
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		String du=df.format(new java.util.Date());
		int month=Integer.parseInt(du.substring(3,5));
		int year=Integer.parseInt(du.substring(6,10));
		int h_year=year+1;
		int l_year=year-1;
		
		String date="01-APR-"+year;
		String date_h="01-APR-"+h_year;
		String date_l="01-APR-"+l_year;
		String sql=null;
		
		
		if(month>=4){
			sql="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	
	    ResultSet rs15 = null;
	    
	    try {
			Connection conn15 = GetConnection.getConnection();
			Statement st12 = conn15.createStatement();
				rs15 = st12.executeQuery(sql);
					float TOTAL_80C_GROSS=0.0f;
					float tot80c=0.0f;
					float parent=0.0f;
					float pr_medical=0.0f;
					 String ded=null;
					 float tot_qual=0.0f;
					 float TOTAL_80_PROPOSED_AMOUNT=0.0f;
					 float tot80d_ins=0.0f;
						if (rs15.next()) {

							TOTAL_80C_GROSS=rs15.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
							parent=rs15.getFloat("MCSC_80D_PROPOSED_AMOUNT");
							TOTAL_80_PROPOSED_AMOUNT=rs15.getFloat("TOTAL_80_PROPOSED_AMOUNT");
							if(TOTAL_80C_GROSS>0.0){
								
								ded="Qual.Amt.Rs";
								ins_value_80c_ded.add(ded);
							}
							
							if(parent>0.0){
								pr_medical=20000;
								ins_value_80c_ded.add(pr_medical);
							}
							
							if(TOTAL_80C_GROSS>0.0){
								
								tot80c=150000;
								ins_value_80c_ded.add(tot80c);
				}
							/*if(TOTAL_80_PROPOSED_AMOUNT>0.0){
								
								tot80d_ins=150000;
								ins_value_80c_ded.add(tot80d_ins);
				}*/
							if(TOTAL_80C_GROSS>0.0){
								
								tot_qual=tot80c+pr_medical;
								ins_value_80c_ded.add(tot_qual);
							}
}
	    }
 catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_value_80c_ded);
		return ins_value_80c_ded;
		
	}
/*
 * inves Ded amt
 */
	
	public static ArrayList<Object> investment_80c_ded() throws SQLException {
		ArrayList<Object> ins_value_80c_ded= new ArrayList<Object>();
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		
		
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		String du=df.format(new java.util.Date());
		int month=Integer.parseInt(du.substring(3,5));
		int year=Integer.parseInt(du.substring(6,10));
		int h_year=year+1;
		int l_year=year-1;
		
		String date="01-APR-"+year;
		String date_h="01-APR-"+h_year;
		String date_l="01-APR-"+l_year;
		String sql_ded=null;
		
		
		if(month>=4){
			sql_ded="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql_ded="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	
	    ResultSet rs_ded = null;
	    
	    try {
			Connection conn_ded = GetConnection.getConnection();
			Statement st_ded = conn_ded.createStatement();
				rs_ded = st_ded.executeQuery(sql_ded);
					float TOTAL_80C_GROSS=0.0f;
					float tot80c=0.0f;
					float parent=0.0f;
					float pr_medical=0.0f;
					String ded_ins=null;
					float ded_tot=0.0f;
					float TOTAL_80_PROPOSED_AMOUNT=0.0f;
					float tot80d_ins=0.0f;
						if (rs_ded.next()) {

							TOTAL_80C_GROSS=rs_ded.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
							parent=rs_ded.getFloat("MCSC_80D_PROPOSED_AMOUNT");
							TOTAL_80_PROPOSED_AMOUNT=rs_ded.getFloat("TOTAL_80_PROPOSED_AMOUNT");
							if(TOTAL_80C_GROSS>0.0){
								
								ded_ins="Ded.Amt.Rs";
								ins_value_80c_ded.add(ded_ins);
							}
							
							if(parent>0.0){
								pr_medical=parent;
								ins_value_80c_ded.add(pr_medical);
							}
							
							if(TOTAL_80C_GROSS>0.0){
								
								tot80c=TOTAL_80C_GROSS;
								ins_value_80c_ded.add(tot80c);
							}
							if(TOTAL_80_PROPOSED_AMOUNT>0.0){
								
								tot80d_ins=TOTAL_80_PROPOSED_AMOUNT-pr_medical;
								//ins_value_80c_ded.add(tot80d_ins);
							}
							
							if(TOTAL_80C_GROSS>0.0){
								
								ded_tot=TOTAL_80C_GROSS+pr_medical+tot80d_ins;
								ins_value_80c_ded.add(ded_tot);
							}
				
				
}
	    }
 catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(ins_value_80c_ded);
		return ins_value_80c_ded;
		
	}
	
	
public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			//getBasicInfo();
			//getactual();
			//ChoicepayValues();
			//ChoicepayColuns();
			//investment_display();
			//invest_col();
			investment_80c_value_Gross();
			investment_80c_column();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}










/*package com.ess.common.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;
public class Is_to_incometax {


 * Investment declaration columns 
 
	public static ArrayList<Object> investment_80c_column() throws SQLException {
		ArrayList<Object> ins_column_80c= new ArrayList<Object>();
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		String du=df.format(new java.util.Date());
		int month=Integer.parseInt(du.substring(3,5));
		int year=Integer.parseInt(du.substring(6,10));
		int h_year=year+1;
		int l_year=year-1;
		
		String date="01-APR-"+year;
		String date_h="01-APR-"+h_year;
		String date_l="01-APR-"+l_year;
		String sql=null;
		
		
		if(month>=4){
			sql="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	
	    ResultSet rs13 = null;
	    
	    try {
			Connection conn13 = GetConnection.getConnection();
			Statement st13 = conn13.createStatement();
				rs13 = st13.executeQuery(sql);
					float TOTAL_80C_GROSS=0.0f;
					String tot80c=null;
					float parent=0.0f;
					float TOTAL_80_PROPOSED_AMOUNT=0.0f;
					String total_col=null;
					String pr_medical=null;
					String tot_80d=null;
					
						if (rs13.next()) {

							TOTAL_80C_GROSS=rs13.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
							parent=rs13.getFloat("MCSC_80D_PROPOSED_AMOUNT");
							
							TOTAL_80_PROPOSED_AMOUNT=rs13.getFloat("TOTAL_80_PROPOSED_AMOUNT");
							
							if(parent>0.0){
								pr_medical="Parent Medical Insr Prem";
								ins_column_80c.add(pr_medical);
							}
							
							if(TOTAL_80C_GROSS>0.0){
								
								tot80c="Deduction Under sec 80C";
								
								ins_column_80c.add(tot80c);
								
				}
							if(TOTAL_80_PROPOSED_AMOUNT>0.0){
								tot_80d="Deduction under sec 80dD";
								ins_column_80c.add(tot_80d);
							}
							if(TOTAL_80C_GROSS>0.0|| TOTAL_80_PROPOSED_AMOUNT>0.0)
							{
								total_col="Total";
								ins_column_80c.add(total_col);
							}
				
				
}
	    }
 catch (Exception e) {
			e.printStackTrace();
		}
	    
		System.out.println(ins_column_80c);
		return ins_column_80c;
		
	}





 * ivestment gross
 


	public static ArrayList<Object> investment_80c_value_Gross() throws SQLException {
		ArrayList<Object> ins_value_80c= new ArrayList<Object>();
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		
		
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		String du=df.format(new java.util.Date());
		int month=Integer.parseInt(du.substring(3,5));
		int year=Integer.parseInt(du.substring(6,10));
		int h_year=year+1;
		int l_year=year-1;
		
		String date="01-APR-"+year;
		String date_h="01-APR-"+h_year;
		String date_l="01-APR-"+l_year;
		String sql=null;
		
		
		if(month>=4){
			sql="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	
	    ResultSet rs12 = null;
	    
	    try {
			Connection conn12 = GetConnection.getConnection();
			Statement st12 = conn12.createStatement();
				rs12 = st12.executeQuery(sql);
					float TOTAL_80C_GROSS=0.0f;
					float tot80c=0.0f;
					float parent=0.0f;
					float pr_medical=0.0f;
					float tot_gross=0.0f;
					float tot_80d_gross=0.0f;
					String gross_col=null;
					float TOTAL_80_PROPOSED_AMOUNT=0.0f;
					
						if (rs12.next()) {

							TOTAL_80C_GROSS=rs12.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
							parent=rs12.getFloat("MCSC_80D_PROPOSED_AMOUNT");
							TOTAL_80_PROPOSED_AMOUNT=rs12.getFloat("TOTAL_80_PROPOSED_AMOUNT");
							
							if(TOTAL_80C_GROSS>0.0 ||TOTAL_80_PROPOSED_AMOUNT>0.0){
								
								gross_col="Gross Amt. Rs";
								ins_value_80c.add(gross_col);
							}
							
							if(parent>0.0){
								pr_medical=parent;
								ins_value_80c.add(pr_medical);
							}
							
							if(TOTAL_80C_GROSS>0.0){
								
								tot80c=TOTAL_80C_GROSS;
								ins_value_80c.add(tot80c);
				}
							
							if(TOTAL_80_PROPOSED_AMOUNT>0.0){
								
								tot_80d_gross=TOTAL_80_PROPOSED_AMOUNT;
								
								ins_value_80c.add(tot_80d_gross);
							}
				
							if(TOTAL_80C_GROSS>0.0){
								
								tot_gross=TOTAL_80C_GROSS+tot_80d_gross-pr_medical;
								ins_value_80c.add(tot_gross);
							}
							
}
	    }
 catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_value_80c);
		return ins_value_80c;
		
	}
	
	
	
	
	
	 * investment declaration qual Rs
	 
	public static ArrayList<Object> investment_80c_value_Qual() throws SQLException {
		ArrayList<Object> ins_value_80c_ded= new ArrayList<Object>();
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		
		
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		String du=df.format(new java.util.Date());
		int month=Integer.parseInt(du.substring(3,5));
		int year=Integer.parseInt(du.substring(6,10));
		int h_year=year+1;
		int l_year=year-1;
		
		String date="01-APR-"+year;
		String date_h="01-APR-"+h_year;
		String date_l="01-APR-"+l_year;
		String sql=null;
		
		
		if(month>=4){
			sql="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	
	    ResultSet rs15 = null;
	    
	    try {
			Connection conn15 = GetConnection.getConnection();
			Statement st12 = conn15.createStatement();
				rs15 = st12.executeQuery(sql);
					float TOTAL_80C_GROSS=0.0f;
					float tot80c=0.0f;
					float parent=0.0f;
					float pr_medical=0.0f;
					 String ded=null;
					 float tot_qual=0.0f;
					 float TOTAL_80_PROPOSED_AMOUNT=0.0f;
					 float tot80d_ins=0.0f;
						if (rs15.next()) {

							TOTAL_80C_GROSS=rs15.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
							parent=rs15.getFloat("MCSC_80D_PROPOSED_AMOUNT");
							TOTAL_80_PROPOSED_AMOUNT=rs15.getFloat("TOTAL_80_PROPOSED_AMOUNT");
							if(TOTAL_80C_GROSS>0.0){
								
								ded="Qual.Amt.Rs";
								ins_value_80c_ded.add(ded);
							}
							
							if(parent>0.0){
								pr_medical=20000;
								ins_value_80c_ded.add(pr_medical);
							}
							
							if(TOTAL_80C_GROSS>0.0){
								
								tot80c=150000;
								ins_value_80c_ded.add(tot80c);
				}
if(TOTAL_80_PROPOSED_AMOUNT>0.0){
								
								tot80d_ins=150000;
								ins_value_80c_ded.add(tot80d_ins);
				}
							if(TOTAL_80C_GROSS>0.0){
								
								tot_qual=tot80c+pr_medical;
								ins_value_80c_ded.add(tot_qual);
							}
}
	    }
 catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_value_80c_ded);
		return ins_value_80c_ded;
		
	}

 * inves Ded amt
 
	
	public static ArrayList<Object> investment_80c_ded() throws SQLException {
		ArrayList<Object> ins_value_80c_ded= new ArrayList<Object>();
		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		
		
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		String du=df.format(new java.util.Date());
		int month=Integer.parseInt(du.substring(3,5));
		int year=Integer.parseInt(du.substring(6,10));
		int h_year=year+1;
		int l_year=year-1;
		
		String date="01-APR-"+year;
		String date_h="01-APR-"+h_year;
		String date_l="01-APR-"+l_year;
		String sql_ded=null;
		
		
		if(month>=4){
			sql_ded="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql_ded="select MCSC_80D_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	
	    ResultSet rs_ded = null;
	    
	    try {
			Connection conn_ded = GetConnection.getConnection();
			Statement st_ded = conn_ded.createStatement();
				rs_ded = st_ded.executeQuery(sql_ded);
					float TOTAL_80C_GROSS=0.0f;
					float tot80c=0.0f;
					float parent=0.0f;
					float pr_medical=0.0f;
					String ded_ins=null;
					float ded_tot=0.0f;
					float TOTAL_80_PROPOSED_AMOUNT=0.0f;
					float tot80d_ins=0.0f;
						if (rs_ded.next()) {

							TOTAL_80C_GROSS=rs_ded.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
							parent=rs_ded.getFloat("MCSC_80D_PROPOSED_AMOUNT");
							TOTAL_80_PROPOSED_AMOUNT=rs_ded.getFloat("TOTAL_80_PROPOSED_AMOUNT");
							if(TOTAL_80C_GROSS>0.0){
								
								ded_ins="Ded.Amt.Rs";
								ins_value_80c_ded.add(ded_ins);
							}
							
							if(parent>0.0){
								pr_medical=parent;
							}
							
							if(TOTAL_80C_GROSS>0.0){
								
								tot80c=TOTAL_80C_GROSS;
								ins_value_80c_ded.add(tot80c);
							}
if(TOTAL_80_PROPOSED_AMOUNT>0.0){
								
								tot80d_ins=TOTAL_80_PROPOSED_AMOUNT-pr_medical;
								ins_value_80c_ded.add(tot80d_ins);
							}
							
							if(TOTAL_80C_GROSS>0.0){
								
								ded_tot=TOTAL_80C_GROSS;
								ins_value_80c_ded.add(ded_tot);
							}
				
				
}
	    }
 catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(ins_value_80c_ded);
		return ins_value_80c_ded;
		
	}
	
	
public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			//getBasicInfo();
			//getactual();
			//ChoicepayValues();
			//ChoicepayColuns();
			//investment_display();
			//invest_col();
			investment_80c_value_Gross();
			investment_80c_column();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

*/