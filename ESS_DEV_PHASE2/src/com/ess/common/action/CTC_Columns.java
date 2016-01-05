package com.ess.common.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class CTC_Columns {
	
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
	
	public static float ChoicepayTot() throws SQLException {
		ArrayList<Object> choice_tot = new ArrayList<Object>();
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
		String getChoicetot=null;
		
		
		if(month>=4){
			getChoicetot="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
		}
		else
		{
			getChoicetot="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"'  and date_time>='"+date_l+"' and date_time<'"+date+"'";
		}	
		
		
		Connection con_to=null;
	    
	    ResultSet rs3 = null;
	    float ctc_total=0.0f;
	    
	    try {
	    	con_to = GetConnection.getConnection();
			Statement st1 = con_to.createStatement();

			rs3 = st1.executeQuery(getChoicetot);
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
			
			
			if (rs3.next()) {

				MEDICAL_NEW = rs3.getFloat("MEDICAL_NEW");
				CHILDREN_NEW=rs3.getFloat("CHILDREN_NEW");
				CONVEYANCE_NEW = rs3.getFloat("CONVEYANCE_NEW");
				FUEL_NEW = rs3.getFloat("FUEL_NEW");
				HRA_NEW = rs3.getFloat("HRA_NEW");
				
				LTA_NEW= rs3.getFloat("LTA_NEW");
				ER_NPS_NEW= rs3.getFloat("ER_NPS_NEW");
				ADVANCE= rs3.getFloat("ADVANCE");
				WASHING= rs3.getFloat("WASHING");
				CHILDREN_H_NEW= rs3.getFloat("CHILDREN_H_NEW");
				
				
				FOOD= rs3.getFloat("FOOD");
				GIFT_NEW= rs3.getFloat("GIFT_NEW");
				UTILITY_BILLS= rs3.getFloat("UTILITY_BILLS");
				ctc_total=MEDICAL_NEW+CHILDREN_NEW+CONVEYANCE_NEW+FUEL_NEW+HRA_NEW+LTA_NEW+ER_NPS_NEW+ADVANCE+WASHING+CHILDREN_H_NEW+FOOD+GIFT_NEW+UTILITY_BILLS;
				
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    finally{
	    	rs3.close();
	    	con_to.close();
	    }
	    System.out.println(choice_tot);
	    return ctc_total;
		
		
	}
	
	
	
	
	
	
	
	
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
			getChoiceColuns="select MEDICAL_NEW,CHILDREN_NEW,CONVEYANCE_NEW,FUEL_NEW,HRA_NEW,LTA_NEW,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_NEW,FOOD,GIFT_NEW,UTILITY_BILLS from Emp_detail_temp where EMP_ID='"+id+"'  and date_time>='"+date+"' and date_time<'"+date_h+"'";
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
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    finally{
	    	rs4.close();
	    	conn_col.close();
	    }
	    
	    
		System.out.println(ch_values);
		return ch_values;
		
	}
	
	/*public static ArrayList<String> Ctc_cal() throws SQLException {
		ArrayList<String> ctc_values = new ArrayList<String>();
		//Map session = ActionContext.getContext().getSession();
		//String id=(String)session.get("empid");
		//System.out.println("id from login=========="+id);
		//EMPID='"+id+"'";
		String getctc="select BASICPAY,hra,PROVIDENT,GRATUTY,PLI,MEDICAL,CONVEYANCE,LTA from  ctcstatement";
		String getvalues="select emp_ctc,bonus from NCSS_EMP_MASTER_INFO where emp_id='CSSE150051'";
		//String insDetails=null;
		
		
		Connection conn_ctc=null;
		
		Connection conn_basic=null;
		
	    ResultSet rs5 = null;
	    ResultSet rs6 = null;
	    
	    try {
	    	conn_ctc = GetConnection.getConnection();
			Statement st5 = conn_ctc.createStatement();
			
			conn_basic = GetConnection.getConnection();
			Statement st6 = conn_basic.createStatement();

			rs5 = st5.executeQuery(getctc);
			
			rs6 = st6.executeQuery(getvalues);
			float basic=0.0f;
			float hra=0.0f;
			float prov=0.0f;
			float gra=0.0f;
			float pli=0.0f;
			float medical=0.0f;
			float convey=0.0f;
			float lta=0.0f;
			
			float ctc=0.0f;
			float bonus=0.0f;
			float medical_in=0.0f;
			float conv_in=0.0f;
			
			float lta_in=0.0f;
			float hra_in=0.0f;
			float toto_other=0.0f;
			float tot_choice=0.0f;
			float tot_ctc=0.0f;
			
			float pli_in=0.0f;
			float over_all_ctc=0.0f;
			
			float spa=0.0f;
			
			if (rs5.next()) {

				basic = rs5.getFloat("BASICPAY");
				hra=rs5.getFloat("HRA");
				prov = rs5.getFloat("PROVIDENT");
				gra = rs5.getFloat("GRATUTY");
				
				pli = rs5.getFloat("PLI");
				medical= rs5.getFloat("MEDICAL");
				convey= rs5.getFloat("CONVEYANCE");
				lta= rs5.getFloat("LTA");
			}
				if(rs6.next()){
					
					ctc = rs6.getFloat("emp_ctc");
					bonus=rs6.getFloat("bonus");
				}
				
				System.out.println("original CTC is"+ctc);	
				System.out.println("bonus from table is"+bonus);
					float basic_pay=(basic*ctc)/100;
					
					System.out.println("basic pay is"+basic_pay);
					
					float pro_fund=(prov*basic_pay)/100;
					System.out.println("provident fund is"+pro_fund);
					
					float gratuty=(gra*basic_pay)/100;
					System.out.println("gratuty is"+gratuty);
					

					float tot_basepay=basic_pay+pro_fund+gratuty;
					System.out.println("total base pay is"+tot_basepay);
					
					float choicepay_tot=ChoicepayTot();
					System.out.println("total choicepay "+choicepay_tot);
					
					System.out.println("Advance bonus "+bonus);
					
					System.out.println("total mandatory debits "+bonus);
					
					medical_in=medical*12;
					System.out.println("Medical is "+medical_in);
					
					conv_in=convey*12;
					System.out.println("Conveyance is "+conv_in);
					
					lta_in=(ctc*lta)/100;
					System.out.println("LTA is "+lta_in);
					
					hra_in=(hra*ctc)/100;
					System.out.println("HRA is "+hra_in);
					
					spa=(ctc-(basic_pay+hra+conv_in+lta_in+medical_in)-pro_fund);
					System.out.println("spa is "+spa);
					
					toto_other=medical_in+conv_in+lta_in+hra_in+spa;
					System.out.println("total other choice items "+toto_other);
					
					tot_choice=toto_other+bonus;
					System.out.println("total choice pay "+tot_choice);
					
					tot_ctc=tot_choice+tot_basepay+choicepay_tot;
					System.out.println("Total CTC "+tot_ctc);
					
					pli_in=(pli*ctc)/100;
					System.out.println("PLI is"+pli_in);
					
					over_all_ctc=pli_in+tot_ctc;
					System.out.println("over all ctc is "+over_all_ctc);
				
		
					//ctc_values=insDetails;
			
			
		} catch (Exception e) {
			System.out.println("problem in getting");
			e.printStackTrace();
			
		}
	    finally{
	    	rs5.close();
	    	conn_ctc.close();
	    }
	    
	    
		//System.out.println(ctc_values);
		return ctc_values;
		
	}
	*/
	
	/* CTC AFTER JOIN  */
	
	public static String Ctc_cal() throws SQLException {
		//ArrayList<String> ctc_values = new ArrayList<String>();
		Map session = ActionContext.getContext().getSession();
	String id=(String)session.get("empid");
		
		String getctc="select BASICPAY,HRA,PROVIDENT,GRATUTY,PLI,MEDICAL,CONVEYANCE,LTA,ESI from  ctcstatement";
		String getvalues="select emp_ctc,bonus from NCSS_EMP_MASTER_INFO where emp_id='"+id+"'";
		String insDetails=null;
		
		
		Connection conn_ctc=null;
		
		Connection conn_basic=null;
		
	    ResultSet rs5 = null;
	    ResultSet rs6 = null;
	    
	    try {
	    	conn_ctc = GetConnection.getConnection();
			Statement st5 = conn_ctc.createStatement();
			
			conn_basic = GetConnection.getConnection();
			Statement st6 = conn_basic.createStatement();

			rs5 = st5.executeQuery(getctc);
			
			rs6 = st6.executeQuery(getvalues);
			float basic=0.0f;
			float hra=0.0f;
			float prov=0.0f;
			float gra=0.0f;
			float pli=0.0f;
			float medical=0.0f;
			float convey=0.0f;
			float lta=0.0f;
			
			float ctc=0.0f;
			float bonus=0.0f;
			float medical_in=0.0f;
			float conv_in=0.0f;
			
			float lta_in=0.0f;
			float hra_in=0.0f;
			float toto_other=0.0f;
			float tot_choice=0.0f;
			float tot_ctc=0.0f;
			
			float pli_in=0.0f;
			float over_all_ctc=0.0f;
			
			float spa=0.0f;
			float esi=0.0f;
			
			if (rs5.next()) {

				basic = rs5.getFloat("BASICPAY");
				hra=rs5.getFloat("HRA");
				prov = rs5.getFloat("PROVIDENT");
				gra = rs5.getFloat("GRATUTY");
				
				pli = rs5.getFloat("PLI");
				medical= rs5.getFloat("MEDICAL");
				convey= rs5.getFloat("CONVEYANCE");
				lta= rs5.getFloat("LTA");
				esi= rs5.getFloat("ESI");
			}
				if(rs6.next()){
					
					ctc = rs6.getFloat("emp_ctc");
					bonus=rs6.getFloat("bonus");
				}
				
			/*	System.out.println("original CTC is"+ctc);	
				System.out.println("bonus from table is"+bonus);
					float basic_pay=(basic*ctc)/100;
					
					System.out.println("basic pay is"+basic_pay);
					
					String basic_str=String.valueOf(basic_pay);
					
					
					float pro_fund=(prov*basic_pay)/100;
					System.out.println("provident fund is"+pro_fund);
					String pro_str=String.valueOf(pro_fund);
					
					float gratuty=(gra*basic_pay)/100;
					System.out.println("gratuty is"+gratuty);
					String gra_str=String.valueOf(gratuty);

					float tot_basepay=basic_pay+pro_fund+gratuty;
					System.out.println("total base pay is"+tot_basepay);
					
					String tot_base_str=String.valueOf(tot_basepay);
					
					float choicepay_tot=ChoicepayTot();
					System.out.println("total choicepay "+choicepay_tot);
					String choicepay_str=String.valueOf(choicepay_tot);
					
					
					System.out.println("Advance bonus "+bonus);
					String bonus_str=String.valueOf(bonus);
					
					System.out.println("total mandatory debits "+bonus);
					String tot_man_str=String.valueOf(bonus);
					
					medical_in=medical*12;
					System.out.println("Medical is "+medical_in);
					String med_str=String.valueOf(medical_in);
					
					conv_in=convey*12;
					System.out.println("Conveyance is "+conv_in);
					String con_str=String.valueOf(conv_in);
					
					lta_in=(ctc*lta)/100;
					System.out.println("LTA is "+lta_in);
					String lta_str=String.valueOf(lta_in);
					
					hra_in=(hra*ctc)/100;
					System.out.println("HRA is "+hra_in);
					String hra_str=String.valueOf(hra_in);
					
					spa=(ctc-(basic_pay+hra_in+conv_in+lta_in+medical_in)-pro_fund);
					System.out.println("spa is "+spa);
					String spa_str=String.valueOf(spa);
					
					toto_other=medical_in+conv_in+lta_in+hra_in+spa;
					System.out.println("total other choice items "+toto_other);
					String tot_other_str=String.valueOf(toto_other);
					
					tot_choice=toto_other+bonus;
					System.out.println("total choice pay "+tot_choice);
					String tot_choice_str=String.valueOf(tot_choice);
					
					tot_ctc=tot_choice+tot_basepay+choicepay_tot;
					System.out.println("Total CTC "+tot_ctc);
					String tot_ctc_str=String.valueOf(tot_ctc);
					
					pli_in=(pli*ctc)/100;
					System.out.println("PLI is"+pli_in);
					String pli_str=String.valueOf(pli_in);
					
					over_all_ctc=pli_in+tot_ctc;
					System.out.println("over all ctc is "+over_all_ctc);
					String over_all_str=String.valueOf(over_all_ctc);*/
				
				System.out.println("original CTC is"+ctc);	
				System.out.println("bonus from table is"+bonus);
				
				
					float basic_pay=(basic*ctc)/100;
					System.out.println("basic pay is"+basic_pay);
					String basic_str=String.valueOf(basic_pay);
					
					

					float esi_pay=(basic_pay*esi)/100;
					System.out.println("esi pay is"+esi_pay);
					String esi_str1=String.valueOf(esi_pay);
					if(ctc>=180000)
					{
						esi_pay=0.00f;
					}
					
					
					float pro_fund=(prov*basic_pay)/100;
					System.out.println("provident fund is"+pro_fund);
					String pro_str=String.valueOf(pro_fund);
					
					float gratuty=(gra*basic_pay)/100;
					System.out.println("gratuty is"+gratuty);
					String gra_str=String.valueOf(gratuty);

					float tot_basepay=basic_pay+pro_fund+gratuty+esi_pay;
					System.out.println("total base pay is"+tot_basepay);
					
					String tot_base_str=String.valueOf(tot_basepay);
					
					float choicepay_tot=ChoicepayTot();
					System.out.println("total choicepay "+choicepay_tot);
					String choicepay_str=String.valueOf(choicepay_tot);
					
					
					System.out.println("Advance bonus "+bonus);
					String bonus_str=String.valueOf(bonus);
					
					System.out.println("total mandatory debits "+bonus);
					String tot_man_str=String.valueOf(bonus);
					
					medical_in=medical*12;
					System.out.println("Medical is "+medical_in);
					String med_str=String.valueOf(medical_in);
					
					conv_in=convey*12;
					System.out.println("Conveyance is "+conv_in);
					String con_str=String.valueOf(conv_in);
					
					lta_in=(basic_pay*lta)/100;
					System.out.println("LTA is "+lta_in);
					String lta_str=String.valueOf(lta_in);
					
					hra_in=(hra*basic_pay)/100;
					System.out.println("HRA is "+hra_in);
					String hra_str=String.valueOf(hra_in);
					

					pli_in=(pli*ctc)/100;
					//pli=0.0f;
					System.out.println("PLI is"+pli_in);
					String pli_str=String.valueOf(pli_in);
					
					float total_before_spa=tot_basepay+choicepay_tot+bonus+medical_in+conv_in+lta_in+hra_in+pli_in;
					
					//spa=(ctc-(basic_pay+hra_in+conv_in+lta_in+medical_in)-pro_fund);
					spa=ctc-total_before_spa;
					
					
					//spa:=(ctc-(total_base_pay+tot_man_debit+medical+convayance+lta+hra));
					
					System.out.println("spa is "+spa);
					String spa_str=String.valueOf(spa);
					
					toto_other=medical_in+conv_in+lta_in+hra_in+spa;
					System.out.println("total other choice items "+toto_other);
					String tot_other_str=String.valueOf(toto_other);
					
					tot_choice=toto_other+bonus;
					System.out.println("total choice pay "+tot_choice);
					String tot_choice_str=String.valueOf(tot_choice);
					
					tot_ctc=tot_choice+tot_basepay+choicepay_tot;
					System.out.println("Total CTC "+tot_ctc);
					String tot_ctc_str=String.valueOf(tot_ctc);
					
					
					over_all_ctc=pli_in+tot_ctc;
					System.out.println("over all ctc is "+over_all_ctc);
					String over_all_str=String.valueOf(over_all_ctc);
					
					insDetails=basic_str+"^"+pro_str+"^"+gra_str+"^"+tot_base_str+"^"+bonus_str+"^"+tot_man_str+"^"+
					med_str+"^"+con_str+"^"+lta_str+"^"+hra_str+"^"+spa_str+"^"+tot_other_str+"^"+tot_choice_str+"^"+
							tot_ctc_str+"^"+pli_str+"^"+over_all_str +"^"+ esi_pay;
			
		} catch (Exception e) {
			System.out.println("problem in getting");
			e.printStackTrace();
			
		}
	    finally{
	    	rs5.close();
	    	conn_ctc.close();
	    }
	    
	    
		//System.out.println(ctc_values);
		return insDetails;
		
	}
	
	
	/* PAYSLIP CONFIGURATION DETAILS  */
	
	public static void main(String args[]){
		
		try {
			//ChoicepayValues();
			//ChoicepayColuns();
			//ChoicepayTot();
			//CTC_Columns bd=new CTC_Columns();
			String all=Ctc_cal();
			System.out.println(all);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
