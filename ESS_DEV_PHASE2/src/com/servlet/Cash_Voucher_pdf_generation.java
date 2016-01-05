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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.ess.common.action.ConvertRupeesintoWords;
import com.ess.util.GetConnection;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.sun.net.httpserver.Authenticator.Success;

public class Cash_Voucher_pdf_generation {

	

	
	 private ByteArrayInputStream inputStream;
		private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 10,
			      Font.BOLD);
		
		private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 8);
		
		private static Font italic = new Font(Font.FontFamily.TIMES_ROMAN, 8,Font.ITALIC);
		
		
		private static Font bigbold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
			      Font.BOLD);
		
		
		public String e_voucher_reports() throws IOException, DocumentException{
		{
			System.out.println("e_voucher_reports");
			System.out.println("e_Voucher_report_data_fetch  ..getFdate and getFdate.."+getFdate() +" and "+getTdate());
			
			String from_date=getFdate();
			String to_date=getTdate();
			System.out.println("e_Voucher_report  ..getFdate and getFdate.."+from_date +" and "+from_date);
			   HttpServletResponse response = ServletActionContext.getResponse();
			   
			 response.setContentType("application/pdf");
		   		Document document = new Document(PageSize.A4, 3, 3, 50, 50);
		   		
		    ByteArrayOutputStream baos = new ByteArrayOutputStream();
		   		 
		   		 PdfWriter pdfWriter=PdfWriter.getInstance(document, baos);
		    document.open();
		     
			try{
			
			
		     //   PdfPTable table2 = new PdfPTable(new float[] {2,2,2,2,2,2,2,4 });  //11  //8 columns
		        
		        PdfPTable table2 = new PdfPTable(new float[] {1,1,1,1,1,1,1,1,1 }); 
		        PdfPTable tab_tot = new PdfPTable(new float[] {1,1,1,1,1,1,1,1,1 }); 
		        
		        PdfPCell cell;
		        
		        
		        cell=new PdfPCell(new Phrase("Vocher No.",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        cell=new PdfPCell(new Phrase("Paid To",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        cell=new PdfPCell(new Phrase("Towards",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        cell=new PdfPCell(new Phrase("Payment Type",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        cell=new PdfPCell(new Phrase("Cash/Cheque No.",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        
		        cell=new PdfPCell(new Phrase("Amount",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        cell=new PdfPCell(new Phrase("Date",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        cell=new PdfPCell(new Phrase("Prepared By",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		        
		        cell=new PdfPCell(new Phrase("Creation Date",bigbold));
		        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		        table2.addCell(cell);
		      
		        
		        
		        Cash_Voucher_pdf_generation ee=new Cash_Voucher_pdf_generation();
		        ArrayList<String> data=ee.e_Voucher_report_data_fetch(from_date,to_date);
				
		        if (data.size() > 0) 
				  {
		        	System.out.println("data.size.if "+data.size()) ;
				  	for (int m = 0; m < data.size(); m++) {
				  		String fandf_data = data.get(m).toString();
				  		
				  		String reg_arr[] = fandf_data.split("\\^");
						
				  		String voucher_no=reg_arr[0];
						String emp_name=reg_arr[1];
						String reason_to_pay=reg_arr[2];
						String payment_type=reg_arr[3];
						
						String cheque_no=reg_arr[4];
						String amount=reg_arr[5];
						String enter_date=reg_arr[6];
						String prepared_by=reg_arr[7];
						String sys_date=reg_arr[8];
				  		
						
						cell=new PdfPCell(new Phrase(voucher_no,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        cell=new PdfPCell(new Phrase(emp_name,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        cell=new PdfPCell(new Phrase(reason_to_pay,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        cell=new PdfPCell(new Phrase(payment_type,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        cell=new PdfPCell(new Phrase(cheque_no,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        
					        cell=new PdfPCell(new Phrase(amount,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        cell=new PdfPCell(new Phrase(enter_date,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        cell=new PdfPCell(new Phrase(prepared_by,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					        
					        cell=new PdfPCell(new Phrase(sys_date,smallBold));
					        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
					        table2.addCell(cell);
					
					        
						
				  	}
				  	
					
				    String grand_total=ee.calculating_total(from_date,to_date);    
				        
				        cell=new PdfPCell(new Phrase("Total Amount",bigbold));
				        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				        cell.setColspan(5);
				        tab_tot.addCell(cell);
				        
				        cell=new PdfPCell(new Phrase(grand_total,bigbold));
				        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				        tab_tot.addCell(cell);
				        
				        cell=new PdfPCell(new Phrase(" ",smallBold));
				        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				        cell.setColspan(3);
				        tab_tot.addCell(cell);
				        document.add(table2);
				  	document.add(tab_tot);
				  }
						
				 
				  	
				  	else
				  	{
				  		 PdfPCell cell_final;
				    	  PdfPTable ta_final = new PdfPTable(new float[] { 2, 7,5 });
				    	  
				    	  cell_final=new PdfPCell(new Phrase("Record is not Available",smallBold));
				    	  cell_final.setHorizontalAlignment(Element.ALIGN_CENTER);
				    	  cell_final.setColspan(3);
				    	  ta_final.addCell(cell_final);
				    	  document.add(ta_final);
				  	}
				  
		        document.close();
		        
		        pdfWriter.close();
			    document.close();
			    

			   	 response.setContentLength(baos.size());
			   	response.addHeader("Content-Disposition", "attachment; filename=\"cash voucher report.pdf\"");
			   	OutputStream out = response.getOutputStream();
			   	 out = response.getOutputStream();
			   	 baos.writeTo(out);
			   	 out.flush();
			   	 out.close();
			   	
			   	 	
			   	 }catch (Exception e) {
			   		System.out.println("problem in generating pdf for  cash e voucher");
			   		System.err.println("exception in print=="+e.getMessage());
			   		e.printStackTrace();
			   		
			   	}
			        inputStream.close();
			       return "SUCCESS";
			    }
		}

		
			
			
			
	// fetching e_voucher report on date basis
			
			private String fdate="";
			private String tdate="";
			
			public String getFdate() {
				return fdate;
			}

			public void setFdate(String fdate) {
				this.fdate = fdate;
			}

			public String getTdate() {
				return tdate;
			}

			public void setTdate(String tdate) {
				this.tdate = tdate;
			}


			String fdate1=getFdate();
			String tdate1=getTdate();

			
			public ArrayList<String>  e_Voucher_report_data_fetch(String from_date,String to_date) throws SQLException, ParseException
			{
				
				ArrayList<String> voucher=new ArrayList<String>();
				
				System.out.println("e_Voucher_report_data_fetch  ..getFdate and getFdate.."+from_date +" and "+to_date);
				//System.out.println("fdate1.."+fdate+ "tdate1."+tdate1);
				
				SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date tempDate1 =  simpleDateFormat1.parse(from_date);
				SimpleDateFormat outputDateFormat1 = new SimpleDateFormat("dd/MMM/YYYY");
				Object from_date1 = outputDateFormat1.format(tempDate1);
				System.out.println("from_date.." + from_date);
				
				SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date tempDate2 =  simpleDateFormat2.parse(to_date);
				SimpleDateFormat outputDateFormat2 = new SimpleDateFormat("dd/MMM/YYYY");
				Object to_date1 = outputDateFormat2.format(tempDate2);
				System.out.println("to_date.." + to_date);
				
				Connection con_ph3=null;
				Statement st_ph3=null;
				ResultSet rs_ph32=null;
				
				String fetch_evoucherreport_sql="select v.VOUCHER_NO ,v.PAID_TO ,v.REASON_TO_PAY ,v.PAYMENT_TYPE ,v.CASH_OR_CHECK_NO ,v.AMOUNT ,"
						+ "v.ENTER_DATE ,v.PREPARED_BY ,v.IN_DATE from E_VOUCHER v where v.IN_DATE >='"+from_date1+"' and v.IN_DATE<='"+to_date1+"' order by v.VOUCHER_NO ";
				
				
				/*String fetch_phase3_sql="select v.VOUCHER_NO ,v.EMP_NAME ,v.REASON_TO_PAY ,v.PAYMENT_TYPE ,v.CASH_OR_CHECK_NO ,v.AMOUNT ,"
						+ "v.ENTER_DATE ,v.PREPARED_BY ,v.IN_DATE from E_VOUCHER v where ROWID IN (SELECT MAX (ROWID)FROM E_VOUCHER e1)";*/
				
				System.out.println(fetch_evoucherreport_sql);
				 int voucher_no=0;
				String emp_name="";
				String reason_to_pay="";
				String payment_type="";
				
				String cheque_no="";
				int amount=0;
				Date enter_date;
				String prepared_by="";

				Date sys_date;
				
				String final_data;
				
				try{
					con_ph3=GetConnection.getConnection();
					st_ph3=con_ph3.createStatement();
					rs_ph32=st_ph3.executeQuery(fetch_evoucherreport_sql);
					while(rs_ph32.next())
					{
						
						
						voucher_no=rs_ph32.getInt(1);
						emp_name=rs_ph32.getString(2);
						reason_to_pay=rs_ph32.getString(3);
						payment_type=rs_ph32.getString(4);
						
						 cheque_no=rs_ph32.getString(5);
						 if(cheque_no==null){
							 cheque_no=" ";
							 
						 }
						 amount=rs_ph32.getInt(6);
						 enter_date=rs_ph32.getDate(7);
						 prepared_by=rs_ph32.getString(8);
						 
						 sys_date=rs_ph32.getDate(9);
						
						
						 final_data=voucher_no+"^"+emp_name+"^"+reason_to_pay+"^"+payment_type+"^"
						 +cheque_no+"^"+amount+"^"+enter_date+"^"+prepared_by+"^" +sys_date;
						 System.out.println("finale data."+final_data);
						 voucher.add(final_data);
					}
					
				}catch(Exception e)
				{
					System.out.println("problem for geeting values e voucher");
					e.printStackTrace();
				}
				finally{
					rs_ph32.close();
					st_ph3.close();
					con_ph3.close();
				}
				return voucher;
			}
			
	//calculating total		
		
			public String  calculating_total(String from_date_str,String to_date_str) throws SQLException, ParseException
			{
				
				Connection con_bill=null;
				Statement st_bill=null;
				ResultSet rs_bill=null;
				String amount=null;
				
				
						
				SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date tempDate1 =  simpleDateFormat1.parse(from_date_str);
				SimpleDateFormat outputDateFormat1 = new SimpleDateFormat("dd/MMM/YYYY");
				Object from_date = outputDateFormat1.format(tempDate1);
				System.out.println("After convert from date.." + from_date);
				
				
				SimpleDateFormat simpleDateFormat3 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date tempDate3 =  simpleDateFormat3.parse(to_date_str);
				SimpleDateFormat outputDateFormat3 = new SimpleDateFormat("dd/MMM/YYYY");
				Object to_date = outputDateFormat3.format(tempDate3);
				System.out.println("After convert to date.." + to_date);
				
		String expense_amt="select sum(amount) from E_VOUCHER v where v.IN_DATE >='"+from_date+"' and v.IN_DATE<='"+to_date+"' order by v.VOUCHER_NO ";
				
			
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





