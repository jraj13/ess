package com.ess.common.action;


import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import  com.ess.common.action.ConvertRupeesintoWords;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.opensymphony.xwork2.ActionContext;
import com.servlet.Voucher;

public class PayslipAction {
	private static final String SUCCESS = null;
	private static final String ERROR = null;

	public static ArrayList<String> payslip() throws SQLException, ParseException {
		ArrayList<String> payslipInfo = new ArrayList<String>();
		System.out.println("PayslipAction");
		
		 Map session = ActionContext.getContext().getSession();
			String id=(String)session.get("empid");
			System.out.println("id from login=========="+id);
		
			// FOR GETTING LAST DAY OF LAST MONTH
			
			Calendar aCalendar = Calendar.getInstance();
			aCalendar.set(Calendar.DATE, 1);
			aCalendar.add(Calendar.DAY_OF_MONTH, -1);
			Date lastDateOfPreviousMonth = (Date) aCalendar.getTime();
			
			System.out.println("last day of month"+lastDateOfPreviousMonth);
			aCalendar.set(Calendar.DATE, 1);
			Date firstDateOfPreviousMonth = (Date) aCalendar.getTime();
			
			String[] date11=lastDateOfPreviousMonth.toString().split(" ");
			System.out.println("day=="+date11[0]);
			System.out.println("month=="+date11[1].toUpperCase());
			System.out.println("lastday=="+date11[2]);
			System.out.println("year=="+date11[5]);
			
			
		String pay="select NAME,DESIGNATION,DEPARTMENT,LOCATION,PAN_NO,PF_NO,DOJ,BANKNAME,ACCNO,WOKK_DAYS,MONTH_DAYS,LOP,BASIC,HRA,CONVAY,LTA,MEDICAL,SPECIAL,PF,ESI,GRATUTY,TOTAL,EMPID,TOTAL_EAR,TOTAL_DED,DATE_TIME,PROF_TAX,INCOMETAX_PAY from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+date11[1].toUpperCase()+"' and to_char(DATE_TIME,'YYYY')='"+date11[5]+"' and empid='"+id+"'";
				 
		//select * from PAYSLIP_TAB WHERE to_char(DATE_TIME, 'MON')='AUG' and to_char(DATE_TIME,'YY')='15';
		String empDetails = null;
	    ResultSet rst = null;
	    
	    try {
	    	System.out.println("inside try");
			Connection con = GetConnection.getConnection();
			System.out.println("PayslipAction con..." +con);
			Statement stmt = con.createStatement();
			System.out.println("PayslipActionv QRY..."+pay);
			rst = stmt.executeQuery(pay);
			

			String EMPID = "";
			String NAME = "";
			String DESIGNATION = "";
			String DEPARTMENT = "";
			String LOCATION = "";
			
			
			String PAN_NO = "";
			String PF_NO = "";
			Date DOJ;
			String BANKNAME = "";
			String ACCNO = "";
			
			String WOKK_DAYS = "";
			String MONTH_DAYS = "";
			String LOP = "";
			String BASIC = "";
			String HRA = "";
			
			String CONVAY = "";
			String LTA = "";
			String MEDICAL = "";
			String SPECIAL = "";
			String PF = "";
			
			String ESI = "";
			String GRATUTY = "";
			String TOTAL = "";
			String TOTAL_EAR = "";
			String TOTAL_DED = "";
			
			//String monthYear="JUL-2015";
			Date monthdate;
			String inWords="";
			
			String prof_tax="";
			String incometax_pay="";
			
			if (rst.next()) {

				EMPID = rst.getString("EMPID");
				NAME = rst.getString("NAME");
				DESIGNATION = rst.getString("DESIGNATION");
				DEPARTMENT = rst.getString("DEPARTMENT");
				LOCATION = rst.getString("LOCATION");
				
				PAN_NO = rst.getString("PAN_NO");
				PF_NO = rst.getString("PF_NO");
				DOJ = rst.getDate("DOJ");
				BANKNAME = rst.getString("BANKNAME");
				ACCNO = rst.getString("ACCNO");
				
				WOKK_DAYS = rst.getString("WOKK_DAYS");
				MONTH_DAYS = rst.getString("MONTH_DAYS");
				LOP = rst.getString("LOP");
				BASIC = rst.getString("BASIC");
				HRA = rst.getString("HRA");
				
				CONVAY = rst.getString("CONVAY");
				LTA = rst.getString("LTA");
				MEDICAL = rst.getString("MEDICAL");
				SPECIAL = rst.getString("SPECIAL");
				PF = rst.getString("PF");
				
				ESI = rst.getString("ESI");
				GRATUTY = rst.getString("GRATUTY");
				
				TOTAL_EAR = rst.getString("TOTAL_EAR");
				TOTAL_DED = rst.getString("TOTAL_DED");
				TOTAL = rst.getString("TOTAL");
				
				
				System.out.println("total is"+TOTAL);
				
				float tot_payslip=(Float.parseFloat(TOTAL));
				
				int total_out = (int) Math.floor(tot_payslip);
					
				System.out.println("total is after applying ceil"+total_out);
				
				String to_pass=String.valueOf(total_out);
				
				
				monthdate=rst.getDate("DATE_TIME");
				
				 inWords =ConvertRupeesintoWords.NumberToWord(to_pass);
				System.out.println("inWords..."+inWords);
				
				prof_tax=rst.getString("PROF_TAX");
				incometax_pay=rst.getString("INCOMETAX_PAY");
				
				//String inWords= NumberToWord(number_str) ;
				empDetails = EMPID + "^" + NAME + "^" + DESIGNATION + "^"+ DEPARTMENT+"^"+LOCATION+"^"+
				
				PAN_NO + "^" + PF_NO + "^" + DOJ + "^"+ BANKNAME+"^"+ ACCNO +"^"+ WOKK_DAYS + "^" +
				
				 MONTH_DAYS + "^" + LOP + "^"+ BASIC+"^"+HRA+"^"+ CONVAY + "^" + LTA + "^" +
				
				 MEDICAL + "^"+ SPECIAL+"^"+PF+"^"+ ESI + "^" + GRATUTY + "^" + TOTAL_EAR + "^"+
				
				 TOTAL_DED+"^"+TOTAL +"^"+ monthdate +"^"+ inWords + "^"+ prof_tax + "^"+ incometax_pay;
				
				payslipInfo.add(empDetails);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(empDetails);
		return payslipInfo;
	}
	
	
	/*   BASED ON MONTH PAYSLIP FETCH  */
	
	public static ArrayList<String> getPayslipQuery() throws SQLException {
		System.out.println("come in getPayslipQuery");

		ArrayList<String> payslipQry = new ArrayList<String>();

		Map session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		// String id="csse150044";
		// String id1=id.substring(8);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String month = request.getParameter("month");
		String year = request.getParameter("year");

		System.out.println("from jquery month payslip=====" + month);

		System.out.println("from jquery year payslip=====" + year);

		String payQRY="select NAME,DESIGNATION,DEPARTMENT,LOCATION,PAN_NO,PF_NO,DOJ,BANKNAME,ACCNO,WOKK_DAYS,MONTH_DAYS,LOP,BASIC,HRA,CONVAY,LTA,MEDICAL,SPECIAL,PF,ESI,GRATUTY,TOTAL,EMPID,TOTAL_EAR,TOTAL_DED,DATE_TIME,PROF_TAX,INCOMETAX_PAY from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+month+"' and to_char(DATE_TIME,'YYYY')='"+year+"' and empid='"+id+"'";
		System.out.println("payQRY=payslip=================" + payQRY);
		
		// String empQRY =
		// "select * from NCSS_ATTENDANCE_QUERY WHERE  to_char(IN_DATE, 'MM')='1' and to_char(IN_DATE,'YYYY')='15'";
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();

		ResultSet rst = null;
		String payslipDetails="";

		try {

			rst = stmt.executeQuery(payQRY);
			
			String EMPID = "";
			String NAME = "";
			String DESIGNATION = "";
			String DEPARTMENT = "";
			String LOCATION = "";
			
			
			String PAN_NO = "";
			String PF_NO = "";
			Date DOJ;
			String BANKNAME = "";
			String ACCNO = "";
			
			String WOKK_DAYS = "";
			String MONTH_DAYS = "";
			String LOP = "";
			String BASIC = "";
			String HRA = "";
			
			String CONVAY = "";
			String LTA = "";
			String MEDICAL = "";
			String SPECIAL = "";
			String PF = "";
			
			String ESI = "";
			String GRATUTY = "";
			String TOTAL = "";
			String TOTAL_EAR = "";
			String TOTAL_DED = "";
			
			//String monthYear="JUL-2015";
			Date monthdate;
			String inWords="";
			
			String prof_tax="";
			String incometax_pay="";

			System.out.println("in attandace" + rst);
			while (rst.next()) {

				/*
				 * IN_DATE = rst.getDate("DATE_TIME"); DateFormat dateFormat1 =
				 * new SimpleDateFormat("dd/MMM/YYYY"); String IN_DATE1 =
				 * dateFormat1.format(IN_DATE);
				 */
				EMPID = rst.getString("EMPID");
				NAME = rst.getString("NAME");
				DESIGNATION = rst.getString("DESIGNATION");
				DEPARTMENT = rst.getString("DEPARTMENT");
				LOCATION = rst.getString("LOCATION");
				
				PAN_NO = rst.getString("PAN_NO");
				PF_NO = rst.getString("PF_NO");
				DOJ = rst.getDate("DOJ");
				BANKNAME = rst.getString("BANKNAME");
				ACCNO = rst.getString("ACCNO");
				
				
				WOKK_DAYS = rst.getString("WOKK_DAYS");
				MONTH_DAYS = rst.getString("MONTH_DAYS");
				LOP = rst.getString("LOP");
				BASIC = rst.getString("BASIC");
				HRA = rst.getString("HRA");
				
				
				CONVAY = rst.getString("CONVAY");
				LTA = rst.getString("LTA");
				MEDICAL = rst.getString("MEDICAL");
				SPECIAL = rst.getString("SPECIAL");
				PF = rst.getString("PF");
				
				ESI = rst.getString("ESI");
				GRATUTY = rst.getString("GRATUTY");
				
				TOTAL_EAR = rst.getString("TOTAL_EAR");
				TOTAL_DED = rst.getString("TOTAL_DED");
				TOTAL = rst.getString("TOTAL");

				float tot_payslip=(Float.parseFloat(TOTAL));
				
				int total_out = (int) Math.floor(tot_payslip);
					
				System.out.println("total is after applying ceil"+total_out);
				
				String to_pass=String.valueOf(total_out);
				
				
				monthdate=rst.getDate("DATE_TIME");
				
				 inWords =ConvertRupeesintoWords.NumberToWord(to_pass);
				System.out.println("inWords..."+inWords);

				/*SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			    Date tempDate=monthdate;
			    System.out.println("tempdate.."+tempDate);
			    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/YYYY");           
			    System.out.println("Output date is = "+outputDateFormat.format(tempDate));
			    Object monthdate1=outputDateFormat.format(tempDate);
					 System.out.println(" monthdate1.."+monthdate1); 
					 
				java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MMM/yyyy");
				
				String var1=df.format(monthdate1);
				String[] date=var1.split("/");
				//out.println("year======="+date[2]);
				System.out.println("day=="+date[0]);
				System.out.println("month=="+date[1]);
				System.out.println("year=="+date[2]);
				*/
				
				System.out.println("monthdate=="+monthdate);
				
				prof_tax=rst.getString("PROF_TAX");
				incometax_pay=rst.getString("INCOMETAX_PAY");
				
				
			payslipDetails = EMPID + "^" + NAME + "^" + DESIGNATION + "^"+ DEPARTMENT+"^"+LOCATION+"^"+
				PAN_NO + "^" + PF_NO + "^" + DOJ + "^"+ BANKNAME+"^"+ACCNO+"^"+
			WOKK_DAYS + "^" + MONTH_DAYS + "^" + LOP + "^"+ BASIC+"^"+HRA+"^"+
			CONVAY + "^" + LTA + "^" + MEDICAL + "^"+ SPECIAL+"^"+PF+"^"+
			ESI + "^" + GRATUTY + "^" + TOTAL_EAR + "^"+ TOTAL_DED+"^"+TOTAL +"^"+ monthdate +"^"+
			inWords + "^"+ prof_tax + "^"+ incometax_pay;
				
			//payslipQry.add(empAttendanceDetails);
				payslipQry.add(payslipDetails);

				System.out.println("RESULT"+payslipQry);
			}
		} catch (Exception ex) {

		} finally {
			con.close();

		}

		return payslipQry;

	}

	
	
	/* PAYSLIP CONFIGUERATION UPDATE METHOD */
	
	//UPDATE Employee Nominee info
	
	
			private String basic1;
			private String hra1;
			private String conv1;
			private String lta1;
			private String ma1;
			private String sp1;
			
			private String pf1;
			private String gratuity1;
			private String esi1;
			private String pli;
			
		public String getPli() {
				return pli;
			}

			public void setPli(String pli) {
				this.pli = pli;
			}
		public String getBasic1() {
				return basic1;
			}
			public void setBasic1(String basic1) {
				this.basic1 = basic1;
			}
			public String getHra1() {
				return hra1;
			}

			public void setHra1(String hra1) {
				this.hra1 = hra1;
			}

			public String getConv1() {
				return conv1;
			}
			public void setConv1(String conv1) {
				this.conv1 = conv1;
			}
			public String getLta1() {
				return lta1;
			}

			public void setLta1(String lta1) {
				this.lta1 = lta1;
			}


			public String getMa1() {
				return ma1;
			}


			public void setMa1(String ma1) {
				this.ma1 = ma1;
			}


			public String getSp1() {
				return sp1;
			}


			public void setSp1(String sp1) {
				this.sp1 = sp1;
			}


			public String getPf1() {
				return pf1;
			}


			public void setPf1(String pf1) {
				this.pf1 = pf1;
			}


			public String getGratuity1() {
				return gratuity1;
			}


			public void setGratuity1(String gratuity1) {
				this.gratuity1 = gratuity1;
			}


			public String getEsi1() {
				return esi1;
			}


			public void setEsi1(String esi1) {
				this.esi1 = esi1;
			}


			public static String getSuccess() {
				return SUCCESS;
			}


			public static String getError() {
				return ERROR;
			}

			public String payslipCofigUpdate()
					{
						System.out.println("Calling payslip config updation method");
					      //String ret = SUCCESS;
					      String ret = "success";
					      Map session = ActionContext.getContext().getSession();
							String id=(String)session.get("empid");
							System.out.println("nomini emp id.."+id);
					      try
					      {
					    	  Connection con = GetConnection.getConnection();
					    	  Statement stmt = con.createStatement();

					    	String editQRY="UPDATE CTCSTATEMENT SET BASICPAY='"+getBasic1()+"',HRA='"+getHra1()+"' ,CONVEYANCE='"+getConv1()+"',LTA='"+getLta1()+"',MEDICAL='"+getMa1()+"' ,PF='"+getPf1()+"',Gratuty='"+getGratuity1()+"' ,ESI='"+getEsi1()+"' ";
					    	System.out.println("editQRY for PAYSLIP CONFIG .."+editQRY);

					    		int rs=stmt.executeUpdate(editQRY);
					    		System.out.println("rs.."+rs);
					    		
					    		if(rs>0)
					    		{
					    			//ret = SUCCESS;	
					    			ret="success";
					    		}
					    		else
					    		{
					    			//ret=ERROR;
					    			ret="error";
					    		}
					      }
					      catch(Exception e)
					      {
					        // ret = ERROR;
					    	  ret="error";
					         e.printStackTrace();
					      }
					      return ret;
					   }
	

			
			/* PAYSLIP CONFIGURATION CLASS */
			
			public static String payslipConfig() throws SQLException {
				//ArrayList<String> ctc_values = new ArrayList<String>();
				Map session = ActionContext.getContext().getSession();
			String id=(String)session.get("empid");
				
				String getctc="select BASICPAY,HRA,PROVIDENT,GRATUTY,PLI,MEDICAL,CONVEYANCE,LTA,ESI from  ctcstatement";
				
				String insDetails=null;
				Connection conn=null;
			    ResultSet rs5 = null;
			    
			    String BASIC = "";
				String HRA = "";
				String CONVAY = "";
				String LTA = "";
				String MEDICAL = "";
				String SPECIAL = "";
				String PROVIDENT = "";
				
				String ESI = "";
				String GRATUTY = "";
				String PLI="";
			    
			    try {
			    	conn = GetConnection.getConnection();
					Statement st5 = conn.createStatement();

					rs5 = st5.executeQuery(getctc);
					if (rs5.next()) {

						BASIC = rs5.getString("BASICPAY");
						HRA=rs5.getString("HRA");
						LTA= rs5.getString("LTA");
						PROVIDENT = rs5.getString("PROVIDENT");
						GRATUTY = rs5.getString("GRATUTY");
						CONVAY= rs5.getString("CONVEYANCE");
						PLI = rs5.getString("PLI");
						MEDICAL= rs5.getString("MEDICAL");
						ESI=rs5.getString("ESI");
						
					}
			
							insDetails=BASIC+"^"+HRA+"^"+LTA+"^"+PROVIDENT+"^"+GRATUTY+"^"+CONVAY+"^"+
									PLI+"^"+MEDICAL+"^"+ESI;
					
				} catch (Exception e) {
					System.out.println("problem in getting");
					e.printStackTrace();
				}
			    finally{
			    	rs5.close();
			    	conn.close();
			    }
			    
				//System.out.println(ctc_values);
				return insDetails;
				
			}
			
/* payslip pdf print */
			
			
/* end payslip pdf print */
public static void main(String args[]){

	try {
		payslip();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

}
