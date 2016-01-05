package com.ess.common.dao;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;


//import com.ess.common.dao.ReportFilter;
import com.ess.common.dao.AttendanceDO;

public class ReportGenerator {

	boolean flag = false;
	public boolean generateAttendenceExcel(String sheetName,ArrayList<Object> attendenceReportList,String fileName,AttendanceDO filter) throws Exception{
		{
	    	AttendanceDO report = null;
	        //DealerDao dealerDao = null;
	   	
	        try
	        {
	            HSSFWorkbook wb = new HSSFWorkbook();
	            HSSFSheet sheet = wb.createSheet(sheetName);
	            
				HSSFRow rowHeader = sheet.createRow((short)0);
				HSSFFont fontheader = wb.createFont();
			    fontheader.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
				
			    // Aqua background
				HSSFCellStyle styleheader = wb.createCellStyle();
				styleheader.setFillBackgroundColor(HSSFColor.LIGHT_YELLOW.index);
				
				//styleheader.setFillPattern(HSSFCellStyle.NO_BORDER);
				styleheader.setFont(fontheader);
				HSSFCell cellheader = rowHeader.createCell((short) 0);
				cellheader.setCellValue("ATTENDANCE REPORT");
				cellheader.setCellStyle(styleheader);
	            HSSFRow row00 = sheet.createRow((short)2);
	            HSSFFont font1 = wb.createFont();
	            font1.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	            HSSFCellStyle style = wb.createCellStyle();
	            style.setFillBackgroundColor(HSSFColor.YELLOW.index);
	            style.setFont(font1);
	            HSSFCell cellh11 = row00.createCell((short) 0);
	            cellh11.setCellStyle(style);
	            cellh11.setCellValue("From Date: ");
	            HSSFCell cellh12 = row00.createCell((short) 1);
	            //cell01.setCellStyle(style);
	            cellh12.setCellValue(filter.getDbDate());
	            HSSFCell cellh13 = row00.createCell((short) 2);
	            cellh13.setCellStyle(style);
	            cellh13.setCellValue("To Date: ");
	            HSSFCell cellh14 = row00.createCell((short) 3);
	            //cell01.setCellStyle(style);
	            cellh14.setCellValue(filter.getDbDate());

	            HSSFCell cellh15 = row00.createCell((short) 4);
	            cellh15.setCellStyle(style);
	            cellh15.setCellValue("DB_DATE: ");
	            HSSFCell cellh16 = row00.createCell((short) 5);
	            //cell01.setCellStyle(style);
	            cellh16.setCellValue(filter.getDbDate());

	            HSSFCell cellh17 = row00.createCell((short) 6);
	            cellh17.setCellStyle(style);
	            cellh17.setCellValue("DATE_TIME: ");
	            HSSFCell cellh18 = row00.createCell((short) 7);
	            //cell01.setCellStyle(style);
	            cellh18.setCellValue(filter.getDateTime());

	            HSSFCell cellh19 = row00.createCell((short) 8);
	            cellh19.setCellStyle(style);
	            cellh19.setCellValue("EMP_ID: ");
	            	            				
				HSSFCell cell10 = row00.createCell((short) 9);
	            cell10.setCellStyle(style);
	            cell10.setCellValue("IN_TIME");
	            
				HSSFCell cell11 = row00.createCell((short) 10);
	            cell11.setCellStyle(style);
	            cell11.setCellValue("OUT_TIME");
	            
				HSSFCell cell12 = row00.createCell((short) 11);
	            cell12.setCellStyle(style);
	            cell12.setCellValue("STATUS");
				
				for(int i = 0; i < attendenceReportList.size(); i++)
	            {
	            	report = (AttendanceDO)attendenceReportList.get(i);
	                HSSFRow row = sheet.createRow((short)i+5);
	                
	                HSSFCell cell09 = row.createCell((short)8);
	                cell09.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
	                cell09.setCellValue(report.getEmpid());
	                
					HSSFCell cell010 = row.createCell((short)9);
	                cell010.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
	                cell010.setCellValue(report.getInTime());

	                HSSFCell cell011 = row.createCell((short)10);
	                cell011.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
	                cell011.setCellValue(report.getOutTime());
	                
	                HSSFCell cell012 = row.createCell((short)11);
	                cell012.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
	                cell012.setCellValue(report.getStatus());
	                	                	               
	 	            }
	            
	            BufferedOutputStream writer = new BufferedOutputStream(new FileOutputStream(fileName), 1024 * 100);

	            wb.write(writer);
	            writer.close();
	            flag = true;
	        }
	        catch(Exception e)
	        {
	        	flag = false;
	            System.out.println("Exception occurred while generating the excel sheet : " + e );
	        }
	        return flag;

	}
 }
}	
