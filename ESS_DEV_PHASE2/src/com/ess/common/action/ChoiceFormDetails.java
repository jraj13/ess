package com.ess.common.action;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.apache.struts2.ServletActionContext;

import com.ess.common.bean.PersonalDetailsBean;
import com.ess.common.util.MyDataSource;
import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class ChoiceFormDetails {

	private double ctc;
	private double basic;
	private double basepay;
	//private double pli = 0;
	private double choicepay;
	private double acp, fuel;
	private double hra, lta, ernps;
	private double value;
	private double hra_value;
	private double lta_value;
	private double basic_value;
	private double basepay_value;
	private double fuel_value;
	
	private double pf;
	private double pf_value;
	private double gratuity;
	private double gratuity_value;
	private double conveyance;
	private double conveyance_value;
	private double medical;
	private double spa;
	private double spa_value;
	private double advbonus;
	private double tmd;
	
	private double pli;
	private double pli_value;
	
	private double overallctc;
	private double totalbasepay;
	private double totalbasepay_value;
	private double totherchoicitems;
	private double totalchoicepay;
	private double totalctc;
	private double medical_value;
	

	private double ernps_new;

	private String finalString = "";

	ArrayList<PersonalDetailsBean> list = new ArrayList<PersonalDetailsBean>();

	public String getChoiceFormDetails() {

		try {

			DataSource dataSource = MyDataSource.getInstance();
			Connection conn = GetConnection.getConnection();

			Map session = ActionContext.getContext().getSession();
			// Map session =(Map) ActionContext.getContext().get("session");

			System.out.println("map session......." + session);
			Object id = session.get("loginid");
			System.out.println("id session.........." + id);
			System.out.println("get session......" + session.get("loginid"));

			String RolebasedQuery = "SELECT * FROM NCSS_EMP_MASTER_INFO where emp_mailid='"+ id + "'";

			Statement pst = conn.createStatement();

			ResultSet rs = pst.executeQuery(RolebasedQuery);

			if (rs.next()) {

				PersonalDetailsBean personalBean = new PersonalDetailsBean();

				personalBean.setTotal_CTC(rs.getString(12));

				String ct = rs.getString(12);
				Object ctssession=session.put("ctcsession",rs.getString(12));
				System.out.println("ctcsession..."+ctssession);

				ctc = Double.parseDouble(ct);

				if (ctc < 250000) {

					System.out.println("you are not elegible for this");

				} else {

					DecimalFormat df = new DecimalFormat("###.##");

					basic = (ctc * 0.30);
					String basic_value1 = df.format(basic);
					basic_value = Double.parseDouble(basic_value1);

					basepay = ((ctc * 0.30) + (basic * 0.24) + (ctc * 0.048));
					String basepay_value1 = df.format(basepay);
					basepay_value = Double.parseDouble(basepay_value1);
					
					choicepay = (ctc * 0.50);
					String choicepay1 = df.format(choicepay);
					value = Double.parseDouble(choicepay1);

					acp = value;

					fuel = (ctc * 0.25);
					fuel_value =(Math.ceil(fuel));
					//String fuel_value1 =df.format(fuel);
					//fuel_value = Double.parseDouble(fuel_value1);
					
					hra = (basic * 0.40);
					//String hra_value1 = df.format(choicepay);
					//hra_value = Double.parseDouble(hra_value1);
					hra_value =(Math.ceil(hra));
					
					/*lta = 2*(basic/12);
					//double lta_value1 = df.format(lta);
					lta_value =(Math.ceil(lta));*/
					
					lta=(basic*.833);
					/*double lta_value1 = df.format(lta);*/
					lta_value =(Math.ceil(lta));
					
					ernps = (basic * 0.10);
					//String ernps_old = df.format(ernps);
							
					ernps_new =(Math.ceil(ernps));
					
					
					pf=(basic*0.12);
					String pf1 = df.format(pf);
					pf_value = Double.parseDouble(pf1);
					
					gratuity=(basic*0.048);
					String grauity1 = df.format(gratuity);
					gratuity_value = Double.parseDouble(grauity1);
					
					/*((ctc * 0.30) + (ctc * 0) + (ctc * 0.048));*/
					totalbasepay = ((basic_value) +(pf_value)+(gratuity_value));
					String totalbasepay1 = df.format(totalbasepay);
					totalbasepay_value = Double.parseDouble(totalbasepay1);
					System.out.print("totalbase_pay .."+totalbasepay_value);
					
					conveyance=1600;
					advbonus=5000;
					tmd=(advbonus);
					
					String pli1 = df.format(pli);
					pli_value = Double.parseDouble(pli1);
					
					medical=(1250*12);
					String medical1 = df.format(medical);
					medical_value = Double.parseDouble(medical1);
					
					/*spa=100000;*/
					spa=(ctc*0.34);
					String spa1 = df.format(spa);
					spa_value = Double.parseDouble(spa1);
					
					totherchoicitems=((medical)+(conveyance)+(lta_value)+(hra_value));
					
					totalchoicepay=((totherchoicitems)+(advbonus));
					
					totalctc=((totalbasepay)+(tmd)+(totherchoicitems));
					pli=(ctc*0.13);
					
					overallctc=((pli)+(totalctc));
				}

			}

			finalString = ctc + "^" + basic_value + "^" + basepay_value + "^" + acp + "^"
					+ fuel_value + "^" + hra_value + "^" + lta_value + "^" + ernps + "^"
					+ ernps_new + "^" + pf_value + "^" + gratuity_value + "^" + totalbasepay_value+ "^"
					+ advbonus + "^" + tmd + "^" + medical_value+ "^" + conveyance + "^" +  spa_value + "^" 
					+ totherchoicitems  + "^" + totalchoicepay  + "^" +totalctc + "^" + pli + "^" + overallctc ;

		} catch (Exception e) {

		}

		return finalString;

	}
	
	
	
	
/*  for ctc statement    */
	
	public String getChoiceFormDetails1() {

		System.out.println("getChoiceFormDetails1");
		try {

			DataSource dataSource = MyDataSource.getInstance();
			Connection conn = GetConnection.getConnection();

			Map session = ActionContext.getContext().getSession();
			// Map session =(Map) ActionContext.getContext().get("session");

			System.out.println("map session......." + session);
			Object id = session.get("loginid");
			System.out.println("id session.........." + id);
			System.out.println("get session......" + session.get("loginid"));

			String RolebasedQuery = "SELECT * FROM NCSS_EMP_MASTER_INFO where emp_mailid='"+ id + "'";
			/*String RolebasedQuery = "SELECT * FROM NCSS_EMP_MASTER_INFO where EMP_MAILID='"+ id + "'";*/

			Statement pst = conn.createStatement();

			ResultSet rs = pst.executeQuery(RolebasedQuery);

			if (rs.next()) {

				PersonalDetailsBean personalBean = new PersonalDetailsBean();

				personalBean.setTotal_CTC(rs.getString(12));
				

				String ct = rs.getString(12);
			//	Object ctssession=session.put("ctcsession",rs.getString(9));

				ctc = Double.parseDouble(ct);

				if (ctc < 50000) {

					System.out.println("you are not elegible for this");

				} else {

					DecimalFormat df = new DecimalFormat("###.##");

					basic = (ctc * 0.30);
					String basic_value1 = df.format(basic);
					basic_value = Double.parseDouble(basic_value1);
					System.out.println("basic_value.."+basic_value);

					basepay = ((ctc * 0.30) + (basic * 0.24) + (ctc * 0.048));
					String basepay_value1 = df.format(basepay);
					basepay_value = Double.parseDouble(basepay_value1);
					
					choicepay = (ctc * 0.50);
					String choicepay1 = df.format(choicepay);
					value = Double.parseDouble(choicepay1);

					acp = value;

					fuel = (ctc * 0.25);
					fuel_value =(Math.ceil(fuel));
					//String fuel_value1 =df.format(fuel);
					//fuel_value = Double.parseDouble(fuel_value1);
					
					//hra = (basic * 0.50);
					//String hra_value1 = df.format(choicepay);
					//hra_value = Double.parseDouble(hra_value1);
					//hra_value =(Math.ceil(hra));
					hra = (basic * 0.40);
					System.out.println("hra..."+hra);
					String hra1 = df.format(hra);
					hra_value = Double.parseDouble(hra1);
					System.out.println("hra_value..."+hra_value);
					
					/*lta = 2*(basic/12);
					//double lta_value1 = df.format(lta);
					lta_value =(Math.ceil(lta));*/
					
					lta=(basic*8.33)/100;
					System.out.println("lta..."+lta);
					String lta1 = df.format(lta);
					lta_value = Double.parseDouble(lta1);
					System.out.println("lta_value..."+lta_value);
					
					//lta_value =(Math.ceil(lta));
					
					ernps = (basic * 0.10);
					//String ernps_old = df.format(ernps);
							
					ernps_new =(Math.ceil(ernps));
					
					
					pf=(basic*0.12);
					String pf1 = df.format(pf);
					pf_value = Double.parseDouble(pf1);
					
					gratuity=(basic*0.048);
					String grauity1 = df.format(gratuity);
					gratuity_value = Double.parseDouble(grauity1);
					
					conveyance=(1600*12);
					System.out.println("conveyance..."+conveyance);
					String conveyance1 = df.format(conveyance);
					conveyance_value = Double.parseDouble(conveyance1);
					System.out.println("conveyance_value..."+conveyance_value);
					
					advbonus=0.0;
					tmd=(advbonus);
					
					String pli1 = df.format(pli);
					pli_value = Double.parseDouble(pli1);
					
					medical=(1250*12);
					String medical1 = df.format(medical);
					medical_value = Double.parseDouble(medical1);
					
					
					/*((ctc * 0.30) + (ctc * 0) + (ctc * 0.048));*/
					totalbasepay = ((basic_value) +(pf_value)+(gratuity_value));
					String totalbasepay1 = df.format(totalbasepay);
					totalbasepay_value = Double.parseDouble(totalbasepay1);
					System.out.print("totalbase_pay .."+totalbasepay_value);
					
					//spa=100000;
					
					spa=((ctc)-((basic_value)+(hra_value)+(conveyance_value)+(lta_value)+(medical_value))-(pf_value));
					System.out.println("spa..."+spa);
					String spa1 = df.format(spa);
					spa_value = Double.parseDouble(spa1);
					System.out.println("spa_value..."+spa_value);
					
					totherchoicitems=((medical)+(conveyance)+(lta_value)+(hra_value)+(spa_value));
					
					totalchoicepay=((totherchoicitems)+(advbonus));
					
					totalctc=((totalbasepay)+(tmd)+(totherchoicitems));
					pli=(ctc*0.13);
					
					overallctc=((pli)+(totalctc));
				}

			}

			finalString = ctc + "^" + basic_value + "^" + basepay_value + "^" + acp + "^"
					+ fuel_value + "^" + hra_value + "^" + lta_value + "^" + ernps + "^"
					+ ernps_new + "^" + pf_value + "^" + gratuity_value + "^" + totalbasepay_value+ "^"
					+ advbonus + "^" + tmd + "^" + medical_value+ "^" + conveyance_value + "^" +  spa_value + "^" 
					+ totherchoicitems  + "^" + totalchoicepay  + "^" +totalctc + "^" + pli + "^" + overallctc ;


		} catch (Exception e) {

		}

		return finalString;

	}
	
	
	
/*  for ctc statement  generated by ADMIN  */
	
	public String getCtcStatementGenerated() {

		System.out.println("getCtcStatementGenerated");
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String empid = request.getParameter("empid");
		System.out.println("empid.."+empid);
		
		
		try {

			DataSource dataSource = MyDataSource.getInstance();
			Connection conn = GetConnection.getConnection();

			String RolebasedQuery = "SELECT * FROM NCSS_EMP_MASTER_INFO where emp_id='"+ empid + "'";
			/*String RolebasedQuery = "SELECT * FROM NCSS_EMP_MASTER_INFO where EMP_MAILID='"+ id + "'";*/

			Statement pst = conn.createStatement();

			ResultSet rs = pst.executeQuery(RolebasedQuery);

			if (rs.next()) {

				PersonalDetailsBean personalBean = new PersonalDetailsBean();

				personalBean.setTotal_CTC(rs.getString(12));
				

				String ct = rs.getString(12);
			//	Object ctssession=session.put("ctcsession",rs.getString(9));

				ctc = Double.parseDouble(ct);

				if (ctc < 50000) {

					System.out.println("you are not elegible for this");

				} else {

					DecimalFormat df = new DecimalFormat("###.##");

					basic = (ctc * 0.30);
					String basic_value1 = df.format(basic);
					basic_value = Double.parseDouble(basic_value1);
					System.out.println("basic_value.."+basic_value);

					basepay = ((ctc * 0.30) + (basic * 0.24) + (ctc * 0.048));
					String basepay_value1 = df.format(basepay);
					basepay_value = Double.parseDouble(basepay_value1);
					
					choicepay = (ctc * 0.50);
					String choicepay1 = df.format(choicepay);
					value = Double.parseDouble(choicepay1);

					acp = value;

					fuel = (ctc * 0.25);
					fuel_value =(Math.ceil(fuel));
					//String fuel_value1 =df.format(fuel);
					//fuel_value = Double.parseDouble(fuel_value1);
					
					//hra = (basic * 0.50);
					//String hra_value1 = df.format(choicepay);
					//hra_value = Double.parseDouble(hra_value1);
					//hra_value =(Math.ceil(hra));
					hra = (basic * 0.40);
					System.out.println("hra..."+hra);
					String hra1 = df.format(hra);
					hra_value = Double.parseDouble(hra1);
					System.out.println("hra_value..."+hra_value);
					
					/*lta = 2*(basic/12);
					//double lta_value1 = df.format(lta);
					lta_value =(Math.ceil(lta));*/
					
					lta=(basic*8.33)/100;
					System.out.println("lta..."+lta);
					String lta1 = df.format(lta);
					lta_value = Double.parseDouble(lta1);
					System.out.println("lta_value..."+lta_value);
					
					//lta_value =(Math.ceil(lta));
					
					ernps = (basic * 0.10);
					//String ernps_old = df.format(ernps);
							
					ernps_new =(Math.ceil(ernps));
					
					
					pf=(basic*0.12);
					String pf1 = df.format(pf);
					pf_value = Double.parseDouble(pf1);
					
					gratuity=(basic*0.048);
					String grauity1 = df.format(gratuity);
					gratuity_value = Double.parseDouble(grauity1);
					
					conveyance=(1600*12);
					System.out.println("conveyance..."+conveyance);
					String conveyance1 = df.format(conveyance);
					conveyance_value = Double.parseDouble(conveyance1);
					System.out.println("conveyance_value..."+conveyance_value);
					
					advbonus=0.0;
					tmd=(advbonus);
					
					String pli1 = df.format(pli);
					pli_value = Double.parseDouble(pli1);
					
					medical=(1250*12);
					String medical1 = df.format(medical);
					medical_value = Double.parseDouble(medical1);
					
					
					/*((ctc * 0.30) + (ctc * 0) + (ctc * 0.048));*/
					totalbasepay = ((basic_value) +(pf_value)+(gratuity_value));
					String totalbasepay1 = df.format(totalbasepay);
					totalbasepay_value = Double.parseDouble(totalbasepay1);
					System.out.print("totalbase_pay .."+totalbasepay_value);
					
					//spa=100000;
					
					spa=((ctc)-((basic_value)+(hra_value)+(conveyance_value)+(lta_value)+(medical_value))-(pf_value));
					System.out.println("spa..."+spa);
					String spa1 = df.format(spa);
					spa_value = Double.parseDouble(spa1);
					System.out.println("spa_value..."+spa_value);
					
					totherchoicitems=((medical)+(conveyance)+(lta_value)+(hra_value)+(spa_value));
					
					totalchoicepay=((totherchoicitems)+(advbonus));
					
					totalctc=((totalbasepay)+(tmd)+(totherchoicitems));
					pli=(ctc*0.13);
					
					overallctc=((pli)+(totalctc));
				}

			}

			finalString = ctc + "^" + basic_value + "^" + basepay_value + "^" + acp + "^"
					+ fuel_value + "^" + hra_value + "^" + lta_value + "^" + ernps + "^"
					+ ernps_new + "^" + pf_value + "^" + gratuity_value + "^" + totalbasepay_value+ "^"
					+ advbonus + "^" + tmd + "^" + medical_value+ "^" + conveyance_value + "^" +  spa_value + "^" 
					+ totherchoicitems  + "^" + totalchoicepay  + "^" +totalctc + "^" + pli + "^" + overallctc ;


		} catch (Exception e) {

		}

		return finalString;

	}
	
	
	/*  End for ctc statement  generated by ADMIN  */	
	

	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	public String admin_emp_investment_report()
	{
		return "success";
		
	}
	
	public String admin_emp_choicepay_report()
	{
		return "success";
		
	}

	
	
	public String investmentExport()
	{
		Map session = ActionContext.getContext().getSession();
		
		session.put("file", "Excel");
		return "success";
		
	}
	
	public String choicepayExport()
	{
		Map session = ActionContext.getContext().getSession();
		session.put("file", "Excel");
		return "success";
		
	}
	
	
	
	public int  isExistChoicePay(String fy_start,String fy_end,String id) throws SQLException, ParseException
	{
		System.out.println("isExistChoicePay");
		Connection con=null;
		Statement st=null;
		//ResultSet rs=null;
		ResultSet rs=null;
		int count=0;
		
		String fiscal_start="01/Apr/"+fy_start;
		String fiscal_end="31/Mar/"+fy_end;
		
		System.out.println("fiscal_start date.." + fiscal_start);
		System.out.println("fiscal_end date.." + fiscal_end);
				
		/*SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date tempDate1 =  simpleDateFormat1.parse(from_date_str);
		SimpleDateFormat outputDateFormat1 = new SimpleDateFormat("dd/MMM/yyyy");
		Object from_date = outputDateFormat1.format(tempDate1);
		System.out.println("After convert from date.." + from_date);
		
		
		SimpleDateFormat simpleDateFormat3 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date tempDate3 =  simpleDateFormat3.parse(to_date_str);
		SimpleDateFormat outputDateFormat3 = new SimpleDateFormat("dd/MMM/yyyy");
		Object to_date = outputDateFormat3.format(tempDate3);
		System.out.println("After convert to date.." + to_date);*/
		
String sqlQRY="select count(*) from EMP_DETAIL_TEMP v where v.DATE_TIME >='"+fiscal_start+"' and v.DATE_TIME<='"+fiscal_end+"' and v.EMP_ID='"+id+"' ";
		System.out.println("isExistChoicePay.."+sqlQRY);

	
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(sqlQRY);

			if(rs.next())
			{
				count=rs.getInt(1);
				System.out.println("inside if.rs=="+count);
			}
			else{
				count=0;
			}
		}catch(Exception e)
		{
			System.out.println("problem for geeting isExistChoicePay");
			e.printStackTrace();
		}
		finally{
			st.close();
			con.close();
		}
		return count;
	}

	
	// FOR INVESTMENT DECLARATION EXIST OR NOT
	
	public int  isExistInvestmentDec(String fy_start,String fy_end,String id) throws SQLException, ParseException
	{
		System.out.println("isExistInvestmentDec");
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		int count=0;
		
		String fiscal_start="01/Apr/"+fy_start;
		String fiscal_end="31/Mar/"+fy_end;
		
		System.out.println("fiscal_start date.." + fiscal_start);
		System.out.println("fiscal_end date.." + fiscal_end);
		
		
String sqlQRY="select count(*) from EMP_INVESTMENT_DECLARATION v where v.DATE_TIME >='"+fiscal_start+"' and v.DATE_TIME<='"+fiscal_end+"' and v.EMP_ID='"+id+"' ";
		System.out.println("isExistChoicePay.."+sqlQRY);
	
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(sqlQRY);

			if(rs.next())
			{
				count=rs.getInt(1);
				System.out.println("inside if.rs=="+count);
			}
			else{
				count=0;
			}
		}catch(Exception e)
		{
			System.out.println("problem for geeting isExistChoicePay");
			e.printStackTrace();
		}
		finally{
			//rs.close();
			st.close();
			con.close();
		}
		return count;
	}

	
	

}
