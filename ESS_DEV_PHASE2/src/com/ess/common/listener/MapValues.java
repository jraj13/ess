package com.ess.common.listener;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.sql.DataSource;

import com.ess.common.util.MyDataSource;
 

public class MapValues {
	private static String mapSQL ="SELECT ROLE_ATTRIBUTE_KEY,ROLE_ATTRIBUTE_VALUE FROM NCSS_ROLE_ATTRIBUTE WHERE  ROLE_ATTRIBUTE_KEY='EMPLOYEE SELF SERVICE' AND ROLE_ID='4'";
	 public static void main(String args[])
	    {
	        /*Map map = new HashMap();
	 
	        //Adding values to the HashMap
	        map.put("test key 1", "test value 1");
	        map.put("test key 2", "test value 2");
	        map.put("test key 3", "test value 3");
	 
	        System.out.println("Retrieving values from HashMap");
	        retrieveValuesFromListMethod(map);
	        System.out.println("**********************\n\n");*/
		 Connection conn = null;
			Map<String, String> map = new HashMap<String, String>();
			try {
				DataSource dataSource = MyDataSource.getInstance();
				conn = dataSource.getConnection();
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(mapSQL);
				//System.out.println("MAP QUERY========="+mapSQL);
				while (rs.next()) {
					//System.out.println("Database values are :" + rs.getString(1));
					//System.out.println("Database values are :" + rs.getString(2));
					map.put(rs.getString(1), rs.getString(2));
					 retrieveValuesFromListMethod(map);
					
				}
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
	 public static void retrieveValuesFromListMethod(Map map)
	    {
	        Set keys = map.keySet();
	        Iterator itr = keys.iterator();
	 
	        String key;
	        String value;
	        while(itr.hasNext())
	        {
	            key = (String)itr.next();
	            value = (String)map.get(key);
	            System.out.println("Key=="+key + " \n value== "+value);
	        }
	    }

}
