/*package com.ess.common.action;

import java.util.ArrayList;

import javax.mail.Session;

import com.itextpdf.text.List;

public class PasswordEncryption
{	public boolean checkLogin(AdminUser adminUser)
	{
		List userList = new ArrayList();
		String password=null;
		Session session = ((Object) getSessionFactory()).openSession();
		try {
			Transaction tx = session.beginTransaction();
			String hql = "select password from AdminUser where username='" + adminUser.getUsername() + "'";
			System.out.println(""+hql);
			Query query = session.createQuery(hql);
			System.out.println("query........."+query);
			userList = (ArrayList) query.list();
			if(userList.size()>0)
			{
			password=((java.util.List) userList).get(0).toString();
			String decodePassword = Encode.decodeString(password);
			System.out.println("pas..decodePassword"+decodePassword);
			if (adminUser.getPassword().equals(decodePassword)) {
				return true;
			}
			}		
			tx.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.clone();
		}
		return false;
	
	}

private Object getSessionFactory() {
	// TODO Auto-generated method stub
	return null;
}
}
*/



package com.ess.common.action;       
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
    
    
    

import com.itextpdf.text.pdf.PdfWriter;

import java.io.File;    
import java.io.FileOutputStream;    
public class PDFConversion    
{    
 /**   
  * This method is used to convert the given file to a PDF format   
  * @param inputFile - Name and the path of the file   
  * @param outputFile - Name and the path where the PDF file to be saved   
  * @param isPictureFile   
  */   

  private void createPdf(String inputFile, String outputFile, boolean isPictureFile)    
  {    
   /**   
    * Set the page size for the image   
    */   
	  Rectangle pageSize = new Rectangle(2780, 2525);    
     Document pdfDocument = new Document( pageSize);    
     String pdfFilePath = outputFile;    

     try    
     {    
       FileOutputStream fileOutputStream = new FileOutputStream(pdfFilePath);    

       PdfWriter writer = null;    

       writer = PdfWriter.getInstance(pdfDocument, fileOutputStream);    

       writer.open();    

       pdfDocument.open();    

       /**   
        * Proceed if the file given is a picture file   
       */   

       if (isPictureFile)    
       {    
          pdfDocument.add((Element) com.lowagie.text.Image.getInstance(inputFile));    
       }    

       /**  
        * Proceed if the file given is (.txt,.html,.doc etc)   
        */   

      else      
      {    
          File file = new File(inputFile);    
         pdfDocument.add(new Paragraph(org.apache.commons.io.FileUtils.readFileToString(file)));    

      }    

      pdfDocument.close();    

      writer.close();    
  }    
  catch (Exception exception)    
  {    
     System.out.println("Document Exception!" + exception);    
  }    

 }     


 public static void main(String args[])    
 {    

   PDFConversion pdfConversion = new PDFConversion();    

  pdfConversion.createPdf("E:/workspace/ESS_DEV/WebContent/postLoginJsp/Benifits_Payments/payslip.jsp", "E:/tajmahal.pdf", false);    


  // For other files    

 // pdfConversion.createPdf("payslip.jsp","payslip.pdf", false);    

}    
}


