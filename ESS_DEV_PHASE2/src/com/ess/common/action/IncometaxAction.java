
package com.ess.common.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class IncometaxAction {

	/**
	 * 
	 * @getting basic info needed in income tax header table
	 * @throws SQLException
	 */
	public static ArrayList<String> getBasicInfo() throws SQLException {
		ArrayList<String> basicInfo = new ArrayList<String>();
		
		Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		System.out.println("id from login=========="+id);
		
		String sql = "select EMP_ID,EMP_NAME,EMP_DESIGNATION,PAN_NO from EMP_PAY_MASTER_TEMP where EMP_ID='"+id+"'";
		String empDetails = null;
		
	    
	    ResultSet rst = null;
	    
	    try {
			Connection con = GetConnection.getConnection();
			Statement stmt = con.createStatement();

			rst = stmt.executeQuery(sql);

			String empId = "";
			String empName = "";
			String empDesig = "";
			String empPan = "";
			
			if (rst.next()) {

				empId = rst.getString("EMP_ID");
				empName = rst.getString("EMP_NAME");
				empDesig = rst.getString("EMP_DESIGNATION");
				empPan = rst.getString("PAN_NO");
				
				empDetails = empId + "^" + empName + "^" + empDesig + "^"+ empPan;
				basicInfo.add(empDetails);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(empDetails);
		return basicInfo;
	}
	/**
	 * 
	 * @Getting information needed in income tax 2nd table
	 */
	public static ArrayList<Object> getactual() throws SQLException {
		ArrayList<Object> getmonth = new ArrayList<Object>();
		
		 //String sql1="SELECT * FROM INCOMETAX WHERE EMPID='CSSE150045'";
		Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		System.out.println("id from login=========="+id);
		String sql1="SELECT * FROM INCOMETAX WHERE EMPID='"+id+"'";
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
				float HRA_EXCE=0.0f;
				float HRA_EXCE_TOT=0.0f;
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
				
				float PARENT_GROSS=0.0f;
				float PARENT_QUAL=0.0f;
				float PARENT_DED=0.0f;
				float SEC_GROSS=0.0f;
				float SEC_DED=0.0f;
				float SEC_QUAL=0.0f;
				float TOT_GROSS=0.0f;
				float TOT_QUAL=0.0f;
				float TOT_DED=0.0f;
				
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
				float BALANCE_TAX=0.0f;
				
				
				if (rs.next()) {
					
					 ACTUL=rs.getString("actul");
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
					

					PLI_ACT=rs.getFloat("PLI_ACT");
					PLI_PRO=rs.getFloat("PLI_PRO");
					PLI_TOT=rs.getFloat("PLI_TOT");
					EARNINGS_TOTAL=rs.getFloat("EARNINGS_TOTAL");
					HRA_EXCE=rs.getFloat("HRA_EXCE");
					HRA_EXCE_TOT=rs.getFloat("HRA_TOTAL");
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
					
					PARENT_GROSS=rs.getFloat("PARENT_GROSS");
					PARENT_QUAL=rs.getFloat("PARENT_QUAL");
					PARENT_DED=rs.getFloat("PARENT_DED");
					SEC_GROSS=rs.getFloat("SEC_GROSS");
					SEC_QUAL=rs.getFloat("SEC_QUAL");
					SEC_DED=rs.getFloat("SEC_DED");
					TOT_GROSS=rs.getFloat("TOT_GROSS");
					TOT_QUAL=rs.getFloat("TOT_QUAL");
					TOT_DED=rs.getFloat("TOT_DED");
					
					
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
					BALANCE_TAX=rs.getFloat("BALANCE_TAX");
					
					emp=ACTUL + "^" + PROJECTION+"^"+BASIC_SALARY_ACT+"^"+BASIC_SALARY_PRO+"^"+BASIC_SALARY_TOT+"^"+HRA_ACT+"^"+HRA_PRO+"^"+HRA_TOT+"^"+SA_ACT+"^"+SA_PRO+"^"+SA_TOT+"^"+PLI_ACT+"^"+PLI_PRO+"^"
					+PLI_TOT+"^"+EARNINGS_TOTAL+"^"+HRA_EXCE+"^"+HRA_EXCE_TOT+"^"+GROSS_EARNINGS+"^"+PER_TOTAL+"^"+GROSS_SALARY+"^"+INCOME_PREVIOUS+"^"+GROSS_PREVIOUS+"^"+STD_DEDUCTION+"^"+PRO_TAX+"^"+PRO_TAX_PREVIOUS
					+"^"+DED_TOTAL+"^"+INCOME_CHARGABLE+"^"+INCOME_OTHER+"^"+PARENT_GROSS+"^"+PARENT_QUAL+"^"+PARENT_DED+"^"+SEC_GROSS+"^"+SEC_QUAL+"^"+SEC_DED+"^"+TOT_GROSS+"^"+TOT_QUAL+"^"+TOT_DED+"^"+MAX_QUAL+"^"+TOTAL_TAXABLE
					+"^"+TAX_CREDIT+"^"+TAX_PAYABLE+"^"+SURCHARGE_ON_TAX+"^"+HIGHER_EDU+"^"+TOTALTAX+"^"+TAX_CURRENT_YEAR+"^"+REBATE+"^"+TAX_PREVIOUS_YEAR+"^"+BALANCE_TAX;
					getmonth.add(emp);
					System.out.println(getmonth);
				}
		 }catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 return getmonth;
	}
	
	
	public static ArrayList<Object> investment() throws SQLException {
		ArrayList<Object> ins_dec = new ArrayList<Object>();
		Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		System.out.println("id from login=========="+id);
		//EMPID='"+id+"'";
		String sql = "SELECT LIP,PPF,NSS,NSC,GOVT,LIC,ELSS,NPF,DSNHB,HLR,ISES,IMF,TFFC,LIC_JSF,MCNSC,MCSC,MCS,MTHD,MTSD,MTSDS,TOTAL_80C_GROSS,TOTAL_80C_QUAL,TOTAL_80C_TOTAL FROM INCOMETAX WHERE EMPID='"+id+"'";
		//String insDetails=null;
		
		
	    
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
			
			if (rs2.next()) {

				LIP = rs2.getFloat("LIP");
				PPF=rs2.getFloat("PPF");
				NSS = rs2.getFloat("NSS");
				NSC = rs2.getFloat("NSC");
				GOVT = rs2.getFloat("GOVT");
				
				LIC= rs2.getFloat("LIC");
				ELSS= rs2.getFloat("ELSS");
				NPF= rs2.getFloat("NPF");
				DSNHB= rs2.getFloat("DSNHB");
				HLR= rs2.getFloat("HLR");
				
				
				ISES= rs2.getFloat("ISES");
				IMF= rs2.getFloat("IMF");
				TFFC= rs2.getFloat("TFFC");
				LIC_JSF= rs2.getFloat("LIC_JSF");
				MCNSC= rs2.getFloat("MCNSC");
				
				
				
				MCSC= rs2.getFloat("MCSC");
				MCS= rs2.getFloat("MCS");
				MTHD= rs2.getFloat("MTHD");
				MTSD= rs2.getFloat("MTSD");
				MTSDS= rs2.getFloat("MTSDS");
				TOTAL_80C_GROSS=rs2.getFloat("TOTAL_80C_GROSS");
				
				if(LIP>0.0){
				
					ins_dec.add(LIP);
					}
				if(PPF>0.0)
				{	
					ins_dec.add(PPF);
				}
				if(NSS>0.0)
				{
					
					ins_dec.add(NSS);
				}
				if(NSC>0.0)
				{
					ins_dec.add(NSC);
				}
				if(GOVT>0.0){
					
					ins_dec.add(GOVT);
				}
				
				
				//LIC,ELSS,NPF,DSNHB,HLR
				if(LIC>0.0)
				{
					ins_dec.add(LIC);
				}
				if(ELSS>0.0){
					ins_dec.add(ELSS);
				}
				if(NPF>0.0){
					ins_dec.add(NPF);
				}
				if(DSNHB>0.0){
					ins_dec.add(DSNHB);
				}
				if(HLR>0.0){
					ins_dec.add(HLR);
				}
				
				//ISES,IMF,TFFC,LIC_JSF,MCNSC
				
				if(ISES>0.0)
				{
					ins_dec.add(ISES);
				}
				if(IMF>0.0){
					ins_dec.add(IMF);
				}
				if(TFFC>0.0){
					ins_dec.add(TFFC);
				}
				if(LIC_JSF>0.0){
					ins_dec.add(LIC_JSF);
				}
				if(MCNSC>0.0){
					ins_dec.add(MCNSC);
				}
				
				//MCSC,MCS,MTHD,MTSD,MTSDS
				if(MCSC>0.0)
				{
					ins_dec.add(MCSC);
				}
				if(MCS>0.0){
					ins_dec.add(MCS);
				}
				if(MTHD>0.0){
					ins_dec.add(MTHD);
				}
				if(MTSD>0.0){
					ins_dec.add(MTSD);
				}
				if(MTSDS>0.0){
					ins_dec.add(MTSDS);
				}
				if(TOTAL_80C_GROSS>0.0){
					ins_dec.add(TOTAL_80C_GROSS);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_dec);
		return ins_dec;
		
	}
	
	
	public static ArrayList<Object> invest() throws SQLException {
		ArrayList<Object> ins_td =new ArrayList<Object>();
		Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		System.out.println("id from login=========="+id);
		//EMPID='"+id+"'";
		String sql = "SELECT LIP,PPF,NSS,NSC,GOVT,LIC,ELSS,NPF,DSNHB,HLR,ISES,IMF,TFFC,LIC_JSF,MCNSC,MCSC,MCS,MTHD,MTSD,MTSDS,TOTAL_80C_GROSS,TOTAL_80C_QUAL,TOTAL_80C_TOTAL FROM INCOMETAX WHERE EMPID='"+id+"'";
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
	    ResultSet rs3 = null;
	    
	    try {
			Connection con = GetConnection.getConnection();
			Statement st = con.createStatement();

			rs3 = st.executeQuery(sql);
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
			if (rs3.next()) {

				LIP = rs3.getFloat("LIP");
				PPF=rs3.getFloat("PPF");
				NSS = rs3.getFloat("NSS");
				NSC = rs3.getFloat("NSC");
				GOVT = rs3.getFloat("GOVT");
				
				LIC= rs3.getFloat("LIC");
				ELSS= rs3.getFloat("ELSS");
				NPF= rs3.getFloat("NPF");
				DSNHB= rs3.getFloat("DSNHB");
				HLR= rs3.getFloat("HLR");
				
				
				ISES= rs3.getFloat("ISES");
				IMF= rs3.getFloat("IMF");
				TFFC= rs3.getFloat("TFFC");
				LIC_JSF= rs3.getFloat("LIC_JSF");
				MCNSC= rs3.getFloat("MCNSC");
				
				
				
				MCSC= rs3.getFloat("MCSC");
				MCS= rs3.getFloat("MCS");
				MTHD= rs3.getFloat("MTHD");
				MTSD= rs3.getFloat("MTSD");
				MTSDS= rs3.getFloat("MTSDS");
				TOTAL_80C_GROSS=rs3.getFloat("TOTAL_80C_GROSS");
				
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
					total_ins="Total";
					ins_td.add(total_ins);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_td);
		
		return ins_td;
	}
	
	
	
	public static ArrayList<Object> investment_tot() throws SQLException {
		ArrayList<Object> ins_tot = new ArrayList<Object>();
		Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		System.out.println("id from login=========="+id);
		//EMPID='"+id+"'";
		
		String sql4 = "SELECT LIP,PPF,NSS,NSC,GOVT,LIC,ELSS,NPF,DSNHB,HLR,ISES,IMF,TFFC,LIC_JSF,MCNSC,MCSC,MCS,MTHD,MTSD,MTSDS,TOTAL_80C_GROSS,TOTAL_80C_QUAL,TOTAL_80C_TOTAL FROM INCOMETAX WHERE EMPID='"+id+"'";
		//String insDetails=null;
		
		
	    
	    ResultSet rs4 = null;
	    
	    try {
			Connection conn = GetConnection.getConnection();
			Statement st = conn.createStatement();

			rs4 = st.executeQuery(sql4);
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
			if (rs4.next()) {

				LIP = rs4.getFloat("LIP");
				PPF=rs4.getFloat("PPF");
				NSS = rs4.getFloat("NSS");
				NSC = rs4.getFloat("NSC");
				GOVT = rs4.getFloat("GOVT");
				
				LIC= rs4.getFloat("LIC");
				ELSS= rs4.getFloat("ELSS");
				NPF= rs4.getFloat("NPF");
				DSNHB= rs4.getFloat("DSNHB");
				HLR= rs4.getFloat("HLR");
				
				
				ISES= rs4.getFloat("ISES");
				IMF= rs4.getFloat("IMF");
				TFFC= rs4.getFloat("TFFC");
				LIC_JSF= rs4.getFloat("LIC_JSF");
				MCNSC= rs4.getFloat("MCNSC");
				
				
				
				MCSC= rs4.getFloat("MCSC");
				MCS= rs4.getFloat("MCS");
				MTHD= rs4.getFloat("MTHD");
				MTSD= rs4.getFloat("MTSD");
				MTSDS= rs4.getFloat("MTSDS");
				TOTAL_80C_GROSS=rs4.getFloat("TOTAL_80C_GROSS");
				
				if(LIP>0.0){
				
					ins_tot.add(LIP);
					}
				if(PPF>0.0)
				{	
					ins_tot.add(PPF);
				}
				if(NSS>0.0)
				{
					
					ins_tot.add(NSS);
				}
				if(NSC>0.0)
				{
					ins_tot.add(NSC);
				}
				if(GOVT>0.0){
					
					ins_tot.add(GOVT);
				}
				
				
				//LIC,ELSS,NPF,DSNHB,HLR
				if(LIC>0.0)
				{
					ins_tot.add(LIC);
				}
				if(ELSS>0.0){
					ins_tot.add(ELSS);
				}
				if(NPF>0.0){
					ins_tot.add(NPF);
				}
				if(DSNHB>0.0){
					ins_tot.add(DSNHB);
				}
				if(HLR>0.0){
					ins_tot.add(HLR);
				}
				
				//ISES,IMF,TFFC,LIC_JSF,MCNSC
				
				if(ISES>0.0)
				{
					ins_tot.add(ISES);
				}
				if(IMF>0.0){
					ins_tot.add(IMF);
				}
				if(TFFC>0.0){
					ins_tot.add(TFFC);
				}
				if(LIC_JSF>0.0){
					ins_tot.add(LIC_JSF);
				}
				if(MCNSC>0.0){
					ins_tot.add(MCNSC);
				}
				
				//MCSC,MCS,MTHD,MTSD,MTSDS
				if(MCSC>0.0)
				{
					ins_tot.add(MCSC);
				}
				if(MCS>0.0){
					ins_tot.add(MCS);
				}
				if(MTHD>0.0){
					ins_tot.add(MTHD);
				}
				if(MTSD>0.0){
					ins_tot.add(MTSD);
				}
				if(MTSDS>0.0){
					ins_tot.add(MTSDS);
				}
				if(TOTAL_80C_GROSS>0.0){
					ins_tot.add(TOTAL_80C_GROSS);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_tot);
		return ins_tot;
		
	}
	
	
	
	public static ArrayList<Object> investment_qual() throws SQLException {
		ArrayList<Object> ins_qual = new ArrayList<Object>();
		Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		System.out.println("id from login=========="+id);
		//EMPID='"+id+"'";
		
		String sql4 = "SELECT LIP,PPF,NSS,NSC,GOVT,LIC,ELSS,NPF,DSNHB,HLR,ISES,IMF,TFFC,LIC_JSF,MCNSC,MCSC,MCS,MTHD,MTSD,MTSDS,TOTAL_80C_GROSS,TOTAL_80C_QUAL,TOTAL_80C_TOTAL FROM INCOMETAX WHERE EMPID='"+id+"'"; 
		//String insDetails=null;
		
		
	    
	    ResultSet rs5 = null;
	    
	    try {
			Connection con5 = GetConnection.getConnection();
			Statement st5 = con5.createStatement();

			rs5 = st5.executeQuery(sql4);
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
			if (rs5.next()) {

				LIP = rs5.getFloat("LIP");
				PPF=rs5.getFloat("PPF");
				NSS = rs5.getFloat("NSS");
				NSC = rs5.getFloat("NSC");
				GOVT = rs5.getFloat("GOVT");
				
				LIC= rs5.getFloat("LIC");
				ELSS= rs5.getFloat("ELSS");
				NPF= rs5.getFloat("NPF");
				DSNHB= rs5.getFloat("DSNHB");
				HLR= rs5.getFloat("HLR");
				
				
				ISES= rs5.getFloat("ISES");
				IMF= rs5.getFloat("IMF");
				TFFC= rs5.getFloat("TFFC");
				LIC_JSF= rs5.getFloat("LIC_JSF");
				MCNSC= rs5.getFloat("MCNSC");
				
				
				
				MCSC= rs5.getFloat("MCSC");
				MCS= rs5.getFloat("MCS");
				MTHD= rs5.getFloat("MTHD");
				MTSD= rs5.getFloat("MTSD");
				MTSDS= rs5.getFloat("MTSDS");
				TOTAL_80C_GROSS=rs5.getFloat("TOTAL_80C_GROSS");
				
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
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(ins_qual);
		return ins_qual;
		
	}


	/*public static ArrayList<String> getbutot() throws SQLException {
		ArrayList<String> finaldata = new ArrayList<String>();
		
		Map session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		System.out.println("id from login=========="+id);
		
		String sql6 = "select TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80C_ACTUAL_AMOUNT,TOTAL_80_PROPOSED_AMOUNT,TOTAL_80_ACTUAL_AMOUNT from EMP_INVESTMENT_DECLARATION WHERE EMP_ID='"+id+"'";
		//String sql6 = "select TOTAL_80C_PROPOSED_AMOUNT,TOTAL_80C_ACTUAL_AMOUNT,TOTAL_80_PROPOSED_AMOUNT,TOTAL_80_ACTUAL_AMOUNT from INCOMETAX WHERE EMPID='CSSE150051'";
		//String empbutom = null;
		
	    
	    ResultSet rst6 = null;
	    
	    try {
			Connection con6 = GetConnection.getConnection();
			Statement stmt6 = con6.createStatement();

			rst6 = stmt6.executeQuery(sql6);

			String tot1 = "";
			String tot2 = "";
			String tot3 = "";
			String tot4 = "";
			String tot6= "";
			String tot7= "";
			while (rst6.next()) {

				tot1 = rst6.getString("TOTAL_80C_PROPOSED_AMOUNT");
				tot3 = rst6.getString("TOTAL_80_PROPOSED_AMOUNT");
				tot6=String.valueOf(Integer.parseInt(tot1)+Integer.parseInt(tot3));
				
				tot2 = rst6.getString("TOTAL_80C_ACTUAL_AMOUNT");
				tot4 = rst6.getString("TOTAL_80_ACTUAL_AMOUNT");
				tot7=String.valueOf(Integer.parseInt(tot2)+Integer.parseInt(tot4));
				
				
				//empbutom = tot6 + "^" + tot7;
				finaldata.add(tot6);
				finaldata.add(tot7);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println( "TOTAL DECLARATION PAGE DETAILS"+finaldata);
		return finaldata;
	}

*/



public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			getBasicInfo();
			//getactual();
			//investment();
			//invest();
			//investment_tot();
			//investment_qual();
			//IncometaxAction.getbutot();
			//choicepay_columns();
			//choicepay_data();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}








