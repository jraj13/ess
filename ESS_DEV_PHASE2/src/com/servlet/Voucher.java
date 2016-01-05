package com.servlet;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

public class Voucher {
	
	private String prepared_by;
	private String paid_to_name;
	
	private String reason_paid_amount;
	private String cash_cheque_no;
	private float cash_cheque_amount;
	private String date;
	private String check;
	
	
	public String getCheck()
	{
		return check;
	}
	
	public void setCheck(String check){
		this.check=check;
	}
	
	
	public String getPrepared_by() {
		return prepared_by;
	}

	public void setPrepared_by(String prepared_by) {
		this.prepared_by = prepared_by;
	}

	public String getPaid_to_name() {
		return paid_to_name;
	}

	public void setPaid_to_name(String paid_to_name) {
		this.paid_to_name = paid_to_name;
	}

	public String getReason_paid_amount() {
		return reason_paid_amount;
	}

	public void setReason_paid_amount(String reason_paid_amount) {
		this.reason_paid_amount = reason_paid_amount;
	}

	public String getCash_cheque_no() {
		return cash_cheque_no;
	}


	public void setCash_cheque_no(String cash_cheque_no) {
		this.cash_cheque_no = cash_cheque_no;
	}

	public float getCash_cheque_amount() {
		return cash_cheque_amount;
	}

