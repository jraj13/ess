package com.ess.common.action;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Map;

import javax.mail.Transport;
import javax.sql.DataSource;

import com.ess.common.bean.ChoicePayBean;
import com.ess.common.bean.PersonalDetailsBean;
import com.ess.common.util.MyDataSource;
import com.opensymphony.xwork2.ActionContext;
import com.ess.common.action.MailPusherActionChoicePay;
import com.ess.util.GetConnection;
public class ChoicePayAction{
	private MailPusherAction mailpush;
public MailPusherAction getMailpush() {
		return mailpush;
	}
	public void setMailpush(MailPusherAction mailpush) {
		this.mailpush = mailpush;
	}
private ChoicePayBean choiceBean;

	
	public ChoicePayBean getChoiceBean() {
	return choiceBean;
}
public void setChoiceBean(ChoicePayBean choiceBean) {
	this.choiceBean = choiceBean;
}
	public static final String SUCCESS = "success";
	public static final String ERROR = "error";
	
	
	 private Map<String, String> session;
	 

		public Map<String, String> getSession() {
			return session;
		}
		public void setSession(Map<String, String> session) {
			this.session = session;
		}
		ArrayList<PersonalDetailsBean> list=new ArrayList<PersonalDetailsBean>();  
		
		public ArrayList<PersonalDetailsBean> getList() 
		{  System.out.println("arraylist method");
		    return list;  
		}  
		public void setList(ArrayList<PersonalDetailsBean> list)
		{  
		    this.list = list;  
		}  
		
		private double ctc;
		private double basic;
		private double basepay;
		private double pli=0;
		private double choicepay;
		private double acp,fuel;
		private double hra,lta,ernps;
		private double value;
		private double ernps_new;
		public double getErnps_new() {
			return ernps_new;
		}
		public void setErnps_new(double ernps_new) {
			this.ernps_new = ernps_new;
		}
		public double getValue() {
			return value;
		}
		public void setValue(double value) {
			this.value = value;
		}
		public double getCtc() {
			return ctc;
		}
		public void setCtc(double ctc) {
			this.ctc = ctc;
		}
		public double getBasic() {
			return basic;
		}
		public void setBasic(double basic) {
			this.basic = basic;
		}
		public double getBasepay() {
			return basepay;
		}
		public void setBasepay(double basepay) {
			this.basepay = basepay;
		}
		public double getPli() {
			return pli;
		}
		public void setPli(double pli) {
			this.pli = pli;
		}
		public double getChoicepay() {
			return choicepay;
		}
		public void setChoicepay(double choicepay) {
			this.choicepay = choicepay;
		}
		public double getAcp() {
			return acp;
		}
		public void setAcp(double acp) {
			this.acp = acp;
		}
		public double getFuel() {
			return fuel;
		}
		public void setFuel(double fuel) {
			this.fuel = fuel;
		}
		public double getHra() {
			return hra;
		}
		public void setHra(double hra) {
			this.hra = hra;
		}
		public double getLta() {
			return lta;
		}
		public void setLta(double lta) {
			this.lta = lta;
		}
		public double getErnps() {
			return ernps;
		}
		public void setErnps(double ernps) {
			this.ernps = ernps;
		}
		
