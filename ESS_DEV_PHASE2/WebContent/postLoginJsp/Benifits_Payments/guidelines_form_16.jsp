
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<a href="GuidelinesForm.pdf" target="_new"><font color="">DIA,L3 VPN</font></a> 
</body>
</html>















<%-- 
<%@page import="com.ess.common.action.AttendanceDetails"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@page import="java.io.File"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.pdf.PdfReader"%>
<%@page import="com.itextpdf.text.pdf.PdfImportedPage"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
 <%@ page language="java" contentType="application/pdf; charset=UTF-8" pageEncoding="ISO-8859-1"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
	border: 1px solid black;
	width
	="100";
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Public Holiday Calendar</title>
</head>
<body>
<h3 style="margin-top:200px;margin-left:250px;;text-align="center">Leave Encashment</h3>


<%
response.reset();
response.setContentType("application/pdf");
/* File file = new File("E:\\ESS_PROJECT\\Form16\\GuidelinesForm 16 - SOP.pdf"); */
//File file = new File("ESS_PROJECT\\Form16\\GuidelinesForm 16 - SOP.pdf");
File file = new File("\\postLoginJsp\\Benifits_Payments\\payslip.pdf");

response.setHeader("Content-Type", "application/pdf");
response.setHeader("Content-Disposition",
        "inline;filename=Saba_PhBill.pdf");
response.setContentLength((int) file.length());
response.setHeader("Content-Type",
        getServletContext().getMimeType(file.getName()));
response.setHeader("Content-Length", String.valueOf(file.length()));

FileInputStream in = new FileInputStream(file);
ServletOutputStream outs = response.getOutputStream();
response.setContentLength(in.available());
byte[] buf = new byte[8192];
int c = 0;
try {
    while ((c = in.read(buf, 0, buf.length)) > 0) {
        //System.out.println("size:"+c);
        outs.write(buf, 0, c);
        out.write(outs.toString());
    }

} catch (IOException ioe) {
    ioe.printStackTrace(System.out);
} finally {
    outs.flush();
    outs.close();
    in.close();
}
%>
</body>
</html> --%>