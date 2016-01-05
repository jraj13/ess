<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ess.util.GetConnection"%>
 
<%
 
            String f_str=request.getParameter("ver").trim();


String sn=f_str.toUpperCase();
String final_str=sn+"%";
System.out.println("final String..."+final_str);
 
                    //Class.forName("oracle.jdbc.driver.OracleDriver");
                    //Connection con =DriverManager.getConnection("jdbc:oracle:thin:@192.168.2.25:1521:orcl","ESS_DEV","ESS_DEV");
                    String query="select * from NCSS_EMP_MASTER_INFO where emp_fname LIKE '"+final_str+"'";
                    Connection con = GetConnection.getConnection();
                    
                   Statement ps=con.createStatement();
                  ResultSet rs = ps.executeQuery(query);  // this is for name
                	System.out.println("query.."+query);
                  String data;
                    
                	  /*    PreparedStatement    ps = con
        					.prepareStatement("SELECT * FROM NCSS_EMP_MASTER_INFO  WHERE EMP_FNAME  LIKE ?");
        			System.out.println("Qry.."+ps);
        			ps.setString(1, f_str + "%");
        			ResultSet rs = ps.executeQuery();
        			System.out.println("Qry.."+ps);
        			System.out.println("rs.."+rs);
        			
        			while (rs.next()) {
        				System.out.println("inside rs.next");
        				data = rs.getString("EMP_FNAME");
        				System.out.println("data.."+data);
        				//list.add(data);
                    
        			} */
                    
        			//System.out.println("inside rs.next.."+rs.next());
                    while(rs.next())
                    {    
                    	System.out.println("inside rs.next");
                        out.println("<font color=red>");
                        data = rs.getString("EMP_FNAME");
                        out.println(data);
                       /*  out.println("This ID Already in Use"); */
                        out.println("</font>");
 
                    } 
        			/* else{
 
                        out.println("<font color=green>");
                        out.println("ID is Available you can proceed");
                        out.println("</font>");
 
                    } */
 
rs.close();
    ps.close();
con.close();
 
%>