	public void setCash_cheque_amount(int cash_cheque_amount) {
		this.cash_cheque_amount = cash_cheque_amount;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
	

	 private ByteArrayInputStream inputStream;
		private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 10,
			      Font.BOLD);
		
		
		private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 8);
		
		private static Font italic = new Font(Font.FontFamily.TIMES_ROMAN, 8,Font.ITALIC);
		
		
		private static Font bigbold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
			      Font.BOLD);
		
		
		
			public String execute() throws IOException{
		        HttpServletResponse response = ServletActionContext.getResponse();
		        Voucher cash_voucher=new Voucher();
		        
		    
		        try{
		        	
		        	String final_prepared_by=getPrepared_by();
		        	String final_paid_to_name=getPaid_to_name();
		        	String final_reason_paid_amount=getReason_paid_amount();
		        	String final_cash_cheque_no=getCash_cheque_no();
		        	float ch_amount=getCash_cheque_amount();
		        	String enter_date_page=getDate();
		        	//System.out.println("enter_date in setter method"+enter_date_page);
		        	
		        	String payment_type_final=getCheck();
		        	//System.out.println("payment_type_final"+payment_type_final);
		        	
		        	
		        	
					SimpleDateFormat simpleDateFormat3 = new SimpleDateFormat("yyyy-MM-dd");
					java.util.Date tempDate3=  simpleDateFormat3.parse(enter_date_page);
					SimpleDateFormat outputDateFormat4 = new SimpleDateFormat("dd/MMM/YYYY");
					Object from_date3 = outputDateFormat4.format(tempDate3);
					//System.out.println("you need to enter date is " + from_date3);
					
					
		        	
					 response.setContentType("application/pdf");
				   		Document document = new Document(PageSize.A4, 3, 3, 50, 50);
				   		
				    ByteArrayOutputStream baos = new ByteArrayOutputStream();
				   		 
				   		 PdfWriter pdfWriter=PdfWriter.getInstance(document, baos);
				    document.open();
		        	
		        	
		int cont=cash_voucher.e_voucher_entry( final_paid_to_name, final_reason_paid_amount, payment_type_final,final_cash_cheque_no,
				 ch_amount, from_date3, final_prepared_by) ;      	
		        	
		       	
		      if(cont>0)
		      {
		    	  
		    
		String voucher_no="";
		String emp_name="";
		String reason_to_pay="";
		String payment_type="";
		
		String cheque_no="";
		String amount="";
		String enter_date="";
		String prepared_by="";

		String sys_date="";
		
	    
		  ArrayList<String> data=cash_voucher.getting_data_voucher();
		  if (data.size() > 0) {
		  	for (int m = 0; m < data.size(); m++) {
		  		String fandf_data = data.get(m).toString();
		  		
		  		String reg_arr[] = fandf_data.split("\\^");
				
		  		voucher_no = reg_arr[0];
		  		emp_name = reg_arr[1];
		  		reason_to_pay = reg_arr[2];
		  		payment_type = reg_arr[3];
		  		
		  		cheque_no = reg_arr[4];
		  		amount = reg_arr[5];
		  		enter_date = reg_arr[6];
		  		prepared_by = reg_arr[7];
		  		
		  		sys_date=reg_arr[8];
		  		
		  		
		  	}
		  }
		  
        
		  String detailed_rupees=ConvertRupeesintoWords.NumberToWord(amount);
		  String final_amount_words=detailed_rupees+"Rupees only";
        //PdfPTable table1 = new PdfPTable(new float[] { 7, 3 });
		  
	    Image image1=Image.getInstance("https://lh6.googleusercontent.com/-UiPLWs8CC8A/U2iMqI16btI/AAAAAAAAAFI/MsD-9T20XPI/s160-k-no/");
	 
	    image1.scalePercent(20);
	    
	   
	    PdfPTable table = new PdfPTable(new float[] { 2, 7,5 });
	    PdfPCell cell;
	 
	      
	    PdfPCell cell2=new PdfPCell();
	      
	    cell2.addElement(new Chunk(image1, 5, -5));
	    //cell2.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
	    //cell2.setBorder(Rectangle.TOP);
	    
	    //cell2.setBorder(Rectangle.BOTTOM);
	  //cell2.setBorder(Rectangle.RIGHT);
	    cell2.setRowspan(2);
	      table.addCell(cell2);
	    
	      
	      
		Chunk reportTitle= new Chunk("Nali Clock Software Solutions Pvt.Ltd."+"\n",bigbold);
		reportTitle.setUnderline(0.1f, -2f); //0.1 thick, -2 y-location
		
		
		Chunk sbpart= new Chunk("Patnering With Global Leadres"+"\n "+"\n ",italic);
		Chunk add1= new Chunk("#308/287,Above DTDC Courier, Konappana Agrahara,"+"\n",smallBold);
		
		Chunk add2 = new Chunk("Hosur Main Road, Bangalore - 560100"+ "\n",smallBold);

		Phrase phrase = new Phrase();
		phrase.add(reportTitle);
		phrase.add(sbpart);
		phrase.add(add1);
		phrase.add(add2);

		Paragraph para = new Paragraph();
		para.add(phrase);
		
		cell=new PdfPCell(new Phrase(para));
		//cell.setBorder(Rectangle.RIGHT);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		//cell.setBorder(Rectangle.TOP);
		
        cell.setRowspan(2);
        table.addCell(cell);
        
      /*  cell=new PdfPCell(new Phrase("CASH / VOUCHER ",bigbold));
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);*/
        
        Font font = new Font(FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.WHITE);
      
        
        
        Chunk vouch= new Chunk("CASH / VOUCHER ",font);
        Phrase phrase_vouch = new Phrase();
        phrase_vouch.add(vouch);
        Paragraph para_voch = new Paragraph();
        //para_voch.FontFactory.getFont(new Color(0x00, 0x00, 0xFF));
        para_voch.add(phrase_vouch);
        
        cell=new PdfPCell(new Phrase(para_voch));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setBackgroundColor(BaseColor.GRAY);
        /*cell.setRowspan(2);*/
        table.addCell(cell);
        
        
        Chunk vrno= new Chunk("Vr. No :"+voucher_no+ "\n"+ "\n",catFont);
		
		Chunk date= new Chunk("Date :"+sys_date,catFont);
		Phrase phrase2 = new Phrase();
		phrase2.add(vrno);
		phrase2.add(date);
        
        
		Paragraph para2 = new Paragraph();
		para2.add(phrase2);
		
		cell=new PdfPCell(new Phrase(para2));
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        table.addCell(cell);
        
        document.add(table);
       
        
       
        PdfPTable table2 = new PdfPTable(new float[] { 10, 3,1 });
        
        cell=new PdfPCell(new Phrase("Particulars",bigbold));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        table2.addCell(cell);
        
        cell=new PdfPCell(new Phrase("Rs.",bigbold));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        table2.addCell(cell);
        
        cell=new PdfPCell(new Phrase("Ps.",bigbold));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        table2.addCell(cell);
        
		
        
        
        Chunk paid_to= new Chunk("Paid to :"+emp_name+ "\n"+"\n",catFont);
		
		Chunk towards= new Chunk("Towards :"+reason_to_pay+ "\n"+"\n",catFont);
		
		Chunk cash= new Chunk("Cash / Cheque No. :"+cheque_no+"                                        "+"Date : "+enter_date ,catFont);
		
		Phrase phrase3 = new Phrase();
		phrase3.add(paid_to);
		phrase3.add(towards);
		phrase3.add(cash);
        
        
		Paragraph para3 = new Paragraph();
		para3.add(phrase3);
		
		cell=new PdfPCell(new Phrase(para3));
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table2.addCell(cell);
       
		
		 
		table2.addCell(new Phrase(" ", bigbold));
		table2.addCell(new Phrase(" ", bigbold));
		
		
	
		 Chunk rupees= new Chunk("Rupees in words :"+final_amount_words                        + "\n",catFont);
			
			Chunk total= new Chunk("                                                                                         Total :"+" "+ "\n",bigbold);
			
			Phrase phrase4 = new Phrase();
			phrase4.add(rupees);
			Phrase phrase5 = new Phrase();
			
			phrase5.add(total);
			
			Paragraph para4 = new Paragraph();
			para4.setAlignment(com.itextpdf.text.Element.ALIGN_LEFT);
			
			para4.add(phrase4);
			
			Paragraph para5 = new Paragraph();
			para5.setAlignment(com.itextpdf.text.Element.ALIGN_RIGHT);
			para5.setIndentationRight(70);
			para5.add(phrase5);
			
			
			Paragraph para6 = new Paragraph();
			para6.add(para4);
			para6.add(para5);
			
			cell=new PdfPCell(new Phrase(para6));
			
			table2.addCell(cell);
        
		
			
			Chunk amt= new Chunk(" "+amount,bigbold);
			
			
			Phrase ph_amt = new Phrase();
			ph_amt.add(amt);
			Paragraph para_amt = new Paragraph();
			para_amt.add(ph_amt);
			cell=new PdfPCell(new Phrase(para_amt));
			cell.setVerticalAlignment(Element.ALIGN_BOTTOM);
			table2.addCell(cell);
			
			table2.addCell(new Phrase(" "+" ", bigbold));
		
		
		
		cell=new PdfPCell(new Phrase("Prepared By                   Checked By                        Authorized By                              Receiver's Signature "+"\n " +"\n " +"\n "          
		,catFont));
        
       cell.setColspan(3);
        cell.setRowspan(2);
        table2.addCell(cell);
        document.add(table2);
		      }
		      else
		      {
		    	  PdfPCell cell_final;
		    	  PdfPTable ta_final = new PdfPTable(new float[] { 2, 7,5 });
		    	  
		    	  cell_final=new PdfPCell(new Phrase("Record is not inserted Please try Again",smallBold));
		    	  cell_final.setHorizontalAlignment(Element.ALIGN_CENTER);
		    	  cell_final.setColspan(3);
		    	  ta_final.addCell(cell_final);
		    	  document.add(ta_final);
		  	    
		  	    
		      }
        
        document.close();
        
        
	    
	    
        pdfWriter.close();
	    document.close();
	    

	   	 response.setContentLength(baos.size());
	   	response.addHeader("Content-Disposition", "attachment; filename=\"cash voucher.pdf\"");
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

		
			
			
			
			
			public ArrayList<String>  getting_data_voucher() throws SQLException
			{
				ArrayList<String> voucher=new ArrayList<String>();
				Connection con_ph3=null;
				Statement st_ph3=null;
				ResultSet rs_ph32=null;
				
				String fetch_phase3_sql="select v.VOUCHER_NO ,v.PAID_TO ,v.REASON_TO_PAY ,v.PAYMENT_TYPE ,v.CASH_OR_CHECK_NO ,v.AMOUNT ,"
						+ "v.ENTER_DATE ,v.PREPARED_BY ,v.IN_DATE from E_VOUCHER v  where v.VOUCHER_NO in (select max( VOUCHER_NO) from E_VOUCHER e1)";
				

				/*String fetch_phase3_sql="select v.VOUCHER_NO ,v.EMP_NAME ,v.REASON_TO_PAY ,v.PAYMENT_TYPE ,v.CASH_OR_CHECK_NO ,v.AMOUNT ,"
						+ "v.ENTER_DATE ,v.PREPARED_BY ,v.IN_DATE from E_VOUCHER v where VOUCHER_NO=1 ";*/
				
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
					rs_ph32=st_ph3.executeQuery(fetch_phase3_sql);
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
						System.out.println("cheque no."+cheque_no);
						
						 final_data=voucher_no+"^"+emp_name+"^"+reason_to_pay+"^"+payment_type+"^"
						 +cheque_no+"^"+amount+"^"+enter_date+"^"+prepared_by+"^"
								 +sys_date;
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
				
		
			
			//for inserting save operation
			
			public int e_voucher_entry(String paid_to_name, String reason_paid_amount,String payment_type,String cash_cheque_no, float cash_cheque_amount, Object sysdate1,String prepare_by) throws SQLException
			{
				
					Connection con=null;
					Statement stmt=null;
					int rs=0;
					String prepare_by1=prepare_by;
					
					String empDataAry[] = prepare_by1.split("\\@");
					String prepared_by = empDataAry[0];
					
					//String sysdate="sysdate";
					Date date = new Date();
				    SimpleDateFormat sdf;
				    sdf = new SimpleDateFormat("dd/MMM/yyyy");
				    Object creation_date=sdf.format(date);
				    System.out.println(creation_date);
					
					
				String e_voucher_entry_qry="insert into E_VOUCHER(PAID_TO,REASON_TO_PAY,PAYMENT_TYPE,CASH_OR_CHECK_NO,AMOUNT,ENTER_DATE,PREPARED_BY,in_date) "
						+ " VALUES ('"+paid_to_name+"','"+reason_paid_amount+"','"+payment_type+"','"+cash_cheque_no+"','"+cash_cheque_amount+"','"+sysdate1+"','"+prepared_by+"','"+creation_date+"')";
				
						System.out.println("e_voucher_entry_qry.."+e_voucher_entry_qry);		
				try{
					con=GetConnection.getConnection();
					stmt=con.createStatement();
					
					rs=stmt.executeUpdate(e_voucher_entry_qry);
				
					//System.out.println("calling pdf");
					
					if(rs>0){
						// System.out.println("Result set of the  in e voucher:::::"+rs);  
						
					}
					else{
						
						//e_voucher_ret="not saved";
					}
					
					
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				finally
				{
					stmt.close();
					con.close();
				}
				
				return rs;
			}
			
			
}

