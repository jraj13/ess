package com.ess.common.eseparation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class IT_Support_Dueclearance {
	
	Map<String,Object> session = ActionContext.getContext().getSession();
	// Map session =(Map) ActionContext.getContext().get("session");

	Object emp_mailid = session.get("loginid");
	
	
	public  List<String> getstatus_dueclearance_Request() throws SQLException
	{
		 System.out.println(" getting initial info  in getstatus_dueclearance_Request phase"); 
		List<String> getinfo=new LinkedList<String>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		/*String hr_sql="select emp_id,CREATION_DATE,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD,SEPARATION_NOTE,RM_COMMENTS,SEQUENCE_NO from E_SEPARATION_EMP where  RM_APPROVE='Inprocess' and EMP_APPROVEL='Initiate' and ADMIN_APPROVE='Pending' and HR_APPROVE='Pending'";*/
		
		String hr_sql="select EMP_SEQ_NO,EMP_EMP_ID,TASK_LIST,MANAGER_MAIL_ID,TASK_ASSIGN_DATE from TASK_ASSIGN_SEPARATION where  MANAGER_MAIL_ID='"+emp_mailid+"'and STATUS_HR not in('Completed','Rejected')" ;
		
		System.out.println("hr_sql"+hr_sql);
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(hr_sql);
			while(rs.next())
			{
				String EMP_SEQ_NO=rs.getString("EMP_SEQ_NO");
				String EMP_EMP_ID=rs.getString("EMP_EMP_ID");
				String TASK_LIST=rs.getString("TASK_LIST");
				String MANAGER_MAIL_ID=rs.getString("MANAGER_MAIL_ID");
				Date TASK_ASSIGN_DATE=rs.getDate("TASK_ASSIGN_DATE");
				
			String data_hr=EMP_SEQ_NO+"^"+EMP_EMP_ID+"^"+TASK_LIST+"^"+MANAGER_MAIL_ID+"^"+TASK_ASSIGN_DATE;
			getinfo.add(data_hr);
			}
			
		}catch(Exception e)
		{
			System.out.println("Problem in getting data in getstatus_dueclearance_Request module");
			e.printStackTrace();
			}finally
		{
			rs.close();
			st.close();
			con.close();
		}
		
		return getinfo;
	}
	
	
	
	public ArrayList<String> e_separation_hr() throws SQLException	{
		 System.out.println(" getting e_separation_manager info  in s new class IN HR"); 
		 
		ArrayList<String> e_sep_manager=new ArrayList<String>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		//String sequence_id = request.getParameter("emp_id");
	//	System.out.println("sequence_id..."+sequence_id);
		String SEQUENCE_NO=request.getParameter("SEQUENCE_NO");
		System.out.println("SEQUENCE_NO.."+SEQUENCE_NO);
		
		/*String man_Sql="select emp_id,SEQUENCE_NO,CREATION_DATE,REASION_RESIGN,DETAILED_REASON,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD from E_SEPARATION_EMP where emp_id='"+sequence_id+"'";*/
		
		String man_Sql="select emp_id,SEQUENCE_NO,CREATION_DATE,REASION_RESIGN,DETAILED_REASON,RELEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD,ACTION_TYPE_RM,REASON_FOR_ACTION_RM,DETAILED_REASON_RM,PHY_REL_DATE_RM,HR_RELIEVING_DATE from E_SEPARATION_EMP where  SEQUENCE_NO='"+SEQUENCE_NO+"'";
		
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(man_Sql);
			String emp_id=null;
			String req_no=null;
			Date creation_date;
			String reason_action=null;
			String detailed_reason=null;
			Date rileaving_date;
			String actual_notice_period=null;
			String given_notice_period=null;
			
			String ACTION_TYPE_RM=null;
			String REASON_FOR_ACTION_RM=null;
			String DETAILED_REASON_RM=null;
			Date PHY_REL_DATE_RM;
			Date HR_RELIEVING_DATE=null;
			
			while(rs.next())
			{
				emp_id=rs.getString(1);
				req_no=rs.getString("SEQUENCE_NO");
				creation_date=rs.getDate("CREATION_DATE");
				reason_action=rs.getString("REASION_RESIGN");
				
				detailed_reason=rs.getString("DETAILED_REASON");
				rileaving_date=rs.getDate("RELEVING_DATE");
				actual_notice_period=rs.getString("ACTUAL_NOTICE_PERIOD");
				given_notice_period=rs.getString("GIVEN_NOTICE_PERIOD");
				
				ACTION_TYPE_RM=rs.getString("ACTION_TYPE_RM");
				REASON_FOR_ACTION_RM=rs.getString("REASON_FOR_ACTION_RM");
				DETAILED_REASON_RM=rs.getString("DETAILED_REASON_RM");
				PHY_REL_DATE_RM=rs.getDate("PHY_REL_DATE_RM");
				HR_RELIEVING_DATE=rs.getDate("HR_RELIEVING_DATE");
				
				
				String man_data=emp_id+"^"+req_no+"^"+creation_date+"^"+reason_action+"^"+detailed_reason+"^"+rileaving_date+"^" +actual_notice_period+"^"
						+given_notice_period +"^"+ ACTION_TYPE_RM +"^"+  REASON_FOR_ACTION_RM  +"^"+ DETAILED_REASON_RM +"^"+ PHY_REL_DATE_RM +"^"+ HR_RELIEVING_DATE;
				e_sep_manager.add(man_data);
			}
			
		
		}catch(Exception e){
			System.out.println("Problem in reults in e-Separation Mnager side");
			e.printStackTrace();
		}
		finally{
			rs.close();
			st.close();
			con.close();
		}
		return e_sep_manager;
	}
	
	
	/* for fetching department based on loginid  */
	
	public static String dept_desig() throws SQLException{

		Connection con_desig=null;
		Statement st_desig=null;
		ResultSet rs_design=null;
		Map<String,Object> session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");

		String hr_sql_query="Select EMP_DESIG from NCSS_EMP_MASTER_INFO where EMP_ID='"+id+"'";
		String emp_desig=null;
		try
		{
			con_desig=GetConnection.getConnection();
			st_desig=con_desig.createStatement();
			rs_design=st_desig.executeQuery(hr_sql_query);
			while(rs_design.next())
			{
				emp_desig=rs_design.getString("EMP_DESIG");
			}
			
		}catch(Exception e)
		{
			System.out.println("Problem in geeting data in e-separation hr level");
			e.printStackTrace();
		}
		finally{
			rs_design.close();
			st_desig.close();
			con_desig.close();
		}
		System.out.println("final result is"+emp_desig);
		return emp_desig;

		}

			
		//fetching the details based on the department

	public  ArrayList<String> department_based_department() throws SQLException{
		
		System.out.println("come in department_based_department method");
		ArrayList<String> department_data=new ArrayList<String>();
		Connection con_dept=null;
		Statement st_dept=null;
		ResultSet rs_dept=null;

		Map<String,Object> session = ActionContext.getContext().getSession();
		String emp_mail_id = (String) session.get("loginid");
		System.out.println("emp_mail_id//"+emp_mail_id);
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
		.getContext().get(ServletActionContext.HTTP_REQUEST);

		String sequence_id=request.getParameter("SEQUENCE_NO").trim();
		System.out.println("sequence_id//"+sequence_id);

		String dept=IT_Support_Dueclearance.dept_desig();
		System.out.println("dept//"+dept);

	//	String hr_sql_query="select t_list.SR_NO,t_list.TASK_NAME from TASK_LIST t_list,TASK_ASSIGN_SEPARATION t_assign where t_list.DEPARTMENT='IT SUPPORT TEAM' and t_assign.MANAGER_MAIL_ID='BALAJI.KONERU@CLOCKSOFT.INFO' and t_assign.STATUS_HR='Initiate' and t_assign.EMP_SEQ_NO='105'";

	String hr_sql_query="select t_list.SR_NO,t_list.TASK_NAME from TASK_LIST t_list,TASK_ASSIGN_SEPARATION t_assign where t_list.DEPARTMENT='"+dept+"' and t_assign.MANAGER_MAIL_ID='"+emp_mail_id+"' and t_assign.STATUS_HR='Initiate' and t_assign.EMP_SEQ_NO='"+sequence_id+"'";
System.out.println(hr_sql_query);
		String task_name=null;
		String task_number=null;
		try
		{
			con_dept=GetConnection.getConnection();
			st_dept=con_dept.createStatement();
			rs_dept=st_dept.executeQuery(hr_sql_query);
			while(rs_dept.next())
			{
				task_number=rs_dept.getString("SR_NO");
				task_name=rs_dept.getString("TASK_NAME");
				
				String total_data=task_number+"^"+task_name;
				
				department_data.add(total_data);
			}
			
		}catch(Exception e)
		{
			System.out.println("Problem in geeting data in e-separation hr level");
			e.printStackTrace();
		}
		finally{
			rs_dept.close();
			st_dept.close();
			con_dept.close();
		}
		System.out.println("final result is"+department_data);
		return department_data;

		}
	
	
	
	public  String saveDueClearanceStatus(String taskstatus,String sequence_no,String t_owner_remarks) throws SQLException
	{
		System.out.println(" update the status in HR class");
		Connection con=null;
		Statement st=null;
		String res_status_report="";
		
	/*	Map<String,Object> session = ActionContext.getContext().getSession();
		String emp_mail_id = (String) session.get("loginid");
		System.out.println("emp_mail_id//"+emp_mail_id);
		*/
		/*String status_update="update E_SEPARATION_EMP set RM_APPROVE='"+status+"', GIVEN_NOTICE_PERIOD='"+given_notice+"', RM_COMMENTS='"+comments_text+"',  RELEVING_DATE='"+r_date+"' where EMP_ID='"+emp_id+"' and SEQUENCE_NO='"+seq_id+"'";*/
		
		String status_update="update TASK_ASSIGN_SEPARATION set STATUS_HR='"+taskstatus+"',TASK_OWNER_REMARKS='"+t_owner_remarks+"' where MANAGER_MAIL_ID='"+emp_mailid+"' and EMP_SEQ_NO='"+sequence_no+"'";
	
		System.out.println("the query in update is "+status_update);
		try{
			con=GetConnection.getConnection();
			st=con.createStatement();
			int res=st.executeUpdate(status_update);
			if(res>0)
			{
				res_status_report="Yes";
			}
			
		}catch(Exception e)
		{
			res_status_report="No";
			System.out.println("Problem in update record after rm approves/reject");
			e.printStackTrace();
		}
		finally
		{
			st.close();
			con.close();
		}
		return res_status_report;
		
	}
	
	
	/*
	 * 
	 * inserting the task deails in the table 
	 * 
	 */
	
	
	public String saveTasks(String favorite,String seq_no) throws SQLException
	{
		System.out.println("the favourate in java class is"+favorite);
		
		String[] str1=favorite.split(";");
		 int size = str1.length;
		 System.out.println("size..."+size);
		 String displaymsg="Sorry Please Try Again";
		 if(size==1)
		 {
			 String[] str_if_value=favorite.split(",");
			 System.out.println("inside if condition in hr_task assign");
			 String task_no = str_if_value[0];
			 String task_name = str_if_value[1];
			 String status=str_if_value[2];
			 String amount=str_if_value[3];
			 String remarks=str_if_value[4];
			 System.out.println("if only"+task_no+" "+task_name+""+status+""+amount+""+remarks);
			 
			 Connection con_if_task=null;
			 Statement st_if_task=null;
			 
			String if_sql_query="insert into TASK_CLEARANCE_STATUS(TASK_NO,TASK_TYPE,TASK_STATUS,AMOUNT,REMARKS,EMP_SEQ_NO,MANAGER_MAIL_ID,TASK_CLEARANCE_DATE) "
					+ "values('"+task_no+"','"+task_name+"','"+status+"','"+amount+"','"+remarks+"','"+seq_no+"','"+emp_mailid+"',to_date(sysdate,'DD/MM/YY'))";
			 
			 try{
			con_if_task=GetConnection.getConnection();
			st_if_task=con_if_task.createStatement();
			int res_data=st_if_task.executeUpdate(if_sql_query);
			if(res_data>0){
				
				displaymsg="Successfully Task status updated";
				
			}
			 
			 }catch(Exception e){
				 System.out.println("problem in inside if condition in hr_task assign");
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
					
					 String task_no = inner[0];
					 String task_name = inner[1];
					 String status=inner[2];
					 String amount=inner[3];
					 String remarks=inner[4];
					 
					  sql_name="insert into TASK_CLEARANCE_STATUS(TASK_NO,TASK_TYPE,TASK_STATUS,AMOUNT,REMARKS,EMP_SEQ_NO,MANAGER_MAIL_ID,TASK_CLEARANCE_DATE) "
								+ "values('"+task_no+"','"+task_name+"','"+status+"','"+amount+"','"+remarks+"','"+seq_no+"','"+emp_mailid+"',to_date(sysdate,'DD/MM/YY'))";
						
					 	System.out.println("this is the insert statement in else if part"+sql_name);
					 	st_else_task.addBatch(sql_name);
					 
				 }
				 else
				 {
					 String un_necessar=inner[0];
					 String task_no = inner[1];
					 String task_name = inner[2];
					 String status=inner[3];
					 String amount=inner[4];
					 String remarks=inner[5];
					 System.out.println("else else"+task_no+" "+task_name+""+status+""+amount+""+remarks);
					 sql_name="insert into TASK_CLEARANCE_STATUS(TASK_NO,TASK_TYPE,TASK_STATUS,AMOUNT,REMARKS,EMP_SEQ_NO,MANAGER_MAIL_ID,TASK_CLEARANCE_DATE) "
								+ "values('"+task_no+"','"+task_name+"','"+status+"','"+amount+"','"+remarks+"','"+seq_no+"','"+emp_mailid+"',to_date(sysdate,'DD/MM/YY'))";
					 
					 	System.out.println("this is the insert statement in else else part"+sql_name);
				
					 	st_else_task.addBatch(sql_name);
				 }
					 	int[] counter = st_else_task.executeBatch();
						 System.out.println("counter in hr task assign"+counter);
						 con_else_task.commit();
						 displaymsg="Successfully Tasks are Assigned";
							 
								}	

								} catch (Exception e) {
									con_else_task.rollback();
									displaymsg="Sorry Please Try Again";
									e.printStackTrace();
									System.out.println("problem to insert the clearance in else part");
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
	
	
	
	
	
	
	


}
