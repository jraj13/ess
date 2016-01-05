package com.servlet;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


public class Monthly_Expenses_Reports {

	private String type_expense;
	private String year;
	private String month;
	
	
	public void setType_expense(String type_expense)
	{
		this.type_expense=type_expense;
	}
	public String getType_expense()
	{
		return type_expense;
	}
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
	
	
	
	 private ByteArrayInputStream inputStream;
	//private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 10,
		  //    Font.BOLD);
	
	
	private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 8);
	
	//private static Font italic = new Font(Font.FontFamily.TIMES_ROMAN, 8,Font.ITALIC);
	
	
	private static Font bigbold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
		      Font.BOLD);
	
	
		public String month_year_basis() throws IOException{
			
	        HttpServletResponse response = ServletActionContext.getResponse();
	    
	       String report_name="Report"; 
	        
	        
	        
	        try{
	        	
	   		 response.setContentType("application/pdf");
	   		Document document = new Document(PageSize.A4, 3, 3, 50, 50);
	   		
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
	   		 
	   		 PdfWriter pdfWriter=PdfWriter.getInstance(document, baos);
	    document.open();
	     
	    Monthly_Expenses_Reports cash_voucher=new Monthly_Expenses_Reports();
	    
	    String cmp_str="ALL";
	    /*int ior=1;*/
	    
	    /*if(ior<=0)*/
	    if( getType_expense().equalsIgnoreCase(cmp_str))
	    
	    {
	    	report_name="All Expenses Report";
	    ArrayList<String> master=cash_voucher.fetching_master_data();
		  if (master.size() > 0) 
		  {
		  	for (int i = 0; i < master.size(); i++) {
		  		String exp_master = master.get(i).toString();
		  		
		  		String master_arr[] = exp_master.split("\\^");
				
		  		String type_of_expense=master_arr[0].trim();
				
		
	    
	    Chunk reportTitle= new Chunk(type_of_expense+"\n",bigbold);
		reportTitle.setUnderline(0.1f, -2f); //0.1 thick, -2 y-location
		
		
		Chunk sbpart= new Chunk("Month :"+getMonth()+"\n ",bigbold);
		Chunk add1= new Chunk("Year"+getYear()+"\n",bigbold);
		

		Phrase phrase = new Phrase();
		phrase.add(reportTitle);
		phrase.add(sbpart);
		phrase.add(add1);
		//phrase.add(add2);

		Paragraph para = new Paragraph();
		para.add(phrase);
		para.setAlignment(Element.ALIGN_CENTER);
	    
		 document.add(para);
		  
		 
		 
		 
		 //adding empty line
		 
		 Chunk empty_line=new Chunk("\n");
		 Phrase phrase_empty = new Phrase();
		 phrase_empty.add(empty_line);
		 Paragraph para_empty = new Paragraph();
		 para_empty.add(phrase_empty);
		 document.add(para_empty);
		  
        PdfPCell cell;
       
        PdfPTable table2 = new PdfPTable(new float[] {2,2,2,2,2,2,2,4 });  //11  //8 columns
        
        PdfPTable tot_para = new PdfPTable(new float[] {2,2,2,2,2,2,2,4 });  //11  //8 columns
        
        cell=new PdfPCell(new Phrase("Date",bigbold));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        table2.addCell(cell);
        
        cell=new PdfPCell(new Phrase("Month",bigbold));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        table2.addCell(cell);
        
        cell=new PdfPCell(new Phrase("Period",bigbold));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        table2.addCell(cell);
        
        cell=new PdfPCell(new Phrase("Bill No",bigbold));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        table2.addCell(cell);
        
        cell=new PdfPCell(new Phrase("Bill Date",bigbold));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        table2.addCell(cell);
        
        
        cell=new PdfPCell(new Phrase("Due Date",bigbold));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        table2.addCell(cell);
        
        cell=new PdfPCell(new Phrase("Amount",bigbold));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        table2.addCell(cell);
        
        cell=new PdfPCell(new Phrase("Remarks",bigbold));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        table2.addCell(cell);
        
     
        
        ArrayList<String> data=cash_voucher.bills(type_of_expense,getMonth(),getYear());
		  if (data.size() > 0) 
		  {
		  	for (int m = 0; m < data.size(); m++) {
		  		String fandf_data = data.get(m).toString();
		  		
		  		String reg_arr[] = fandf_data.split("\\^");
				
		  		String date=reg_arr[0];
				String month=reg_arr[1];
				String period=reg_arr[2];
				String bill_no=reg_arr[3];
				
				String bill_Date=reg_arr[4];
				String due_date=reg_arr[5];
				String amount=reg_arr[6];
				String remarks=reg_arr[7];
		  		
		  		
				
				 cell=new PdfPCell(new Phrase(date,smallBold));
			        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			        table2.addCell(cell);
			        
			        cell=new PdfPCell(new Phrase(month,smallBold));
			        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			        table2.addCell(cell);
			        
			        cell=new PdfPCell(new Phrase(period,smallBold));
			        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			        table2.addCell(cell);
			        
			        cell=new PdfPCell(new Phrase(bill_no,smallBold));
			        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			        table2.addCell(cell);
			        
			        cell=new PdfPCell(new Phrase(bill_Date,smallBold));
			        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			        table2.addCell(cell);
			        
			        
			        cell=new PdfPCell(new Phrase(due_date,smallBold));
			        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			        table2.addCell(cell);
			        
			        cell=new PdfPCell(new Phrase(amount,smallBold));
			        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			        table2.addCell(cell);
			        
			        cell=new PdfPCell(new Phrase(remarks,smallBold));
			        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			        table2.addCell(cell);
				
				
				
		  	}
		  	
		  	String grant_amount=cash_voucher.calculating_total(type_of_expense,getMonth(),getYear());
	        
	        cell=new PdfPCell(new Phrase("Total Amount",bigbold));
	        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	        cell.setColspan(6);
	        tot_para.addCell(cell);
	        
	        cell=new PdfPCell(new Phrase(grant_amount,bigbold));
	        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        
	        tot_para.addCell(cell);
	        
	        cell=new PdfPCell(new Phrase(" ",bigbold));
	        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	       // cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
	        tot_para.addCell(cell);
		  	
		  	
		  	
		  	
		  }
				
		 
		  	
		  	else
		  	{
		  	  cell=new PdfPCell(new Phrase("No Reords Fond",smallBold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setColspan(8);
		        table2.addCell(cell);
		  		
		  	}
		  
        
        
        
        document.add(table2);
        document.add(tot_para);
        document.add(para_empty);
        
		  	}
		  }
		  
	    }
		  
		  else
		  {
			  report_name=getType_expense()+" Report";
			  Chunk reportTitle= new Chunk(getType_expense()+"\n",bigbold);
				reportTitle.setUnderline(0.1f, -2f); //0.1 thick, -2 y-location
				
				
				Chunk sbpart= new Chunk("Month :"+getMonth()+"\n ",bigbold);
				Chunk add1= new Chunk("Year"+getYear()+"\n"+"\n"+"\n",bigbold);
				

				Phrase phrase = new Phrase();
				phrase.add(reportTitle);
				phrase.add(sbpart);
				phrase.add(add1);
				//phrase.add(add2);

				Paragraph para = new Paragraph();
				para.add(phrase);
				para.setAlignment(Element.ALIGN_CENTER);
			    
				 document.add(para);
			  
			  
			  PdfPCell cell;
		       
		        PdfPTable table2 = new PdfPTable(new float[] {2,2,2,2,2,2,2,4 });  //11  //8 columns
		        PdfPTable tot_para = new PdfPTable(new float[] {2,2,2,2,2,2,2,4 });
		        
		        cell=new PdfPCell(new Phrase("Date",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        cell=new PdfPCell(new Phrase("Month",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        cell=new PdfPCell(new Phrase("Period",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        cell=new PdfPCell(new Phrase("Bill No",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        cell=new PdfPCell(new Phrase("Bill Date",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        
		        cell=new PdfPCell(new Phrase("Due Date",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        cell=new PdfPCell(new Phrase("Amount",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        cell=new PdfPCell(new Phrase("Remarks",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		     
		        
		        ArrayList<String> data=cash_voucher.bills(getType_expense(),getMonth(),getYear());
				  if (data.size() > 0) 
				  {
				  	for (int m = 0; m < data.size(); m++) {
				  		String fandf_data = data.get(m).toString();
				  		
				  		String reg_arr[] = fandf_data.split("\\^");
						
				  		String date=reg_arr[0];
						String month=reg_arr[1];
						String period=reg_arr[2];
						String bill_no=reg_arr[3];
						
						String bill_Date=reg_arr[4];
						String due_date=reg_arr[5];
						String amount=reg_arr[6];
						String remarks=reg_arr[7];
				  		
				  		
						
						 cell=new PdfPCell(new Phrase(date,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        cell=new PdfPCell(new Phrase(month,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        cell=new PdfPCell(new Phrase(period,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        cell=new PdfPCell(new Phrase(bill_no,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        cell=new PdfPCell(new Phrase(bill_Date,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        
					        cell=new PdfPCell(new Phrase(due_date,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        cell=new PdfPCell(new Phrase(amount,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        cell=new PdfPCell(new Phrase(remarks,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
						
						
						
				  	}
				  	 String grant_amount=cash_voucher.calculating_total(getType_expense(),getMonth(),getYear());
				  	 cell=new PdfPCell(new Phrase("Total Amount",bigbold));
				        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				        cell.setColspan(6);
				        tot_para.addCell(cell);
				        
				        cell=new PdfPCell(new Phrase(grant_amount,bigbold));
				        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				        
				        tot_para.addCell(cell);
				        
				        cell=new PdfPCell(new Phrase(" ",bigbold));
				        //cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				        //cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
				        tot_para.addCell(cell);
				  	
				  }
						
				 
				  	
				  	else
				  	{
				  	  cell=new PdfPCell(new Phrase("No Reords Fond",smallBold));
				        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				        cell.setColspan(8);
				        table2.addCell(cell);
				  		
				  	}
				  
		        
		        
		        
		        document.add(table2);
		        
		        
		        document.add(tot_para);
			  
			  
			  
		  }
		  
		  
		  
		  
        document.close();
        
        
	    
	    
        pdfWriter.close();
	    document.close();
	    

	   	 response.setContentLength(baos.size());
	   	/*response.addHeader("Content-Disposition", "attachment; filename=\"Telephone Bills.pdf\"");*/
	   	response.addHeader("Content-Disposition", "attachment; filename=\""+report_name+".pdf\"");
	   	OutputStream out = response.getOutputStream();
	   	 out = response.getOutputStream();
	   	 baos.writeTo(out);
	   	 out.flush();
	   	 out.close();
	   	
	   	 	
	   	 }catch (Exception e) {
	   		System.out.println("problem in generating pdf for Telephone bills");
	   		System.err.println("exception in print=="+e.getMessage());
	   		e.printStackTrace();
	   		
	   	}
	        inputStream.close();
	        return "SUCCESS";
	    }


		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*public ArrayList<String>  bills(String type_of_expense) throws SQLException
		{
			ArrayList<String> bills_data=new ArrayList<String>();
			Connection con_bill=null;
			Statement st_bill=null;
			ResultSet rs_bill=null;
			
		String expense_sql=	"select MONTH_IN ,PERIOD ,BILL_NO ,BILL_DATE ,DUE_DATE ,AMOUNT ,REMARKS , IN_DATE   "
				+ "from MONTHLY_EXPENSES where TYPE_EXPENSE='"+type_of_expense+"'";
			

			Date date;
			String month="";
			String period="";
			String bill_no="";
			
			Date bill_Date;
			Date due_date;
			float amount=0.0f;
			String remarks="";
			
			String final_data="";
			try{
				con_bill=GetConnection.getConnection();
				st_bill=con_bill.createStatement();
				rs_bill=st_bill.executeQuery(expense_sql);
				while(rs_bill.next())
				{
					
					date=rs_bill.getDate("IN_DATE");
					month=rs_bill.getString("MONTH_IN");
					period=rs_bill.getString("PERIOD");
					bill_no=rs_bill.getString("BILL_NO");
					
					bill_Date=rs_bill.getDate("BILL_DATE");
					due_date=rs_bill.getDate("DUE_DATE");
					amount=rs_bill.getFloat("AMOUNT");
					remarks=rs_bill.getString("REMARKS");
					
					
					
					 final_data=date+"^"+month+"^"+period+"^"+bill_no+"^"
					 +bill_Date+"^"+due_date+"^"+amount+"^"+remarks;
							 
					 bills_data.add(final_data);
					 System.out.println("the final data is in telephone expense entry"+bills_data);
				}
				
			}catch(Exception e)
			{
				System.out.println("problem for geeting values e voucher");
				e.printStackTrace();
			}
			finally{
				rs_bill.close();
				st_bill.close();
				con_bill.close();
			}
			return bills_data;
		}
			*/
		
		
		
		public ArrayList<String>  fetching_master_data() throws SQLException
		{
			ArrayList<String> master_data=new ArrayList<String>();
			Connection con_bill=null;
			Statement st_bill=null;
			ResultSet rs_bill=null;
			
		String expense_sql=	"select MENU_ITEM from EXPENSE_ENTRY_MENU ";
			

			
			String item_name="";
			
			String final_data="";
			try{
				con_bill=GetConnection.getConnection();
				st_bill=con_bill.createStatement();
				rs_bill=st_bill.executeQuery(expense_sql);
				while(rs_bill.next())
				{
					
					item_name=rs_bill.getString("MENU_ITEM");
					
					 final_data=item_name;
							 
					 master_data.add(final_data);
					 System.out.println("daily bills master table"+master_data);
				}
				
			}catch(Exception e)
			{
				System.out.println("problem for geeting values e voucher");
				e.printStackTrace();
			}
			finally{
				rs_bill.close();
				st_bill.close();
				con_bill.close();
			}
			return master_data;
		}
	



	
	//Based on the exact type
	
	public ArrayList<String>  bills(String type_expense_entry,String month_in,String year_in) throws SQLException
	{
		ArrayList<String> bills_data=new ArrayList<String>();
		Connection con_bill=null;
		Statement st_bill=null;
		ResultSet rs_bill=null;
		
	/*String expense_sql=	"select MONTH_IN ,PERIOD ,BILL_NO ,BILL_DATE ,DUE_DATE ,AMOUNT ,REMARKS , IN_DATE   "
			+ "from MONTHLY_EXPENSES where TYPE_EXPENSE='"+type_expense_entry+"'";*/
	
	
		String expense_sql="select MONTH_IN ,PERIOD ,BILL_NO ,BILL_DATE ,DUE_DATE ,AMOUNT ,REMARKS , IN_DATE  from "
			+ "MONTHLY_EXPENSES where TYPE_EXPENSE='"+type_expense_entry+"' and to_char(IN_DATE,'MON')='"+month_in+"' and to_char(IN_DATE,'YYYY')='"+year_in+"'";
	
		System.out.println("esqlllllllll"+expense_sql);
		Date date;
		String month="";
		String period="";
		String bill_no="";
		
		Date bill_Date;
		Date due_date;
		float amount=0.0f;
		String remarks="";
		
		String final_data="";
		try{
			con_bill=GetConnection.getConnection();
			st_bill=con_bill.createStatement();
			rs_bill=st_bill.executeQuery(expense_sql);
			while(rs_bill.next())
			{
				
				date=rs_bill.getDate("IN_DATE");
				month=rs_bill.getString("MONTH_IN");
				period=rs_bill.getString("PERIOD");
				bill_no=rs_bill.getString("BILL_NO");
				
				bill_Date=rs_bill.getDate("BILL_DATE");
				due_date=rs_bill.getDate("DUE_DATE");
				amount=rs_bill.getFloat("AMOUNT");
				remarks=rs_bill.getString("REMARKS");
				
				
				
				 final_data=date+"^"+month+"^"+period+"^"+bill_no+"^"
				 +bill_Date+"^"+due_date+"^"+amount+"^"+remarks;
						 
				 bills_data.add(final_data);
				 System.out.println("the final data is in telephone expense entry"+bills_data);
			}
			
		}catch(Exception e)
		{
			System.out.println("expense child table");
			e.printStackTrace();
		}
		finally{
			rs_bill.close();
			st_bill.close();
			con_bill.close();
		}
		return bills_data;
	}
		

	
	
	
	public String  calculating_total(String type_expense_entry,String month_in,String year_in) throws SQLException, ParseException
	{
		
		Connection con_bill=null;
		Statement st_bill=null;
		ResultSet rs_bill=null;
		String amount=null;
		
		
		
String expense_amt="select sum(AMOUNT) from "
		+ "MONTHLY_EXPENSES where TYPE_EXPENSE='"+type_expense_entry+"' and to_char(IN_DATE,'MON')='"+month_in+"' and to_char(IN_DATE,'YYYY')='"+year_in+"'";
		
	
		try{
			con_bill=GetConnection.getConnection();
			st_bill=con_bill.createStatement();
			rs_bill=st_bill.executeQuery(expense_amt);
			while(rs_bill.next())
			{
				
				amount=String.valueOf(rs_bill.getFloat(1));
				
			}
			
		}catch(Exception e)
		{
			System.out.println("problem for geeting values e voucher");
			e.printStackTrace();
		}
		finally{
			rs_bill.close();
			st_bill.close();
			con_bill.close();
		}
		return amount;
	}
	
	
	
	
	
	

	
}
