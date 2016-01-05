package com.ess.common.bean;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;  

import javax.sql.DataSource;

import com.ess.common.util.MyDataSource;
import com.ess.util.GetConnection;
  
/*public class EmployeeReportDAO*/
public class EmployeeReportDAO 
{  
    private Connection conn;  
    private PreparedStatement pstmt;  
    private ResultSet rs;  
    
    
    public ResultSet queryAll() throws ClassNotFoundException {  
        try {  
        	System.out.println("inside queryAll method of DAO class");
        	  //DataSource dataSource = MyDataSource.getInstance();
              conn = GetConnection.getConnection();
              
            pstmt = conn.prepareStatement("select * from NCSS_EMP_MASTER_INFO");  
            rs = pstmt.executeQuery();  
            
        } catch (SQLException e) {  
            e.printStackTrace();  
        }  
        return rs;  
    }  
}  