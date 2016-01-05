package com.ess.common.action;

import java.sql.Connection;
//import java.sql.Date;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;
import com.servlet.Cash_Voucher_pdf_generation;

import java.text.SimpleDateFormat;
import java.util.Date;

public class E_Voucher_Expense {

	public void e_voucher_entry(String paid_to_name, String reason_paid_amount,String payment_type,String cash_cheque_no, float cash_cheque_amount, Object date1,Object sysdate1,String prepare_by)
	{
		
		//String e_voucher_ret="";
			Connection con=null;
			Statement stmt=null;
			int rs;
			String prepare_by1=prepare_by;
			
			String empDataAry[] = prepare_by1.split("\\@");
			String prepared_by = empDataAry[0];
			
		String e_voucher_entry_qry="insert into E_VOUCHER(EMP_NAME,REASON_TO_PAY,PAYMENT_TYPE,CASH_OR_CHECK_NO,AMOUNT,ENTER_DATE,PREPARED_BY,in_date) "
				+ " VALUES ('"+paid_to_name+"','"+reason_paid_amount+"','"+payment_type+"','"+cash_cheque_no+"','"+cash_cheque_amount+"','"+date1+"','"+prepared_by+"','"+sysdate1+"')";
		
				System.out.println("e_voucher_entry_qry.."+e_voucher_entry_qry);		
		try{
			con=GetConnection.getConnection();
			stmt=con.createStatement();
			
			rs=stmt.executeUpdate(e_voucher_entry_qry);
			
			Cash_Voucher_pdf_generation  vv=new Cash_Voucher_pdf_generation();
			//vv.report_eoucher();
			System.out.println("calling pdf");
			
			if(rs>0){
				 System.out.println("Result set of the  in e voucher"+rs);  
				//e_voucher_ret="E_Voucher entry successfully done";
				
				
			}
			else{
				
				//e_voucher_ret="not saved";
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			//e_voucher_ret="internal problem ! please try again";

		}
		
		//return e_voucher_ret;
	}
	
	
	// Telephone Expense entry save method  
		
	public String telephone_expenseentry_save(String datesArray,String type_expense)
	{
		System.out.println("telephone_expenseentry_save");
		
		String save_status="";
		
		Connection con=null;
		Statement stmt=null;
		

		
		String[] str_els = datesArray.split(";");

		int size = str_els.length;
		System.out.println("array list in else statement is" + size);
		

		try {
			System.out.println("inside if size is 1 condition");
			Date date = (Date) new java.util.Date();
		    SimpleDateFormat sdf;
		    sdf = new SimpleDateFormat("dd/MMM/yyyy");
		    Object creation_date=sdf.format(date);
		    System.out.println("creation_date.."+creation_date);
		    
		    
			con = GetConnection.getConnection();
			stmt = con.createStatement();
			con.setAutoCommit(false);

			if (size == 1) {

				for (int i = 0; i < str_els.length; i++) {
					System.out.println("if size == 1");
					System.out.println("length"+str_els.length);
					

					String[] inner = str_els[i].split(",");

					String month = inner[0].trim();
					System.out.println("month  ---" + month);

					String period = inner[1].trim().toUpperCase();
					System.out.println(" period ---"+ period);

					String bill_no = inner[2].trim();
					System.out.println("bill_no  ---"+ bill_no);

					
					String bill_date1 = inner[3].trim();
					System.out.println(" bill_date1---" + bill_date1);
					
					SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
					java.util.Date tempDate1 =  simpleDateFormat1.parse(bill_date1);
					SimpleDateFormat outputDateFormat1 = new SimpleDateFormat("dd/MMM/YYYY");
					Object bill_date = outputDateFormat1.format(tempDate1);
					System.out.println("bill_date.." + bill_date);
					

					String duedate1 = inner[4].trim();
					System.out.println("duedate1 ---" + duedate1);
					
					SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
					java.util.Date tempDate2 =  simpleDateFormat2.parse(duedate1);
					SimpleDateFormat outputDateFormat2 = new SimpleDateFormat("dd/MMM/YYYY");
					Object duedate = outputDateFormat2.format(tempDate2);
					System.out.println("duedate.." + duedate);


					 float amount=Float.parseFloat(inner[5].trim());
					 System.out.println("amont ---"+amount); 
					 
					 String remarks=inner[6].trim();
					 System.out.println("remarks ---"+remarks); 
					 
					 
					 
	String if_query = "INSERT INTO MONTHLY_EXPENSES(MONTH_IN,PERIOD	,BILL_NO,BILL_DATE,DUE_DATE,AMOUNT,REMARKS,TYPE_EXPENSE	,IN_DATE) VALUES('"+ month+ "','"+ period+ "','"+ bill_no+ "','"+ bill_date+ "','"+ duedate+ "', "
			+ ""+ amount+ ", '"+ remarks+ "', '"+ type_expense+"','"+creation_date+"')";
					System.out.println("query ---" + if_query);

					stmt.addBatch(if_query);

				}
			}

			else if (size > 1) {
				System.out.println("if size > 1");

				for (int j = 0; j < str_els.length; j++) {
					if (j == 0) {

						String[] inner = str_els[j].split(",");

						String month = inner[0].trim();
						System.out.println("month  ---" + month);

						String period = inner[1].trim().toUpperCase();
						System.out.println(" period ---"+ period);

						String bill_no = inner[2].trim();
						System.out.println("bill_no  ---"+ bill_no);

						
						String bill_date1 = inner[3].trim();
						System.out.println(" bill_date1---" + bill_date1);
						
						SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
						java.util.Date tempDate1 =  simpleDateFormat1.parse(bill_date1);
						SimpleDateFormat outputDateFormat1 = new SimpleDateFormat("dd/MMM/YYYY");
						Object bill_date = outputDateFormat1.format(tempDate1);
						System.out.println("bill_date.." + bill_date);
						

						String duedate1 = inner[4].trim();
						System.out.println("duedate1 ---" + duedate1);
						
						SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
						java.util.Date tempDate2 =  simpleDateFormat2.parse(duedate1);
						SimpleDateFormat outputDateFormat2 = new SimpleDateFormat("dd/MMM/YYYY");
						Object duedate = outputDateFormat2.format(tempDate2);
						System.out.println("duedate.." + duedate);


						 float amount=Float.parseFloat(inner[5].trim());
						 System.out.println("before_duedate ---"+amount); 
						 
						 String remarks=inner[6].trim();
						 System.out.println("remarks ---"+remarks); 
							

							String if_query = "INSERT INTO MONTHLY_EXPENSES(MONTH_IN,PERIOD	,BILL_NO,BILL_DATE,DUE_DATE,AMOUNT,REMARKS,TYPE_EXPENSE	,IN_DATE) VALUES('"+ month+ "','"+ period+ "','"+ bill_no+ "','"+ bill_date+ "','"+ duedate+ "', "
									+ ""+ amount+ ", '"+ remarks+ "', '"+ type_expense+"','"+creation_date+"')";
							
						System.out.println("query ---" + if_query);
						// msg="Succesfully enxpense entry inserted";
						stmt.addBatch(if_query);
					}

					else {
						System.out.println("else");
						String[] inner = str_els[j].split(",");

						String month = inner[1].trim();
						System.out.println("month  ---" + month);

						String period = inner[2].trim().toUpperCase();
						System.out.println(" period ---"+ period);

						String bill_no = inner[3].trim();
						System.out.println("bill_no  ---"+ bill_no);

						
						String bill_date1 = inner[4].trim();
						System.out.println(" bill_date1---" + bill_date1);
						
						SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
						java.util.Date tempDate1 =  simpleDateFormat1.parse(bill_date1);
						SimpleDateFormat outputDateFormat1 = new SimpleDateFormat("dd/MMM/YYYY");
						Object bill_date = outputDateFormat1.format(tempDate1);
						System.out.println("bill_date.." + bill_date);
						

						String duedate1 = inner[5].trim();
						System.out.println("duedate1 ---" + duedate1);
						
						SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
						java.util.Date tempDate2 =  simpleDateFormat2.parse(duedate1);
						SimpleDateFormat outputDateFormat2 = new SimpleDateFormat("dd/MMM/YYYY");
						Object duedate = outputDateFormat2.format(tempDate2);
						System.out.println("duedate.." + duedate);



						 float amount=Float.parseFloat(inner[6].trim());
						 System.out.println("amount ---"+amount); 
						 
						 String remarks=inner[7].trim();
						 System.out.println("remarks ---"+remarks); 
							
							
						String rls_query = "INSERT INTO MONTHLY_EXPENSES(MONTH_IN,PERIOD,BILL_NO,BILL_DATE,DUE_DATE,AMOUNT,REMARKS,TYPE_EXPENSE	,IN_DATE) VALUES('"+ month+ "','"+ period+ "','"+ bill_no+ "','"+ bill_date+ "','"+ duedate+ "', "
								+ ""+ amount+ ", '"+ remarks+ "', '"+ type_expense+"','"+creation_date+"')";
						
						
						System.out.println("query ---" + rls_query);
						//st.executeUpdate(rls_query);

						stmt.addBatch(rls_query);
					}

				}

			}
			int[] counter = stmt.executeBatch();
			/* if(counter>0){
				 save_status = "Successfully saved telephone expense entry";
			} */
			con.commit();
			save_status = "Successfully details are saved";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			save_status = "Please Enter all fields then try Again !";
			
			
		} finally {
			 System.out.println("msg is---"+save_status);
			if(save_status=="Successfully details are saved"){
				save_status = "Successfully details are saved";
			}else if(save_status=="Please Enter all fields then try Again"){
				save_status = "Please Enter all fields then try Again !";
			 } 
		}
		
		
		
		
		return save_status;
		
	}
	
	
	


	
	//expense entry for courier 
	
	
	public String couriear_expenseentry_save(String datesArray,String type_expense)
	{
		String save_status="";
		
		Connection con=null;
		Statement stmt=null;
		
		
		
		
		String[] str_els = datesArray.split(";");

		int size = str_els.length;
		System.out.println("array list in else statement is" + size);
		
		

		try {
			System.out.println("inside if size is 1 condition");
			con = GetConnection.getConnection();
			stmt = con.createStatement();
			con.setAutoCommit(false);

			if (size == 1) {

				for (int i = 0; i < str_els.length; i++) {
					System.out.println("if size == 1");

					String[] inner = str_els[i].split(",");

					String month = inner[0].trim();
					System.out.println("month  ---" + month);

					String period = inner[1].trim().toUpperCase();
					System.out.println(" period ---"+ period);
					
					
					String coureiear_type= inner[2].trim().toUpperCase();
					System.out.println(" coureiear_type ---"+ coureiear_type);
					
					

					String bill_no = inner[3].trim();
					System.out.println("bill_no  ---"+ bill_no);

					
					String bill_date1 = inner[4].trim();
					System.out.println(" bill_date1---" + bill_date1);
					
					SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
					java.util.Date tempDate1 =  simpleDateFormat1.parse(bill_date1);
					SimpleDateFormat outputDateFormat1 = new SimpleDateFormat("dd/MMM/YYYY");
					Object bill_date = outputDateFormat1.format(tempDate1);
					System.out.println("bill_date.." + bill_date);
					

					String duedate1 = inner[5].trim();
					System.out.println("duedate1 ---" + duedate1);
					
					SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
					java.util.Date tempDate2 =  simpleDateFormat2.parse(duedate1);
					SimpleDateFormat outputDateFormat2 = new SimpleDateFormat("dd/MMM/YYYY");
					Object duedate = outputDateFormat2.format(tempDate2);
					System.out.println("duedate.." + duedate);


					 float amount=Float.parseFloat(inner[6].trim());
					 System.out.println("before_duedate ---"+amount); 
					 
					 String remarks=inner[7].trim();
					 System.out.println("remarks ---"+remarks); 
					 
					 
					 
	String if_query = "INSERT INTO MONTHLY_EXPENSES(MONTH_IN,PERIOD	,TYPE_OF_COURIER,BILL_NO,BILL_DATE,DUE_DATE,AMOUNT,REMARKS,TYPE_EXPENSE	,IN_DATE) VALUES('"+ month+ "','"+ period+ "','"+coureiear_type+"','"+ bill_no+ "','"+ bill_date+ "','"+ duedate+ "', "
			+ ""+ amount+ ", "+ remarks+ ", '"+ type_expense+"',sysdate)";
					System.out.println("query ---" + if_query);

					stmt.addBatch(if_query);

				}
			}

			else if (size > 1) {
				System.out.println("if size > 1");

				for (int j = 0; j < str_els.length; j++) {
					if (j == 0) {

						String[] inner = str_els[j].split(",");

						String month = inner[0].trim();
						System.out.println("month  ---" + month);

						String period = inner[1].trim().toUpperCase();
						System.out.println(" period ---"+ period);

						
						String coureiear_type= inner[2].trim().toUpperCase();
						System.out.println(" coureiear_type ---"+ coureiear_type);
						
						
						
						String bill_no = inner[3].trim();
						System.out.println("bill_no  ---"+ bill_no);

						
						String bill_date1 = inner[4].trim();
						System.out.println(" bill_date1---" + bill_date1);
						
						SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
						java.util.Date tempDate1 =  simpleDateFormat1.parse(bill_date1);
						SimpleDateFormat outputDateFormat1 = new SimpleDateFormat("dd/MMM/YYYY");
						Object bill_date = outputDateFormat1.format(tempDate1);
						System.out.println("bill_date.." + bill_date);
						

						String duedate1 = inner[5].trim();
						System.out.println("duedate1 ---" + duedate1);
						
						SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
						java.util.Date tempDate2 =  simpleDateFormat2.parse(duedate1);
						SimpleDateFormat outputDateFormat2 = new SimpleDateFormat("dd/MMM/YYYY");
						Object duedate = outputDateFormat2.format(tempDate2);
						System.out.println("duedate.." + duedate);


						 float amount=Float.parseFloat(inner[6].trim());
						 System.out.println("before_duedate ---"+amount); 
						 
						 String remarks=inner[7].trim();
						 System.out.println("remarks ---"+remarks); 
							

							String if_query = "INSERT INTO MONTHLY_EXPENSES(MONTH_IN,PERIOD	,TYPE_OF_COURIER,BILL_NO,BILL_DATE,DUE_DATE,AMOUNT,REMARKS,TYPE_EXPENSE	,IN_DATE) VALUES('"+ month+ "','"+ period+ "','"+coureiear_type+"','"+ bill_no+ "','"+ bill_date+ "','"+ duedate+ "', "
									+ ""+ amount+ ", "+ remarks+ ", '"+ type_expense+"',sysdate)";
							
						System.out.println("query ---" + if_query);
						// msg="Succesfully enxpense entry inserted";
						stmt.addBatch(if_query);
					}

					else {
						System.out.println("else");
						String[] inner = str_els[j].split(",");

						String month = inner[1].trim();
						System.out.println("month  ---" + month);
						
						String coureiear_type= inner[2].trim().toUpperCase();
						System.out.println(" coureiear_type ---"+ coureiear_type);

						String period = inner[3].trim().toUpperCase();
						System.out.println(" period ---"+ period);

						String bill_no = inner[4].trim();
						System.out.println("bill_no  ---"+ bill_no);

						
						String bill_date1 = inner[5].trim();
						System.out.println(" bill_date1---" + bill_date1);
						
						SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
						java.util.Date tempDate1 =  simpleDateFormat1.parse(bill_date1);
						SimpleDateFormat outputDateFormat1 = new SimpleDateFormat("dd/MMM/YYYY");
						Object bill_date = outputDateFormat1.format(tempDate1);
						System.out.println("bill_date.." + bill_date);
						

						String duedate1 = inner[6].trim();
						System.out.println("duedate1 ---" + duedate1);
						
						SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
						java.util.Date tempDate2 =  simpleDateFormat2.parse(duedate1);
						SimpleDateFormat outputDateFormat2 = new SimpleDateFormat("dd/MMM/YYYY");
						Object duedate = outputDateFormat2.format(tempDate2);
						System.out.println("duedate.." + duedate);



						 float amount=Float.parseFloat(inner[7].trim());
						 System.out.println("before_duedate ---"+amount); 
						 
						 String remarks=inner[8].trim();
						 System.out.println("remarks ---"+remarks); 
							
							
							
						String rls_query = "INSERT INTO MONTHLY_EXPENSES(MONTH_IN,PERIOD,TYPE_OF_COURIER,BILL_NO,BILL_DATE,DUE_DATE,AMOUNT,REMARKS,TYPE_EXPENSE	,IN_DATE) VALUES('"+ month+ "','"+ period+ "','"+coureiear_type+"','"+ bill_no+ "','"+ bill_date+ "','"+ duedate+ "', "
								+ ""+ amount+ ", "+ remarks+ ", '"+ type_expense+"',sysdate)";
						
						
						System.out.println("query ---" + rls_query);
						//st.executeUpdate(rls_query);

						stmt.addBatch(rls_query);
					}

				}

			}
			int[] counter = stmt.executeBatch();
			/* if(counter>0){
				 save_status = "Successfully saved telephone expense entry";
			} */
			con.commit();
			save_status = "Successfully bond details are saved";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			save_status = "Please Enter all fields then try Again !";
			
			
		} finally {
			 System.out.println("msg is---"+save_status);
			if(save_status=="Successfully saved telephone expense entry"){
				save_status = "Successfully bond details are saved";
			}else if(save_status=="Please Enter all fields then try Again"){
				save_status = "Please Enter all fields then try Again !";
			 } 
		}
		
		
		
		
		return save_status;
		
	}

	
	

	
	
	
	
	
	
	
}
