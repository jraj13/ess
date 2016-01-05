package com.ess.common.action;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.ess.common.bean.PersonalDetailsBean;
import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;



public class CtcStatementAction {
	
	
	
	
	
	private String finalString = "";

	ArrayList<PersonalDetailsBean> list = new ArrayList<PersonalDetailsBean>();
	
	public String generate() throws SQLException {
    	Connection con = GetConnection.getConnection();
		
		CallableStatement stmt=null;
				
		 double basicpay=0.0;
		 double pro_fund=0.0;
		 double gratuty=0.0;
		 double total_base_pay=0.0;
		 double adv_bonus=0.0;
		 double tot_man_debit=0.0;
		 double medical=0.0;
		 double convayance=0.0;
		 double lta=0.0;
		 double hra=0.0;
		 double tot_oth_choice_items=0.0;
		 double tot_choice_pay=0.0;
		 double total_ctc=0.0;
		 double pli=0.0;
		 double overall_ctc=0.0;
		 
	 Map session = ActionContext.getContext().getSession();
			String id = (String) session.get("empid");

		
		
        try {
        	
        	String sql="{call ctcstatementprocedure(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
        	stmt=con.prepareCall(sql);
        	stmt.setString(1,id);
        	
        	 
        	stmt.registerOutParameter(2,java.sql.Types.FLOAT);
        	stmt.registerOutParameter(3,java.sql.Types.FLOAT);
        	stmt.registerOutParameter(4,java.sql.Types.FLOAT);
        	stmt.registerOutParameter(5,java.sql.Types.FLOAT);
        	stmt.registerOutParameter(6,java.sql.Types.FLOAT);
        	stmt.registerOutParameter(7,java.sql.Types.FLOAT);
        	stmt.registerOutParameter(8,java.sql.Types.FLOAT);
        	stmt.registerOutParameter(9,java.sql.Types.FLOAT);
        	stmt.registerOutParameter(10,java.sql.Types.FLOAT);
        	stmt.registerOutParameter(11,java.sql.Types.FLOAT);
        	stmt.registerOutParameter(12,java.sql.Types.FLOAT);
        	stmt.registerOutParameter(13,java.sql.Types.FLOAT);
        	stmt.registerOutParameter(14,java.sql.Types.FLOAT);
        	stmt.registerOutParameter(15,java.sql.Types.FLOAT);
        	stmt.registerOutParameter(16,java.sql.Types.FLOAT); 
        	stmt.execute();  
        	
        	basicpay=stmt.getFloat(2); 
        	pro_fund=stmt.getFloat(3); 
        	gratuty=stmt.getFloat(4); 
        	total_base_pay=stmt.getFloat(5); 
        	adv_bonus=stmt.getFloat(6); 
        	tot_man_debit=stmt.getFloat(7); 
        	medical=stmt.getFloat(8); 
        	convayance=stmt.getFloat(9); 
        	lta=stmt.getFloat(10); 
        	hra=stmt.getFloat(11); 
        	tot_oth_choice_items=stmt.getFloat(12); 
        	tot_choice_pay=stmt.getFloat(13); 
        	total_ctc=stmt.getFloat(14); 
        	pli=stmt.getFloat(15); 
        	overall_ctc=stmt.getFloat(16); 
        	
        	finalString = basicpay + "^" + pro_fund + "^"
					+ gratuty + "^" + total_base_pay + "^" + adv_bonus + "^" + tot_man_debit + "^"
					+ medical + "^" + convayance + "^" + lta + "^" + hra+ "^"
					+ tot_oth_choice_items + "^" + tot_choice_pay + "^" + total_ctc+ "^" + pli + "^" +  overall_ctc;
        	System.out.println("final String..."+finalString);
} catch (Exception e) {

            e.printStackTrace();
        }
        return finalString;
	}
public static void main(String args[]){
 try{
	 CtcStatementAction aa=new CtcStatementAction();
	 aa.generate();
}
 catch(Exception e)
 {
	 e.printStackTrace();
 }
}
}

