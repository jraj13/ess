package com.ess.common.action;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class CTCStmtMainAction {
	
	
	public static ArrayList<String> GetBeforeCTC() throws SQLException {

		ArrayList<String> ctcList = new ArrayList<String>();

		Map session = ActionContext.getContext().getSession();
		// Map session =(Map) ActionContext.getContext().get("session");

		System.out.println("map session......." + session);
		Object id = session.get("empid");
		System.out.println("id session.........." + id);
		System.out.println("get session......" + session.get("loginid"));

	/*	HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String empid = request.getParameter("empid");
		System.out.println("empid.."+empid);*/
		
		
		String beforectcQuery="Select empid,basicpay,pro_fund,gratuty ,tot_basepay ,ad_bonus ,tot_man_debits,medical,conveyance,lta,hra,tot_other_choice,tot_choice, tot_ctc, pli, overall_ctc,SPA,ESI from BEFORE_CTC where empid='"+id+"'";

		Connection con = GetConnection.getConnection();
		System.out.println("connection"+con);
		Statement stmt = con.createStatement();
		ResultSet rst = null;

		rst = stmt.executeQuery(beforectcQuery);
String basicpay="";
String pro_fund="";
String gratuty ="";
String tot_basepay =""; 
String ad_bonus ="";
String tot_man_debits="";
String medical="";
String conveyance="";
String lta="";
String hra="";
String tot_other_choice ="";
String tot_choice ="";
String tot_ctc ="";
String pli ="";
String overall_ctc ="";
String spa="";
String esi_value="";


		while (rst.next()) {
			 basicpay=rst.getString("basicpay");
			  pro_fund=rst.getString("pro_fund");
			  gratuty =rst.getString("gratuty");
			  tot_basepay =rst.getString("tot_basepay");
			  ad_bonus =rst.getString("ad_bonus");
			  tot_man_debits=rst.getString("tot_man_debits");
			  medical=rst.getString("medical");
			  conveyance=rst.getString("conveyance");
			  lta=rst.getString("lta");
			  hra=rst.getString("hra");
			  tot_other_choice =rst.getString("tot_other_choice");
			  tot_choice =rst.getString("tot_choice");
			  tot_ctc =rst.getString("tot_ctc");
			  pli =rst.getString("pli");
			  overall_ctc =rst.getString("overall_ctc");
			  spa=rst.getString("SPA");
			  esi_value=rst.getString("ESI");
			  if(esi_value==null || esi_value=="")
			  {
				  esi_value="0.0";
			  }

			String ctcDetails = basicpay + "^" + pro_fund + "^" + gratuty + "^"
					+ tot_basepay + "^" + ad_bonus + "^" + tot_man_debits + "^" + medical+"^"
			+ conveyance + "^" + lta + "^" + hra + "^" + tot_other_choice+"^"
			+ tot_choice + "^" + tot_ctc + "^" + pli + "^" + overall_ctc + "^" +spa + "^" + esi_value ;
			

			ctcList.add(ctcDetails);
			System.out.println("from ctclist..."+ctcList);

		}

		return ctcList;
	}
	

	
	
	
	public String callBeforeCtc()
	{
	//String id="CSSE150045";
	System.out.println("calling callBeforeCTC method");
	
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);
	String empid = request.getParameter("empid");
	System.out.println("empid.."+empid);
		CallableStatement callableStatement = null;
				
				String callBeforeCTC = "{call BEFOREJOIN_CTC('"+empid+"')}";
				
				String msg="false";
			
				try {

						Connection con = GetConnection.getConnection(); 
						callableStatement = con.prepareCall(callBeforeCTC);
						System.out.println("calling procedure");
						callableStatement.executeUpdate();
						msg="true";
				} catch (Exception ex) {
					
					System.out.println("record deletion=="+ex.getMessage());

				}
				return msg;
	}
	public static void main(String args[]){
		
		try {
			GetBeforeCTC();
			CTCStmtMainAction av=new CTCStmtMainAction();
			String ri=av.callBeforeCtc();
			System.out.println(ri);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}
