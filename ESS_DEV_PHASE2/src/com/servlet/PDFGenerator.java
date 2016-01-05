package com.servlet;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.Date;
import java.util.Map;


import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;


import com.ess.util.GetConnection;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class PDFGenerator extends ActionSupport{

	
	 /**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	
	private ByteArrayInputStream inputStream;
	private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 14,
		      Font.BOLD);
	private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12);
	
	    public String execute() throws IOException{
	        HttpServletResponse response = ServletActionContext.getResponse();
	    
	        try{
	        	 
	        	 /** set content type as PDF */
	   		 response.setContentType("application/pdf");
	    /** create Object Of document */
	   		 /*Document document = new Document(PageSize.FLSE);*/
	   		 Document document=new Document();
	   		 /** set margin of page */
	   		//document.setMargins(1.25F,0.75F, 5F,0.75F);
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
	   		 
	   		 PdfWriter pdfWriter=PdfWriter.getInstance(document, baos);
	    document.open();
	    
	    
	  /*
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		String SEQUENCE_NO=request.getParameter("SEQUENCE_NO");
		System.out.println("SEQUENCE_NO..in pdf generation "+SEQUENCE_NO);*/
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		//String id = (String) session.get("empid");
		String seq_pdfId=(String) session.get("pdfseqid");
		System.out.println("SEQUENCE_NO..in pdf generation "+seq_pdfId);
		CallableStatement cstmt = null;
		Connection con=null;
		String SQL_call_procedure = "{call PDF_GENERATION_PROCED (?,?,?,?,?,?)}";
		String emp_id=""; 
		Date rel_date;
		String fname="";
		String lname="";
		String desig="";
		
		try {
			con=GetConnection.getConnection();
		   
		   cstmt = con.prepareCall (SQL_call_procedure);
		   cstmt.setString(1,seq_pdfId);
		   cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
		   
		   cstmt.registerOutParameter(3, java.sql.Types.DATE);
		   cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
		   cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
		   cstmt.registerOutParameter(6, java.sql.Types.VARCHAR);
		   cstmt.executeUpdate();
		   emp_id=cstmt.getString(2);
		   rel_date=cstmt.getDate(3);
		   fname=cstmt.getString(4);
		   lname=cstmt.getString(5);
		   desig=cstmt.getString(6);
		   
		   
		}
		finally{
			cstmt.close();
			con.close();
		}
	    
	    
       Image image1=Image.getInstance("https://lh6.googleusercontent.com/-UiPLWs8CC8A/U2iMqI16btI/AAAAAAAAAFI/MsD-9T20XPI/s160-k-no/");
       
			//Image image1=Image.getInstance("E:/clocksoftlogo.jpg");
       
      // image1.setAbsolutePosition(50f, 650f);
       image1.scaleAbsolute(50f, 50f);
      
        document.add(image1);
        
        Paragraph paragraph = new Paragraph("Acceptance Of Resignation",catFont);
        paragraph.setAlignment(Element.ALIGN_CENTER);
        document.add(paragraph);
       
        Paragraph pa_date_issue= new Paragraph("Date of Issue:" +rel_date+" ");
        document.add(pa_date_issue);
		
        Paragraph pa_name= new Paragraph("Employee Name: Mr." +fname+" "+lname+" ");
        document.add(pa_name);
		
        Paragraph pa_desig= new Paragraph("Designation :" +emp_id+" "+desig+" ");
        document.add(pa_desig);
        
        Paragraph pa_Dear= new Paragraph("Dear  :" +fname+" "+lname+" ");
        document.add(pa_Dear);
        
       Paragraph para2=new Paragraph("With referance to your resignatuion letter dated on "+rel_date+" ,we here by accept yourresignation"
        		+ "from the service of the company.As consented with you,you will be relieved from "
        		+ "the service of the company after the working hours of "+rel_date+" ",smallBold);
        
        document.add(para2);
       

        
        
        
        
        
        System.out.println("entering the pdf documents before responce ");
	    
	    
	    
        pdfWriter.close();
	    document.close();
	    

	   	 response.setContentLength(baos.size());
	   	response.addHeader("Content-Disposition", "attachment; filename=\"correspondence Letter.pdf\"");
	   	OutputStream out = response.getOutputStream();
	   	 /** get out put Stream*/
	   	 out = response.getOutputStream();
	   	 /** write to--- Don't know*/
	   	 baos.writeTo(out);
	   	/** Clear OutputStream*/
	   	 out.flush();
	   	 out.close();
	   
	   	 	
	   	 }catch (Exception e) {
	   		System.err.println("exception in print=="+e.getMessage());
	   		e.printStackTrace();
	   		System.out.println("in catch block is ");
	   		
	   	}
	    	inputStream.close();
	        return "SUCCESS";
	    }
}
	    