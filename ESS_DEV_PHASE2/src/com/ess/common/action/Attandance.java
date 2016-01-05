package com.ess.common.action;

import java.io.IOException;
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

/**
 * Servlet implementation class Attandance
 */  
public class Attandance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Attandance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment; filename=name.xls");
		//WritableWorkbook workBook = Workbook.createWorkbook(response.getOutputStream());
		HSSFWorkbook hwb=new HSSFWorkbook();
		HSSFSheet sheet =  hwb.createSheet("new sheet");

		HSSFRow rowhead=   sheet.createRow((short)0);
		rowhead.createCell((short) 0).setCellValue("Date");
		rowhead.createCell((short) 1).setCellValue("ID Number");
		rowhead.createCell((short) 2).setCellValue("In Time");
		rowhead.createCell((short) 3).setCellValue("Out Time");

		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
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
			rs = st.executeQuery("Select * from NCSS_TEMP_BKP_DUMP3 where date_time>='10-AUG-15' and date_time<'14-AUG-15' order by fullid,date_time");
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
