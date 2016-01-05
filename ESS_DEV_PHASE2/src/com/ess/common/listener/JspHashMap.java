package com.ess.common.listener;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

import org.apache.jasper.tagplugins.jstl.core.Set;

import com.ess.common.util.MyDataSource;

public class JspHashMap implements ServletContextListener {
	//private String mapSQL = "SELECT * FROM NCSS_ROLE_ATTRIBUTE";
	private String mapSQL ="SELECT ROLE_ATTRIBUTE_KEY,ROLE_ATTRIBUTE_VALUE FROM NCSS_ROLE_ATTRIBUTE WHERE  ROLE_ATTRIBUTE_KEY='EMPLOYEE SELF SERVICE' AND ROLE_ID='4'";

	public void contextInitialized(ServletContextEvent context) {
		System.out.println("ServletContextListener started");
		Connection conn = null;
		HashMap<String, String> hashMap = new HashMap<String, String>();
		try {
			DataSource dataSource = MyDataSource.getInstance();
			conn = dataSource.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(mapSQL);
			System.out.println("MAP QUERY========="+mapSQL);
			while (rs.next()) {
				System.out.println("Database values are :" + rs.getString(1));
				System.out.println("Database values are :" + rs.getString(2));
				hashMap.put(rs.getString(1), rs.getString(2));
				
				
			}
			System.out.println("Final hashmap to load jsp files are :"
					+ hashMap);
			context.getServletContext().setAttribute("hashMap", hashMap);
			
			System.out.println("hashMap is set to Application Context"+hashMap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
				}
			}
		}
	}

	public void contextDestroyed(ServletContextEvent context) {
		System.out.println("ServletContextListener destroyed");
	}
	public static void retrieveValuesFromListMethod(Map map)
    {
        Set keys = (Set) map.keySet();
        Iterator itr = ((java.util.Set) keys).iterator();
 
        String key;
        String value;
        while(itr.hasNext())
        {
            key = (String)itr.next();
            value = (String)map.get(key);
            System.out.println(key + " - "+ value);
        }
    }
}
