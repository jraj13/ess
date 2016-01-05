package com.ess.common.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class InvestmentDisplay {

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
		System.out.println("date.."+date);
		String date_h="01-APR-"+h_year;
		System.out.println("date_h.."+date_h);
		String date_l="01-APR-"+l_year;
		System.out.println("date_l.."+date_l);
		String sql3=null;
		
		
		if(month>=4){
			sql3="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			sql3="select LIP_80C_PROPOSED_AMOUNT,PPF_8OC_PROPOSED_AMOUNT,NSS_8OC_PROPOSED_AMOUNT,NSC_8OC_PROPOSED_AMOUNT,GOVT_INFRA_80CCF_PROPOSED_AMOU,LIC_80C_PROPOSED_AMOUNT,ELSS_80C_PROPOSED_AMOUNT,NPF_80C_PROPOSED_AMOUNT,DSNHB_80C_PROPOSED_AMOUNT,HLR_80C_PROPOSED_AMOUNT,ISES_80C_PROPOSED_AMOUNT,IMF_80C_PROPOSED_AMOUNT,TFFC_80C_PROPOSED_AMOUNT,LIC_JSF_80CCC_PROPOSED_AMOUNT,MCNSC_80D_PROPOSED_AMOUNT,MCSC_80D_PROPOSED_AMOUNT,MCS_SC_80D_PROPOSED_AMOUNT,MTHD_SC_80DD_PROPOSED_AMOUNT,MTSD_SD_80DDB_PROPOSED_AMOUNT,MTSDS_SC_80DDB_PROPOSED_AMOUNT,TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80_PROPOSED_AMOUNT from EMP_INVESTMENT_DECLARATION where EMP_ID='"+id+"' and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
		
		System.out.println("sql3.."+sql3);
		
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
	    String total_80c=null;
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
			float TOTAL_80C=0.0f;
			
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
				
				TOTAL_80C=rs3.getFloat("TOTAL_80_PROPOSED_AMOUNT");
				
				
				
				
				
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
					govt1 = "CONTRIBUTION TO GOVT.INFRASTRUTURE BONDS UNDER SEC";
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
					total_ins="TOTAL_80C_PROPOSED_AMOUNT";
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
	
	
	
	
	public static ArrayList<Object> choicepay_columns() throws SQLException {
		ArrayList<Object> choice_column = new ArrayList<Object>();
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
		String choicecol=null;
		
		
		if(month>=4){
			choicecol="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			choicecol="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"'  and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
		
		
		
		//String choicecol = "select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,UTILITY_BILLS,GIFT_NEW from EMP_DETAIL_TEMP where EMP_ID='"+id+"'";
	    ResultSet rs6 = null;
	    
	    String medical1=null;
		String child1=null;
		String convey1=null; 
		String fuel1=null; 
		String hra1=null; 
		
		
		
		String lta1=null; 
		String er_nps1=null; 
		String advance1=null; 
		String washing1=null; 
		String hostel1=null; 
		
		String food1=null; 
		String bils1=null; 
		String gift1=null; 
	   
	    try {
			Connection con6 = GetConnection.getConnection();
			Statement st6 = con6.createStatement();

			rs6 = st6.executeQuery(choicecol);
			 
		    float medical=0.0f;
			float child=0.0f;
			float convey=0.0f;
			float fuel=0.0f;
			float hra=0.0f;
			
			float lta=0.0f;
			float er_nps=0.0f;
			float advance=0.0f;
			float washing=0.0f;
			float hostel=0.0f;
			
			
			float food=0.0f;
			float bils=0.0f;
			float gift=0.0f;
			
			
			
			if(rs6.next()){
				
			medical = rs6.getFloat("MEDICAL_NEW");
			child=rs6.getFloat("CHILDREN_NEW");
			convey = rs6.getFloat("CONVEYANCE_NEW");
			fuel = rs6.getFloat("FUEL_NEW");
			hra = rs6.getFloat("HRA_NEW");
			
			lta= rs6.getFloat("LTA_NEW");
			er_nps= rs6.getFloat("ER_NPS_NEW");
			advance= rs6.getFloat("ADVANCE");
			washing= rs6.getFloat("WASHING");
			hostel= rs6.getFloat("CHILDREN_H_NEW");
			
			food= rs6.getFloat("FOOD");
			bils= rs6.getFloat("UTILITY_BILLS");
			gift= rs6.getFloat("GIFT_NEW");
			
			if(medical>0.0){
				medical1="Medical Reimbursement";
				choice_column.add(medical1);
			}
			if(child>0.0){
				child1="Children Education Allowance";
				choice_column.add(child1);
			}
			if(convey>0.0){
				convey1="Conveyance Allowance";
				choice_column.add(convey1);
			}
			if(fuel>0.0){
				fuel1="Fuel / Maint. Expenses";
				choice_column.add(fuel1);
			}
			if(hra>0.0){
				hra1="HRA";
				choice_column.add(hra1);
			}
			
			
			if(lta>0.0){
				lta1="LTA";
				choice_column.add(lta1);
			}
			if(er_nps>0.0){
				er_nps1="Er.NPS Contribution";
				choice_column.add(er_nps1);
			}
			if(advance>0.0){
				advance1="Advance Bonus";
				choice_column.add(advance1);
			}
			if(washing>0.0){
				washing1="Washing Expenses";
				choice_column.add(washing1);
			}
			if(hostel>0.0){
				hostel1="Children Hostel Allowance";
				choice_column.add(hostel1);
			}
			
			
			
			if(food>0.0){
				food1="Food Coupons";
				choice_column.add(food1);
			}
			if(bils>0.0){
				bils1="Utility Bills";
				choice_column.add(bils1);
			}
			if(gift>0.0){
				gift1="Gift Coupons";
				choice_column.add(gift1);
			}
							
	    }
	    }
			
			catch(Exception e){
	    	e.printStackTrace();
	    }
			System.out.println(choice_column);
	    return choice_column;
	}
			
			
			
	public static ArrayList<Object> choicepay_data() throws SQLException {
		ArrayList<Object> choice_data = new ArrayList<Object>();
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
		String choicecol=null;
		
		
		if(month>=4){
			choicecol="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			choicecol="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"'  and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}
		
		
		
		
		
		
		
		//String choicecol = "select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,UTILITY_BILLS,GIFT_NEW from EMP_DETAIL_TEMP where EMP_ID='"+id+"'";
	    ResultSet rs7 = null;
	    
	    
	    try {
			Connection con6 = GetConnection.getConnection();
			Statement st7 = con6.createStatement();

			rs7 = st7.executeQuery(choicecol);
			 
		    float medical2=0.0f;
			float child2=0.0f;
			float convey2=0.0f;
			float fuel2=0.0f;
			float hra2=0.0f;
			
			float lta2=0.0f;
			float er_nps2=0.0f;
			float advance2=0.0f;
			float washing2=0.0f;
			float hostel2=0.0f;
			
			
			float food2=0.0f;
			float bils2=0.0f;
			float gift2=0.0f;
			
			
			
			if(rs7.next()){
				
			medical2 = rs7.getFloat("MEDICAL_NEW");
			child2=rs7.getFloat("CHILDREN_NEW");
			convey2 = rs7.getFloat("CONVEYANCE_NEW");
			fuel2 = rs7.getFloat("FUEL_NEW");
			hra2 = rs7.getFloat("HRA_NEW");
			
			lta2= rs7.getFloat("LTA_NEW");
			er_nps2= rs7.getFloat("ER_NPS_NEW");
			advance2= rs7.getFloat("ADVANCE");
			washing2= rs7.getFloat("WASHING");
			hostel2= rs7.getFloat("CHILDREN_H_NEW");
			
			food2= rs7.getFloat("FOOD");
			bils2= rs7.getFloat("UTILITY_BILLS");
			gift2= rs7.getFloat("GIFT_NEW");
			
			if(medical2>0.0){
				choice_data.add(medical2);
			}
			if(child2>0.0){
				choice_data.add(child2);
			}
			if(convey2>0.0){
				choice_data.add(convey2);
			}
			if(fuel2>0.0){
				choice_data.add(fuel2);
			}
			if(hra2>0.0){
				choice_data.add(hra2);
			}
			
			
			if(lta2>0.0){
				choice_data.add(lta2);
			}
			if(er_nps2>0.0){
				choice_data.add(er_nps2);
			}
			if(advance2>0.0){
				choice_data.add(advance2);
			}
			if(washing2>0.0){
				choice_data.add(washing2);
			}
			if(hostel2>0.0){
				choice_data.add(hostel2);
			}
			
			
			
			if(food2>0.0){
				choice_data.add(food2);
			}
			if(bils2>0.0){
				choice_data.add(bils2);
			}
			if(gift2>0.0){
				choice_data.add(gift2);
			}
							
	    }
	    }
			
			catch(Exception e){
	    	e.printStackTrace();
	    }
			System.out.println(choice_data);
	    return choice_data;
	}
					
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			//investment_display();
			//invest_col();
			
			choicepay_data();
			choicepay_columns();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}


