package com.ess.common.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
//import java.util.Map;

//import java.util.Map;

import java.util.Calendar;
import java.util.Map;

import com.ess.util.GetConnection;
//import com.opensymphony.xwork2.ActionContext;
//import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionContext;

public class NewIncomeTax {
/*
 * Geeting Basic information about Employee
 */
	
	public static ArrayList<String> getBasicInfo() throws SQLException {
		ArrayList<String> basicInfo = new ArrayList<String>();
		
		Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		System.out.println("id from login=========="+id);
		
		/*String sql = "select EMP_ID,EMP_NAME,EMP_DESIGNATION,PAN_NO from EMP_PAY_MASTER_TEMP where EMP_ID='"+id+"'";*/
		String sql="select EMP_ID,EMP_FNAME,EMP_LNAME,EMP_DESIG,PAN from NCSS_EMP_MASTER_INFO where EMP_ID='"+id+"'";
		
		String empDetails = null;
		
	    
	    ResultSet rst = null;
	    
	    try {
			Connection con = GetConnection.getConnection();
			Statement stmt = con.createStatement();

			rst = stmt.executeQuery(sql);

			String empId = "";
			String empFName = "";
			String empLName = "";
			String empDesig = "";
			String empPan = "";
			
			if (rst.next()) {

				empId = rst.getString("EMP_ID");
				empFName = rst.getString("EMP_FNAME");
				empLName = rst.getString("EMP_LNAME");
				empDesig = rst.getString("EMP_DESIG");
				empPan = rst.getString("PAN");
				
				empDetails = empId + "^" + empFName + "^" + empLName   + "^" + empDesig + "^"+ empPan;
				basicInfo.add(empDetails);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(empDetails);
		return basicInfo;
	}
	/*
	 * Getting first part for incometax 
	 */
	
	public static ArrayList<Object> getactual() throws SQLException {
		ArrayList<Object> getmonth = new ArrayList<Object>();
		
		 //String sql1="SELECT * FROM INCOMETAX WHERE EMPID='CSSE150045'";
		Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		System.out.println("id from login=========="+id);
		String  new_month=null;
		Calendar now = Calendar.getInstance();
	    int  month=now.get(Calendar.MONTH) + 1;
	   int year=now.get(Calendar.YEAR);
	    if(month<10){
	    	  new_month="0"+String.valueOf(month);
	    	 System.out.println(new_month);
	    }
	    
	    else{
	    	  new_month=String.valueOf(month);
	    	 System.out.println(new_month);
	    }
	   // select * from EMP_INVESTMENT_DECLARATION where to_char(DATE_TIME,'MM')='8' and to_char(DATE_TIME,'YYYY')='2015';
		
		String sql1="SELECT * FROM INCOMETAX WHERE EMPID='"+id+"' and to_char(DATE_TIME,'MM')='"+new_month+"' and to_char(DATE_TIME,'YYYY')='"+year+"'";
		 ResultSet rs = null;
		 String emp=null;
		 try{
			 Connection con1 = GetConnection.getConnection();
				Statement stm = con1.createStatement();

				rs = stm.executeQuery(sql1);
				String ACTUL=null;
				String PROJECTION=null;
				float BASIC_SALARY_ACT=0.0f;
				float BASIC_SALARY_PRO=0.0f;
				float BASIC_SALARY_TOT=0.0f;
				float HRA_ACT=0.0f;
				float HRA_PRO=0.0f;
				float HRA_TOT=0.0f;
				float SA_ACT=0.0f;
				float SA_PRO=0.0f;
				float SA_TOT=0.0f;
				
				float PLI_ACT=0.0f;
				float PLI_PRO=0.0f;
				float PLI_TOT=0.0f;
				float EARNINGS_TOTAL=0.0f;
				
				float choicepay_total=0.0f;
				
				float GROSS_EARNINGS=0.0f;
				float PER_TOTAL=0.0f;
				
				
				float GROSS_SALARY=0.0f;
				float INCOME_PREVIOUS=0.0f;
				float GROSS_PREVIOUS=0.0f;
				
				float STD_DEDUCTION=0.0f;
				float PRO_TAX=0.0f;
				float PRO_TAX_PREVIOUS=0.0f;
				float DED_TOTAL=0.0f;
				
				float INCOME_CHARGABLE=0.0f;
				
				float INCOME_OTHER=0.0f;
				
				
				//float TOT_DED=0.0f;
				
				float MAX_QUAL=0.0f;
				float TOTAL_TAXABLE=0.0f;
				float TAX_CREDIT=0.0f;
				float TAX_PAYABLE=0.0f;
				float SURCHARGE_ON_TAX=0.0f;
				float HIGHER_EDU=0.0f;
				float TOTALTAX=0.0f;
				float TAX_CURRENT_YEAR=0.0f;
				
				float REBATE=0.0f;
				float TAX_PREVIOUS_YEAR=0.0f;
				//float BALANCE_TAX=0.0f;
				
				
				if (rs.next()) {
					
					
					 ACTUL=rs.getString("ACTUL");
					PROJECTION=rs.getString("PROJECTION");
					BASIC_SALARY_ACT=rs.getFloat("BASIC_SALARY_ACT");
					BASIC_SALARY_PRO=rs.getFloat("BASIC_SALARY_PRO");
					BASIC_SALARY_TOT=rs.getFloat("BASIC_SALARY_TOT");
					
					HRA_ACT=rs.getFloat("HRA_ACT");
					HRA_PRO=rs.getFloat("HRA_PRO");
					HRA_TOT=rs.getFloat("HRA_TOT");
					SA_ACT=rs.getFloat("SA_ACT");
					SA_PRO=rs.getFloat("SA_PRO");
					
					
					SA_TOT=rs.getFloat("SA_TOT");
					PLI_ACT=rs.getFloat("PLI_ACT");
					PLI_PRO=rs.getFloat("PLI_PRO");
					PLI_TOT=rs.getFloat("PLI_TOT");
					EARNINGS_TOTAL=rs.getFloat("EARNINGS_TOTAL");
					
					
					choicepay_total=rs.getFloat("choicepay_total");
					GROSS_EARNINGS=rs.getFloat("GROSS_EARNINGS");
					PER_TOTAL=rs.getFloat("PER_TOTAL");
					GROSS_SALARY=rs.getFloat("GROSS_SALARY");
					INCOME_PREVIOUS=rs.getFloat("INCOME_PREVIOUS");
					
					
					GROSS_PREVIOUS=rs.getFloat("GROSS_PREVIOUS");
					STD_DEDUCTION=rs.getFloat("STD_DEDUCTION");
					PRO_TAX=rs.getFloat("PRO_TAX");
					PRO_TAX_PREVIOUS=rs.getFloat("PRO_TAX_PREVIOUS");
					DED_TOTAL=rs.getFloat("DED_TOTAL");
					
					
					INCOME_CHARGABLE=rs.getFloat("INCOME_CHARGABLE");
					INCOME_OTHER=rs.getFloat("INCOME_OTHER");
					MAX_QUAL=rs.getFloat("MAX_QUAL");
					TOTAL_TAXABLE=rs.getFloat("TOTAL_TAXABLE");
					TAX_CREDIT=rs.getFloat("TAX_CREDIT");
					
					
					TAX_PAYABLE=rs.getFloat("TAX_PAYABLE");
					SURCHARGE_ON_TAX=rs.getFloat("SURCHARGE_ON_TAX");
					HIGHER_EDU=rs.getFloat("HIGHER_EDU");
					TOTALTAX=rs.getFloat("TOTALTAX");
					TAX_CURRENT_YEAR=rs.getFloat("TAX_CURRENT_YEAR");
					
					
					REBATE=rs.getFloat("REBATE");
					TAX_PREVIOUS_YEAR=rs.getFloat("TAX_PREVIOUS_YEAR");
					
					emp=ACTUL + "^" + PROJECTION+"^"+BASIC_SALARY_ACT+"^"+BASIC_SALARY_PRO+"^"+BASIC_SALARY_TOT+"^"+
					HRA_ACT+"^"+HRA_PRO+"^"+HRA_TOT+"^"+SA_ACT+"^"+SA_PRO+"^"+
							SA_TOT+"^"+PLI_ACT+"^"+PLI_PRO+"^"+PLI_TOT+"^"+EARNINGS_TOTAL+"^"+
					choicepay_total+"^"+GROSS_EARNINGS+"^"+PER_TOTAL+"^"+GROSS_SALARY+"^"+INCOME_PREVIOUS+"^"+
							GROSS_PREVIOUS+"^"+STD_DEDUCTION+"^"+PRO_TAX+"^"+PRO_TAX_PREVIOUS+"^"+DED_TOTAL+"^"+
					INCOME_CHARGABLE+"^"+INCOME_OTHER+"^"+MAX_QUAL+"^"+TOTAL_TAXABLE
					
					+"^"+TAX_CREDIT+"^"+TAX_PAYABLE+"^"+SURCHARGE_ON_TAX+"^"+HIGHER_EDU+"^"+TOTALTAX+"^"+
					TAX_CURRENT_YEAR+"^"+REBATE+"^"+TAX_PREVIOUS_YEAR;
					
					getmonth.add(emp);
					System.out.println(getmonth);
				}
		 }catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 return getmonth;
	}
	
	public static ArrayList<Object> ChoicepayValues() throws SQLException {
		ArrayList<Object> ins_dec = new ArrayList<Object>();
		Map<String,Object> session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
	
		
		
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		String du=df.format(new java.util.Date());
		int month=Integer.parseInt(du.substring(3,5));
		int year=Integer.parseInt(du.substring(6,10));
		int h_year=year+1;
		int l_year=year-1;
		String date="01-APR-"+year;
		String date_h="01-APR-"+h_year;
		String date_l="01-APR-"+l_year;
		String getChoiceColuns=null;
		
		
		if(month>=4){
			getChoiceColuns="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			getChoiceColuns="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"'  and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	    
	    ResultSet rs2 = null;
	    
	    try {
			Connection conn = GetConnection.getConnection();
			Statement st = conn.createStatement();

			rs2 = st.executeQuery(getChoiceColuns);
			float MEDICAL_NEW=0.0f;
			float CHILDREN_NEW=0.0f;
			float CONVEYANCE_NEW=0.0f;
			float FUEL_NEW=0.0f;
			float HRA_NEW=0.0f;
			
			float LTA_NEW=0.0f;
			float ER_NPS_NEW=0.0f;
			float ADVANCE=0.0f;
			float WASHING=0.0f;
			float CHILDREN_H_NEW=0.0f;
			
			
			float FOOD=0.0f;
			float GIFT_NEW=0.0f;
			float UTILITY_BILLS=0.0f;
			
			if (rs2.next()) {

				MEDICAL_NEW = rs2.getFloat("MEDICAL_NEW");
				CHILDREN_NEW=rs2.getFloat("CHILDREN_NEW");
				CONVEYANCE_NEW = rs2.getFloat("CONVEYANCE_NEW");
				FUEL_NEW = rs2.getFloat("FUEL_NEW");
				HRA_NEW = rs2.getFloat("HRA_NEW");
				
				LTA_NEW= rs2.getFloat("LTA_NEW");
				ER_NPS_NEW= rs2.getFloat("ER_NPS_NEW");
				ADVANCE= rs2.getFloat("ADVANCE");
				WASHING= rs2.getFloat("WASHING");
				CHILDREN_H_NEW= rs2.getFloat("CHILDREN_H_NEW");
				
				
				FOOD= rs2.getFloat("FOOD");
				GIFT_NEW= rs2.getFloat("GIFT_NEW");
				UTILITY_BILLS= rs2.getFloat("UTILITY_BILLS");
				
				if(MEDICAL_NEW>0.0){
				
					ins_dec.add(MEDICAL_NEW);
					}
				if(CHILDREN_NEW>0.0)
				{	
					ins_dec.add(CHILDREN_NEW);
				}
				if(CONVEYANCE_NEW>0.0)
				{
					
					ins_dec.add(CONVEYANCE_NEW);
				}
				if(FUEL_NEW>0.0)
				{
					ins_dec.add(FUEL_NEW);
				}
				if(HRA_NEW>0.0){
					
					ins_dec.add(HRA_NEW);
				}
				
				
				//LIC,ELSS,NPF,DSNHB,HLR
				if(LTA_NEW>0.0)
				{
					ins_dec.add(LTA_NEW);
				}
				if(ER_NPS_NEW>0.0){
					ins_dec.add(ER_NPS_NEW);
				}
				if(ADVANCE>0.0){
					ins_dec.add(ADVANCE);
				}
				if(WASHING>0.0){
					ins_dec.add(WASHING);
				}
				if(CHILDREN_H_NEW>0.0){
					ins_dec.add(CHILDREN_H_NEW);
				}
				
				//ISES,IMF,TFFC,LIC_JSF,MCNSC
				
				if(FOOD>0.0)
				{
					ins_dec.add(FOOD);
				}
				if(GIFT_NEW>0.0){
					ins_dec.add(GIFT_NEW);
				}
				if(UTILITY_BILLS>0.0){
					ins_dec.add(UTILITY_BILLS);
				}
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_dec);
		return ins_dec;
		
	}
	
	/*
	 * Getting Choicepay columns if u opting
	 */
	public static ArrayList<Object> ChoicepayColuns() throws SQLException {
		ArrayList<Object> ch_values = new ArrayList<Object>();
		Map<String,Object> session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
				
		
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		String du=df.format(new java.util.Date());
		int month=Integer.parseInt(du.substring(3,5));
		int year=Integer.parseInt(du.substring(6,10));
		int h_year=year+1;
		int l_year=year-1;
		
		String date="01-APR-"+year;
		String date_h="01-APR-"+h_year;
		String date_l="01-APR-"+l_year;
		String getChoiceColuns=null;
		
		
		if(month>=4){
			getChoiceColuns="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"' and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			getChoiceColuns="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"'  and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}	
		
		
		
		Connection conn_col=null;
	    ResultSet rs4 = null;
	    
	    try {
		 conn_col = GetConnection.getConnection();
			Statement st = conn_col.createStatement();

			rs4 = st.executeQuery(getChoiceColuns);
			float MEDICAL_NEW=0.0f;
			float CHILDREN_NEW=0.0f;
			float CONVEYANCE_NEW=0.0f;
			float FUEL_NEW=0.0f;
			float HRA_NEW=0.0f;
			
			float LTA_NEW=0.0f;
			float ER_NPS_NEW=0.0f;
			float ADVANCE=0.0f;
			float WASHING=0.0f;
			float CHILDREN_H_NEW=0.0f;
			
			
			float FOOD=0.0f;
			float GIFT_NEW=0.0f;
			float UTILITY_BILLS=0.0f;
			
			
			if (rs4.next()) {

				MEDICAL_NEW = rs4.getFloat("MEDICAL_NEW");
				CHILDREN_NEW=rs4.getFloat("CHILDREN_NEW");
				CONVEYANCE_NEW = rs4.getFloat("CONVEYANCE_NEW");
				FUEL_NEW = rs4.getFloat("FUEL_NEW");
				HRA_NEW = rs4.getFloat("HRA_NEW");
				
				LTA_NEW= rs4.getFloat("LTA_NEW");
				ER_NPS_NEW= rs4.getFloat("ER_NPS_NEW");
				ADVANCE= rs4.getFloat("ADVANCE");
				WASHING= rs4.getFloat("WASHING");
				CHILDREN_H_NEW= rs4.getFloat("CHILDREN_H_NEW");
				
				
				FOOD= rs4.getFloat("FOOD");
				GIFT_NEW= rs4.getFloat("GIFT_NEW");
				UTILITY_BILLS= rs4.getFloat("UTILITY_BILLS");
				
				if(MEDICAL_NEW>0.0){
				
					ch_values.add("Medical Reimbursement");
					}
				if(CHILDREN_NEW>0.0)
				{	
					ch_values.add("Children Education Allowance");
				}
				if(CONVEYANCE_NEW>0.0)
				{
					
					ch_values.add("Conveyance Allowance");
				}
				if(FUEL_NEW>0.0)
				{
					ch_values.add("Fuel / Maint. Expenses");
				}
				if(HRA_NEW>0.0){
					
					ch_values.add("HRA");
				}
				
				
				//LIC,ELSS,NPF,DSNHB,HLR
				if(LTA_NEW>0.0)
				{
					ch_values.add("LTA");
				}
				if(ER_NPS_NEW>0.0){
					ch_values.add("Er.NPS Contribution");
				}
				if(ADVANCE>0.0){
					ch_values.add("Advance Bonus");
				}
				if(WASHING>0.0){
					ch_values.add("Washing Expenses");
				}
				if(CHILDREN_H_NEW>0.0){
					ch_values.add("Children Hostel Allowance");
				}
				
				//ISES,IMF,TFFC,LIC_JSF,MCNSC
				
				if(FOOD>0.0)
				{
					ch_values.add("Food Coupons");
				}
				if(GIFT_NEW>0.0){
					ch_values.add("Gift Coupons");
				}
				if(UTILITY_BILLS>0.0){
					ch_values.add("Utility Bills ");
				}
				
				System.out.println(ch_values);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    finally{
	    	rs4.close();
	    	conn_col.close();
	    }
	    
	    
		return ch_values;
		
	}
	
	
	
	
	
	
	/*
	 * Getting Gross Amount investment values if u opting
	 */
	
	public static ArrayList<Object> investment_display() throws SQLException {
		ArrayList<Object> ins_value = new ArrayList<Object>();
		Map<String,Object> session = ActionContext.getContext().getSession();
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
			sql="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	//	String sql="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'";
	    ResultSet rs2 = null;
	    
	    try {
			Connection conn = GetConnection.getConnection();
			Statement st = conn.createStatement();

			rs2 = st.executeQuery(sql);
			float LIP=0.0f;
			float PPF=0.0f;
			float NSS=0.0f;
			float NSC=0.0f;
			float GOVT=0.0f;
			
			float LIC=0.0f;
			float ELSS=0.0f;
			float NPF=0.0f;
			float DSNHB=0.0f;
			float HLR=0.0f;
			
			
			float ISES=0.0f;
			float IMF=0.0f;
			float TFFC=0.0f;
			float LIC_JSF=0.0f;
			float MCNSC=0.0f;
			
			
			
			float MCSC=0.0f;
			float MCS=0.0f;
			float MTHD=0.0f;
			float MTSD=0.0f;
			float MTSDS=0.0f;
			float TOTAL_80C_GROSS=0.0f;
			float TOTAL_80C=0.0f;
			
			if (rs2.next()) {

				LIP = rs2.getFloat("LIP_80C_PROPOSED_AMOUNT");
				PPF=rs2.getFloat("PPF_8OC_PROPOSED_AMOUNT");
				NSS = rs2.getFloat("NSS_8OC_PROPOSED_AMOUNT");
				NSC = rs2.getFloat("NSC_8OC_PROPOSED_AMOUNT");
				GOVT = rs2.getFloat("GOVT_INFRA_80CCF_PROPOSED_AMOU");
				
				LIC= rs2.getFloat("LIC_80C_PROPOSED_AMOUNT");
				ELSS= rs2.getFloat("ELSS_80C_PROPOSED_AMOUNT");
				NPF= rs2.getFloat("NPF_80C_PROPOSED_AMOUNT");
				DSNHB= rs2.getFloat("DSNHB_80C_PROPOSED_AMOUNT");
				HLR= rs2.getFloat("HLR_80C_PROPOSED_AMOUNT");
				
				
				ISES= rs2.getFloat("ISES_80C_PROPOSED_AMOUNT");
				IMF= rs2.getFloat("IMF_80C_PROPOSED_AMOUNT");
				TFFC= rs2.getFloat("TFFC_80C_PROPOSED_AMOUNT");
				LIC_JSF= rs2.getFloat("LIC_JSF_80CCC_PROPOSED_AMOUNT");
				MCNSC= rs2.getFloat("MCNSC_80D_PROPOSED_AMOUNT");
				
				
				
				
				
				MCSC= rs2.getFloat("MCSC_80D_PROPOSED_AMOUNT");
				MCS= rs2.getFloat("MCS_SC_80D_PROPOSED_AMOUNT");
				MTHD= rs2.getFloat("MTHD_SC_80DD_PROPOSED_AMOUNT");
				MTSD= rs2.getFloat("MTSD_SD_80DDB_PROPOSED_AMOUNT");
				MTSDS= rs2.getFloat("MTSDS_SC_80DDB_PROPOSED_AMOUNT");
				
				
				
				
				TOTAL_80C_GROSS=rs2.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
				TOTAL_80C=rs2.getFloat("TOTAL_80_PROPOSED_AMOUNT");
				if(TOTAL_80C_GROSS>0.0){
					ins_value.add("Gross Amt Rs.");
				}
				
				if(LIP>0.0){
				
					ins_value.add(LIP);
					}
				if(PPF>0.0)
				{	
					ins_value.add(PPF);
				}
				if(NSS>0.0)
				{
					
					ins_value.add(NSS);
				}
				if(NSC>0.0)
				{
					ins_value.add(NSC);
				}
				if(GOVT>0.0){
					
					ins_value.add(GOVT);
				}
				
				
				//LIC,ELSS,NPF,DSNHB,HLR
				if(LIC>0.0)
				{
					ins_value.add(LIC);
				}
				if(ELSS>0.0){
					ins_value.add(ELSS);
				}
				if(NPF>0.0){
					ins_value.add(NPF);
				}
				if(DSNHB>0.0){
					ins_value.add(DSNHB);
				}
				if(HLR>0.0){
					ins_value.add(HLR);
				}
				
				//ISES,IMF,TFFC,LIC_JSF,MCNSC
				
				if(ISES>0.0)
				{
					ins_value.add(ISES);
				}
				if(IMF>0.0){
					ins_value.add(IMF);
				}
				if(TFFC>0.0){
					ins_value.add(TFFC);
				}
				if(LIC_JSF>0.0){
					ins_value.add(LIC_JSF);
				}
				if(MCNSC>0.0){
					ins_value.add(MCNSC);
				}
				
				//MCSC,MCS,MTHD,MTSD,MTSDS
				if(MCSC>0.0)
				{
					ins_value.add(MCSC);
				}
				if(MCS>0.0){
					ins_value.add(MCS);
				}
				if(MTHD>0.0){
					ins_value.add(MTHD);
				}
				if(MTSD>0.0){
					ins_value.add(MTSD);
				}
				if(MTSDS>0.0){
					ins_value.add(MTSDS);
				}
				
				if(TOTAL_80C>0.0){
				//ins_value.add(TOTAL_80C);
			}
				
				if(TOTAL_80C_GROSS>0.0){
					ins_value.add(TOTAL_80C_GROSS+TOTAL_80C);
				}
				
				/*if(TOTAL_80C>0.0){
					ins_value.add(TOTAL_80C);
				}*/
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_value);
		return ins_value;
		
	}
	
	
	/*
	 * Getting qUAL Amount invest_insment values if u opting
	 */
	
	public static ArrayList<Object> invest_insment_display_qual() throws SQLException {
		ArrayList<Object> ins_qual = new ArrayList<Object>();
		Map<String,Object> session = ActionContext.getContext().getSession();
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
		String sql30=null;
		
		if(month>=4){
			sql30="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql30="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	//	String sql="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'";
	    ResultSet rs30 = null;
	    
	    try {
			Connection conn_ins = GetConnection.getConnection();
			Statement st_ins = conn_ins.createStatement();

			rs30 = st_ins.executeQuery(sql30);
			float LIP=0.0f;
			float PPF=0.0f;
			float NSS=0.0f;
			float NSC=0.0f;
			float GOVT=0.0f;
			
			float LIC=0.0f;
			float ELSS=0.0f;
			float NPF=0.0f;
			float DSNHB=0.0f;
			float HLR=0.0f;
			
			
			float ISES=0.0f;
			float IMF=0.0f;
			float TFFC=0.0f;
			float LIC_JSF=0.0f;
			float MCNSC=0.0f;
			
			
			
			float MCSC=0.0f;
			float MCS=0.0f;
			float MTHD=0.0f;
			float MTSD=0.0f;
			float MTSDS=0.0f;
			float TOTAL_80C_GROSS=0.0f;
			float TOTAL_80C=0.0f;
			
			
			float total=0.0f;
			if (rs30.next()) {

				LIP = rs30.getFloat("LIP_80C_PROPOSED_AMOUNT");
				PPF=rs30.getFloat("PPF_8OC_PROPOSED_AMOUNT");
				NSS = rs30.getFloat("NSS_8OC_PROPOSED_AMOUNT");
				NSC = rs30.getFloat("NSC_8OC_PROPOSED_AMOUNT");
				GOVT = rs30.getFloat("GOVT_INFRA_80CCF_PROPOSED_AMOU");
				
				LIC= rs30.getFloat("LIC_80C_PROPOSED_AMOUNT");
				ELSS= rs30.getFloat("ELSS_80C_PROPOSED_AMOUNT");
				NPF= rs30.getFloat("NPF_80C_PROPOSED_AMOUNT");
				DSNHB= rs30.getFloat("DSNHB_80C_PROPOSED_AMOUNT");
				HLR= rs30.getFloat("HLR_80C_PROPOSED_AMOUNT");
				
				
				ISES= rs30.getFloat("ISES_80C_PROPOSED_AMOUNT");
				IMF= rs30.getFloat("IMF_80C_PROPOSED_AMOUNT");
				TFFC= rs30.getFloat("TFFC_80C_PROPOSED_AMOUNT");
				LIC_JSF= rs30.getFloat("LIC_JSF_80CCC_PROPOSED_AMOUNT");
				MCNSC= rs30.getFloat("MCNSC_80D_PROPOSED_AMOUNT");
				
				
				
				
				
				MCSC= rs30.getFloat("MCSC_80D_PROPOSED_AMOUNT");
				MCS= rs30.getFloat("MCS_SC_80D_PROPOSED_AMOUNT");
				MTHD= rs30.getFloat("MTHD_SC_80DD_PROPOSED_AMOUNT");
				MTSD= rs30.getFloat("MTSD_SD_80DDB_PROPOSED_AMOUNT");
				MTSDS= rs30.getFloat("MTSDS_SC_80DDB_PROPOSED_AMOUNT");
				
				
				
				
				TOTAL_80C_GROSS=rs30.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
				TOTAL_80C=rs30.getFloat("TOTAL_80_PROPOSED_AMOUNT");
				
				if(TOTAL_80C_GROSS>0.0){
					ins_qual.add("Qual Amt Rs.");
				}
				
				if(LIP>0.0){
				
					ins_qual.add(LIP);
					}
				if(PPF>0.0)
				{	
					ins_qual.add(PPF);
				}
				if(NSS>0.0)
				{
					
					ins_qual.add(NSS);
				}
				if(NSC>0.0)
				{
					ins_qual.add(NSC);
				}
				if(GOVT>0.0){
					
					ins_qual.add(GOVT);
				}
				
				
				//LIC,ELSS,NPF,DSNHB,HLR
				if(LIC>0.0)
				{
					ins_qual.add(LIC);
				}
				if(ELSS>0.0){
					ins_qual.add(ELSS);
				}
				if(NPF>0.0){
					ins_qual.add(NPF);
				}
				if(DSNHB>0.0){
					ins_qual.add(DSNHB);
				}
				if(HLR>0.0){
					ins_qual.add(HLR);
				}
				
				//ISES,IMF,TFFC,LIC_JSF,MCNSC
				
				if(ISES>0.0)
				{
					ins_qual.add(ISES);
				}
				if(IMF>0.0){
					ins_qual.add(IMF);
				}
				if(TFFC>0.0){
					ins_qual.add(TFFC);
				}
				if(LIC_JSF>0.0){
					ins_qual.add(LIC_JSF);
				}
				if(MCNSC>0.0){
					ins_qual.add(MCNSC);
				}
				
				//MCSC,MCS,MTHD,MTSD,MTSDS
				if(MCSC>0.0)
				{
					ins_qual.add(MCSC);
				}
				if(MCS>0.0){
					ins_qual.add(MCS);
				}
				if(MTHD>0.0){
					ins_qual.add(MTHD);
				}
				if(MTSD>0.0){
					ins_qual.add(MTSD);
				}
				if(MTSDS>0.0){
					ins_qual.add(MTSDS);
				}
				
				
				if(TOTAL_80C>0.0){
					
					total=TOTAL_80C;
					//ins_qual.add(TOTAL_80C);
			}
				
				if(TOTAL_80C_GROSS>0.0){
					
					
					ins_qual.add(TOTAL_80C_GROSS+total);
				}
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_qual);
		return ins_qual;
		
	}
	
	
	
	
	
	
	/*
	 * Getting total Amount investment values if u opting
	 */
	
	public static ArrayList<Object> investment_display_total() throws SQLException {
		ArrayList<Object> ins_value_total = new ArrayList<Object>();
		Map<String,Object> session = ActionContext.getContext().getSession();
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
		String sql_tot=null;
		
		if(month>=4){
			sql_tot="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql_tot="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	//	String sql_tot="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'";
	    ResultSet rs2_tot = null;
	    
	    try {
			Connection co_tot = GetConnection.getConnection();
			Statement st_tot = co_tot.createStatement();

			rs2_tot = st_tot.executeQuery(sql_tot);
			float LIP=0.0f;
			float PPF=0.0f;
			float NSS=0.0f;
			float NSC=0.0f;
			float GOVT=0.0f;
			
			float LIC=0.0f;
			float ELSS=0.0f;
			float NPF=0.0f;
			float DSNHB=0.0f;
			float HLR=0.0f;
			
			
			float ISES=0.0f;
			float IMF=0.0f;
			float TFFC=0.0f;
			float LIC_JSF=0.0f;
			float MCNSC=0.0f;
			
			
			
			float MCSC=0.0f;
			float MCS=0.0f;
			float MTHD=0.0f;
			float MTSD=0.0f;
			float MTSDS=0.0f;
			float TOTAL_80C_GROSS=0.0f;
			float TOTAL_80C=0.0f;
			
			if (rs2_tot.next()) {

				LIP = rs2_tot.getFloat("LIP_80C_PROPOSED_AMOUNT");
				PPF=rs2_tot.getFloat("PPF_8OC_PROPOSED_AMOUNT");
				NSS = rs2_tot.getFloat("NSS_8OC_PROPOSED_AMOUNT");
				NSC = rs2_tot.getFloat("NSC_8OC_PROPOSED_AMOUNT");
				GOVT = rs2_tot.getFloat("GOVT_INFRA_80CCF_PROPOSED_AMOU");
				
				LIC= rs2_tot.getFloat("LIC_80C_PROPOSED_AMOUNT");
				ELSS= rs2_tot.getFloat("ELSS_80C_PROPOSED_AMOUNT");
				NPF= rs2_tot.getFloat("NPF_80C_PROPOSED_AMOUNT");
				DSNHB= rs2_tot.getFloat("DSNHB_80C_PROPOSED_AMOUNT");
				HLR= rs2_tot.getFloat("HLR_80C_PROPOSED_AMOUNT");
				
				
				ISES= rs2_tot.getFloat("ISES_80C_PROPOSED_AMOUNT");
				IMF= rs2_tot.getFloat("IMF_80C_PROPOSED_AMOUNT");
				TFFC= rs2_tot.getFloat("TFFC_80C_PROPOSED_AMOUNT");
				LIC_JSF= rs2_tot.getFloat("LIC_JSF_80CCC_PROPOSED_AMOUNT");
				MCNSC= rs2_tot.getFloat("MCNSC_80D_PROPOSED_AMOUNT");
				
				
				
				
				
				MCSC= rs2_tot.getFloat("MCSC_80D_PROPOSED_AMOUNT");
				MCS= rs2_tot.getFloat("MCS_SC_80D_PROPOSED_AMOUNT");
				MTHD= rs2_tot.getFloat("MTHD_SC_80DD_PROPOSED_AMOUNT");
				MTSD= rs2_tot.getFloat("MTSD_SD_80DDB_PROPOSED_AMOUNT");
				MTSDS= rs2_tot.getFloat("MTSDS_SC_80DDB_PROPOSED_AMOUNT");
				
				
				
				
				TOTAL_80C_GROSS=rs2_tot.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
				TOTAL_80C=rs2_tot.getFloat("TOTAL_80_PROPOSED_AMOUNT");
				if(TOTAL_80C_GROSS>0.0){
					ins_value_total.add("Total  Rs.");
				}
				
				if(LIP>0.0){
				
					ins_value_total.add(LIP);
					}
				if(PPF>0.0)
				{	
					ins_value_total.add(PPF);
				}
				if(NSS>0.0)
				{
					
					ins_value_total.add(NSS);
				}
				if(NSC>0.0)
				{
					ins_value_total.add(NSC);
				}
				if(GOVT>0.0){
					
					ins_value_total.add(GOVT);
				}
				
				
				//LIC,ELSS,NPF,DSNHB,HLR
				if(LIC>0.0)
				{
					ins_value_total.add(LIC);
				}
				if(ELSS>0.0){
					ins_value_total.add(ELSS);
				}
				if(NPF>0.0){
					ins_value_total.add(NPF);
				}
				if(DSNHB>0.0){
					ins_value_total.add(DSNHB);
				}
				if(HLR>0.0){
					ins_value_total.add(HLR);
				}
				
				//ISES,IMF,TFFC,LIC_JSF,MCNSC
				
				if(ISES>0.0)
				{
					ins_value_total.add(ISES);
				}
				if(IMF>0.0){
					ins_value_total.add(IMF);
				}
				if(TFFC>0.0){
					ins_value_total.add(TFFC);
				}
				if(LIC_JSF>0.0){
					ins_value_total.add(LIC_JSF);
				}
				if(MCNSC>0.0){
					ins_value_total.add(MCNSC);
				}
				
				//MCSC,MCS,MTHD,MTSD,MTSDS
				if(MCSC>0.0)
				{
					ins_value_total.add(MCSC);
				}
				if(MCS>0.0){
					ins_value_total.add(MCS);
				}
				if(MTHD>0.0){
					ins_value_total.add(MTHD);
				}
				if(MTSD>0.0){
					ins_value_total.add(MTSD);
				}
				if(MTSDS>0.0){
					ins_value_total.add(MTSDS);
				}
				
				if(TOTAL_80C>0.0){
				//ins_value_total.add(TOTAL_80C);
			}
				if(TOTAL_80C_GROSS>0.0){
					ins_value_total.add(TOTAL_80C_GROSS+TOTAL_80C);
				}
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_value_total);
		return ins_value_total;
		
	}
	/*
	 * Getting investment columns if u opting
	 */
	public static ArrayList<Object> invest_col() throws SQLException {
		ArrayList<Object> ins_td =new ArrayList<Object>();
		Map<String,Object> session = ActionContext.getContext().getSession();
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
		String sql3=null;
		
		
		if(month>=4){
			sql3="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql3="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
		
		
		
		
		//String sql3="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'";
		//String insDetails=null;
		
		String lip1=null;
		String ppf1=null;
		String nss1=null; 
		String nsc1=null; 
		String govt1=null; 
		
		
		
		String lic1=null; 
		String elss1=null; 
		String npf1=null; 
		String dsnhb1=null; 
		String hlr1=null; 
		
		
		String ises1=null; 
		String imf1=null; 
		String tffc1=null; 
		String lic_jsf1=null; 
		String mcnsc1=null; 
		
		
		
		String mcsc1=null; 
		String mcs1=null; 
		String mthd1=null; 
		String mtsd1=null; 
		String mtsds1=null; 
	    String total_ins=null;
	    //String total_80c=null;
		String inver=null;
	    ResultSet rs3 = null;
	    
	    try {
			Connection con = GetConnection.getConnection();
			Statement st = con.createStatement();

			rs3 = st.executeQuery(sql3);
			float LIP=0.0f;
			float PPF=0.0f;
			float NSS=0.0f;
			float NSC=0.0f;
			float GOVT=0.0f;
			
			float LIC=0.0f;
			float ELSS=0.0f;
			float NPF=0.0f;
			float DSNHB=0.0f;
			float HLR=0.0f;
			
			
			float ISES=0.0f;
			float IMF=0.0f;
			float TFFC=0.0f;
			float LIC_JSF=0.0f;
			float MCNSC=0.0f;
			
			
			
			float MCSC=0.0f;
			float MCS=0.0f;
			float MTHD=0.0f;
			float MTSD=0.0f;
			float MTSDS=0.0f;
			float TOTAL_80C_GROSS=0.0f;
			//float TOTAL_80C=0.0f;
			
			if (rs3.next()) {

				LIP = rs3.getFloat("LIP_80C_PROPOSED_AMOUNT");
				PPF=rs3.getFloat("PPF_8OC_PROPOSED_AMOUNT");
				NSS = rs3.getFloat("NSS_8OC_PROPOSED_AMOUNT");
				NSC = rs3.getFloat("NSC_8OC_PROPOSED_AMOUNT");
				GOVT = rs3.getFloat("GOVT_INFRA_80CCF_PROPOSED_AMOU");
				
				LIC= rs3.getFloat("LIC_80C_PROPOSED_AMOUNT");
				ELSS= rs3.getFloat("ELSS_80C_PROPOSED_AMOUNT");
				NPF= rs3.getFloat("NPF_80C_PROPOSED_AMOUNT");
				DSNHB= rs3.getFloat("DSNHB_80C_PROPOSED_AMOUNT");
				HLR= rs3.getFloat("HLR_80C_PROPOSED_AMOUNT");
				
				
				ISES= rs3.getFloat("ISES_80C_PROPOSED_AMOUNT");
				IMF= rs3.getFloat("IMF_80C_PROPOSED_AMOUNT");
				TFFC= rs3.getFloat("TFFC_80C_PROPOSED_AMOUNT");
				LIC_JSF= rs3.getFloat("LIC_JSF_80CCC_PROPOSED_AMOUNT");
				MCNSC= rs3.getFloat("MCNSC_80D_PROPOSED_AMOUNT");
				
				
				
				
				
				MCSC= rs3.getFloat("MCSC_80D_PROPOSED_AMOUNT");
				MCS= rs3.getFloat("MCS_SC_80D_PROPOSED_AMOUNT");
				MTHD= rs3.getFloat("MTHD_SC_80DD_PROPOSED_AMOUNT");
				MTSD= rs3.getFloat("MTSD_SD_80DDB_PROPOSED_AMOUNT");
				MTSDS= rs3.getFloat("MTSDS_SC_80DDB_PROPOSED_AMOUNT");
				
				
				
				
				TOTAL_80C_GROSS=rs3.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
				//TOTAL_80C=rs3.getFloat("TOTAL_80_PROPOSED_AMOUNT");
				
				if(TOTAL_80C_GROSS>0.0){
					inver=" * Investment-U/S 80C";
					ins_td.add(inver);
				}
				
				if(LIP>0.0){
					lip1 = "LIFE INSURANCE POLICY";
					ins_td.add(lip1);
					
					}
				if(PPF>0.0)
				{
					ppf1 = "PUBLIC PROVIDENT FUND(PPF)";
					ins_td.add(ppf1);
				}
				if(NSS>0.0)
				{
					
					nss1 = "NATIONAL SAVING SCHEME(NSS)";
					ins_td.add(nss1);
					
				}
				if(NSC>0.0)
				{
					nsc1 ="NSC(VIII ISSUE)";
					ins_td.add(nsc1);
					
				}
				if(GOVT>0.0){
					govt1 = "CONTRIBUTION TO GOVT.INFRASTRUTURE BONDS";
					ins_td.add(govt1);
					
				}

				//LIC,ELSS,NPF,DSNHB,HLR
				if(LIC>0.0)
				{
					lic1 = "LIC ANNITY PLAN";
					ins_td.add(lic1);
				}
				if(ELSS>0.0){
					elss1 = "EQUITY LINKED SAVING SCHEME";
					ins_td.add(elss1);
				}
				if(NPF>0.0){
					npf1="NOTIFIED PENSION FUND";
					ins_td.add(npf1);
				}
				if(DSNHB>0.0){
					dsnhb1="DEPOSIT SCHEME OF NATIONAL HOUSING BANK";
					ins_td.add(dsnhb1);
				}
				if(HLR>0.0){
					hlr1="HOUSING LOAN REPAYMENT(PRINCIPAL)";
					ins_td.add(hlr1);
				}
				
				//ISES,IMF,TFFC,LIC_JSF,MCNSC
				
				if(ISES>0.0)
				{
					ises1 = "INFRASTRUCUTE EQUITY SHARES/DEBENTURES";
					ins_td.add(ises1);
				}
				if(IMF>0.0){
					imf1 = "INFRASTRUCTURE MUTUAL FUND";
					ins_td.add(imf1);
				}
				if(TFFC>0.0){
					tffc1="TUTION FEES FOR CHILDREN";
					ins_td.add(tffc1);
				}
				if(LIC_JSF>0.0){
					lic_jsf1="LIC JEEVAN SURAKSHA-PENSION FUND";
					ins_td.add(lic_jsf1);
				}
				if(MCNSC>0.0){
					mcnsc1="MEDICLAIM-PARENT(NON SENIOR CITIZEN)";
					ins_td.add(mcnsc1);
				}
				
				//MCSC,MCS,MTHD,MTSD,MTSDS
				if(MCSC>0.0)
				{
					mcsc1 = "MEDICLAIM-PARENT(SENIOR CITIZEN)";
					ins_td.add(mcsc1);
				}
				if(MCS>0.0){
					mcs1 = "MEDICLAIM-SELF/SPOUSE/CHILDREN";
					ins_td.add(mcs1);
				}
				if(MTHD>0.0){
					mthd1="MEDCL TRMNT-HANDICAPPED DEPENDENT";
					ins_td.add(mthd1);
				}
				if(MTSD>0.0){
					mtsd1="MEDCL TRMNT-SPECF DISEASE-SELF/DEPENDENT";
					ins_td.add(mtsd1);
				}
				if(MTSDS>0.0){
					mtsds1="MEDCL TRMNT-SPECF DISEASE-SENIOR CITIZEN";
					ins_td.add(mtsds1);
				}
				
				
				if(TOTAL_80C_GROSS>0.0){
					total_ins="TOTAL";
					ins_td.add(total_ins);
				}
				/*if(TOTAL_80C>0.0){
					total_80c="TOTAL_80_PROPOSED_AMOUNT";
					ins_td.add(total_80c);
				}*/
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_td);
		
		return ins_td;
	}
	
	
	
		
public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			//getBasicInfo();
			//getactual();
			invest_insment_display_qual();
			//ChoicepayValues();
			//ChoicepayColuns();
			//investment_display();
			//invest_col();
			//investment_80c_value();
			//investment_80c_column();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * Getting Choicepay values if u opting
	 
	public static ArrayList<Object> ChoicepayValues() throws SQLException {
		ArrayList<Object> ins_dec = new ArrayList<Object>();
		Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
	
		
		
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		String du=df.format(new java.util.Date());
		int month=Integer.parseInt(du.substring(3,5));
		int year=Integer.parseInt(du.substring(6,10));
		int h_year=year+1;
		int l_year=year-1;
		String date="01-APR-"+year;
		String date_h="01-APR-"+h_year;
		String date_l="01-APR-"+l_year;
		String getChoiceColuns=null;
		
		
		if(month>=4){
			getChoiceColuns="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			getChoiceColuns="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"'  and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	    
	    ResultSet rs2 = null;
	    
	    try {
			Connection conn = GetConnection.getConnection();
			Statement st = conn.createStatement();

			rs2 = st.executeQuery(getChoiceColuns);
			float MEDICAL_NEW=0.0f;
			float CHILDREN_NEW=0.0f;
			float CONVEYANCE_NEW=0.0f;
			float FUEL_NEW=0.0f;
			float HRA_NEW=0.0f;
			
			float LTA_NEW=0.0f;
			float ER_NPS_NEW=0.0f;
			float ADVANCE=0.0f;
			float WASHING=0.0f;
			float CHILDREN_H_NEW=0.0f;
			
			
			float FOOD=0.0f;
			float GIFT_NEW=0.0f;
			float UTILITY_BILLS=0.0f;
			
			if (rs2.next()) {

				MEDICAL_NEW = rs2.getFloat("MEDICAL_NEW");
				CHILDREN_NEW=rs2.getFloat("CHILDREN_NEW");
				CONVEYANCE_NEW = rs2.getFloat("CONVEYANCE_NEW");
				FUEL_NEW = rs2.getFloat("FUEL_NEW");
				HRA_NEW = rs2.getFloat("HRA_NEW");
				
				LTA_NEW= rs2.getFloat("LTA_NEW");
				ER_NPS_NEW= rs2.getFloat("ER_NPS_NEW");
				ADVANCE= rs2.getFloat("ADVANCE");
				WASHING= rs2.getFloat("WASHING");
				CHILDREN_H_NEW= rs2.getFloat("CHILDREN_H_NEW");
				
				
				FOOD= rs2.getFloat("FOOD");
				GIFT_NEW= rs2.getFloat("GIFT_NEW");
				UTILITY_BILLS= rs2.getFloat("UTILITY_BILLS");
				
				if(MEDICAL_NEW>0.0){
				
					ins_dec.add(MEDICAL_NEW);
					}
				if(CHILDREN_NEW>0.0)
				{	
					ins_dec.add(CHILDREN_NEW);
				}
				if(CONVEYANCE_NEW>0.0)
				{
					
					ins_dec.add(CONVEYANCE_NEW);
				}
				if(FUEL_NEW>0.0)
				{
					ins_dec.add(FUEL_NEW);
				}
				if(HRA_NEW>0.0){
					
					ins_dec.add(HRA_NEW);
				}
				
				
				//LIC,ELSS,NPF,DSNHB,HLR
				if(LTA_NEW>0.0)
				{
					ins_dec.add(LTA_NEW);
				}
				if(ER_NPS_NEW>0.0){
					ins_dec.add(ER_NPS_NEW);
				}
				if(ADVANCE>0.0){
					ins_dec.add(ADVANCE);
				}
				if(WASHING>0.0){
					ins_dec.add(WASHING);
				}
				if(CHILDREN_H_NEW>0.0){
					ins_dec.add(CHILDREN_H_NEW);
				}
				
				//ISES,IMF,TFFC,LIC_JSF,MCNSC
				
				if(FOOD>0.0)
				{
					ins_dec.add(FOOD);
				}
				if(GIFT_NEW>0.0){
					ins_dec.add(GIFT_NEW);
				}
				if(UTILITY_BILLS>0.0){
					ins_dec.add(UTILITY_BILLS);
				}
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_dec);
		return ins_dec;
		
	}
	
	
	 * Getting Choicepay columns if u opting
	 
	public static ArrayList<Object> ChoicepayColuns() throws SQLException {
		ArrayList<Object> ch_values = new ArrayList<Object>();
		Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
				
		
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		String du=df.format(new java.util.Date());
		int month=Integer.parseInt(du.substring(3,5));
		int year=Integer.parseInt(du.substring(6,10));
		int h_year=year+1;
		int l_year=year-1;
		
		String date="01-APR-"+year;
		String date_h="01-APR-"+h_year;
		String date_l="01-APR-"+l_year;
		String getChoiceColuns=null;
		
		
		if(month>=4){
			getChoiceColuns="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"' and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			getChoiceColuns="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"'  and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}	
		
		
		
		Connection conn_col=null;
	    ResultSet rs4 = null;
	    
	    try {
		 conn_col = GetConnection.getConnection();
			Statement st = conn_col.createStatement();

			rs4 = st.executeQuery(getChoiceColuns);
			float MEDICAL_NEW=0.0f;
			float CHILDREN_NEW=0.0f;
			float CONVEYANCE_NEW=0.0f;
			float FUEL_NEW=0.0f;
			float HRA_NEW=0.0f;
			
			float LTA_NEW=0.0f;
			float ER_NPS_NEW=0.0f;
			float ADVANCE=0.0f;
			float WASHING=0.0f;
			float CHILDREN_H_NEW=0.0f;
			
			
			float FOOD=0.0f;
			float GIFT_NEW=0.0f;
			float UTILITY_BILLS=0.0f;
			
			
			if (rs4.next()) {

				MEDICAL_NEW = rs4.getFloat("MEDICAL_NEW");
				CHILDREN_NEW=rs4.getFloat("CHILDREN_NEW");
				CONVEYANCE_NEW = rs4.getFloat("CONVEYANCE_NEW");
				FUEL_NEW = rs4.getFloat("FUEL_NEW");
				HRA_NEW = rs4.getFloat("HRA_NEW");
				
				LTA_NEW= rs4.getFloat("LTA_NEW");
				ER_NPS_NEW= rs4.getFloat("ER_NPS_NEW");
				ADVANCE= rs4.getFloat("ADVANCE");
				WASHING= rs4.getFloat("WASHING");
				CHILDREN_H_NEW= rs4.getFloat("CHILDREN_H_NEW");
				
				
				FOOD= rs4.getFloat("FOOD");
				GIFT_NEW= rs4.getFloat("GIFT_NEW");
				UTILITY_BILLS= rs4.getFloat("UTILITY_BILLS");
				
				if(MEDICAL_NEW>0.0){
				
					ch_values.add("Medical Reimbursement");
					}
				if(CHILDREN_NEW>0.0)
				{	
					ch_values.add("Children Education Allowance");
				}
				if(CONVEYANCE_NEW>0.0)
				{
					
					ch_values.add("Conveyance Allowance");
				}
				if(FUEL_NEW>0.0)
				{
					ch_values.add("Fuel / Maint. Expenses");
				}
				if(HRA_NEW>0.0){
					
					ch_values.add("HRA");
				}
				
				
				//LIC,ELSS,NPF,DSNHB,HLR
				if(LTA_NEW>0.0)
				{
					ch_values.add("LTA");
				}
				if(ER_NPS_NEW>0.0){
					ch_values.add("Er.NPS Contribution");
				}
				if(ADVANCE>0.0){
					ch_values.add("Advance Bonus");
				}
				if(WASHING>0.0){
					ch_values.add("Washing Expenses");
				}
				if(CHILDREN_H_NEW>0.0){
					ch_values.add("Children Hostel Allowance");
				}
				
				//ISES,IMF,TFFC,LIC_JSF,MCNSC
				
				if(FOOD>0.0)
				{
					ch_values.add("Food Coupons");
				}
				if(GIFT_NEW>0.0){
					ch_values.add("Gift Coupons");
				}
				if(UTILITY_BILLS>0.0){
					ch_values.add("Utility Bills ");
				}
				
				System.out.println(ch_values);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    finally{
	    	rs4.close();
	    	conn_col.close();
	    }
	    
	    
		return ch_values;
		
	}
	
	
	
	
	
	
	
	 * Getting Gross Amount investment values if u opting
	 
	
	public static ArrayList<Object> investment_display() throws SQLException {
		ArrayList<Object> ins_value = new ArrayList<Object>();
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
			sql="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	//	String sql="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'";
	    ResultSet rs2 = null;
	    
	    try {
			Connection conn = GetConnection.getConnection();
			Statement st = conn.createStatement();

			rs2 = st.executeQuery(sql);
			float LIP=0.0f;
			float PPF=0.0f;
			float NSS=0.0f;
			float NSC=0.0f;
			float GOVT=0.0f;
			
			float LIC=0.0f;
			float ELSS=0.0f;
			float NPF=0.0f;
			float DSNHB=0.0f;
			float HLR=0.0f;
			
			
			float ISES=0.0f;
			float IMF=0.0f;
			float TFFC=0.0f;
			float LIC_JSF=0.0f;
			float MCNSC=0.0f;
			
			
			
			float MCSC=0.0f;
			float MCS=0.0f;
			float MTHD=0.0f;
			float MTSD=0.0f;
			float MTSDS=0.0f;
			float TOTAL_80C_GROSS=0.0f;
			//float TOTAL_80C=0.0f;
			
			if (rs2.next()) {

				LIP = rs2.getFloat("LIP_80C_PROPOSED_AMOUNT");
				PPF=rs2.getFloat("PPF_8OC_PROPOSED_AMOUNT");
				NSS = rs2.getFloat("NSS_8OC_PROPOSED_AMOUNT");
				NSC = rs2.getFloat("NSC_8OC_PROPOSED_AMOUNT");
				GOVT = rs2.getFloat("GOVT_INFRA_80CCF_PROPOSED_AMOU");
				
				LIC= rs2.getFloat("LIC_80C_PROPOSED_AMOUNT");
				ELSS= rs2.getFloat("ELSS_80C_PROPOSED_AMOUNT");
				NPF= rs2.getFloat("NPF_80C_PROPOSED_AMOUNT");
				DSNHB= rs2.getFloat("DSNHB_80C_PROPOSED_AMOUNT");
				HLR= rs2.getFloat("HLR_80C_PROPOSED_AMOUNT");
				
				
				ISES= rs2.getFloat("ISES_80C_PROPOSED_AMOUNT");
				IMF= rs2.getFloat("IMF_80C_PROPOSED_AMOUNT");
				TFFC= rs2.getFloat("TFFC_80C_PROPOSED_AMOUNT");
				LIC_JSF= rs2.getFloat("LIC_JSF_80CCC_PROPOSED_AMOUNT");
				MCNSC= rs2.getFloat("MCNSC_80D_PROPOSED_AMOUNT");
				
				
				
				
				
				MCSC= rs2.getFloat("MCSC_80D_PROPOSED_AMOUNT");
				MCS= rs2.getFloat("MCS_SC_80D_PROPOSED_AMOUNT");
				MTHD= rs2.getFloat("MTHD_SC_80DD_PROPOSED_AMOUNT");
				MTSD= rs2.getFloat("MTSD_SD_80DDB_PROPOSED_AMOUNT");
				MTSDS= rs2.getFloat("MTSDS_SC_80DDB_PROPOSED_AMOUNT");
				
				
				
				
				TOTAL_80C_GROSS=rs2.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
				//TOTAL_80C=rs2.getFloat("TOTAL_80_PROPOSED_AMOUNT");
				if(TOTAL_80C_GROSS>0.0){
					ins_value.add("Gross Amt Rs.");
				}
				
				if(LIP>0.0){
				
					ins_value.add(LIP);
					}
				if(PPF>0.0)
				{	
					ins_value.add(PPF);
				}
				if(NSS>0.0)
				{
					
					ins_value.add(NSS);
				}
				if(NSC>0.0)
				{
					ins_value.add(NSC);
				}
				if(GOVT>0.0){
					
					ins_value.add(GOVT);
				}
				
				
				//LIC,ELSS,NPF,DSNHB,HLR
				if(LIC>0.0)
				{
					ins_value.add(LIC);
				}
				if(ELSS>0.0){
					ins_value.add(ELSS);
				}
				if(NPF>0.0){
					ins_value.add(NPF);
				}
				if(DSNHB>0.0){
					ins_value.add(DSNHB);
				}
				if(HLR>0.0){
					ins_value.add(HLR);
				}
				
				//ISES,IMF,TFFC,LIC_JSF,MCNSC
				
				if(ISES>0.0)
				{
					ins_value.add(ISES);
				}
				if(IMF>0.0){
					ins_value.add(IMF);
				}
				if(TFFC>0.0){
					ins_value.add(TFFC);
				}
				if(LIC_JSF>0.0){
					ins_value.add(LIC_JSF);
				}
				if(MCNSC>0.0){
					ins_value.add(MCNSC);
				}
				
				//MCSC,MCS,MTHD,MTSD,MTSDS
				if(MCSC>0.0)
				{
					ins_value.add(MCSC);
				}
				if(MCS>0.0){
					ins_value.add(MCS);
				}
				if(MTHD>0.0){
					ins_value.add(MTHD);
				}
				if(MTSD>0.0){
					ins_value.add(MTSD);
				}
				if(MTSDS>0.0){
					ins_value.add(MTSDS);
				}
				
				
				if(TOTAL_80C_GROSS>0.0){
					ins_value.add(TOTAL_80C_GROSS);
				}
				
				if(TOTAL_80C>0.0){
					ins_value.add(TOTAL_80C);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_value);
		return ins_value;
		
	}
	
	
	
	 * Getting qUAL Amount invest_insment values if u opting
	 
	
	public static ArrayList<Object> invest_insment_display_qual() throws SQLException {
		ArrayList<Object> ins_qual = new ArrayList<Object>();
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
		String sql30=null;
		
		if(month>=4){
			sql30="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql30="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	//	String sql="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'";
	    ResultSet rs30 = null;
	    
	    try {
			Connection conn_ins = GetConnection.getConnection();
			Statement st_ins = conn_ins.createStatement();

			rs30 = st_ins.executeQuery(sql30);
			float LIP=0.0f;
			float PPF=0.0f;
			float NSS=0.0f;
			float NSC=0.0f;
			float GOVT=0.0f;
			
			float LIC=0.0f;
			float ELSS=0.0f;
			float NPF=0.0f;
			float DSNHB=0.0f;
			float HLR=0.0f;
			
			
			float ISES=0.0f;
			float IMF=0.0f;
			float TFFC=0.0f;
			float LIC_JSF=0.0f;
			float MCNSC=0.0f;
			
			
			
			float MCSC=0.0f;
			float MCS=0.0f;
			float MTHD=0.0f;
			float MTSD=0.0f;
			float MTSDS=0.0f;
			float TOTAL_80C_GROSS=0.0f;
			//float TOTAL_80C=0.0f;
			
			if (rs30.next()) {

				LIP = rs30.getFloat("LIP_80C_PROPOSED_AMOUNT");
				PPF=rs30.getFloat("PPF_8OC_PROPOSED_AMOUNT");
				NSS = rs30.getFloat("NSS_8OC_PROPOSED_AMOUNT");
				NSC = rs30.getFloat("NSC_8OC_PROPOSED_AMOUNT");
				GOVT = rs30.getFloat("GOVT_INFRA_80CCF_PROPOSED_AMOU");
				
				LIC= rs30.getFloat("LIC_80C_PROPOSED_AMOUNT");
				ELSS= rs30.getFloat("ELSS_80C_PROPOSED_AMOUNT");
				NPF= rs30.getFloat("NPF_80C_PROPOSED_AMOUNT");
				DSNHB= rs30.getFloat("DSNHB_80C_PROPOSED_AMOUNT");
				HLR= rs30.getFloat("HLR_80C_PROPOSED_AMOUNT");
				
				
				ISES= rs30.getFloat("ISES_80C_PROPOSED_AMOUNT");
				IMF= rs30.getFloat("IMF_80C_PROPOSED_AMOUNT");
				TFFC= rs30.getFloat("TFFC_80C_PROPOSED_AMOUNT");
				LIC_JSF= rs30.getFloat("LIC_JSF_80CCC_PROPOSED_AMOUNT");
				MCNSC= rs30.getFloat("MCNSC_80D_PROPOSED_AMOUNT");
				
				
				
				
				
				MCSC= rs30.getFloat("MCSC_80D_PROPOSED_AMOUNT");
				MCS= rs30.getFloat("MCS_SC_80D_PROPOSED_AMOUNT");
				MTHD= rs30.getFloat("MTHD_SC_80DD_PROPOSED_AMOUNT");
				MTSD= rs30.getFloat("MTSD_SD_80DDB_PROPOSED_AMOUNT");
				MTSDS= rs30.getFloat("MTSDS_SC_80DDB_PROPOSED_AMOUNT");
				
				
				
				
				TOTAL_80C_GROSS=rs30.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
				//TOTAL_80C=rs30.getFloat("TOTAL_80_PROPOSED_AMOUNT");
				if(TOTAL_80C_GROSS>0.0){
					ins_qual.add("Qual Amt Rs.");
				}
				
				if(LIP>0.0){
				
					ins_qual.add(LIP);
					}
				if(PPF>0.0)
				{	
					ins_qual.add(PPF);
				}
				if(NSS>0.0)
				{
					
					ins_qual.add(NSS);
				}
				if(NSC>0.0)
				{
					ins_qual.add(NSC);
				}
				if(GOVT>0.0){
					
					ins_qual.add(GOVT);
				}
				
				
				//LIC,ELSS,NPF,DSNHB,HLR
				if(LIC>0.0)
				{
					ins_qual.add(LIC);
				}
				if(ELSS>0.0){
					ins_qual.add(ELSS);
				}
				if(NPF>0.0){
					ins_qual.add(NPF);
				}
				if(DSNHB>0.0){
					ins_qual.add(DSNHB);
				}
				if(HLR>0.0){
					ins_qual.add(HLR);
				}
				
				//ISES,IMF,TFFC,LIC_JSF,MCNSC
				
				if(ISES>0.0)
				{
					ins_qual.add(ISES);
				}
				if(IMF>0.0){
					ins_qual.add(IMF);
				}
				if(TFFC>0.0){
					ins_qual.add(TFFC);
				}
				if(LIC_JSF>0.0){
					ins_qual.add(LIC_JSF);
				}
				if(MCNSC>0.0){
					ins_qual.add(MCNSC);
				}
				
				//MCSC,MCS,MTHD,MTSD,MTSDS
				if(MCSC>0.0)
				{
					ins_qual.add(MCSC);
				}
				if(MCS>0.0){
					ins_qual.add(MCS);
				}
				if(MTHD>0.0){
					ins_qual.add(MTHD);
				}
				if(MTSD>0.0){
					ins_qual.add(MTSD);
				}
				if(MTSDS>0.0){
					ins_qual.add(MTSDS);
				}
				
				
				if(TOTAL_80C_GROSS>0.0){
					ins_qual.add(TOTAL_80C_GROSS);
				}
				
				if(TOTAL_80C>0.0){
					ins_qual.add(TOTAL_80C);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_qual);
		return ins_qual;
		
	}
	
	
	
	
	
	
	
	 * Getting total Amount investment values if u opting
	 
	
	public static ArrayList<Object> investment_display_total() throws SQLException {
		ArrayList<Object> ins_value_total = new ArrayList<Object>();
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
		String sql_tot=null;
		
		if(month>=4){
			sql_tot="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql_tot="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
	//	String sql_tot="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'";
	    ResultSet rs2_tot = null;
	    
	    try {
			Connection co_tot = GetConnection.getConnection();
			Statement st_tot = co_tot.createStatement();

			rs2_tot = st_tot.executeQuery(sql_tot);
			float LIP=0.0f;
			float PPF=0.0f;
			float NSS=0.0f;
			float NSC=0.0f;
			float GOVT=0.0f;
			
			float LIC=0.0f;
			float ELSS=0.0f;
			float NPF=0.0f;
			float DSNHB=0.0f;
			float HLR=0.0f;
			
			
			float ISES=0.0f;
			float IMF=0.0f;
			float TFFC=0.0f;
			float LIC_JSF=0.0f;
			float MCNSC=0.0f;
			
			
			
			float MCSC=0.0f;
			float MCS=0.0f;
			float MTHD=0.0f;
			float MTSD=0.0f;
			float MTSDS=0.0f;
			float TOTAL_80C_GROSS=0.0f;
			//float TOTAL_80C=0.0f;
			
			if (rs2_tot.next()) {

				LIP = rs2_tot.getFloat("LIP_80C_PROPOSED_AMOUNT");
				PPF=rs2_tot.getFloat("PPF_8OC_PROPOSED_AMOUNT");
				NSS = rs2_tot.getFloat("NSS_8OC_PROPOSED_AMOUNT");
				NSC = rs2_tot.getFloat("NSC_8OC_PROPOSED_AMOUNT");
				GOVT = rs2_tot.getFloat("GOVT_INFRA_80CCF_PROPOSED_AMOU");
				
				LIC= rs2_tot.getFloat("LIC_80C_PROPOSED_AMOUNT");
				ELSS= rs2_tot.getFloat("ELSS_80C_PROPOSED_AMOUNT");
				NPF= rs2_tot.getFloat("NPF_80C_PROPOSED_AMOUNT");
				DSNHB= rs2_tot.getFloat("DSNHB_80C_PROPOSED_AMOUNT");
				HLR= rs2_tot.getFloat("HLR_80C_PROPOSED_AMOUNT");
				
				
				ISES= rs2_tot.getFloat("ISES_80C_PROPOSED_AMOUNT");
				IMF= rs2_tot.getFloat("IMF_80C_PROPOSED_AMOUNT");
				TFFC= rs2_tot.getFloat("TFFC_80C_PROPOSED_AMOUNT");
				LIC_JSF= rs2_tot.getFloat("LIC_JSF_80CCC_PROPOSED_AMOUNT");
				MCNSC= rs2_tot.getFloat("MCNSC_80D_PROPOSED_AMOUNT");
				
				
				
				
				
				MCSC= rs2_tot.getFloat("MCSC_80D_PROPOSED_AMOUNT");
				MCS= rs2_tot.getFloat("MCS_SC_80D_PROPOSED_AMOUNT");
				MTHD= rs2_tot.getFloat("MTHD_SC_80DD_PROPOSED_AMOUNT");
				MTSD= rs2_tot.getFloat("MTSD_SD_80DDB_PROPOSED_AMOUNT");
				MTSDS= rs2_tot.getFloat("MTSDS_SC_80DDB_PROPOSED_AMOUNT");
				
				
				
				
				TOTAL_80C_GROSS=rs2_tot.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
				//TOTAL_80C=rs2_tot.getFloat("TOTAL_80_PROPOSED_AMOUNT");
				if(TOTAL_80C_GROSS>0.0){
					ins_value_total.add("Total  Rs.");
				}
				
				if(LIP>0.0){
				
					ins_value_total.add(LIP);
					}
				if(PPF>0.0)
				{	
					ins_value_total.add(PPF);
				}
				if(NSS>0.0)
				{
					
					ins_value_total.add(NSS);
				}
				if(NSC>0.0)
				{
					ins_value_total.add(NSC);
				}
				if(GOVT>0.0){
					
					ins_value_total.add(GOVT);
				}
				
				
				//LIC,ELSS,NPF,DSNHB,HLR
				if(LIC>0.0)
				{
					ins_value_total.add(LIC);
				}
				if(ELSS>0.0){
					ins_value_total.add(ELSS);
				}
				if(NPF>0.0){
					ins_value_total.add(NPF);
				}
				if(DSNHB>0.0){
					ins_value_total.add(DSNHB);
				}
				if(HLR>0.0){
					ins_value_total.add(HLR);
				}
				
				//ISES,IMF,TFFC,LIC_JSF,MCNSC
				
				if(ISES>0.0)
				{
					ins_value_total.add(ISES);
				}
				if(IMF>0.0){
					ins_value_total.add(IMF);
				}
				if(TFFC>0.0){
					ins_value_total.add(TFFC);
				}
				if(LIC_JSF>0.0){
					ins_value_total.add(LIC_JSF);
				}
				if(MCNSC>0.0){
					ins_value_total.add(MCNSC);
				}
				
				//MCSC,MCS,MTHD,MTSD,MTSDS
				if(MCSC>0.0)
				{
					ins_value_total.add(MCSC);
				}
				if(MCS>0.0){
					ins_value_total.add(MCS);
				}
				if(MTHD>0.0){
					ins_value_total.add(MTHD);
				}
				if(MTSD>0.0){
					ins_value_total.add(MTSD);
				}
				if(MTSDS>0.0){
					ins_value_total.add(MTSDS);
				}
				
				
				if(TOTAL_80C_GROSS>0.0){
					ins_value_total.add(TOTAL_80C_GROSS);
				}
				
				if(TOTAL_80C>0.0){
					ins_value_total.add(TOTAL_80C);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_value_total);
		return ins_value_total;
		
	}
	
	 * Getting investment columns if u opting
	 
	public static ArrayList<Object> invest_col() throws SQLException {
		ArrayList<Object> ins_td =new ArrayList<Object>();
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
		String sql3=null;
		
		
		if(month>=4){
			sql3="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql3="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
		
		
		
		
		//String sql3="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'";
		//String insDetails=null;
		
		String lip1=null;
		String ppf1=null;
		String nss1=null; 
		String nsc1=null; 
		String govt1=null; 
		
		
		
		String lic1=null; 
		String elss1=null; 
		String npf1=null; 
		String dsnhb1=null; 
		String hlr1=null; 
		
		
		String ises1=null; 
		String imf1=null; 
		String tffc1=null; 
		String lic_jsf1=null; 
		String mcnsc1=null; 
		
		
		
		String mcsc1=null; 
		String mcs1=null; 
		String mthd1=null; 
		String mtsd1=null; 
		String mtsds1=null; 
	    String total_ins=null;
	    //String total_80c=null;
		String inver=null;
	    ResultSet rs3 = null;
	    
	    try {
			Connection con = GetConnection.getConnection();
			Statement st = con.createStatement();

			rs3 = st.executeQuery(sql3);
			float LIP=0.0f;
			float PPF=0.0f;
			float NSS=0.0f;
			float NSC=0.0f;
			float GOVT=0.0f;
			
			float LIC=0.0f;
			float ELSS=0.0f;
			float NPF=0.0f;
			float DSNHB=0.0f;
			float HLR=0.0f;
			
			
			float ISES=0.0f;
			float IMF=0.0f;
			float TFFC=0.0f;
			float LIC_JSF=0.0f;
			float MCNSC=0.0f;
			
			
			
			float MCSC=0.0f;
			float MCS=0.0f;
			float MTHD=0.0f;
			float MTSD=0.0f;
			float MTSDS=0.0f;
			float TOTAL_80C_GROSS=0.0f;
			//float TOTAL_80C=0.0f;
			
			if (rs3.next()) {

				LIP = rs3.getFloat("LIP_80C_PROPOSED_AMOUNT");
				PPF=rs3.getFloat("PPF_8OC_PROPOSED_AMOUNT");
				NSS = rs3.getFloat("NSS_8OC_PROPOSED_AMOUNT");
				NSC = rs3.getFloat("NSC_8OC_PROPOSED_AMOUNT");
				GOVT = rs3.getFloat("GOVT_INFRA_80CCF_PROPOSED_AMOU");
				
				LIC= rs3.getFloat("LIC_80C_PROPOSED_AMOUNT");
				ELSS= rs3.getFloat("ELSS_80C_PROPOSED_AMOUNT");
				NPF= rs3.getFloat("NPF_80C_PROPOSED_AMOUNT");
				DSNHB= rs3.getFloat("DSNHB_80C_PROPOSED_AMOUNT");
				HLR= rs3.getFloat("HLR_80C_PROPOSED_AMOUNT");
				
				
				ISES= rs3.getFloat("ISES_80C_PROPOSED_AMOUNT");
				IMF= rs3.getFloat("IMF_80C_PROPOSED_AMOUNT");
				TFFC= rs3.getFloat("TFFC_80C_PROPOSED_AMOUNT");
				LIC_JSF= rs3.getFloat("LIC_JSF_80CCC_PROPOSED_AMOUNT");
				MCNSC= rs3.getFloat("MCNSC_80D_PROPOSED_AMOUNT");
				
				
				
				
				
				MCSC= rs3.getFloat("MCSC_80D_PROPOSED_AMOUNT");
				MCS= rs3.getFloat("MCS_SC_80D_PROPOSED_AMOUNT");
				MTHD= rs3.getFloat("MTHD_SC_80DD_PROPOSED_AMOUNT");
				MTSD= rs3.getFloat("MTSD_SD_80DDB_PROPOSED_AMOUNT");
				MTSDS= rs3.getFloat("MTSDS_SC_80DDB_PROPOSED_AMOUNT");
				
				
				
				
				TOTAL_80C_GROSS=rs3.getFloat("TOTAL_80C_PROPOSED_AMOUNT");
				
				//TOTAL_80C=rs3.getFloat("TOTAL_80_PROPOSED_AMOUNT");
				
				if(TOTAL_80C_GROSS>0.0){
					inver=" * Investment-U/S 80C";
					ins_td.add(inver);
				}
				
				if(LIP>0.0){
					lip1 = "LIFE INSURANCE POLICY";
					ins_td.add(lip1);
					
					}
				if(PPF>0.0)
				{
					ppf1 = "PUBLIC PROVIDENT FUND(PPF)";
					ins_td.add(ppf1);
				}
				if(NSS>0.0)
				{
					
					nss1 = "NATIONAL SAVING SCHEME(NSS)";
					ins_td.add(nss1);
					
				}
				if(NSC>0.0)
				{
					nsc1 ="NSC(VIII ISSUE)";
					ins_td.add(nsc1);
					
				}
				if(GOVT>0.0){
					govt1 = "CONTRIBUTION TO GOVT.INFRASTRUTURE BONDS";
					ins_td.add(govt1);
					
				}

				//LIC,ELSS,NPF,DSNHB,HLR
				if(LIC>0.0)
				{
					lic1 = "LIC ANNITY PLAN";
					ins_td.add(lic1);
				}
				if(ELSS>0.0){
					elss1 = "EQUITY LINKED SAVING SCHEME";
					ins_td.add(elss1);
				}
				if(NPF>0.0){
					npf1="NOTIFIED PENSION FUND";
					ins_td.add(npf1);
				}
				if(DSNHB>0.0){
					dsnhb1="DEPOSIT SCHEME OF NATIONAL HOUSING BANK";
					ins_td.add(dsnhb1);
				}
				if(HLR>0.0){
					hlr1="HOUSING LOAN REPAYMENT(PRINCIPAL)";
					ins_td.add(hlr1);
				}
				
				//ISES,IMF,TFFC,LIC_JSF,MCNSC
				
				if(ISES>0.0)
				{
					ises1 = "INFRASTRUCUTE EQUITY SHARES/DEBENTURES";
					ins_td.add(ises1);
				}
				if(IMF>0.0){
					imf1 = "INFRASTRUCTURE MUTUAL FUND";
					ins_td.add(imf1);
				}
				if(TFFC>0.0){
					tffc1="TUTION FEES FOR CHILDREN";
					ins_td.add(tffc1);
				}
				if(LIC_JSF>0.0){
					lic_jsf1="LIC JEEVAN SURAKSHA-PENSION FUND";
					ins_td.add(lic_jsf1);
				}
				if(MCNSC>0.0){
					mcnsc1="MEDICLAIM-PARENT(NON SENIOR CITIZEN)";
					ins_td.add(mcnsc1);
				}
				
				//MCSC,MCS,MTHD,MTSD,MTSDS
				if(MCSC>0.0)
				{
					mcsc1 = "MEDICLAIM-PARENT(SENIOR CITIZEN)";
					ins_td.add(mcsc1);
				}
				if(MCS>0.0){
					mcs1 = "MEDICLAIM-SELF/SPOUSE/CHILDREN";
					ins_td.add(mcs1);
				}
				if(MTHD>0.0){
					mthd1="MEDCL TRMNT-HANDICAPPED DEPENDENT";
					ins_td.add(mthd1);
				}
				if(MTSD>0.0){
					mtsd1="MEDCL TRMNT-SPECF DISEASE-SELF/DEPENDENT";
					ins_td.add(mtsd1);
				}
				if(MTSDS>0.0){
					mtsds1="MEDCL TRMNT-SPECF DISEASE-SENIOR CITIZEN";
					ins_td.add(mtsds1);
				}
				if(TOTAL_80C_GROSS>0.0){
					total_ins="TOTAL";
					ins_td.add(total_ins);
				}
				if(TOTAL_80C>0.0){
					total_80c="TOTAL_80_PROPOSED_AMOUNT";
					ins_td.add(total_80c);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_td);
		
		return ins_td;
	}
	
	
	
		
public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			//getBasicInfo();
			//getactual();
			invest_insment_display_qual();
			//ChoicepayValues();
			//ChoicepayColuns();
			//investment_display();
			//invest_col();
			//investment_80c_value();
			//investment_80c_column();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
*/