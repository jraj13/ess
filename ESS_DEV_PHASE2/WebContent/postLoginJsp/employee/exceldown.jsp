 <%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
 <%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
 <%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="com.ess.util.GetConnection" %>
<form action="downloadexcel">
<input type="button" value="click"/>

</form>

<%-- <%

HSSFWorkbook hwb=new HSSFWorkbook();
HSSFSheet sheet = hwb.createSheet();

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

%> --%>