package com.ess.common.action;
 import java.sql.*;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.io.*;
import java.sql.SQLException;

import com.ess.util.*;
import java.util.*;
import java.util.Date;
import javax.sql.DataSource;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;

import oracle.sql.DATE;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;

import java.io.File;
 
public class BiometricData  {
  public static void main(String argv[]) throws SQLException  {
    try {
	File fXmlFile = new File("E:/bmd(18-6-2015).xml");
	
	DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
	Document doc = dBuilder.parse(fXmlFile);
 
	//optional, but recommended
	//read this - http://stackoverflow.com/questions/13786607/normalization-in-dom-parsing-with-java-how-does-it-work
	
	doc.getDocumentElement().normalize();
 
	System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
 
	NodeList nList = doc.getElementsByTagName("BiometricDevice");
	System.out.println(nList);
 
	System.out.println("length of the records------------------"+nList.getLength());

	for (int temp = 0; temp < nList.getLength(); temp++) {
 
		Node nNode = nList.item(temp);
 
		System.out.println("\nCurrent Element :" + nNode.getNodeName());
  
		if (nNode.getNodeType() == Node.ELEMENT_NODE) {
 
			Element eElement = (Element) nNode;
			
			
			//System.out.println("Patients id : " + eElement.getAttribute("id"));
			String date=eElement.getElementsByTagName("Date").item(0).getTextContent();
			String empid=eElement.getElementsByTagName("EmpID").item(0).getTextContent();
			
			String[] str=date.split(" ");
			String datestr=str[0];
			String time=str[1];
			
			/*int count;
		
			int size=time.length();
			for(int i=size-1;i>0;i--)
			{
				 count=time.charAt(i);
				
			}
			 System.out.println("count..."+count);*/
			// System.out.println("count out..."+count);
			/*
			if(time.length()<8)
			{
				String time1 = String.format("%08d", time);
				System.out.println(""+time1);
			}
			*/
	
		
				System.out.println("date--------------"+datestr);
			
			
			    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			   
			    Date tempDate=simpleDateFormat.parse(datestr);
			    System.out.println("tempdate================="+tempDate);
			    
			    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/yyyy");           
			    Object datestr1=outputDateFormat.format(tempDate);
			   
			   // Date date1 = Format.parse(datestr);
			System.out.println("from object date--------------"+datestr1);
			System.out.println("Date== : " + datestr1);
			System.out.println("Time== : " + time );
			//System.out.println("Time1== : " + time1 );
			System.out.println("EMPID== : " + empid);
			
			
			
			Connection con = null;
			CallableStatement callableStatement = null;
	 
	//String getDBUSERByUserIdSql = "{call biometricprocedure5('"+datestr1+"','"+empid+"','"+time+"')}";
			
			String getDBUSERByUserIdSql = "{call BIOMETRICPROCEDURE5('"+datestr1+"','"+empid+"','"+time+"')}";
	 
			try {
				
				System.out.println("inside try====="+getDBUSERByUserIdSql);
				con=GetConnection.getConnection();
				callableStatement = con.prepareCall(getDBUSERByUserIdSql);
				
				callableStatement.executeUpdate();
	
	 
			} catch (SQLException e) {
	 
				System.out.println(e.getMessage());
	 
			} finally {
	 
				if (callableStatement != null) {
					callableStatement.close();
				}
	 
				if (con != null) {
					con.close();
				}
	 
			}
			
			
		}
		}
	
	
	
	
    } catch (Exception e) {
	e.printStackTrace();
    }
    
  }
 
}