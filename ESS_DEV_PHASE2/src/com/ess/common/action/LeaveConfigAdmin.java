package com.ess.common.action;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class LeaveConfigAdmin {

	public ArrayList<Object> leaves_config() {
		System.out.print("leaves_config");
		ArrayList<Object> l_config = new ArrayList<Object>();

		String att_config_sql = "Select LEAVES_TYPE,LEAVE_DAYS from LEAVES_CONFIGURATIONS_INFO";
		System.out.print(att_config_sql);

		Connection con = null;
		Statement st = null;
		ResultSet rs_leaves = null;

		try {
			con = GetConnection.getConnection();
			st = con.createStatement();

			rs_leaves = st.executeQuery(att_config_sql);

			// String LEAVES_TYPE=null;
			float LEAVE_DAYS = 0.0f;

			while (rs_leaves.next()) {

				// LEAVES_TYPE=rs_leaves.getString("LEAVES_TYPE");
				LEAVE_DAYS = rs_leaves.getFloat("LEAVE_DAYS");

				float leaves_details = LEAVE_DAYS;
				System.out.println(leaves_details);
				l_config.add(leaves_details);
			}

		} catch (Exception e) {
			System.out.println("problems in fetching leaves details");
			e.printStackTrace();
		} finally {

		}

		return l_config;

	}

	public String update_Leaves_Config(float pl, float sl, float cl,
			float advpl, float advsl, float compoOFF) throws SQLException {

		System.out.println("update_Leaves_Config");
		String reply_msg = "Sorry Try Again";
		CallableStatement cstmt = null;
		Connection con = null;
		/*
		 * String leaves_config_procedure =
		 * "{call LEAVES_CONFIGURATION.leaves_config_update (?,?,?,?,?,?)}";
		 */

		String leaves_config_procedure = "{call LEAVES_CONFIGURATIONS_ADMIN.leaves_config_update_admin (?,?,?,?,?,?)}";

		try {
			con = GetConnection.getConnection();

			cstmt = con.prepareCall(leaves_config_procedure);
			cstmt.setFloat(1, pl);
			cstmt.setFloat(2, sl);
			cstmt.setFloat(3, cl);

			cstmt.setFloat(4, advpl);
			cstmt.setFloat(5, advsl);
			cstmt.setFloat(6, compoOFF);

			cstmt.executeUpdate();
			reply_msg = "Successfully Updated";
		} catch (Exception e) {
			reply_msg = "Sorry Try Again";
			System.out
					.println("Problem in modification in leaves configuration procedure");
			e.printStackTrace();
		}

		finally {
			cstmt.close();
			con.close();
		}

		return reply_msg;

	}

	public String saveLeaveAssigned_forall_emp() throws SQLException {
		System.out.println("update the status in saveLeaveAssigned");
		CallableStatement cstmt = null;
		Connection con = null;
		String response = "";

		String leaves_assign_procedure = "{call ASSIGN_LEAVES_ONCE.fetching_all_employees}";
		System.out.println("the query in leave assign is"
				+ leaves_assign_procedure);
		try {
			con = GetConnection.getConnection();

			cstmt = con.prepareCall(leaves_assign_procedure);
			int res = cstmt.executeUpdate();

			if (res > 0) {
				response = "Yes";
			}

		} catch (Exception e) {
			response = "No";
			System.out.println("Problem in assing leave ");
			e.printStackTrace();
		} finally {

			cstmt.close();
			con.close();
		}
		return response;

	}

	/* FOR GETTING  PERTICULRA EMPLOYEE LEAVE DETAILS BY ADMIN FOR UPDATING */
	
	public ArrayList<Object> saveLeaveAssigned_for_a_emp() {
		System.out.println("leaves_config");
		ArrayList<Object> l_config = new ArrayList<Object>();

		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String emp_id=request.getParameter("empid").toUpperCase();
		String monthid=request.getParameter("monthid"); 
		int month_id=Integer.parseInt(monthid);
		System.out.println("empid.."+emp_id+ ",  monthid.."+month_id);
		
		String att_config_sql = "{call INDIVIDUAL_LEAVES_ASSIGN.indivial_assign_leaves_emp(?,?,?,?,?,?,?,?)}";

		System.out.print(att_config_sql);

		Connection con = null;
		CallableStatement cstmt=null;
		
		float pl=0.0f;
		float sl=0.0f;
		float cl=0.0f;
		float advpl=0.0f;
		float advsl=0.0f;
		float compoff=0.0f;
		

		try {
			con = GetConnection.getConnection();
			cstmt = con.prepareCall(att_config_sql);

			cstmt.setString(1, emp_id);
			cstmt.setInt(2, month_id);

			cstmt.registerOutParameter(3, java.sql.Types.FLOAT);
			cstmt.registerOutParameter(4, java.sql.Types.FLOAT);
			cstmt.registerOutParameter(5, java.sql.Types.FLOAT);
			cstmt.registerOutParameter(6, java.sql.Types.FLOAT);
			cstmt.registerOutParameter(7, java.sql.Types.FLOAT);
			cstmt.registerOutParameter(8, java.sql.Types.FLOAT);

			cstmt.executeUpdate();

			pl = cstmt.getFloat(3);
			sl = cstmt.getFloat(4);
			cl = cstmt.getFloat(5);
			advpl = cstmt.getFloat(6);
			advsl = cstmt.getFloat(7);
			compoff = cstmt.getFloat(8);
			
			String leave_details=pl +"^"+ sl +"^"+ cl +"^"+ advpl +"^"+ advsl +"^"+ compoff;
			System.out.println("fetch leave details.." +leave_details);
			System.out.println("empid.."+emp_id);
			
			l_config.add(leave_details);

		} catch (Exception e) {
			System.out.println("problems in fetching leaves details");
			e.printStackTrace();
		} finally {

		}

		return l_config;

	}
	
	/* FOR ASSINGING LEAVE TO PERTICULAR EMPLOYEE */
	
	public String insert_Leaves_first_time(String emp_id, float pl, float sl,
			float cl, float adv_pl, float adv_sl, float compoff)
			throws SQLException {
		System.out.println("This is inserting the leaves first time to the employees");
		CallableStatement cstmt_leaves = null;
		Connection con_leaves = null;
		String leaves_insert_sql = "{call INDIVIDUAL_LEAVES_ASSIGN.insert_new_leaves (?,?,?,?,?,?,?)}";
		String response = "";

		try {
			con_leaves = GetConnection.getConnection();

			cstmt_leaves = con_leaves.prepareCall(leaves_insert_sql);

			cstmt_leaves.setString(1, emp_id);

			cstmt_leaves.setFloat(2, pl);
			cstmt_leaves.setFloat(3, sl);
			cstmt_leaves.setFloat(4, cl);

			cstmt_leaves.setFloat(5, adv_pl);
			cstmt_leaves.setFloat(6, adv_sl);
			cstmt_leaves.setFloat(7, compoff);

			int res = cstmt_leaves.executeUpdate();

			if (res > 0) {
				response = "Yes";
			}

		} catch (Exception e) {
			response = "No";
			System.out
					.println("Problem in inserting leaves in table trhrough procedures");
			e.printStackTrace();
		}

		finally {
			cstmt_leaves.close();
			con_leaves.close();
		}

		return response;
	}
	
	
	/* fetching modified the employee leaves once again uI */

	public ArrayList<String> input_modification_to_employee(String emp_id)
			throws SQLException {

		ArrayList<String> modify_input = new ArrayList<String>();
		System.out
				.println("This is getting the leaves info for employees through procedures");
		CallableStatement cstmt_emp = null;
		Connection con_emp = null;
		String fetching_leaves_info_sql = "{call INDIVIDUAL_LEAVES_ASSIGN.modifying_middle_leaves (?,?,?,?,?,?,?,?,?,?,?,?,?)}";

		// procedure modifying_middle_leaves(employee_id in varchar2,tot_pl out
		// number,ava_pl out number,tot_sl out number,ava_sl out number
		// ,tot_cl out number,ava_cl out number,tot_advpl out number,ava_advpl
		// out number,
		// tot_advsl out number,ava_advsl out number,tot_comoff out
		// number,ava_comoff out number)

		float opening_pl = 0.0f;
		float opening_sl = 0.0f;
		float opening_cl = 0.0f;

		float opening_adv_pl = 0.0f;
		float opening_adv_sl = 0.0f;
		float opening_comoff = 0.0f;

		float available_pl = 0.0f;
		float available_sl = 0.0f;
		float available_cl = 0.0f;

		float available_adv_pl = 0.0f;
		float available_adv_sl = 0.0f;
		float available_comoff = 0.0f;

		try {
			con_emp = GetConnection.getConnection();

			cstmt_emp = con_emp.prepareCall(fetching_leaves_info_sql);

			cstmt_emp.setString(1, emp_id);

			cstmt_emp.registerOutParameter(2, java.sql.Types.FLOAT);
			cstmt_emp.registerOutParameter(3, java.sql.Types.FLOAT);
			cstmt_emp.registerOutParameter(4, java.sql.Types.FLOAT);
			cstmt_emp.registerOutParameter(5, java.sql.Types.FLOAT);

			cstmt_emp.registerOutParameter(6, java.sql.Types.FLOAT);
			cstmt_emp.registerOutParameter(7, java.sql.Types.FLOAT);
			cstmt_emp.registerOutParameter(8, java.sql.Types.FLOAT);

			cstmt_emp.registerOutParameter(9, java.sql.Types.FLOAT);
			cstmt_emp.registerOutParameter(10, java.sql.Types.FLOAT);
			cstmt_emp.registerOutParameter(11, java.sql.Types.FLOAT);
			cstmt_emp.registerOutParameter(12, java.sql.Types.FLOAT);
			cstmt_emp.registerOutParameter(13, java.sql.Types.FLOAT);

			cstmt_emp.executeUpdate();

			opening_pl = cstmt_emp.getFloat(2);
			available_pl = cstmt_emp.getFloat(3);

			opening_sl = cstmt_emp.getFloat(4);
			available_sl = cstmt_emp.getFloat(5);

			opening_cl = cstmt_emp.getFloat(6);
			available_cl = cstmt_emp.getFloat(7);

			opening_adv_pl = cstmt_emp.getFloat(8);
			available_adv_pl = cstmt_emp.getFloat(9);

			opening_adv_sl = cstmt_emp.getFloat(10);
			available_adv_sl = cstmt_emp.getFloat(11);

			opening_comoff = cstmt_emp.getFloat(12);
			available_comoff = cstmt_emp.getFloat(12);

			String result_arr = opening_pl + "^" + available_pl + "^"+ opening_sl + "^" + available_sl + "^" + opening_cl + "^"
					+ available_cl + "^" +opening_adv_pl + "^" + available_adv_pl + "^"+ opening_adv_sl + "^" + available_adv_sl + "^"
					+ opening_comoff  + "^"+ available_comoff;
			System.out.println("result_arr...."+result_arr);
			modify_input.add(result_arr);

		} catch (Exception e) {

			System.out
					.println("Problem in fetchinf  leaves from table trhrough procedures");
			e.printStackTrace();
		}

		finally {
			cstmt_emp.close();
			con_emp.close();
		}

		return modify_input;
	}

	/* after assign the employee leaves freshly then update option is*/
	
	public String update_Modified_Leaves(String emp_id,
	float new_pl,float new_sl,float new_cl,float new_adv_pl,float new_adv_sl,float new_comoff,
	float opening_pl,float opening_sl,float opening_cl,float opening_adv_pl,float opening_adv_sl,float opening_comoff,
	float ava_pl,float ava_sl,float ava_cl,float ava_adv_pl,float ava_adv_sl,float ava_comoff
	) throws SQLException
			{
		
		System.out.println("This is inserting the leaves after modifying leaves to employees");
		System.out.println("emp_id.."+emp_id);
		CallableStatement cstmt_leaves = null;
		Connection con_leaves = null;
		String leaves_insert_sql = "{call INDIVIDUAL_LEAVES_ASSIGN.modifying_save (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		String reply_msg = "";

		try {
			con_leaves = GetConnection.getConnection();
		
			cstmt_leaves = con_leaves.prepareCall(leaves_insert_sql);
		
			cstmt_leaves.setString(1, emp_id);
		
			cstmt_leaves.setFloat(2, new_pl);
			cstmt_leaves.setFloat(3, new_sl);
			cstmt_leaves.setFloat(4, new_cl);
			
			cstmt_leaves.setFloat(5, new_adv_pl);
			cstmt_leaves.setFloat(6, new_adv_sl);
			cstmt_leaves.setFloat(7, new_comoff);
			
			cstmt_leaves.setFloat(8, opening_pl);
			cstmt_leaves.setFloat(9, opening_sl);
			cstmt_leaves.setFloat(10, opening_cl);
			
			cstmt_leaves.setFloat(11, opening_adv_pl);
			cstmt_leaves.setFloat(12, opening_adv_sl);
			cstmt_leaves.setFloat(13, opening_comoff);
			
			
			cstmt_leaves.setFloat(14, ava_pl);
			cstmt_leaves.setFloat(15, ava_sl);
			cstmt_leaves.setFloat(16, ava_cl);
			
			cstmt_leaves.setFloat(17, ava_adv_pl);
			cstmt_leaves.setFloat(18, ava_adv_sl);
			cstmt_leaves.setFloat(19, ava_comoff);
			
			
			cstmt_leaves.executeUpdate();
			reply_msg = "Sucessfully modified leave";
			System.out.println("Sucessfully modified leave in class");
		
		} catch (Exception e) {
			reply_msg = "Sorry Try Again";
			System.out
					.println("Problem in inserting leaves after modifying leaves to employee in table trhrough procedures");
			e.printStackTrace();
		}
		
		finally {
			cstmt_leaves.close();
			con_leaves.close();
		}
		
		return reply_msg;
		}
	
	

}
