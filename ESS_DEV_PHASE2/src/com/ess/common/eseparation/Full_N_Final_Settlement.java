package com.ess.common.eseparation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class Full_N_Final_Settlement {

	
	public ArrayList<Object> bond_edit_fetch_details(String sequence_no) throws SQLException
	{
		ArrayList<Object> bondedit_list=new ArrayList<Object>();
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String seq_no = request.getParameter("seq_no");

		//System.out.println("bond_edit_fetch_details/// =====" + seq_no);
		
		String query="Select RESIGNATION_NO,DESCRIPTION,BEGINNING_DATE,ENDING_DATE,EFFECT,REMARKS,SID from EMP_FNF_BOND_SUMMARY where RESIGNATION_NO= '"+seq_no+"' ";
		
		System.out.println("query..."+query);
		ResultSet rst=null;
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		
		try{
			
			rst = stmt.executeQuery(query);
			String resign_no = "";
			String description="";
			Date begg_date;
			Date end_date;
			String effect = "";
			String remarks = "";
			String sid="";

			while (rst.next()) {
				resign_no = rst.getString("RESIGNATION_NO");
				description = rst.getString("DESCRIPTION");
				begg_date = rst.getDate("BEGINNING_DATE");
				end_date = rst.getDate("ENDING_DATE");
				effect = rst.getString("EFFECT");
				remarks = rst.getString("REMARKS");
				sid = rst.getString("SID");

				String finalResponse = resign_no + "^" + description + "^"
						+ begg_date + "^" + end_date + "^" + effect + "^" + remarks+ "^" + sid ;
				
				/*String finalResponse = resign_no + "^" + description + "^"
						+ begg_date + "^" + end_date + "^" + effect + "^" + remarks ;*/
				bondedit_list.add(finalResponse);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			con.close();
		}
		
		return bondedit_list;
	}
	
	public ArrayList<Object> loan_edit_fetch_details(String sequence_no) throws SQLException
	{
		ArrayList<Object> bondedit_list=new ArrayList<Object>();
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String seq_no = request.getParameter("seq_no");

	//	System.out.println("loan_edit_fetch_details =====" + seq_no);
		
		String query="Select RESIGNATION_NO,SUB_TYPE,DESCRIPTION,LOAN_AMOUNT,BALANCE_AMOUNT,SPE_REPAYMENT_AMOUNT,SID from EMP_FNF_LOAN_SUMMARY where RESIGNATION_NO= '"+seq_no+"' ";
		System.out.println("loan_edit_fetch_details.."+query);
		
		ResultSet rst=null;
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		
		try{
			
			rst = stmt.executeQuery(query);
			String resign_no = "";
			String sub_type="";
			String des_loan;
			String loan_amount;
			String bal_amount = "";
			String spe_repay_amount = "";
			String sid="";

			while (rst.next()) {
				resign_no = rst.getString("RESIGNATION_NO");
				sub_type = rst.getString("SUB_TYPE");
				des_loan = rst.getString("DESCRIPTION");
				loan_amount = rst.getString("LOAN_AMOUNT");
				bal_amount = rst.getString("BALANCE_AMOUNT");
				spe_repay_amount = rst.getString("SPE_REPAYMENT_AMOUNT");
				sid=rst.getString("SID");

				String finalResponse = resign_no + "^" + sub_type + "^"
						+ des_loan + "^" + loan_amount + "^" + bal_amount + "^" + spe_repay_amount+ "^" + sid;
				bondedit_list.add(finalResponse);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			con.close();
		}
		
		return bondedit_list;
	}
	
	
	public ArrayList<String> empAddress_info(String sequence_no_main) throws SQLException
	{
		System.out.println("empAddress_info");
		ArrayList<String> addr_list=new ArrayList<String>();
		
	/*HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String seq_no = request.getParameter("seq_no");
		System.out.println("bond_edit_fetch_details =====" + seq_no);
		*/
		//String query="Select EMP_ID  from E_SEPARATION_EMP where SEQUENCE_NO= '"+sequence_no+"' ";
		
		String addr_query="select EMP_ID,EMP_PER_STREET,EMP_PER_ADDRESS,EMP_PER_ADDR_CITY, EMP_PER_ADDR_DIST,EMP_PER_PCODE,EMP_EMG_CON,   EMP_CURR_STREET, EMP_CURR_ADDRESS,EMP_CURR_ADDR_CITY,EMP_CURR_ADDR_DIST,EMP_CURR_PCODE  from NCSS_EMP_PERSONAL_INFO where EMP_ID in (select emp_id from E_SEPARATION_EMP where SEQUENCE_NO='"+sequence_no_main+"')";
		System.out.println(addr_query);
		ResultSet rst=null;
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
	
		try{
			rst = stmt.executeQuery(addr_query);
			String emp_id1="";
			
			String emp_per_street1="";
			String emp_per_add1r="";
			String emp_per_addr_city1 = "";
			String emp_per_addr_dist1="";
			String emp_per_pcode1="";
			String emp_emg_con1 = "";
			
			String emp_curr_street1="";
			String emp_curr_addr1 = "";
			String emp_curr_addr_city1="";
			String emp_curr_addr_dist1 = "";
			String emp_curr_pcode1_main="";
			
			while (rst.next()) {
				emp_id1 = rst.getString("EMP_ID");
				
				emp_per_street1 = rst.getString("EMP_PER_STREET");
				emp_per_add1r = rst.getString("EMP_PER_ADDRESS");
				emp_per_addr_city1 = rst.getString("EMP_PER_ADDR_CITY");
				emp_per_addr_dist1 = rst.getString("EMP_PER_ADDR_DIST");
				emp_per_pcode1 = rst.getString("EMP_PER_PCODE");
				emp_emg_con1 = rst.getString("EMP_EMG_CON");
				
				emp_curr_street1 = rst.getString("EMP_CURR_STREET");
				emp_curr_addr1 = rst.getString("EMP_CURR_ADDRESS");
				emp_curr_addr_city1 = rst.getString("EMP_CURR_ADDR_CITY");
				emp_curr_addr_dist1 = rst.getString("EMP_CURR_ADDR_DIST");
				emp_curr_pcode1_main = rst.getString("EMP_CURR_PCODE");
				
				String finalResponse = emp_id1 + "^" + emp_per_street1 + "^"+ emp_per_add1r + "^" + emp_per_addr_city1 + "^" 
						+  emp_per_addr_dist1 + "^" + emp_per_pcode1 + "^" + emp_emg_con1 + "^" +  emp_curr_street1 + "^"
								+ emp_curr_addr1 + "^" +  emp_curr_addr_city1 + "^" + emp_curr_addr_dist1 + "^" + emp_curr_pcode1_main;
				
				addr_list.add(finalResponse);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			con.close();
		}
		
		return addr_list;
	}
	
	
	
	/* update emp permanent address  */
	
	public String update_emp_per_addr(String per_street,String per_addr,String per_addr_city,String per_addr_distt,String per_add_pcode,String per_cont_no,String per_emp_id) throws SQLException
	{
		System.out.println("update_emp_per_addr");
		String final_res="";
		
		/*HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String seq_no = request.getParameter("seq_no");
		System.out.println("bond_edit_fetch_details =====" + seq_no);*/
		
		String query="update NCSS_EMP_PERSONAL_INFO set  EMP_PER_STREET='"+per_street+"',EMP_PER_ADDRESS='"+per_addr+"', EMP_PER_ADDR_CITY='"+per_addr_city+"', EMP_PER_ADDR_DIST='"+per_addr_distt+"', EMP_PER_PCODE='"+per_add_pcode+"', EMP_EMG_CON='"+per_cont_no+"' where EMP_ID='"+per_emp_id+"'";
		System.out.println("update_emp_per_addr...."+query);
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		
		try{
			
			int rst = stmt.executeUpdate(query);
			if(rst>0){
				final_res="Recored updated successfully";
			}
			else{
				final_res="Recored not updated";
			}
		}catch(Exception e){
			final_res="Recored not updated";
			e.printStackTrace();
		}
		finally{
			con.close();
		}
		
		return final_res;
	}
	

	/* update emp current address  */
	
	public String update_emp_curr_addr(String curr_street,String curr_addr,String curr_addr_city,String curr_addr_distt,String curr_add_pcode,String curr_cont_no,String curr_emp_id) throws SQLException
	{
		System.out.println("update_emp_curr_addr");
		String final_res="";
		
		/*HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String seq_no = request.getParameter("seq_no");
		System.out.println("bond_edit_fetch_details =====" + seq_no);*/
		
		String query="update NCSS_EMP_PERSONAL_INFO set  EMP_CURR_STREET='"+curr_street+"',EMP_CURR_ADDRESS='"+curr_addr+"', EMP_CURR_ADDR_CITY='"+curr_addr_city+"', EMP_CURR_ADDR_DIST='"+curr_addr_distt+"', EMP_CURR_PCODE='"+curr_add_pcode+"', EMP_EMG_CON='"+curr_cont_no+"' where EMP_ID='"+curr_emp_id+"'";
		System.out.println("update_emp_curr_addr..."+query);
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
		
		try{
			
			int rst = stmt.executeUpdate(query);
			
			if(rst>0){
				final_res="Recored updated successfully";
			}
			else{
				final_res="Recored not updated";
			}
		}catch(Exception e){
			final_res="Recored not updated";
			e.printStackTrace();
		}
		finally{
			con.close();
		}
		
		return final_res;
	}
	
	
	/* bond summary updation  */
	
	public String bond_update_save(String favorite) throws SQLException, ParseException
	{
		System.out.println("bond update: favourate in java class is.."+favorite);
		
		String[] str1=favorite.split(";");
		 int size = str1.length;
		 System.out.println("size..."+size);
		 String displaymsg="";
		 if(size==1)
		 {
			 String[] str_if_value=favorite.split(",");
			 System.out.println("inside if condition in hr_task assign");
			 String description = str_if_value[0];
			 String begin_date1 = str_if_value[1];
			 
			 SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			    Date tempDate1=simpleDateFormat1.parse(begin_date1);
			    SimpleDateFormat outputDateFormat1 = new SimpleDateFormat("dd/MMM/YYYY");           
			    Object begin_date=outputDateFormat1.format(tempDate1);
					 System.out.println("begin Date.."+begin_date); 
					 
			 String ending_date2=str_if_value[2];
			 
			 SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
			    Date tempDate2=simpleDateFormat2.parse(ending_date2);
			    SimpleDateFormat outputDateFormat2= new SimpleDateFormat("dd/MMM/YYYY");           
			    Object ending_date=outputDateFormat2.format(tempDate2);
					 System.out.println("ending_date.."+ending_date); 
					 
			 String effect=str_if_value[3];
			 String remarks=str_if_value[4];
			 String sid=str_if_value[5];
			 System.out.println("if only"+description+" "+begin_date+""+ending_date+""+effect+""+remarks+""+sid);
			 
			 Connection con_if_task=null;
			 Statement st_if_task=null;
			 
			String if_sql_query="update  EMP_FNF_BOND_SUMMARY set DESCRIPTION='"+description+"', BEGINNING_DATE='"+begin_date+"',  ENDING_DATE='"+ending_date+"',  EFFECT='"+effect+"' , REMARKS='"+remarks+"' where SID='"+sid+"' ";
			 
			 try{
			con_if_task=GetConnection.getConnection();
			st_if_task=con_if_task.createStatement();
			int res_data=st_if_task.executeUpdate(if_sql_query);
			if(res_data>0){
				displaymsg="Successfully Bond summary updated";
				
			}
			 
			 }catch(Exception e){
				 System.out.println("problem in inside if condition in bond summary updation");
				 e.printStackTrace();
			 }finally{
				 st_if_task.close();
				 con_if_task.close();
			 }
			 
		 
		 }
		 else
		 {
			 	String[] str_els=favorite.split(";");
			 
			 System.out.println("lenth in else"+str_els.length);
			 
			 Connection con_else_task=null;
			 Statement st_else_task=null;
				try {
			 //String[] str_els=values.split(";");
			
			 con_else_task=GetConnection.getConnection();
			 st_else_task=con_else_task.createStatement(); 
			 con_else_task.setAutoCommit(false);
			 
			 for(int i=0;i<str_els.length;i++)
				{
				 String sql_name="sql_query_else"+i;
				 
				 String[] inner = str_els[i].split(",");
				 if(i==0){
					
					 String description = inner[0];
					 String begin_date3 = inner[1];
					 
					 SimpleDateFormat simpleDateFormat3 = new SimpleDateFormat("yyyy-MM-dd");
					    Date tempDate3=simpleDateFormat3.parse(begin_date3);
					    SimpleDateFormat outputDateFormat3 = new SimpleDateFormat("dd/MMM/YYYY");           
					    Object begin_date=outputDateFormat3.format(tempDate3);
							 System.out.println("begin_date.."+begin_date); 
							 
					 String ending_date4=inner[2];
					 
					 SimpleDateFormat simpleDateFormat4 = new SimpleDateFormat("yyyy-MM-dd");
					    Date tempDate4=simpleDateFormat4.parse(ending_date4);
					    SimpleDateFormat outputDateFormat4= new SimpleDateFormat("dd/MMM/YYYY");           
					    Object ending_date=outputDateFormat4.format(tempDate4);
							 System.out.println("ending_date.."+ending_date); 
							 
					 String effect=inner[3];
					 String remarks=inner[4];
					 String sid=inner[5];
					 
					  sql_name="update  EMP_FNF_BOND_SUMMARY set DESCRIPTION='"+description+"', BEGINNING_DATE='"+begin_date+"',  ENDING_DATE='"+ending_date+"',  EFFECT='"+effect+"' , REMARKS='"+remarks+"' where SID='"+sid+"' ";
						
					 	System.out.println("this is the insert statement in else if part"+sql_name);
					 	st_else_task.addBatch(sql_name);
					 
				 }
				 else
				 {
					/* String un_necessar=inner[0];
					 String task_no = inner[1];
					 String task_name = inner[2];
					 String status=inner[3];
					 String amount=inner[4];
					 String remarks=inner[5];
					 System.out.println("else else"+task_no+" "+task_name+""+status+""+amount+""+remarks);
					 sql_name="insert into TASK_CLEARANCE_STATUS(TASK_NO,TASK_TYPE,TASK_STATUS,AMOUNT,REMARKS,EMP_SEQ_NO,MANAGER_MAIL_ID,TASK_CLEARANCE_DATE) "
								+ "values('"+task_no+"','"+task_name+"','"+status+"','"+amount+"','"+remarks+"','"+seq_no+"','"+emp_mailid+"',to_date(sysdate,'DD/MM/YY'))";
					 */
					 String un_necessar=inner[0];
					 String description = inner[1];
					 String begin_date5 = inner[2];
					 
					 SimpleDateFormat simpleDateFormat5 = new SimpleDateFormat("yyyy-MM-dd");
					    Date tempDate5=simpleDateFormat5.parse(begin_date5);
					    SimpleDateFormat outputDateFormat5 = new SimpleDateFormat("dd/MMM/YYYY");           
					    Object begin_date=outputDateFormat5.format(tempDate5);
							 System.out.println("begin_date.."+begin_date); 
							 
					 String ending_date6=inner[3];
					 
					 SimpleDateFormat simpleDateFormat6 = new SimpleDateFormat("yyyy-MM-dd");
					    Date tempDate6=simpleDateFormat6.parse(ending_date6);
					    SimpleDateFormat outputDateFormat6= new SimpleDateFormat("dd/MMM/YYYY");           
					    Object ending_date=outputDateFormat6.format(tempDate6);
							 System.out.println("ending_date.."+ending_date); 
							 
					 String effect=inner[4];
					 String remarks=inner[5];
					 String sid=inner[6];
					 
					 System.out.println("else else"+description+" "+begin_date+""+ending_date+""+effect+""+remarks+""+sid);
					 sql_name="update  EMP_FNF_BOND_SUMMARY set DESCRIPTION='"+description+"', BEGINNING_DATE='"+begin_date+"',  ENDING_DATE='"+ending_date+"',  EFFECT='"+effect+"' , REMARKS='"+remarks+"' where SID='"+sid+"' ";
					 
					 	System.out.println("this is the insert statement in else else part"+sql_name);
				
					 	st_else_task.addBatch(sql_name);
				 }
					 	int[] counter = st_else_task.executeBatch();
						 System.out.println("counter in bond updation"+counter);
						 con_else_task.commit();
						 displaymsg="Successfully Bond summary updated";
							 
								}	

								} catch (Exception e) {
									con_else_task.rollback();
									displaymsg="Sorry Please Try Again";
									e.printStackTrace();
									System.out.println("problem to bond updating  in else part");
									e.getMessage();
								}
				 
								finally{
									
									st_else_task.close();
									con_else_task.close();
									System.out.println("finally block");
								} 

		 }
		return displaymsg;
		
	}
	
	
	/* loan summary updation */

	public String loan_update_save(String favorite) throws SQLException,
			ParseException {
		System.out.println("bond update: favourate in java class is.."
				+ favorite);

		String[] str1 = favorite.split(";");
		int size = str1.length;
		System.out.println("size..." + size);
		String displaymsg = "";
		if (size == 1) {
			String[] str_if_value = favorite.split(",");
			System.out.println("inside if condition in hr_task assign");
			String subtype = str_if_value[0];
			String description = str_if_value[1];
			String loan_amount = str_if_value[2];
			String balance_amount = str_if_value[3];
			String repay_amount = str_if_value[4];
			String sid = str_if_value[5];
			System.out.println("if only" + subtype + " " + description + ""
					+ loan_amount + "" + balance_amount + "" + repay_amount
					+ "" + sid);

			Connection con_if_task = null;
			Statement st_if_task = null;

			String if_sql_query = "update  EMP_FNF_LOAN_SUMMARY set SUB_TYPE='"
					+ subtype + "', DESCRIPTION='" + description
					+ "',  LOAN_AMOUNT='" + loan_amount
					+ "',  BALANCE_AMOUNT='" + balance_amount
					+ "' , SPE_REPAYMENT_AMOUNT='" + repay_amount
					+ "' where SID='" + sid + "' ";

			try {
				con_if_task = GetConnection.getConnection();
				st_if_task = con_if_task.createStatement();
				int res_data = st_if_task.executeUpdate(if_sql_query);
				if (res_data > 0) {
					displaymsg = "Successfully Loan summary updated";
				}

			} catch (Exception e) {
				System.out
						.println("problem in inside if condition in bond summary updation");
				e.printStackTrace();
			} finally {
				st_if_task.close();
				con_if_task.close();
			}

		} else {
			String[] str_els = favorite.split(";");

			System.out.println("lenth in else" + str_els.length);

			Connection con_else_task = null;
			Statement st_else_task = null;
			try {
				// String[] str_els=values.split(";");

				con_else_task = GetConnection.getConnection();
				st_else_task = con_else_task.createStatement();
				con_else_task.setAutoCommit(false);

				for (int i = 0; i < str_els.length; i++) {
					String sql_name = "sql_query_else" + i;

					String[] inner = str_els[i].split(",");
					if (i == 0) {

						String subtype = inner[0];
						String description = inner[1];
						String loan_amount = inner[2];
						String balance_amount = inner[3];
						String repay_amount = inner[4];
						String sid = inner[5];

						sql_name = "update  EMP_FNF_LOAN_SUMMARY set SUB_TYPE='"
								+ subtype
								+ "', DESCRIPTION='"
								+ description
								+ "',  LOAN_AMOUNT='"
								+ loan_amount
								+ "',  BALANCE_AMOUNT='"
								+ balance_amount
								+ "' , SPE_REPAYMENT_AMOUNT='"
								+ repay_amount
								+ "' where SID='" + sid + "' ";

						System.out
								.println("this is the UPDATE statement in else if part"
										+ sql_name);
						st_else_task.addBatch(sql_name);

					} else {

						String un_necessar = inner[0];
						String subtype = inner[1];
						String description = inner[2];
						String loan_amount = inner[3];
						String balance_amount = inner[4];
						String repay_amount = inner[5];
						String sid = inner[6];

						System.out
								.println("else else" + subtype + " "
										+ description + "" + loan_amount + ""
										+ balance_amount + "" + repay_amount
										+ "" + sid);
						sql_name = "update  EMP_FNF_LOAN_SUMMARY set SUB_TYPE='"
								+ subtype
								+ "', DESCRIPTION='"
								+ description
								+ "',  LOAN_AMOUNT='"
								+ loan_amount
								+ "',  BALANCE_AMOUNT='"
								+ balance_amount
								+ "' , SPE_REPAYMENT_AMOUNT='"
								+ repay_amount
								+ "' where SID='" + sid + "' ";

						System.out
								.println("this is the update statement in else else part"
										+ sql_name);

						st_else_task.addBatch(sql_name);
					}
					int[] counter = st_else_task.executeBatch();
					System.out.println("counter in loan updation" + counter);
					con_else_task.commit();
					displaymsg = "Successfully Loan summary updated";

				}

			} catch (Exception e) {
				con_else_task.rollback();
				displaymsg = "Sorry Please Try Again";
				e.printStackTrace();
				System.out.println("problem to loan updating  in else part");
				e.getMessage();
			}

			finally {

				st_else_task.close();
				con_else_task.close();
				System.out.println("finally block");
			}

		}
		return displaymsg;

	}
	
	
	/* Bank details method */
	
	public ArrayList<String> bank_retrieval(String seq_no) throws SQLException
	{
		
		ArrayList<String> bak_info=new ArrayList<String>();
		
		Connection con_bank=null;
		Statement st_bank=null;
		ResultSet rs_bank=null;
		String fetch_bank_info="select BANK_NAME,ACC_NO from BANKINFO where EMP_ID in (select emp_id from E_SEPARATION_EMP where SEQUENCE_NO='"+seq_no+"')";
		String bank_name="";
		String acc_no="";
		
		try
		{
			con_bank=GetConnection.getConnection();
			st_bank=con_bank.createStatement();
			rs_bank=st_bank.executeQuery(fetch_bank_info);
			if(rs_bank.next())
			{
				bank_name=rs_bank.getString("BANK_NAME");
				if(bank_name==null)
				{
					bank_name="";
				}
				acc_no=rs_bank.getString("ACC_NO");
				if(acc_no==null)
				{
					acc_no="";
				}
				
			}
			else
			{
				bank_name="";
				acc_no="";
			}
			
			String total_data=bank_name+"^"+acc_no;
			bak_info.add(total_data);
			
		}
		catch(Exception e)
		{
			System.out.println("problem in fetching bank details from db");
			e.printStackTrace();
		}
		finally{
			
			rs_bank.close();
			 st_bank.close();
			 con_bank.close();
		}
		
		
		return bak_info;
		
	}
	
	
	
	
	
	public ArrayList<String> bank_info_fandf_settlement(String seq_no) throws SQLException
	{
		
		ArrayList<String> bak_info_new=new ArrayList<String>();
		
		Connection con_bank_new=null;
		Statement st_bank_new=null;
		ResultSet rs_bank_new=null;
		//String fetch_bank_info="select BANK_EMP,ACC_NO_EMP,MICR_NO_EMP,CHEQUE_ADV,BANK_ACC_ADV,BANK_NAME_ADV,AMOUNT_ADV,DATE_ADV from BANK_TABLE_FANDF_SETTLEMENT where EMP_ID in (select emp_id from E_SEPARATION_EMP where SEQUENCE_NO='"+seq_no+"')";
		
		String fetch_bank_info="select BANK_EMP,ACC_NO_EMP,MICR_NO_EMP,CHEQUE_ADV,BANK_ACC_ADV,BANK_NAME_ADV,AMOUNT_ADV,DATE_ADV from BANK_TABLE_FANDF_SETTLEMENT where EMP_ID='"+seq_no+"'";
		
		String BANK_EMP="";
		String ACC_NO_EMP="";
		String MICR_NO_EMP="";
		
		String CHEQUE_ADV="";
		String BANK_ACC_ADV="";
		String BANK_NAME_ADV="";
		
		String AMOUNT_ADV="";
		Date DATE_ADV = null;
		
		
		try
		{
			con_bank_new=GetConnection.getConnection();
			st_bank_new=con_bank_new.createStatement();
			rs_bank_new=st_bank_new.executeQuery(fetch_bank_info);
			if(rs_bank_new.next())
			{
				BANK_EMP=rs_bank_new.getString("BANK_EMP");
				if(BANK_EMP==null)
				{
					BANK_EMP="";
				}
				ACC_NO_EMP=rs_bank_new.getString("ACC_NO_EMP");
				if(ACC_NO_EMP==null)
				{
					ACC_NO_EMP="";
				}
				MICR_NO_EMP=rs_bank_new.getString("MICR_NO_EMP");
				if(MICR_NO_EMP==null)
				{
					MICR_NO_EMP="";
				}
				
				
				CHEQUE_ADV=rs_bank_new.getString("CHEQUE_ADV");
				if(CHEQUE_ADV==null)
				{
					CHEQUE_ADV="";
				}
				
				BANK_ACC_ADV=rs_bank_new.getString("BANK_ACC_ADV");
				if(BANK_ACC_ADV==null)
				{
					BANK_ACC_ADV="";
				}
				
				BANK_NAME_ADV=rs_bank_new.getString("BANK_NAME_ADV");
				if(BANK_NAME_ADV==null)
				{
					BANK_NAME_ADV="";
				}
				
				AMOUNT_ADV=rs_bank_new.getString("AMOUNT_ADV");
				if(AMOUNT_ADV==null)
				{
					AMOUNT_ADV="";
				}
				

				DATE_ADV=rs_bank_new.getDate("DATE_ADV");
				
				
			}
			else
			{
				BANK_EMP="";
				 ACC_NO_EMP="";
				 MICR_NO_EMP="";
				
				 CHEQUE_ADV="";
				 BANK_ACC_ADV="";
				 BANK_NAME_ADV="";
				
				 AMOUNT_ADV="";
			}
			String total_data=BANK_EMP+"^"+ACC_NO_EMP+"^"+MICR_NO_EMP+"^"+CHEQUE_ADV+"^"+BANK_ACC_ADV+"^"+BANK_NAME_ADV+"^"+AMOUNT_ADV+"^"+DATE_ADV+"^"+seq_no;
			bak_info_new.add(total_data);
		}
		catch(Exception e)
		{
			 
			
			System.out.println("problem in fetching bank details from db in f and f settlement");
			e.printStackTrace();
		}
		
		
		
		return bak_info_new;
	}
	
	
	
	public String inserting_bank_details(String bank_emp,String acc_no_emp,String micr_no_emp,String cheque_adv,String bank_acc_adv,String bank_name_adv,
			float amout_adv,Object bank_date,String seq_no) throws SQLException
	{
		
		Connection con_bank_insert=null;
		Statement st_nank_insert=null;
		
		Connection con_bank_update=null;
		Statement st_nank_update=null;
		
		
		String insert_msg="no";
		
		//System.out.println("bank date in jsp is"+bank_date);
		
		String insert_bank_sql="insert into BANK_TABLE_FANDF_SETTLEMENT (BANK_EMP,ACC_NO_EMP,MICR_NO_EMP,CHEQUE_ADV,BANK_ACC_ADV,BANK_NAME_ADV,AMOUNT_ADV,EMP_ID) values('"+bank_emp+"','"+acc_no_emp+"','"+micr_no_emp+"','"+cheque_adv+"','"+bank_acc_adv+"','"+bank_name_adv+"','"+amout_adv+"','"+seq_no+"')";
		
		
		
		String update_bank_details="update BANK_TABLE_FANDF_SETTLEMENT set BANK_EMP='"+bank_emp  +"',ACC_NO_EMP='"+acc_no_emp +"',MICR_NO_EMP='"+micr_no_emp +"',CHEQUE_ADV='"+cheque_adv +"',BANK_ACC_ADV='"+bank_acc_adv +"',BANK_NAME_ADV='"+bank_name_adv +"',AMOUNT_ADV='"+amout_adv +"' where EMP_ID='"+seq_no +"'";
		
		//System.out.println("bank date in jsp is avove comparision"+bank_date);
		
		
		if(bank_date!=null)
			
		{
			//System.out.println("bank date in jsp in side if condtion is"+bank_date);
			
			 insert_bank_sql="insert into BANK_TABLE_FANDF_SETTLEMENT (BANK_EMP,ACC_NO_EMP,MICR_NO_EMP,"
					+ "CHEQUE_ADV,BANK_ACC_ADV,BANK_NAME_ADV,AMOUNT_ADV,DATE_ADV,"
					+ "EMP_ID) values('"+bank_emp+"','"+acc_no_emp+"','"+micr_no_emp+"','"+cheque_adv+"','"+bank_acc_adv+"','"+bank_name_adv+"','"+amout_adv+"','"+bank_date+"','"+seq_no+"')";
		
			 update_bank_details="update BANK_TABLE_FANDF_SETTLEMENT set BANK_EMP='"+bank_emp  +"',ACC_NO_EMP='"+acc_no_emp +"',MICR_NO_EMP='"+micr_no_emp +"',CHEQUE_ADV='"+cheque_adv +"',BANK_ACC_ADV='"+bank_acc_adv +"',BANK_NAME_ADV='"+bank_name_adv +"',AMOUNT_ADV='"+amout_adv +"',DATE_ADV='"+bank_date +"' where EMP_ID='"+seq_no +"'";
		}
		
		
		
		try
		{
			//System.out.println("inside try"+bank_date);
			
			con_bank_insert=GetConnection.getConnection();
			st_nank_insert=con_bank_insert.createStatement();
			int res_insert=st_nank_insert.executeUpdate(insert_bank_sql);
			if(res_insert>=0)
			{
				insert_msg="insert";
			}
		}
		catch(Exception e)
		{
			//e.printStackTrace();
			con_bank_update=GetConnection.getConnection();
			st_nank_update=con_bank_update.createStatement();
			int res_update=st_nank_update.executeUpdate(update_bank_details);
			if(res_update>=0)
			{
				insert_msg="update";
			}
			
			
		}
		
		
		return insert_msg;
		
	}
	

	public String fnf_submit_to_SA(String seq_no,String hr_clearance_process_status) throws SQLException
	{
		
		Connection con=null;
		Statement stmt=null;
		
		String update_msg="";
		
		//System.out.println("bank date in jsp is"+bank_date);
		
		
		String update_qry="update E_SEPARATION_EMP set HR_CLEARANCE_PROCCESS_STATUS='"+hr_clearance_process_status+"' where SEQUENCE_NO='"+seq_no +"'";
		
		System.out.println("fnf_submit_to_SA Query..."+update_qry);
		
		try
		{
			con=GetConnection.getConnection();
			stmt=con.createStatement();
			int res_update=stmt.executeUpdate(update_qry);
			if(res_update>=0)
			{
				update_msg="Yes";
			}
		}
		catch(Exception e)
		{
			//e.printStackTrace();
			update_msg="No";
			System.out.println("problem to submit fnf report to Sanctioning authority");
			
		}
		
		
		return update_msg;
		
	}
	
	
	
	public ArrayList<String> hr_crearance_reports(String seq_no) throws SQLException
	{
		System.out.println("hr_crearance_reports");
		ArrayList<String> info=new ArrayList<String>();
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		/*HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String seq_no = request.getParameter("seq_no");*/
		
		String fetch_info="select HR_CLEARANCE_PROCCESS_STATUS from E_SEPARATION_EMP where SEQUENCE_NO='"+seq_no+"' ";
		String hr_clear_pro_sts="";
		System.out.println("hr_crearance_reports.."+fetch_info);
		
		try
		{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(fetch_info);
			
			if(rs.next())
			{
				 hr_clear_pro_sts=rs.getString("HR_CLEARANCE_PROCCESS_STATUS");
			}
			
			String total_data=hr_clear_pro_sts;
			info.add(total_data);
			
		}
		catch(Exception e)
		{
			System.out.println("problem in fetching HR_CLEARANCE_PROCCESS_STATUS from db");
			e.printStackTrace();
		}
		finally{
			
			rs.close();
			 st.close();
			 con.close();
		}
		
		
		return info;
		
	}
	
	
	
	
}

	