<%@page import="org.apache.poi.hssf.usermodel.*" %><%@page import="java.io.*" %>
<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.ess.common.bean.AttandanceReportBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>


<%

//Map session = ActionContext.getContext().getSession();
String date1=(String)session.getAttribute("startdate");
System.out.println("start date jsp===="+date1); 

String date2=(String)session.getAttribute("enddate");
System.out.println("end datefrom jsp===="+date2); 

SimpleDateFormat format1 = new SimpleDateFormat("MM/dd/yyyy");
SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
Date date11 = format1.parse(date1);
Object startDate = format2.format(date11);
System.out.println("final start date.." + startDate);

SimpleDateFormat format11 = new SimpleDateFormat("MM/dd/yyyy");
SimpleDateFormat format22 = new SimpleDateFormat("dd-MMM-yyyy");
Date date22 = format11.parse(date2);
Object enddate = format22.format(date22);
System.out.println("final end date.." + enddate);




// create a small spreadsheet
HSSFWorkbook hwb = new HSSFWorkbook();
			HSSFSheet sheet = hwb.createSheet("new sheet");
			System.out.println("it is calling download method2");
			HSSFRow rowhead = sheet.createRow((short) 0);

//HSSFRow rowhead = sheet.createRow((short) 0);
rowhead.createCell((short) 0).setCellValue("Date");
rowhead.createCell((short) 1).setCellValue("ID Number");
rowhead.createCell((short) 2).setCellValue("In Time");
rowhead.createCell((short) 3).setCellValue("Out Time");
Connection con = GetConnection.getConnection();
/* String monthlywise="Select * from NCSS_TEMP_BKP_DUMP3 where to_char(db_date,'MON')='10-AUG-15' and to_char(db_date,'YYYY')='15-AUG-15' order by fullid,date_time"; */
String sql = "Select * from NCSS_TEMP_BKP_DUMP3 where date_time>=? and date_time<=? order by fullid,date_time";

PreparedStatement st = con.prepareStatement(sql);
st.setObject(1, startDate);
st.setObject(2, enddate);
ResultSet rs1 = st.executeQuery();
int i = 1;
System.out.println(rs1.next());
 while (rs1.next()) {
	HSSFRow row1 = sheet.createRow((short) i);
	row1.createCell((short) 0).setCellValue(rs1.getString("date_time"));
	row1.createCell((short) 1).setCellValue(rs1.getString("fullid"));
	row1.createCell((short) 2).setCellValue(rs1.getString("in_time"));
	row1.createCell((short) 3).setCellValue(rs1.getString("out_time"));
	i++;
} 

// write it as an excel attachment
ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
hwb.write(outByteStream);
byte [] outArray = outByteStream.toByteArray();
response.setContentType("application/ms-excel");
response.setContentLength(outArray.length);
response.setHeader("Expires:", "0"); // eliminates browser caching
response.setHeader("Content-Disposition", "attachment; filename=testxls.xls");
OutputStream outStream = response.getOutputStream();
outStream.write(outArray);
outStream.flush();
hwb.close();
%>