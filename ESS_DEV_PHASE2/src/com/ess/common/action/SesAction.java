package com.ess.common.action;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
public class SesAction extends ActionSupport implements SessionAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final String SUCCESS = "success";
	private Map<String, String> session;
	
	public Map getSession()
	  {
	    return this.session;
	  }

	  public void setSession(Map session) {
	    this.session = session;
	  }
	  
	  private String emp_search;
		private String month_each;
		private String year_each;
		
	private String fromdate;
	private String todate;
	private String month;
	
	public String getEmp_search() {
		return emp_search;
	}

	public void setEmp_search(String emp_search) {
		this.emp_search = emp_search;
	}

	public String getMonth_each() {
		return month_each;
	}

	public void setMonth_each(String month_each) {
		this.month_each = month_each;
	}

	public String getYear_each() {
		return year_each;
	}

	public void setYear_each(String year_each) {
		this.year_each = year_each;
	}
	
	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
	private String year;
	
	
	public String getFromdate() {
		return fromdate;
	}
	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	
	public String down()
	{
		 //st.setString(1, this.getFromdate().toUpperCase());
	     // st.setString(2, this.loginBean.getPassword().toUpperCase());
	      Object id=session.put("startdate",getFromdate());
	      Object id1=session.put("enddate",getTodate());
		System.out.println("startdate"+id);
		System.out.println("end date"+id1);
		
		return SUCCESS;
	}
	
	public String month()
	{
		 //st.setString(1, this.getFromdate().toUpperCase());
	     // st.setString(2, this.loginBean.getPassword().toUpperCase());
	      Object mon=session.put("month",getMonth());
	      Object yy=session.put("year",getYear());
	      
	      /*    HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);
	String month11 = request.getParameter("month11").trim();
	System.out.println("month11.../"+month11);
	
	String year11 = request.getParameter("year11");
	System.out.println("year11//"+year11);*/
	      
	      
		System.out.println("month"+mon);
		System.out.println("year"+yy);
		
		return SUCCESS;
	}
	
	
	
	public String each_emp()
	{
		
		Object download_id=session.put("reportid",getEmp_search());
		Object download_month=session.put("reportmonth",getMonth_each());
		Object download_year=session.put("reportyear",getYear_each());
		
		System.out.println("download_id"+download_id);
		System.out.println("download_month"+download_month);
		System.out.println("download_year"+download_year);
		
		
		return SUCCESS;

	}
	
	
}





















