package com.ess.common.dao;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AttendanceReportExcel  extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		HttpSession session= request.getSession(false);
		ServletConfig sConfig = this.getServletConfig();
		ServletContext sContext = sConfig.getServletContext();
		String path = sContext.getRealPath("/");
		String fileName = "";
		String userName = (String)request.getParameter("userName");
		String type = (String)request.getParameter("reportType");
		
		String fromDate = (String)request.getParameter("fromDate");
		String toDate = (String)request.getParameter("toDate");

		//UserDO userDO = (UserDO) session.getAttribute("userDO");
       // int roleId=userDO.getRoleId();
		
        
        try
		 {
			ReportFilter filter = (ReportFilter)session.getAttribute("filter");
			ReportsDAO reportsDAO = new ReportsDAO();
			
			ArrayList repList = null;
			String msg = "";
			boolean excelFlag = false;
			ReportGenerator repGenerator = new ReportGenerator();
			if(type.equals("ATTENDANCE"))
			{
				msg = "Attendance Report";
				fileName = "Attendance Report_"+userName+".xls";
				repList = reportsDAO.getAttendenceReport(filter);
				if (repList == null || repList.size()==0)
				{
					AttendanceDO attendanceReport = new AttendanceDO();
					repList.add(attendanceReport);
					msg = "No Data Available";
				}
				//excelFlag = repGenerator.generateAttendenceExcel(msg,repList,path+fileName,filter);
			}
			
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition","inline; filename="+path+fileName);
			boolean flag = false;

			if(excelFlag)
			{
				int buffSize = 1024 * 5;
				BufferedOutputStream bos = null;
				BufferedInputStream bis = null;
					
				bos = new BufferedOutputStream(response.getOutputStream());
				bis = new BufferedInputStream(new FileInputStream(path+fileName));
					
				byte [] data = new byte[buffSize];
				   
				while(bis.read(data, 0, buffSize) != -1)
				{
					bos.write(data);
				}
						
				bos.flush();
				bos.close();
				bis.close();
				flag = true;
				boolean deleteFlag = new File(path+fileName).delete();
			}
		  }
		  catch(Exception e)
		  {
			  System.out.println("Exception occured in stock report excel:::"+e);
		  	e.printStackTrace();
		  }
		
	}
}
