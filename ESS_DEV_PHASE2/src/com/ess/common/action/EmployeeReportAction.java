/*package com.ess.common.action;

//ExcelApachepoi  
 
import java.io.ByteArrayInputStream;    
import java.io.ByteArrayOutputStream;    
import java.io.InputStream;    
import java.sql.ResultSet;  
import java.sql.ResultSetMetaData;  
     

import java.sql.SQLException;

import org.apache.poi.hssf.usermodel.HSSFCell;    
import org.apache.poi.hssf.usermodel.HSSFRichTextString;  
import org.apache.poi.hssf.usermodel.HSSFRow;    
import org.apache.poi.hssf.usermodel.HSSFSheet;    
import org.apache.poi.hssf.usermodel.HSSFWorkbook;    

import com.ess.common.bean.EmployeeReportDAO;
import com.opensymphony.xwork2.ActionSupport;    

       

public class EmployeeReportAction extends ActionSupport {

	
	 *//**
	 * 
	 *//*
	private static final long serialVersionUID = 1L;
	ResultSet rs = null;  
	    public InputStream getExcelFile() {    
	    	System.out.println("inside the getExcelFile method");
	          
	        String sheetName = "EmployeeReport";  
	        ByteArrayInputStream bais=null;  
	  
	        HSSFWorkbook workbook = new HSSFWorkbook();     
	  
	  
	        HSSFSheet sheet = workbook.createSheet();     
	        workbook.setSheetName(0, sheetName);  
	          
	                    
	        HSSFRow row = sheet.createRow((short) 0);  
	        HSSFCell cell;  
	        try {  
	            ResultSetMetaData md = rs.getMetaData();   // ResultSet       
	            int nColumn = md.getColumnCount();  
	         
	            for (int i = 1; i <= nColumn; i++) {  
	                cell = row.createCell((short) (i - 1));  
	                cell.setCellType(HSSFCell.CELL_TYPE_STRING);          //??Excel?  
	                cell.setCellValue(new HSSFRichTextString(md.getColumnLabel(i)));  //  
	            }  
	              
	            //  
	            int iRow = 1;  
	            while (rs.next()) {  
	                row = sheet.createRow((short) iRow);  
	                for (int j = 1; j <= nColumn; j++) {  
	                    cell = row.createCell((short) (j-1));  
	                    cell.setCellType(HSSFCell.CELL_TYPE_STRING);  
	                    cell.setCellValue(new HSSFRichTextString(rs.getObject(j).toString()));  
	                }  
	                iRow++;  
	              
	            }  
	            ByteArrayOutputStream baos = new ByteArrayOutputStream();    
	             
	                workbook.write(baos);   
	              
	              
	            byte[] ba = baos.toByteArray();  
	           
	             bais = new ByteArrayInputStream(ba);  
	              
	                
	        } catch (Exception e) {    
	            e.printStackTrace();    
	        }    
	        return bais;  
	      }    
	  
	   public String queryAll() throws Exception {   
	            EmployeeReportDAO db= new EmployeeReportDAO();  
	            rs = db.queryAll();  
	            return SUCCESS;    
	        }   
	   
	   
	   
	   public static void main(String[] args) throws SQLException
	   {
		   EmployeeReportAction.getExcelFile(); 
	   }
}
*/