	//choice method for opening CTC from Personal Employee Role 
	public String choice()
	{
		
		String ret = SUCCESS;
		Connection conn = null;
		
		
		
		try {
			  DataSource dataSource = MyDataSource.getInstance();
			  conn = GetConnection.getConnection();
			  System.out.println("http session.............."+session);
			  Map session = ActionContext.getContext().getSession();  
			//Map session =(Map) ActionContext.getContext().get("session");  
			
		      System.out.println("map session......."+session);
		      Object id= session.get("loginid");
		      System.out.println("id session.........."+id);
		      System.out.println("get session......"+session.get("loginid"));
		      String RolebasedQuery="SELECT * FROM EMP_PAY_MASTER_TEMP where EMAIL_ID='"+id+"'";
	
			  PreparedStatement pst = conn.prepareStatement(RolebasedQuery );
			
			  ResultSet rs=pst.executeQuery();
			
		      System.out.println("Resultset..............."+rs);
			
		      while(rs.next())
			{  
		    	  PersonalDetailsBean personalBean=new PersonalDetailsBean();
		    	  personalBean.setTotal_CTC(rs.getString(7));
				  System.out.println("seventh Record............"+rs.getString(7));
				  String ct=rs.getString(7);
				   ctc = Double.parseDouble(ct);
				  System.out.println("ct value...."+ct);
				if(ctc<250000)
				{
				  System.out.println("you are not elegible for this");
				}
				else
				{
				
				   DecimalFormat df = new DecimalFormat("###.##");
					//System.out.println("kilobytes (DecimalFormat) : " + df.format(kilobytes));
					
				  basic=(ctc*0.30);
				  System.out.println("basic........."+basic);
				  
				  basepay=((ctc*0.30)+(ctc*0.25)+(ctc*0.48));
				  System.out.println("basepay value=="+basepay);
					 
				 //displaing choicepay two decimals using Decimal fromat class
					 
				  choicepay=(ctc-(basepay+pli));
				  System.out.println("choicepay"+choicepay);
				  String choicepay1=df.format(choicepay);
				  value = Double.parseDouble(choicepay1);
				  System.out.println("double value"+value);
				  System.out.println("343double two decimals.........."+choicepay1);
				  //displaing choicepay two decimals using Decimal fromat class
			
				  acp=value;
					 
				  fuel=(ctc*0.25);
				  hra=(basic*0.50);
				  System.out.println("hra value=="+hra);
				  lta=(basic*2);
				  System.out.println("lta....."+lta);
				  ernps=(basic*0.10);
				  String ernps_old=df.format(ernps);
				  ernps_new=Double.parseDouble(ernps_old);
				  System.out.println("ofter vernps value="+ernps_new);
				  
				}
				  list.add(personalBean);
				 //fetching records using list
				

		
				}  
			
			if (!rs.next()) {
				System.out.println("if condition.........."+rs.next());
				
				ret = SUCCESS;
			}
			
			else
			{	 
			   return SUCCESS;
		
			}
			}
		   catch (Exception e) {
			  e.printStackTrace();
			  ret = SUCCESS;}
		   finally {
			if (conn != null)
			{
				try {
					System.out.println("final block.....");
					conn.close();
					} 
					catch (Exception e) { }
			}
		}
		   return ret;
		
		
		
	}
	//Inserting Choice pay Details to DB
	private String choiceInsertQuery="INSERT INTO EMP_DETAIL_TEMP VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	int rst=0;
	public String choiceSuccess()
	{
		System.out.println(" I am choice method");
		String ret=ERROR;
		Connection conn=null;
		System.out.println("before try connection"+conn);
		
		try{
			
		//calling connection from Application Resources
		DataSource dataSource = MyDataSource.getInstance();
		 conn = dataSource.getConnection();
		 System.out.println("After try connection............."+conn);
		 Map session = ActionContext.getContext().getSession();  
			//Map session =(Map) ActionContext.getContext().get("session");  
			

		      Object id= session.get("empid");
		      System.out.println("getting session id===="+id);
		//passing query into PreparedStatement for inserting operation
		PreparedStatement ps=conn.prepareStatement(choiceInsertQuery);
		System.out.println("prepares statemnt......"+ps);
		
		ps.setDouble(1, getCtc());
		//ps.setDouble(1, choiceBean.getCtc());
		System.out.println("inserted first Record.............."+choiceBean.getCtc());
		ps.setString(2, choiceBean.getBasic());
		ps.setString(3,choiceBean.getBasepay());
		ps.setString(4, choiceBean.getPli());
		ps.setDouble(5, getValue());
		ps.setString(6, choiceBean.getSpa());
		ps.setString(7, choiceBean.getAcp());
		ps.setString(8, choiceBean.getMr1());
		ps.setString(9, choiceBean.getMr2());
		ps.setString(10, choiceBean.getCea1());
		ps.setString(11,choiceBean.getCea2());
		ps.setString(12, choiceBean.getCoa1());
		ps.setString(13, choiceBean.getCoa2());
		ps.setString(14, choiceBean.getFme1());
		ps.setString(15, choiceBean.getFme2());
	    ps.setString(16,choiceBean.getHra());
	System.out.println();
	
		
		ps.setString(17, choiceBean.getHra2());
		ps.setString(18, choiceBean.getLta());
		ps.setString(19, choiceBean.getLta2());
		//ps.setString(20, choiceBean.getErnc());
		ps.setDouble(20, getErnps_new());
		ps.setString(21, choiceBean.getErnc1());
		ps.setString(22, choiceBean.getAb());
		ps.setString(23, choiceBean.getWe());
		ps.setString(24, choiceBean.getCha1());
		ps.setString(25, choiceBean.getCha2());
		ps.setString(26, choiceBean.getFc2());
		ps.setString(27, choiceBean.getEe());
		ps.setString(28, choiceBean.getFe());
		ps.setString(29, choiceBean.getGf2());
		ps.setObject(30, id);
		ps.setString(31, choiceBean.getUb());
		rst=ps.executeUpdate();
		System.out.println("insert resultset..............."+rst);
		
		if(rst>0)
		{
			
			
			MailPusherActionChoicePay mp=new MailPusherActionChoicePay();
			mp.executeMail();
			
			
			ret=SUCCESS;
		}
		else
		{
			ret=ERROR;
		}
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return ret;
		}
	public String personal_menu()
	{
		return SUCCESS;
		
	}
	public String choicePaySuccess()
	{
	
		System.out.println("inside method printing id....................");
		
		
		String ret = SUCCESS;
		Connection conn = null;
		
		
		
		try {
			  DataSource dataSource = MyDataSource.getInstance();
			  conn = dataSource.getConnection();
			  System.out.println("http session.............."+session);
			  Map session = ActionContext.getContext().getSession();  
			//Map session =(Map) ActionContext.getContext().get("session");  
			
		      System.out.println("map session......."+session);
		      Object id= session.get("loginid");
		      System.out.println("id session.........."+id);
		      System.out.println("get session......"+session.get("loginid"));
		      String RolebasedQuery="SELECT * FROM EMP_PAY_MASTER_TEMP where EMAIL_ID='"+id+"'";
	
			  PreparedStatement pst = conn.prepareStatement(RolebasedQuery );
			
			  ResultSet rs=pst.executeQuery();
			
		      System.out.println("Resultset..............."+rs);
			
		      while(rs.next())
			{  
				PersonalDetailsBean personalBean=new PersonalDetailsBean();
				
				personalBean.setEmp_no(rs.getString("EMP_ID"));
				personalBean.setEmp_no(rs.getString("EMP_ID"));
				System.out.println("first Record............"+rs.getString("EMP_ID"));
				personalBean.setName(rs.getString("EMP_NAME"));
				System.out.println("SECOND Record............"+rs.getString("EMP_NAME"));
				personalBean.setDesignation(rs.getString("EMP_DESIGNATION"));
				System.out.println("fourth Record............"+rs.getString("EMP_DESIGNATION"));
				//personalBean.setDate_of_joining(rs.getString("DOJ"));
				//date format removing time
				String date=rs.getString("DOJ").substring(0, 10);
				System.out.println("string date===="+date);
				
				personalBean.setDate_of_joining(date);
				
				System.out.println("fifth Record............"+rs.getString("DOJ"));
				personalBean.setPAN_no(rs.getString("PAN_NO"));
				System.out.println("sixth Record............"+rs.getString("PAN_NO"));
				
				personalBean.setMailid(rs.getString("EMAIL_ID"));
				System.out.println("third Record............"+rs.getString("EMAIL_ID"));
				personalBean.setTotal_CTC(rs.getString("CTC"));
				System.out.println("seventh Record............"+rs.getString("CTC"));
			//fetching records using list
				list.add(personalBean);
				}  
			
			if (!rs.next()) {
				
				System.out.println("if condition.........."+rs.next());
				
				ret = SUCCESS;
			}
		
			else
			{	
			
			return SUCCESS;
		
			}
			}
		   catch (Exception e) {
			e.printStackTrace();
			ret = SUCCESS;}
		   finally {
			if (conn != null)
			{
				try {
					System.out.println("final block.....");
						conn.close();
					} 
					catch (Exception e) { }
			}
		}
		   return ret;
		
	
		 
	}
}


