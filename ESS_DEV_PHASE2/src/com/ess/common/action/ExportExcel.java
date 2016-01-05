package com.ess.common.action;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.ess.util.GetConnection;


public class ExportExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ExportExcel() {
        super();
        // TODO Auto-generated constructor stub
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HSSFWorkbook hwb = new HSSFWorkbook();
		HSSFSheet sheet = hwb.createSheet("new sheet");
		System.out.println("it is calling download method2");
		HSSFRow rowhead = sheet.createRow((short) 0);

//HSSFRow rowhead = sheet.createRow((short) 0);
rowhead.createCell((short) 0).setCellValue("Date");
rowhead.createCell((short) 1).setCellValue("ID Number");
rowhead.createCell((short) 2).setCellValue("In Time");
rowhead.createCell((short) 3).setCellValue("Out Time");
Connection con=null;
ResultSet rs1=null;
Statement ps = null;
try {
	con = GetConnection.getConnection();
} catch (SQLException e) {
	e.printStackTrace();
}
/* String monthlywise="Select * from NCSS_TEMP_BKP_DUMP3 where to_char(db_date,'MON')='10-AUG-15' and to_char(db_date,'YYYY')='15-AUG-15' order by fullid,date_time"; */
String monthlywise="Select * from NCSS_TEMP_BKP_DUMP3 order by fullid,date_time";
try {
	ps = con.createStatement();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
/* ps.setObject(1,"10-AUG-15") ;
ps.setObject(2,"15-AUG-15" ); */
 try {
	rs1 = ps.executeQuery(monthlywise);
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
System.out.println("it is near to while");
int i = 1;
try {
	System.out.println(rs1.next());
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
try {
	while (rs1.next()) {
	HSSFRow row1 = sheet.createRow((short) i);
	row1.createCell((short) 0).setCellValue(rs1.getString("date_time"));
	row1.createCell((short) 1).setCellValue(rs1.getString("fullid"));
	row1.createCell((short) 2).setCellValue(rs1.getString("in_time"));
	row1.createCell((short) 3).setCellValue(rs1.getString("out_time"));
	i++;
	}
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} 

//write it as an excel attachment
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
		
		
		
		
		
		
		
	}

	
}
