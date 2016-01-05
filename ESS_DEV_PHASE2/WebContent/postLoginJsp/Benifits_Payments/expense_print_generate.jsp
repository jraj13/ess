

<%@page import="javax.swing.border.TitledBorder"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page import="com.lowagie.text.DocumentException"%>
<%@page import="com.lowagie.text.Paragraph"%>
<%@page import="com.lowagie.text.html.HtmlWriter"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="java.io.*"%>;
<%@page import="java.awt.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<%@page import="com.lowagie.text.html.*"%>

<%@page import="java.awt.*"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<%@page import="com.lowagie.text.html.*"%>
<%@page import="com.ess.util.GetConnection"%>
<%@page import="java.util.Date"%>
<%@page import="com.lowagie.text.*"%>
<%@page import=" com.lowagie.text.pdf.*"%>

<%@page import="com.itextpdf.text.Rectangle"%>


<%-- <%@ page trimDirectiveWhitespaces="true" %> --%>

<%
String cnt=request.getParameter("choose");


String id=(String)session.getAttribute("empid");
System.out.println("id from jsp===="+id);



/* System.out.println("come in test.jsp"+cnt); */
/* String str="pdf";

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
try
{ 
	System.out.println("come in Try block");
    Document document=new Document();
    if(str.equals("pdf"))
    {
        response.setContentType("application/pdf");
        PdfWriter.getInstance(document,response.getOutputStream());
    }

    conn = GetConnection.getConnection();
    String query = "SELECT * from ESS_EXPENSE_ENTRY where EMP_ID='"+id+"' AND EMP_COUNT='"+cnt+"'";  //Fetching data from table
    System.out.println("query..."+query);
       ps=conn.prepareStatement(query);                // executing query
       System.out.println("ps..."+ps);
       rs=ps.executeQuery();
       System.out.println("rs..."+rs);
       
    document.open();
    
  // new paragraph instance initialized and add function write in pdf file
    document.add(new Paragraph("--------------------------------------REPORT FOR EXPENSE ENTRY---------------------------------------------\n\n"));
    document.add(new Paragraph("                            		  CREATED REPORT BY- NCSS												\n\n"));
    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
    document.addCreationDate();
    System.out.println("rs.next()..."+rs.next());
    System.out.println("rs.getString(1) top..."+rs.getString(1));
    
	   while(rs.next())
    {    
    	 System.out.println("rs.getString(1)..."+rs.getString(1));
    	 System.out.println("rs.getString(2)..."+rs.getString(2));
          // fetch & writing records in pdf files
        document.add(new Paragraph("CLAIM_TYPE :: "+rs.getString(1)+"\nBILL_NO :: "+rs.getString(2)+"\nBILL_DATE :: "+rs.getString(3)+"\nEXP_AMOUNT :: "+rs.getString(4)+"\nREMARKS :: "+rs.getString(5)+"\nEMP_ID :: "+rs.getString(6)+"\nFORM NO :: "+rs.getString(7)+"\n\n"));
     }  
    document.add(new Paragraph("---------------------------------------------------------PAGE NO::"+document.getPageNumber()+"------------------------------------------------------"));

    document.close(); //document instance closed
    conn.close();  //db connection close

}
catch(Exception de) 
{
        de.printStackTrace();
            System.err.println("document: " + de.getMessage());
            
} */


/* 
Document document=new Document();
PdfWriter.getInstance(document,new FileOutputStream("E:\\data11.pdf"));
document.open(); */

/* public static final Rectangle A4; */
String str="pdf";
try
{ 
	System.out.println("come in Try block");
   Document document=new Document();
   if(str.equals("pdf"))
   {
       response.setContentType("application/pdf");
       PdfWriter.getInstance(document,response.getOutputStream());
   }

   document.open(); 
   
   document.add(new Paragraph("--------------------------------------REPORT FOR EXPENSE ENTRY---------------------------------------------\n\n"));
   document.add(new Paragraph("                            		  CREATED REPORT BY- NCSS												\n\n"));
   

  /*  document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------")); */
   document.addCreationDate();

PdfPTable table=new PdfPTable(7);
table.addCell("CLAIM_TYPE");
table.addCell("BILL_NO");
table.addCell("BILL_DATE");
table.addCell("EXP_AMOUNT");
table.addCell("REMARKS");
table.addCell("EMP_ID");
/* table.addCell("COUNT"); */
table.addCell("EMP_COUNT");

Connection conn = GetConnection.getConnection();

Statement st=conn.createStatement();
ResultSet rs=st.executeQuery("SELECT * from ESS_EXPENSE_ENTRY where EMP_ID='"+id+"' AND EMP_COUNT='"+cnt+"'");

Date d;
/* d= rs.getDate("BILL_DATE"); */
while(rs.next()){

table.addCell(rs.getString("CLAIM_TYPE"));
table.addCell(rs.getString("BILL_NO"));
table.addCell(rs.getString("BILL_DATE").substring(0, 10));
table.addCell(rs.getString("EXP_AMOUNT"));
table.addCell(rs.getString("REMARKS"));
table.addCell(rs.getString("EMP_ID"));
/* table.addCell(rs.getString("COUNT")); */
table.addCell(rs.getString("EMP_COUNT"));
}

document.add(table);
document.add(new Paragraph("---------------------------------------------------------PAGE NO::"+document.getPageNumber()+"------------------------------------------------------"));
document.close();



}
catch(Exception de) 
{
        de.printStackTrace();
          System.err.println("document: " + de.getMessage());
            
} 
%>
