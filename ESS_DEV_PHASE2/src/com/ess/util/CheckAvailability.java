package com.ess.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class CheckAvailability
 */
public class CheckAvailability extends HttpServlet {
	
       
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)  
	            throws ServletException, IOException {  
		 response.setContentType("text/html");  
	     PrintWriter out = response.getWriter();  
	        Connection conn = null;
	        try {  
	  System.out.println("in servlet");
	        conn = GetConnection.getConnection();
	            String fisrt_name = request.getParameter("employeeid").trim();  
	            String uname=fisrt_name.toUpperCase();
	            
	            
	            System.out.println("uname is"+uname);
	            PreparedStatement ps = conn.prepareStatement("select emp_fname from NCSS_EMP_MASTER_INFO where emp_id=?");  
	            System.out.println("hello");
	            ps.setString(1,uname);  
	            
	            ResultSet rs = ps.executeQuery();  
	            System.out.println("uname before if"+uname);
	            
	            System.out.println(rs);
	            
	            
	            if (!rs.next()) {  
	            	out.println("<html><font color='green'><b>"+uname+"</b> is avaliable</font></html>");  
	            	
	            	
	                System.out.println("uname if is"+uname);
	            }  
	            else{  
	            	out.println("<html><font color='red'><b>"+uname+"</b> is already in use</font></html>"); 
	            	
	            	
	            	 System.out.println("uname else is"+uname);
	            }  
	            out.println();  
	  
	        } catch (Exception ex) {  
	            out.println("Error ->" + ex.getMessage());  
	        } finally {  
	            out.close();  
	        }  
	    }  
	  
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)  
	            throws ServletException, IOException {  
	        doPost(request, response);  
	    }  

}
