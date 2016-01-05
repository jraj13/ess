<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
   <%@page import="org.apache.poi.hssf.usermodel.*" %><%@page import="java.io.*" %>
<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.ess.common.bean.AttandanceReportBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="org.apache.poi.hssf.util.HSSFColor"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String emp_id=(String)session.getAttribute("reportid");
String emp_month=(String)session.getAttribute("reportmonth");
String emp_year=(String)session.getAttribute("reportyear");

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

String monthlywise="Select * from NCSS_TEMP_BKP_DUMP3 where to_char(db_date,'MON')=? and to_char(db_date,'YYYY')=? and fullid=? order by db_date";

PreparedStatement st = con.prepareStatement(monthlywise);
st.setObject(1, emp_month);
st.setObject(2, emp_year);
st.setObject(3, emp_id);

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

//write it as an excel attachment
ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
hwb.write(outByteStream);
byte [] outArray = outByteStream.toByteArray();
response.setContentType("application/ms-excel");
response.setContentLength(outArray.length);
response.setHeader("Expires:", "0"); // eliminates browser caching
/* response.setHeader("Content-Disposition", "attachment; filename=testxls.xls"); */
response.setHeader("Content-Disposition", "attachment; filename=perticularemployee.xls");

OutputStream outStream = response.getOutputStream();
outStream.write(outArray);
outStream.flush();
hwb.close();

%>
</body>
</html>