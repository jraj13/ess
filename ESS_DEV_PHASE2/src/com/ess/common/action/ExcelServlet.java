package com.ess.common.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ess.util.GetConnection;
import com.lowagie.text.Cell;
import com.lowagie.text.Row;
 



import  org.apache.poi.hssf.usermodel.HSSFSheet;  
import  org.apache.poi.hssf.usermodel.HSSFWorkbook; 
import  org.apache.poi.hssf.usermodel.HSSFRow;
import  org.apache.poi.hssf.usermodel.HSSFCell;
/**
 * Servlet implementation class ExcelServlet
 */
public class ExcelServlet extends HttpServlet 
{
   
  private static final long serialVersionUID = 1L;     
     
     
    public ExcelServlet() 
    {
        super();
        // TODO Auto-generated constructor stub
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
     {   
    	Connection con=null;
    	ResultSet rs=null;
    	Statement st=null;
         try
          {          
            
        	 HSSFWorkbook hwb=new HSSFWorkbook();
        		HSSFSheet sheet =  hwb.createSheet("new sheet");

        		HSSFRow rowhead=   sheet.createRow((short)0);
        		rowhead.createCell((short) 0).setCellValue("Date");
        		rowhead.createCell((short) 1).setCellValue("ID Number");
        		rowhead.createCell((short) 2).setCellValue("In Time");
        		rowhead.createCell((short) 3).setCellValue("Out Time");

        	
				try {
					con = GetConnection.getConnection();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        		
				try {
					st = con.createStatement();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        		try {
					rs=st.executeQuery("Select * from NCSS_TEMP_BKP_DUMP3 where date_time>='10-AUG-15' and date_time<'14-AUG-15' order by fullid,date_time");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        		int i=1;
        		try {
					while(rs.next()){
					HSSFRow row=   sheet.createRow((short)i);
					row.createCell((short) 0).setCellValue(rs.getString("date_time"));
					row.createCell((short) 1).setCellValue(rs.getString("fullid"));
					row.createCell((short) 2).setCellValue(rs.getString("in_time"));
					row.createCell((short) 3).setCellValue(rs.getString("out_time"));
					i++;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        		//FileOutputStream fileOut =  new FileOutputStream(filename);
        		//hwb.write(fileOut);
        		//fileOut.close();
        		System.out.println("Your excel file has been generated!");
        		 response.setContentType("application/vnd.ms-excel");
        	     hwb.write(response.getOutputStream());
        		 
        		 
        	       response.getOutputStream().close();
          }
          
           catch (FileNotFoundException e) 
           {
             e.printStackTrace();
           } 
           catch (IOException e) 
           {
             e.printStackTrace();
           }
             
      
             
    }
     }

