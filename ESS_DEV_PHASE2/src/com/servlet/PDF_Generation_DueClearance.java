package com.servlet;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.ess.common.eseparation.DueClearance;
import com.ess.util.GetConnection;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PDF_Generation_DueClearance extends ActionSupport
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	 private ByteArrayInputStream inputStream;
		private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 10,
			      Font.BOLD);
		private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 8);
		
		private static Font bigbold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
			      Font.BOLD);
		
		
			public String execute() throws IOException{
		        HttpServletResponse response = ServletActionContext.getResponse();
		        Map<String,Object> session = ActionContext.getContext().getSession();
		        String seq_pdfId=(String) session.get("pdfsequence_id_due_clerance");
				System.out.println("SEQUENCE_NO..in pdf generation in due clerance"+seq_pdfId);
		        
		        try{
		        	 
		        	 /** set content type as PDF */
		   		 response.setContentType("application/pdf");
		    /** create Object Of document */
		   		 /*Document document = new Document(PageSize.FLSE);*/
		   		 //Document document=new Document();
		   		 /** set margin of page */
		   		//document.setMargins(1.05F,0.75F, 2F,0.75F);
		   		//Document document = new Document(PageSize.A4, 50, 50, 50, 50);
		   		Document document = new Document(PageSize.A4, 3, 3, 50, 50);
		   		
		    ByteArrayOutputStream baos = new ByteArrayOutputStream();
		   		 
		   		 PdfWriter pdfWriter=PdfWriter.getInstance(document, baos);
		    document.open();
		    
		    
		     
		     
		     Paragraph para_head = new Paragraph();

		     para_head.setSpacingAfter(5);
		     para_head.setSpacingBefore(5);
		     para_head.setAlignment(Element.ALIGN_MIDDLE);
		     para_head.setIndentationLeft(200);
		     para_head.setIndentationRight(200);
		     Chunk chunk_head = new Chunk(
	                   "Request Number :"+seq_pdfId,bigbold);
		     
		     
		     para_head.add(chunk_head);
	               document.add(para_head);
		    
		   Rectangle rect= new Rectangle(150,150);
	        rect.enableBorderSide(1);
	        rect.enableBorderSide(2);
	        rect.enableBorderSide(4);
	        rect.enableBorderSide(8);
	        rect.setBorder(2);
	        rect.setBorderColor(BaseColor.BLACK);
	        document.add(rect);
		    
		    
		    
		    PdfPTable table = new PdfPTable(new float[] { 5, 5 });
		    
			  table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
			  table.getDefaultCell().setBorder(Rectangle.NO_BORDER);
			  
			  String emp_id="";
			  String fname="";
			  String lname="";
			  String designation="";
			  String mail_id="";
			  String detailed_reason="";
			  String releav_date="";
			  String creation_date="";
			  ArrayList<String> data=PDF_Generation_DueClearance.fetch_Personal_info(seq_pdfId);
			  if (data.size() > 0) {
			  	for (int m = 0; m < data.size(); m++) {
			  		String fandf_data = data.get(m).toString();
			  		
			  		String reg_arr[] = fandf_data.split("\\^");
			  		
			  		emp_id=reg_arr[0];
			  		fname = reg_arr[1];
			  		lname=reg_arr[2];
			  		designation = reg_arr[3];
			  		mail_id = reg_arr[4];
			  		detailed_reason=reg_arr[5];
			  		releav_date=reg_arr[6];
			  		creation_date=reg_arr[7];
			  		
			  	}
			  }
			  
			  
			  table.addCell(new Phrase("Employee Details",bigbold));
			  
			  table.addCell(new Phrase("Organization Details",bigbold));
			  table.setHeaderRows(1);
			  
			  PdfPCell[] cells = table.getRow(0).getCells(); 
			  
			  for (int j=0;j<cells.length;j++){
			     cells[j].setBackgroundColor(BaseColor.LIGHT_GRAY);
			     
			  }
		          
		    	     table.addCell(new Phrase("Employee Name:"+fname +lname,smallBold));

		             table.addCell(new Phrase("Designation:"+designation,smallBold));
		             
		            
		             table.addCell(new Phrase("Employee Number:"+emp_id,smallBold));
		             table.addCell(new Phrase("Job:"+designation,smallBold));
		             
		             table.addCell(new Phrase("E-Mail ID:"+mail_id,smallBold));
		             table.addCell(new Phrase("Organization:"+ " ",smallBold));
		             
	        document.add(table);
	        
	        //second table
	        
	        PdfPTable table2 = new PdfPTable(new float[] { 5, 5 });
		    
			  table2.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
			  table2.getDefaultCell().setBorder(Rectangle.NO_BORDER);
			  
			  
			  table2.addCell(new Phrase("Administration Data",bigbold));
			  
			  table2.addCell(new Phrase("Separation Details",bigbold));
			  
		          
			  table2.setHeaderRows(1);
			  
			  PdfPCell[] cells2 = table2.getRow(0).getCells(); 
			  
			  for (int i=0;i<cells2.length;i++){
			     cells2[i].setBackgroundColor(BaseColor.LIGHT_GRAY);
			     
			  }
		          
		    	     table2.addCell(new Phrase("Solution Type:"+"E-Separation",smallBold));
		             table2.addCell(new Phrase("Action Type:"+"Pre Separation",smallBold));
		            
		             table2.addCell(new Phrase("Status:"+"In Process",smallBold));
		             table2.addCell(new Phrase("Action Reason:"+"Resignation",smallBold));
		             
		             table2.addCell(new Phrase("Withdrawal Reason:"+" ",smallBold));
		             table2.addCell(new Phrase("Detailed Reason:"+detailed_reason,smallBold));
		             
		             table2.addCell(new Phrase("On Hold Reason:"+" ",smallBold));
		             table2.addCell(new Phrase("Relieving Date:"+releav_date,smallBold));
		             
		             table2.addCell(new Phrase("Creation date/Time:"+creation_date,smallBold));
		             table2.addCell(new Phrase(" "+" ",smallBold));
	        
	        document.add(table2);
	        
	        
	        Paragraph paragraph1 = new Paragraph();

	        paragraph1.setSpacingAfter(5);
	        paragraph1.setSpacingBefore(5);
	        paragraph1.setAlignment(Element.ALIGN_LEFT);
	        paragraph1.setIndentationLeft(60);
	        paragraph1.setIndentationRight(60);
       
               Chunk chunk1 = new Chunk(
                   "Counseller Details",bigbold);
              
               paragraph1.add(chunk1);
               document.add(paragraph1);
	        
	      
	        
	        //table3
	        
	        PdfPTable table3 = new PdfPTable(new float[] { 2,2,2,2,2 });
		    
			  table3.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
			  
			  
			  table3.addCell(new Phrase("Created By Role",catFont));
			  table3.addCell(new Phrase("User ID",catFont));
			  table3.addCell(new Phrase("Counseller ID",catFont));
			  table3.addCell(new Phrase("Group ID",catFont));
			  table3.addCell(new Phrase("Status",catFont));
			 
		          
			  table3.setHeaderRows(1);
			  
			  PdfPCell[] cells3 = table3.getRow(0).getCells(); 
			  
			  for (int i=0;i<cells3.length;i++){
			     cells3[i].setBackgroundColor(BaseColor.LIGHT_GRAY);
			     
			  }
		          
		    	     table3.addCell(new Phrase(" ",smallBold));
		    	     table3.addCell(new Phrase(" ",smallBold));
		    	     table3.addCell(new Phrase(" ",smallBold));
		    	     table3.addCell(new Phrase(" ",smallBold));
		    	     table3.addCell(new Phrase(" ",smallBold));
		    	     document.add(table3);
	        
		    	    
		    	     

				     Paragraph paragraph2 = new Paragraph();

				     paragraph2.setSpacingAfter(5);
				     paragraph2.setSpacingBefore(5);
				     paragraph2.setAlignment(Element.ALIGN_LEFT);
				     paragraph2.setIndentationLeft(60);
				     paragraph2.setIndentationRight(60);
		        
		                Chunk chunk2 = new Chunk(
		                    "Approver Details",bigbold);
		               
		                paragraph2.add(chunk2);
		                document.add(paragraph2);
		    	     
		    	     
		    	     
		    	     
		    	   
		    
		 	       //table4
			        
			        PdfPTable table4 = new PdfPTable(new float[] { 2,2,2,2,2 });
				    
					  table4.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
					  //table3.getDefaultCell().setBorder(Rectangle.NO_BORDER);
					  
					  
					  table4.addCell(new Phrase("Created By Role",catFont));
					  
				      table4.addCell(new Phrase("User ID",catFont));
				      table4.addCell(new Phrase("Approver ID",catFont));
				      table4.addCell(new Phrase("Group ID",catFont));
				      table4.addCell(new Phrase("Status",catFont));
				          
				      table4.setHeaderRows(1);
					  
					  PdfPCell[] cells4 = table4.getRow(0).getCells(); 
					  
					  for (int i=0;i<cells4.length;i++){
					     cells4[i].setBackgroundColor(BaseColor.LIGHT_GRAY);
					  }
				          
					  table4.addCell(new Phrase(" ",smallBold));
					  table4.addCell(new Phrase(" ",smallBold));
					  table4.addCell(new Phrase(" ",smallBold));
					  table4.addCell(new Phrase(" ",smallBold));
					  table4.addCell(new Phrase(" ",smallBold));
				     document.add(table4);  
				    
		 	        
				     Paragraph paragraph3 = new Paragraph();

				     paragraph3.setSpacingAfter(5);
				     paragraph3.setSpacingBefore(5);
				     paragraph3.setAlignment(Element.ALIGN_LEFT);
				     paragraph3.setIndentationLeft(60);
				     paragraph3.setIndentationRight(60);
		        
		                Chunk chunk3 = new Chunk(
		                    "Check List Details",bigbold);
		               
		                paragraph3.add(chunk3);
		                document.add(paragraph3);
			 	        
			 	        
			 	       //table5
				        
				        PdfPTable table5 = new PdfPTable(new float[] { 3,1.5f,1.2f,2.3f,1.3f,1.5f,2 });
					    
				        table5.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
						  //table3.getDefaultCell().setBorder(Rectangle.NO_BORDER);
						  
				        table5.addCell(new Phrase("Description",catFont));
						  
				        table5.addCell(new Phrase("Object ID",catFont));
				        table5.addCell(new Phrase("Owner",catFont));
				        table5.addCell(new Phrase("Department",catFont));
				        table5.addCell(new Phrase("Amount",catFont));
				        table5.addCell(new Phrase("Currency",catFont));
				        table5.addCell(new Phrase("Status",catFont));
				        
				        
				        
				        
				        table5.setHeaderRows(1);
				         
						  
						  PdfPCell[] cells5 = table5.getRow(0).getCells(); 
						  
						  
						  for (int i=0;i<cells5.length;i++){
						     cells5[i].setBackgroundColor(BaseColor.LIGHT_GRAY);
						     
						  }
					          
						 
						  
						  DueClearance dc=new DueClearance();

			               // ArrayList<String> arrObj=dc.getDueClearanceStatusfor_fnf(seq_pdfId);
			                ArrayList<String> arrObj=dc.getDueClearanceStatusfor_fnf_PDF(seq_pdfId);   
			                if (arrObj.size() > 0) {
			                for(int i=0;i<arrObj.size();i++){
			                	
			                	String strArray=arrObj.get(i).toString();
			                	
			                	String[] arrdata=strArray.split("\\^");
			                	
			                	/*//String EMP_SEQ_NO=arrdata[0];
			                	
			                	String TASK_LIST=arrdata[1];
			                	//String MANAGER_MAIL_ID=arrdata[2];
			                	String TASK_TYPE=arrdata[3];
			                	//String REMARKS=arrdata[4];
			                	String AMOUNT=arrdata[5];
			                	String TASK_STATUS=arrdata[6];
			                	//String date_assign=arrdata[7];
*/
		                	System.out.println("Check values");
		                	
			                	String EMP_SEQ_NO=arrdata[0];
			                	System.out.println("EMP_SEQ_NO.."+EMP_SEQ_NO);
			                	String MANAGER_MAIL_ID=arrdata[1];
			                	System.out.println("MANAGER_MAIL_ID.."+MANAGER_MAIL_ID);
			                	String TASK_ASSIGN_DATE=arrdata[2];
			                	System.out.println("TASK_ASSIGN_DATE.."+TASK_ASSIGN_DATE);
			                	String STATUS=arrdata[3];
			                	System.out.println("STATUS.."+STATUS);
			                	String TASK_OWNER_REMARKS=arrdata[4];
			                	System.out.println("TASK_OWNER_REMARKS.."+TASK_OWNER_REMARKS);
			                	String TASK_LIST=arrdata[5];
			                	System.out.println("TASK_LIST.."+TASK_LIST);
			                	String TASK_TYPE=arrdata[6];
			                	System.out.println("TASK_TYPE.."+TASK_TYPE);
			                	String TASK_STATUS=arrdata[7];
			                	System.out.println("TASK_STATUS.."+TASK_STATUS);
			                	String AMOUNT=arrdata[8];
			                	System.out.println("AMOUNT.."+AMOUNT);
			                	
			                	
			                	 table5.addCell(new Phrase(TASK_TYPE,smallBold));
			                	 table5.addCell(new Phrase(" ",smallBold));
			                	 table5.addCell(new Phrase(" ",smallBold));
			                	 table5.addCell(new Phrase(TASK_LIST,smallBold));
			                	 table5.addCell(new Phrase(AMOUNT,smallBold));
			                	 table5.addCell(new Phrase(" ",smallBold));
			                	 table5.addCell(new Phrase(STATUS,smallBold));
			                	
			                	 /*table5.addCell(new Phrase(TASK_LIST,smallBold));
			                	 table5.addCell(new Phrase(" ",smallBold));
			                	 table5.addCell(new Phrase(" ",smallBold));
			                	 table5.addCell(new Phrase(TASK_LIST,smallBold));
			                	 table5.addCell(new Phrase(AMOUNT,smallBold));
			                	 table5.addCell(new Phrase(" ",smallBold));
			                	 table5.addCell(new Phrase(TASK_STATUS,smallBold));*/
			                	 
			                	 
			                	 
			                }
			                }
						  
						  
						  
						  
						  
						  
					     document.add(table5); 
		 	        
		 	        
	        pdfWriter.close();
		    document.close();
		    

		   	 response.setContentLength(baos.size());
		   	response.addHeader("Content-Disposition", "attachment; filename=\"clearance details.pdf\"");
		   	OutputStream out = response.getOutputStream();
		   	 /** get out put Stream*/
		   	 out = response.getOutputStream();
		   	 /** write to--- Don't know*/
		   	 baos.writeTo(out);
		   	/** Clear OutputStream*/
		   	 out.flush();
		   	 out.close();
		   	
		   	 	
		   	 }catch (Exception e) {
		   		System.out.println("problem in generating pdf for due clerance details");
		   		System.err.println("exception in print=="+e.getMessage());
		   		e.printStackTrace();
		   		
		   	}
		        inputStream.close();
		        return "SUCCESS";
		    }
		    
		    
		 public static ArrayList<String> fetch_Personal_info(String seq_no) throws SQLException
		 {
			 ArrayList<String> a1 = new ArrayList<String>();
			
			 
			 String personal_info_sql="select mas.EMP_ID,mas.EMP_FNAME,mas.EMP_LNAME,mas.EMP_DESIG,mas.EMP_MAILID,"
			 		+ "sep.DETAILED_REASON,sep.HR_RELIEVING_DATE,sep.CREATION_DATE from NCSS_EMP_MASTER_INFO mas,E_SEPARATION_EMP sep "
			 		+ "where mas.EMP_ID in(select EMP_ID from E_SEPARATION_EMP  where SEQUENCE_NO='106') and sep.SEQUENCE_NO='106'";
			 
			 Connection con_per=null;
			 Statement st_per=null;
			 ResultSet rs_per=null;
			 String emp_id=null;
			 String designation=null;
			 String fname=null;
			 String lname=null;
			 
			 String mail_id=null;
			 String detailed_reason=null;
			 Date releav_date;
			 Date creation_date;
			 String personal_data=null;
			 try{
				 con_per=GetConnection.getConnection();
				 st_per=con_per.createStatement();
				 rs_per=st_per.executeQuery(personal_info_sql);
				 while(rs_per.next())
				 {
					 emp_id=rs_per.getString(1);
					 fname=rs_per.getString(2);
					 lname=rs_per.getString(3);
					 designation=rs_per.getString(4);
					 mail_id=rs_per.getString(5);
					 detailed_reason=rs_per.getString(6);
					 releav_date=rs_per.getDate(7);
					 creation_date=rs_per.getDate(8);
					 personal_data=emp_id+"^"+fname+"^"+lname+"^"+designation+"^"+mail_id+"^"+
							 detailed_reason+"^"+releav_date+"^"+creation_date;
					 a1.add(personal_data);
				 }
			 }catch(Exception e)
			 {
				 System.out.println("the problem in fetching personal information in  pdf generation");
				 e.printStackTrace();
				 
			 }
			 
			 
			 finally
			 {
				 rs_per.close();
				 st_per.close();
				 con_per.close();
				 
			 }
			 
			 
			return a1;
			 
		 }
		    
		    
		    
	}