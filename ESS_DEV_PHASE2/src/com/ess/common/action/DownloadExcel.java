/*
package com.ess.common.action;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.poi.hssf.usermodel.HSSFRow;
//import  org.apache.poi.hssf.usermodel.HSSFCell;  
// import java.util.Date;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionSupport;
public class DownloadExcel  extends ActionSupport
{
	public static final String SUCCESS = "success";

	public static String download(){
	System.out.println("it is calling download method1");
	try{
		//Date date=new Date();
		//String id="CSSE150059";
	String filename="E:/data.xls" ;
	
	HSSFWorkbook hwb=new HSSFWorkbook();
	HSSFSheet sheet =  hwb.createSheet("new sheet");
	System.out.println("it is calling download method2");
	HSSFRow rowhead=   sheet.createRow((short)0);
	rowhead.createCell((short) 0).setCellValue("Date");
	rowhead.createCell((short) 1).setCellValue("ID Number");
	rowhead.createCell((short) 2).setCellValue("In Time");
	rowhead.createCell((short) 3).setCellValue("Out Time");

	Connection con = GetConnection.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("Select * from NCSS_TEMP_BKP_DUMP3 where date_time>='10-AUG-15' and date_time<'14-AUG-15' order by fullid,date_time");
	int i=1;
	while(rs.next()){
	HSSFRow row=   sheet.createRow((short)i);
	row.createCell((short) 0).setCellValue(rs.getString("date_time"));
	row.createCell((short) 1).setCellValue(rs.getString("fullid"));
	row.createCell((short) 2).setCellValue(rs.getString("in_time"));
	row.createCell((short) 3).setCellValue(rs.getString("out_time"));
	i++;
	}
	FileOutputStream fileOut =  new FileOutputStream(filename);
	hwb.write(fileOut);
	fileOut.close();
	System.out.println("Your excel file has been generated!");

	} catch ( Exception ex ) {
	    System.out.println(ex);

	}
	return SUCCESS;
}

public static void main(String[]args){
	DownloadExcel.download();
}
}
 */

package com.ess.common.action;

import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.ess.common.bean.AttandanceReportBean;
import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionSupport;

public class DownloadExcel extends ActionSupport  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final String SUCCESS = "success";
	private AttandanceReportBean bean;

	public AttandanceReportBean getBean() {
		return bean;
	}

	public void setBean(AttandanceReportBean bean) {
		this.bean = bean;
	}

	@SuppressWarnings("deprecation")
	public String download() {
		
		System.out.println("it is calling download method1");

		String sql = "Select * from NCSS_TEMP_BKP_DUMP3 where date_time>=? and date_time<=? order by fullid,date_time";
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();

			System.out.println(dateFormat.format(date));
			String day = dateFormat.format(date);
			String filename = "E:/AttandanceReport-" + day + ".xls";

			HSSFWorkbook hwb = new HSSFWorkbook();
			HSSFSheet sheet = hwb.createSheet("new sheet");
			HSSFRow rowhead = sheet.createRow((short) 0);
			rowhead.createCell((short) 0).setCellValue("Date");
			rowhead.createCell((short) 1).setCellValue("ID Number");
			rowhead.createCell((short) 2).setCellValue("In Time");
			rowhead.createCell((short) 3).setCellValue("Out Time");

			Connection con = GetConnection.getConnection();

			String date1 = this.bean.getFromdate();
			String date2 = this.bean.getTodate();
			SimpleDateFormat format1 = new SimpleDateFormat("MM/dd/yyyy");
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
			Date date11 = format1.parse(date1);
			Object startDate = format2.format(date11);
			System.out.println("start date.." + startDate);

			SimpleDateFormat format11 = new SimpleDateFormat("MM/dd/yyyy");
			SimpleDateFormat format22 = new SimpleDateFormat("dd-MMM-yyyy");
			Date date22 = format11.parse(date2);
			Object enddate = format22.format(date22);
			System.out.println("end date.." + enddate);

			PreparedStatement st = con.prepareStatement(sql);
			st.setObject(1, startDate);
			st.setObject(2, enddate);
			ResultSet rs = st.executeQuery();

			int i = 1;
			while (rs.next()) {
				HSSFRow row = sheet.createRow((short) i);
				row.createCell((short) 0).setCellValue(
						rs.getString("date_time"));
				row.createCell((short) 1).setCellValue(rs.getString("fullid"));
				row.createCell((short) 2).setCellValue(rs.getString("in_time"));
				row.createCell((short) 3)
						.setCellValue(rs.getString("out_time"));
				i++;
			}
			FileOutputStream fileOut = new FileOutputStream(filename);
			hwb.write(fileOut);
			fileOut.close();
			System.out.println("Your excel file has been generated!");
			hwb.close();
		} catch (Exception ex) {
			System.out.println(ex);

		}
		return SUCCESS;
	}
	@SuppressWarnings("deprecation")
	public String downloadMonthly() {
		System.out.println("it is calling download monthy");
		String monthlywise="Select * from NCSS_TEMP_BKP_DUMP3 where to_char(db_date,'MON')=? and to_char(db_date,'YYYY')=? order by fullid,date_time";
		
		try {
			String month=bean.getMonth();
			System.out.println("month is ---"+month);
			String year=bean.getYear();
			System.out.println("year is ---"+year);
			
			String filename = "E:/AttandanceReport-" + month + ".xls";

			HSSFWorkbook hwb = new HSSFWorkbook();
			HSSFSheet sheet = hwb.createSheet("new sheet");
			System.out.println("it is calling download method2");
			HSSFRow rowhead = sheet.createRow((short) 0);
			rowhead.createCell((short) 0).setCellValue("Date");
			rowhead.createCell((short) 1).setCellValue("ID Number");
			rowhead.createCell((short) 2).setCellValue("In Time");
			rowhead.createCell((short) 3).setCellValue("Out Time");

			Connection con = GetConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement(monthlywise);
			ps.setObject(1,this.bean.getMonth() );
			ps.setObject(2,this.bean.getYear() );
			ResultSet rs1 = ps.executeQuery();
			
			
			int i = 1;
			while (rs1.next()) {
				HSSFRow row = sheet.createRow((short) i);
				row.createCell((short) 0).setCellValue(
						rs1.getString("date_time"));
				row.createCell((short) 1).setCellValue(rs1.getString("fullid"));
				row.createCell((short) 2).setCellValue(rs1.getString("in_time"));
				row.createCell((short) 3).setCellValue(rs1.getString("out_time"));
				i++;
			}
			FileOutputStream fileOut = new FileOutputStream(filename);
			hwb.write(fileOut);
			fileOut.close();
			System.out.println("Your excel file has been generated!");
			hwb.close();
		} catch (Exception ex) {
			System.out.println(ex);

		}
		return SUCCESS;
	}
public String dummy()
{
	
	return SUCCESS;
	
}
	public static void main(String[] args) {
		// DownloadExcel.download();
	}
}
