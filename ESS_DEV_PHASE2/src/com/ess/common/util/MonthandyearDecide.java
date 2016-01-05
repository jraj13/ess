package com.ess.common.util;


public class MonthandyearDecide {

	
		
	public String monthyear(){
	
		String future_years=null;
		String old_yars=null;
		String curr_year=null;
		String final_str=null;
		
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		String du=df.format(new java.util.Date());
		int month=Integer.parseInt(du.substring(3,5));
		int year=Integer.parseInt(du.substring(6,10));
		//int month=2;
		int h_year=year+1;
		int l_year=year-1;
		if(month>=4){
			
			future_years=String.valueOf(h_year);
			curr_year=String.valueOf(year);
			final_str=curr_year+"^"+future_years;
		}
		else
		{
			old_yars=String.valueOf(l_year);
			curr_year=String.valueOf(year);
			final_str=old_yars+"^"+curr_year;
		}
		
		System.out.println("fianl string in month decide"+final_str);
		
	return final_str;
}
	
	
	
/*	
	USE IN JSP PAGE
	
	MonthandyearDecide mm=new MonthandyearDecide();
	String mm_year=mm.monthyear();
	
	String empPersonalInfoAry11[]=mm_year.split("\\^");
	String fy_start = empPersonalInfoAry11[0];
	String fy_end =empPersonalInfoAry11[1];
	*/
	
	
	public static void main(String[] args) {
		MonthandyearDecide mm=new MonthandyearDecide();
		String mm_year=mm.monthyear();
		System.out.println("month and year"+mm_year);
	}
}
