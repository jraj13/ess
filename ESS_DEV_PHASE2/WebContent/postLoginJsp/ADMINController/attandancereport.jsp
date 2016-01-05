
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.action.EmployeeDetails"%>
    <%@ page import="java.lang.*,java.util.*"%>
<%@page import="org.apache.poi.hssf.usermodel.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.ess.util.GetConnection" %>

<%@page import="com.ess.common.action.EmployeeDetails"%>




package com.ess.common.action;
import  java.io.*;  
import  java.sql.*;

import  org.apache.poi.hssf.usermodel.HSSFWorkbook; 
import  org.apache.poi.hssf.usermodel.HSSFRow;
//import  org.apache.poi.hssf.usermodel.HSSFCell;  


import com.ess.util.GetConnection;
<%
	String startdate=request.getParameter("todate");
	String enddate=request.getParameter("fromdate");
	System.out.println("todate is"+startdate);
	System.out.println("from date is"+enddate);
	
	try{
		//Date date=new Date();
		//String id="CSSE150059";
	String filename="e:/data.xls" ;
	
	
	HSSFWorkbook hwb=new HSSFWorkbook();
	HSSFSheet sheet =  hwb.createSheet("new sheet");

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


%>

	

