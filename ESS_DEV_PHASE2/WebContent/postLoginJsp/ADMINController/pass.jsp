<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ess.util.GetConnection"%>
 
<%
 
            String f_str=request.getParameter("ver").trim();
String sn=f_str.toUpperCase();

 
                    //Class.forName("oracle.jdbc.driver.OracleDriver");
                    //Connection con =DriverManager.getConnection("jdbc:oracle:thin:@192.168.2.25:1521:orcl","ESS_DEV","ESS_DEV");
                    
                    Connection con = GetConnection.getConnection();
                    
                    Statement st=con.createStatement();
                    ResultSet rs = st.executeQuery("select * from NCSS_EMP_MASTER_INFO where emp_id='"+sn+"'");  // this is for name
                    if(rs.next())
                    {    
                        out.println("<font color=red>");
                        out.println("This ID Already in Use");
                        out.println("</font>");
 
                    }else {
 
                        out.println("<font color=green>");
                        out.println("ID is Available you can proceed");
                        out.println("</font>");
 
                    }
 
rs.close();
st.close();
con.close();
 
%>