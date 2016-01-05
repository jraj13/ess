
package com.ess.common.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class PayslipFilter {
	
	
	public static String payslipRandomColumn() throws SQLException
	{
		System.out.println("payslipRandomColumn");
		//ArrayList<String> deductlist=new ArrayList<String>();
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		
		Calendar aCalendar = Calendar.getInstance();
		aCalendar.set(Calendar.DATE, 1);
		aCalendar.add(Calendar.DAY_OF_MONTH, -1);
		Date lastDateOfPreviousMonth = (Date) aCalendar.getTime();
		
		System.out.println("last day of month"+lastDateOfPreviousMonth);
		aCalendar.set(Calendar.DATE, 1);
		//Date firstDateOfPreviousMonth = (Date) aCalendar.getTime();
		
		
		String[] date11=lastDateOfPreviousMonth.toString().split(" ");
		System.out.println("day=="+date11[0]);
		System.out.println("month=="+date11[1].toUpperCase());
		System.out.println("lastday=="+date11[2]);
		System.out.println("year=="+date11[5]);
		
		
	String pay="select PF,ESI,GRATUTY,PROF_TAX,INCOMETAX_PAY from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+date11[1].toUpperCase()+"' and to_char(DATE_TIME,'YYYY')='"+date11[5]+"' and empid='"+id+"'";
			 


	//String query="select PF,ESI,GRATUTY,PROF_TAX,INCOMETAX_PAY from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+month+"' and to_char(DATE_TIME,'YYYY')='"+year+"' and empid='"+id+"'";
	System.out.println(pay);
	String deductionDetails=null;
	
	Connection con;
	ResultSet rs=null;
	//String deductionDetails="";
	try {
		con = GetConnection.getConnection();
		Statement st= con.createStatement();
		
		float pf_val=0.0f;
		float gratuity_val=0.0f;
		float esi_val=0.0f;
		float incometax_val=0.0f;
		float proftax_val=0.0f;
		rs=st.executeQuery(pay);
		
		
		String colm1="&nbsp;";
		String colm2="&nbsp;";
		String colm3="&nbsp;";
		String colm4="&nbsp;";
		String colm5="&nbsp;";
		
		
		while(rs.next())
		{
			pf_val=rs.getFloat("PF");
			System.out.println(pf_val);
			gratuity_val=rs.getFloat("GRATUTY");
			esi_val=rs.getFloat("ESI");
			incometax_val=rs.getFloat("INCOMETAX_PAY");
			proftax_val=rs.getFloat("PROF_TAX");
			
			if(pf_val>0.0f)
			{
				colm1="PF";
				
			}
			
			if(gratuity_val>0.0f)
			{
				
				colm2="GRATUITY";
			
			}
			if(esi_val>0.0f)
			{
				colm3="ESI";
				
				
			}
			if(incometax_val>0.0f)
			{
				colm4="INCOMETAX PAY";
				
				
			}
			if(proftax_val>0.0f)
			{
				colm5="PROF TAX";
				
			}
			
			 deductionDetails=colm1 +"^"+  colm2  +"^"+ colm3  +"^"+ colm4  +"^"+  colm5;
			
			
			
			System.out.println("deductlist in pay slip labels.."+deductionDetails);
		}
		
		
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return deductionDetails;
	}

	
	
	public static String payslipRandomValue() throws SQLException
	{
		System.out.println("payslipRandomValue");
		//ArrayList<String> deductlist=new ArrayList<String>();
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		
		Calendar aCalendar = Calendar.getInstance();
		aCalendar.set(Calendar.DATE, 1);
		aCalendar.add(Calendar.DAY_OF_MONTH, -1);
		Date lastDateOfPreviousMonth = (Date) aCalendar.getTime();
		
		System.out.println("last day of month"+lastDateOfPreviousMonth);
		aCalendar.set(Calendar.DATE, 1);
		//Date firstDateOfPreviousMonth = (Date) aCalendar.getTime();
		
		
		String[] date11=lastDateOfPreviousMonth.toString().split(" ");
		System.out.println("day=="+date11[0]);
		System.out.println("month=="+date11[1].toUpperCase());
		System.out.println("lastday=="+date11[2]);
		System.out.println("year=="+date11[5]);
		
		
	String pay="select PF,ESI,GRATUTY,PROF_TAX,INCOMETAX_PAY from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+date11[1].toUpperCase()+"' and to_char(DATE_TIME,'YYYY')='"+date11[5]+"' and empid='"+id+"'";
			 


	//String query="select PF,ESI,GRATUTY,PROF_TAX,INCOMETAX_PAY from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+month+"' and to_char(DATE_TIME,'YYYY')='"+year+"' and empid='"+id+"'";
	System.out.println(pay);
	String data=null;
	
	Connection con;
	ResultSet rs=null;
	//String deductionDetails="";
	try {
		con = GetConnection.getConnection();
		Statement st= con.createStatement();
		
		float pf_val=0.0f;
		float gratuity_val=0.0f;
		float esi_val=0.0f;
		float incometax_val=0.0f;
		float proftax_val=0.0f;
		
		String pf_val1="&nbsp;";
		String gratuity_val1="&nbsp;";
		String esi_val1="&nbsp;";
		String incometax_val1="&nbsp;";
		String proftax_val1="&nbsp;";
		
		rs=st.executeQuery(pay);
		
		while(rs.next())
		{
			pf_val=rs.getFloat("PF");
			System.out.println(pf_val);
			gratuity_val=rs.getFloat("GRATUTY");
			esi_val=rs.getFloat("ESI");
			incometax_val=rs.getFloat("INCOMETAX_PAY");
			proftax_val=rs.getFloat("PROF_TAX");
			
			
			if(pf_val>0.0f)
			{
				pf_val1 = Float.toString(pf_val); 
				
			}
			
			if(gratuity_val>0.0f)
			{
				gratuity_val1 = Float.toString(gratuity_val); 
			}
			if(esi_val>0.0f)
			{
				esi_val1 = Float.toString(esi_val); 
			}
			if(incometax_val>0.0f)
			{
				incometax_val1 = Float.toString(incometax_val); 
			}
			if(proftax_val>0.0f)
			{
				proftax_val1 = Float.toString(proftax_val); 
			}
			
			
			 data=pf_val1+"^"+gratuity_val1+"^"+esi_val1+"^"+incometax_val1+"^"+proftax_val1;
			
					//deductlist.add(data);
			
			System.out.println("data in payslip data.."+data);
		}
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return data;
	}

	
	
	
	/* DATA WILL FETCH ON MONTHLY BASIS  */
	
	/*Map session = ActionContext.getContext().getSession();
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
	*/
	
	
	public static String payslipRandomColumn2() throws SQLException
	{
		System.out.println("payslipRandomColumn2");
		//ArrayList<String> deductlist=new ArrayList<String>();
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String month = request.getParameter("month");
		String year = request.getParameter("year");

		System.out.println("from jquery month payslip random=====" + month);
		System.out.println("from jquery year payslip random=====" + year);
		
	String pay="select PF,ESI,GRATUTY,PROF_TAX,INCOMETAX_PAY from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+month+"' and to_char(DATE_TIME,'YYYY')='"+year+"' and empid='"+id+"'";
			 


	//String query="select PF,ESI,GRATUTY,PROF_TAX,INCOMETAX_PAY from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+month+"' and to_char(DATE_TIME,'YYYY')='"+year+"' and empid='"+id+"'";
	System.out.println("payslipRandomColumn2 query.."+pay);
	String deductionDetails=null;
	
	Connection con;
	ResultSet rs=null;
	//String deductionDetails="";
	try {
		con = GetConnection.getConnection();
		Statement st= con.createStatement();
		
		float pf_val=0.0f;
		float gratuity_val=0.0f;
		float esi_val=0.0f;
		float incometax_val=0.0f;
		float proftax_val=0.0f;
		rs=st.executeQuery(pay);
		
		
		String colm1="&nbsp;";
		String colm2="&nbsp;";
		String colm3="&nbsp;";
		String colm4="&nbsp;";
		String colm5="&nbsp;";
		
		
		while(rs.next())
		{
			pf_val=rs.getFloat("PF");
			System.out.println(pf_val);
			gratuity_val=rs.getFloat("GRATUTY");
			esi_val=rs.getFloat("ESI");
			incometax_val=rs.getFloat("INCOMETAX_PAY");
			proftax_val=rs.getFloat("PROF_TAX");
			
			if(pf_val>0.0f)
			{
				colm1="PF";
			}
			
			if(gratuity_val>0.0f)
			{
				
				colm2="GRATUITY";
			
			}
			if(esi_val>0.0f)
			{
				colm3="ESI";
				
				
			}
			if(incometax_val>0.0f)
			{
				colm4="INCOMETAX PAY";
				
				
			}
			if(proftax_val>0.0f)
			{
				colm5="PROF TAX";
				
			}
			
			 deductionDetails=colm1 +"^"+  colm2  +"^"+ colm3  +"^"+ colm4  +"^"+  colm5;
			
			
			
			System.out.println("deductlist in pay slip labels.."+deductionDetails);
		}
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return deductionDetails;
	}

	
	
	public static String payslipRandomValue2() throws SQLException
	{
		System.out.println("payslipRandomValue2");
		//ArrayList<String> deductlist=new ArrayList<String>();
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");

		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String month = request.getParameter("month");
		String year = request.getParameter("year");

		System.out.println("from jquery month payslip random=====" + month);
		System.out.println("from jquery year payslip random=====" + year);
		
	String pay="select PF,ESI,GRATUTY,PROF_TAX,INCOMETAX_PAY from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+month+"' and to_char(DATE_TIME,'YYYY')='"+year+"' and empid='"+id+"'";

	//String query="select PF,ESI,GRATUTY,PROF_TAX,INCOMETAX_PAY from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+month+"' and to_char(DATE_TIME,'YYYY')='"+year+"' and empid='"+id+"'";
	System.out.println(pay);
	String data=null;
	
	Connection con;
	ResultSet rs=null;
	//String deductionDetails="";
	try {
		con = GetConnection.getConnection();
		Statement st= con.createStatement();
		
		float pf_val=0.0f;
		float gratuity_val=0.0f;
		float esi_val=0.0f;
		float incometax_val=0.0f;
		float proftax_val=0.0f;
		
		String pf_val1="&nbsp;";
		String gratuity_val1="&nbsp;";
		String esi_val1="&nbsp;";
		String incometax_val1="&nbsp;";
		String proftax_val1="&nbsp;";
		
		rs=st.executeQuery(pay);
		
		while(rs.next())
		{
			pf_val=rs.getFloat("PF");
			System.out.println(pf_val);
			gratuity_val=rs.getFloat("GRATUTY");
			esi_val=rs.getFloat("ESI");
			incometax_val=rs.getFloat("INCOMETAX_PAY");
			proftax_val=rs.getFloat("PROF_TAX");
			
			
			if(pf_val>0.0f)
			{
				pf_val1 = Float.toString(pf_val); 
				
			}
			
			if(gratuity_val>0.0f)
			{
				gratuity_val1 = Float.toString(gratuity_val); 
			}
			if(esi_val>0.0f)
			{
				esi_val1 = Float.toString(esi_val); 
			}
			if(incometax_val>0.0f)
			{
				incometax_val1 = Float.toString(incometax_val); 
			}
			if(proftax_val>0.0f)
			{
				proftax_val1 = Float.toString(proftax_val); 
			}
			
			
			 data=pf_val1+"^"+gratuity_val1+"^"+esi_val1+"^"+incometax_val1+"^"+proftax_val1;
			
					//deductlist.add(data);
			
			System.out.println("data in payslip data.."+data);
		}
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return data;
	}

	
	
	
	
	public static void main(String args[]) throws SQLException
	{
		PayslipFilter.payslipRandomColumn();
		
	}
	
	
}
















/*package com.ess.common.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;



import com.dao.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class PayslipFilter {
	
	
	public static ArrayList<String> payslipRandomColumn() throws SQLException
	{
		System.out.println("payslipRandomSelect");
		ArrayList<String> deductlist=new ArrayList<String>();
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		
		Calendar aCalendar = Calendar.getInstance();
		aCalendar.set(Calendar.DATE, 1);
		aCalendar.add(Calendar.DAY_OF_MONTH, -1);
		Date lastDateOfPreviousMonth = (Date) aCalendar.getTime();
		
		System.out.println("last day of month"+lastDateOfPreviousMonth);
		aCalendar.set(Calendar.DATE, 1);
		//Date firstDateOfPreviousMonth = (Date) aCalendar.getTime();
		
		
		String[] date11=lastDateOfPreviousMonth.toString().split(" ");
		System.out.println("day=="+date11[0]);
		System.out.println("month=="+date11[1].toUpperCase());
		System.out.println("lastday=="+date11[2]);
		System.out.println("year=="+date11[5]);
		
		
	String pay="select PF,ESI,GRATUTY,PROF_TAX,INCOMETAX_PAY from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+date11[1].toUpperCase()+"' and to_char(DATE_TIME,'YYYY')='"+date11[5]+"' and empid='"+id+"'";
			 


	//String query="select PF,ESI,GRATUTY,PROF_TAX,INCOMETAX_PAY from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+month+"' and to_char(DATE_TIME,'YYYY')='"+year+"' and empid='"+id+"'";
	System.out.println(pay);
	
	
	Connection con;
	ResultSet rs=null;
	//String deductionDetails="";
	try {
		con = GetConnection.getConnection();
		Statement st= con.createStatement();
		
		float pf_val=0.0f;
		float gratuity_val=0.0f;
		float esi_val=0.0f;
		float incometax_val=0.0f;
		float proftax_val=0.0f;
		rs=st.executeQuery(pay);
		
		while(rs.next())
		{
			pf_val=rs.getFloat("PF");
			System.out.println(pf_val);
			gratuity_val=rs.getFloat("GRATUTY");
			esi_val=rs.getFloat("ESI");
			incometax_val=rs.getFloat("INCOMETAX_PAY");
			proftax_val=rs.getFloat("PROF_TAX");
			
			if(pf_val>0.0f)
			{
				deductlist.add("PF");
				//deductlist.add("pf_val");
				
			}
			
			if(gratuity_val>0.0f)
			{
				deductlist.add("GRATUITY");
				//deductlist.add("gratuity_val");
			}
			if(esi_val>0.0f)
			{
				deductlist.add("ESI");
				deductlist.add(" &nbsp;");
				deductlist.add(" &nbsp;");
				deductlist.add(" &nbsp;");
				//deductlist.add("esi_val");
			}
			if(incometax_val>0.0f)
			{
				deductlist.add("INCOMETAX PAY");
				//deductlist.add("incometax_val");
			}
			if(proftax_val>0.0f)
			{
				deductlist.add("PROF TAX");
				deductlist.add(" &nbsp;");
				deductlist.add(" &nbsp;");
				//deductlist.add("proftax_val");
			}
			
			//deductionDetails=pf_val +"^"+  gratuity_val  +"^"+ esi_val  +"^"+ incometax_val  +"^"+  proftax_val;
			
			//deductlist.add(deductionDetails);
			
			
			System.out.println("deductlist.."+deductlist);
		}
		
		
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return deductlist;
	}

	
	
	public static ArrayList<String> payslipRandomValue() throws SQLException
	{
		System.out.println("payslipRandomSelect");
		ArrayList<String> deductlist=new ArrayList<String>();
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		String id=(String)session.get("empid");
		
		Calendar aCalendar = Calendar.getInstance();
		aCalendar.set(Calendar.DATE, 1);
		aCalendar.add(Calendar.DAY_OF_MONTH, -1);
		Date lastDateOfPreviousMonth = (Date) aCalendar.getTime();
		
		System.out.println("last day of month"+lastDateOfPreviousMonth);
		aCalendar.set(Calendar.DATE, 1);
		//Date firstDateOfPreviousMonth = (Date) aCalendar.getTime();
		
		
		String[] date11=lastDateOfPreviousMonth.toString().split(" ");
		System.out.println("day=="+date11[0]);
		System.out.println("month=="+date11[1].toUpperCase());
		System.out.println("lastday=="+date11[2]);
		System.out.println("year=="+date11[5]);
		
		
	String pay="select PF,ESI,GRATUTY,PROF_TAX,INCOMETAX_PAY from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+date11[1].toUpperCase()+"' and to_char(DATE_TIME,'YYYY')='"+date11[5]+"' and empid='"+id+"'";
			 


	//String query="select PF,ESI,GRATUTY,PROF_TAX,INCOMETAX_PAY from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+month+"' and to_char(DATE_TIME,'YYYY')='"+year+"' and empid='"+id+"'";
	System.out.println(pay);
	
	
	Connection con;
	ResultSet rs=null;
	//String deductionDetails="";
	try {
		con = GetConnection.getConnection();
		Statement st= con.createStatement();
		
		float pf_val=0.0f;
		float gratuity_val=0.0f;
		float esi_val=0.0f;
		float incometax_val=0.0f;
		float proftax_val=0.0f;
		
		String pf_val1="";
		String gratuity_val1="";
		String esi_val1="";
		String incometax_val1="";
		String proftax_val1="";
		
		rs=st.executeQuery(pay);
		
		while(rs.next())
		{
			pf_val=rs.getFloat("PF");
			System.out.println(pf_val);
			gratuity_val=rs.getFloat("GRATUTY");
			esi_val=rs.getFloat("ESI");
			incometax_val=rs.getFloat("INCOMETAX_PAY");
			proftax_val=rs.getFloat("PROF_TAX");
			
			
			if(pf_val>0.0f)
			{
				pf_val1 = Float.toString(pf_val); 
				//deductlist.add("PF");
				
				//deductlist.add(pf_val1);
				
			}
			
			if(gratuity_val>0.0f)
			{
				gratuity_val1 = Float.toString(gratuity_val); 
				//deductlist.add("GRATUITY");
				deductlist.add(gratuity_val1);
			}
			if(esi_val>0.0f)
			{
				esi_val1 = Float.toString(esi_val); 
				//deductlist.add("ESI");
				deductlist.add(esi_val1);
				deductlist.add(" &nbsp;");
				deductlist.add(" &nbsp;");
				deductlist.add(" &nbsp;");
			}
			if(incometax_val>0.0f)
			{
				incometax_val1 = Float.toString(incometax_val); 
				//deductlist.add("INCOMETAX PAY");
				deductlist.add(incometax_val1);
			}
			if(proftax_val>0.0f)
			{
				proftax_val1 = Float.toString(proftax_val); 
				//deductlist.add("PROF TAX");
				deductlist.add(proftax_val1);
				deductlist.add(" &nbsp;");
				deductlist.add(" &nbsp;");
			}
			
			
			
			//deductionDetails=pf_val +"^"+  gratuity_val  +"^"+ esi_val  +"^"+ incometax_val  +"^"+  proftax_val;
			
			//deductlist.add(deductionDetails);
			
			
			System.out.println("deductlist.."+deductlist);
		}
		
		
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return deductlist;
	}

	
	public static void main(String args[]) throws SQLException
	{
		PayslipFilter.payslipRandomColumn();
		
	}
	
	
}
*/