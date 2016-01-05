package com.ess.common.action;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionSupport;

public class Upload_files extends ActionSupport implements
ServletRequestAware {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File userImage;
    private String userImageContentType;
    private String userImageFileName;
 
    private HttpServletRequest servletRequest;
    
    
    private String hdCategory;
    private String hdQuery;
    
    
    public File getUserImage() {
        return userImage;
    }
 
    public void setUserImage(File userImage) {
        this.userImage = userImage;
    }
 
    public String getUserImageContentType() {
        return userImageContentType;
    }
 
    public void setUserImageContentType(String userImageContentType) {
        this.userImageContentType = userImageContentType;
    }
 
    public String getUserImageFileName() {
        return userImageFileName;
    }
 
    public void setUserImageFileName(String userImageFileName) {
        this.userImageFileName = userImageFileName;
    }
    
    public void setHdCategory(String hdCategory)
    {
    	this.hdCategory=hdCategory;
    }
    
    public String getHdCategory()
    {
    	return hdCategory;
    }
    
    
    public void setHdQuery(String hdQuery)
    {
    	this.hdQuery=hdQuery;
    }
    public String getHdQuery()
    {
    	return hdQuery;
    }
 
    @Override
    public void setServletRequest(HttpServletRequest servletRequest) {
        this.servletRequest = servletRequest;
 
    }
    
    
    
 
    public String upload_file_database() {
        try {
            String filePath = servletRequest.getSession().getServletContext().getRealPath("/" );
            System.out.println("Server path in uploading is:" + filePath);
            File fileToCreate = new File(filePath, this.userImageFileName);
 
            System.out.println("the path is"+fileToCreate);
            
            
            FileUtils.copyFile(this.userImage, fileToCreate);
            
            Upload_files files_upload=new Upload_files();
            files_upload.helpdeskreportSave(getHdCategory(),getHdQuery(),fileToCreate);
            
        } catch (Exception e) {
            e.printStackTrace();
            //addActionError(e.getMessage());
 
            return INPUT;
        }
        return SUCCESS;
    }
 
   
    
    
    public String helpdeskreportSave(String hdCategory,String hdQuery,Object hdAttachment) throws SQLException{
    	
    	System.out.println("helpdeskreportSave method calling");
    	String helpdesksave="";
    	
    	
    	Connection con=null;
    	Statement stmt=null;
    	     
    	String sql="insert into HELP_DESK_TABLE(TICKET_CATEGORY,TICKET_QUERY,TIC_ATTACHMENT) values('"+hdCategory+"', '"+hdQuery+"', '"+hdAttachment+"')";
    	
    	System.out.println("sql.."+sql);
    	try {
    		
    		con=GetConnection.getConnection();
    		stmt=con.createStatement();
    		
    		int rs=stmt.executeUpdate(sql);
    		
    		if(rs>0){
    			helpdesksave="Query submitted successfully";
    			
    			/*HelpDeskAction obj=new HelpDeskAction();
    			obj.executeMailHelpDeskReq(mailid, hdCategory);*/
    			
    			
    		}
    		else{
    			helpdesksave="please try again";
    		}
    		
    	} catch (SQLException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    		helpdesksave="internal problem";
    	}
    	
    	return helpdesksave;
    	
    }
}
