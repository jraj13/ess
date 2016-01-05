<%@page import="org.apache.poi.hssf.usermodel.*" %><%@page import="java.io.*" %>
<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.ess.common.bean.AttandanceReportBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="org.apache.poi.hssf.util.HSSFColor"%>
<%

String date1=(String)session.getAttribute("startdate");

String date2=(String)session.getAttribute("enddate");

SimpleDateFormat format1 = new SimpleDateFormat("MM/dd/yyyy");
SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
Date date11 = format1.parse(date1);
Object startDate = format2.format(date11);

SimpleDateFormat format11 = new SimpleDateFormat("MM/dd/yyyy");
SimpleDateFormat format22 = new SimpleDateFormat("dd-MMM-yyyy");
Date date22 = format11.parse(date2);
Object enddate = format22.format(date22);




// create a small spreadsheet
			HSSFWorkbook hwb = new HSSFWorkbook();
			HSSFSheet sheet = hwb.createSheet("new sheet");
			HSSFCellStyle style = hwb.createCellStyle();
			sheet.setDefaultColumnWidth(25);
		
 			HSSFRow rowhead=sheet.createRow(1);
 			HSSFCell cell;
			 HSSFFont font = hwb.createFont();
	        cell=rowhead.createCell(1);
	        
	        font.setFontName("Arial");
	        style.setFillForegroundColor(HSSFColor.BLUE.index);
	        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	        font.setColor(HSSFColor.WHITE.index);
	        style.setFont(font);
	        cell.setCellStyle(style);
	        style.setFont(font);
	        
	        HSSFRow header = sheet.createRow(0);
	         
	        header.createCell(1).setCellValue("DATE");
	        header.getCell(1).setCellStyle(style);
	         
	        header.createCell(2).setCellValue("EMPLOYEE ID");
	        header.getCell(2).setCellStyle(style);
	         
	        header.createCell(3).setCellValue("IN TIME");
	        header.getCell(3).setCellStyle(style);
	         
	        header.createCell(4).setCellValue("OUT TIME");
	        header.getCell(4).setCellStyle(style);
	        
	        header.createCell(5).setCellValue("REGULARIZATION STATUS");
	        header.getCell(5).setCellStyle(style);
	         

Connection con = GetConnection.getConnection();
//String sql = "Select * from NCSS_TEMP_BKP_DUMP3 where db_date>=? and date_time<=? and ATT_STATUS='PRS' order by fullid,date_time";
String sql = "Select * from NCSS_TEMP_BKP_DUMP3 where db_date>=? and db_date<=?  order by fullid,DB_DATE";

PreparedStatement st = con.prepareStatement(sql);
st.setObject(1, startDate);
st.setObject(2, enddate);
ResultSet rs1 = st.executeQuery();
int i = 1;
HSSFRow row;
 while (rs1.next()) {
	 
	HSSFRow row1 = sheet.createRow((short) i);
	/* row1.setRowStyle(style); */
	  
	row=sheet.createRow(i);
	
	/* row.setHeight((short) 800); */
	
	
    cell=row.createCell(1);
	
    String monthonly_first=rs1.getString("DB_DATE");
	String[] monthonly=monthonly_first.split(" ");
	cell.setCellValue(monthonly[0]);
    
    //cell.setCellValue(rs1.getString("DB_DATE"));
    cell=row.createCell(2);
    
    
    
    
    
    
    //cell.setCellStyle(style);
    
    
    cell.setCellValue(rs1.getString("fullid"));
    cell=row.createCell(3);
    //cell.setCellStyle(style);
    
    cell.setCellValue(rs1.getString("in_time"));
    cell=row.createCell(4);
    //cell.setCellStyle(style);
	  
    cell.setCellValue(rs1.getString("out_time"));
    cell=row.createCell(5);
    //cell.setCellStyle(style);
	
     cell.setCellValue(rs1.getString("REGULARIZATION_REMARKS"));
     
   
    
    
	i++;
} 

// write it as an excel attachment
ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
hwb.write(outByteStream);
byte [] outArray = outByteStream.toByteArray();
response.setContentType("application/ms-excel");
response.setContentLength(outArray.length);
response.setHeader("Expires:", "0"); // eliminates browser caching
/* response.setHeader("Content-Disposition", "attachment; filename=testxls.xls"); */
response.setHeader("Content-Disposition", "attachment; filename=BetweenDates.xls");

OutputStream outStream = response.getOutputStream();
outStream.write(outArray);
outStream.flush();
hwb.close();
%>