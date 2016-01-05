package com.ess.common.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * 
 * * @author madhu
 */
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final int THRESHOLD_SIZE = 1024 * 1024 * 5;// 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	/**
	 * handles file upload via HTTP POST method
	 */

	String finalResponse = "";

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String UPLOAD_DIRECTORY = "InvestmentUploads";

		HttpSession session = request.getSession();

		String user = (String) session.getAttribute("user");
		//System.out.println("frm servlets === " + user);

		UPLOAD_DIRECTORY = UPLOAD_DIRECTORY;// +"//"+user;

		//System.out.println("==Am In Upload Servlet==");

		PrintWriter out = response.getWriter();
		// checks if the request actually contains upload file
		if (!ServletFileUpload.isMultipartContent(request)) {

			out.println("Request does not contain upload data");
			out.flush();
			return;
		}

		// configures upload settings
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(THRESHOLD_SIZE);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(MAX_REQUEST_SIZE);

		// constructs the directory path to store upload file
		String uploadPath = getServletContext().getRealPath("")
				+ File.separator + UPLOAD_DIRECTORY;

		System.out.println("uploadPath==" + uploadPath);
		// creates the directory if it does not exist
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		try {
			// parses the request's content to extract file data
			List formItems = upload.parseRequest(request);
			Iterator iter = formItems.iterator();

			// iterates over form's fields
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				// processes only fields that are not form fields
				if (!item.isFormField()) {

					String uploadfile = request.getParameter("file").substring(
							request.getParameter("file").lastIndexOf("\\") + 1);
					
					String fileTogetSize=request.getParameter("file");


					File file = new File(fileTogetSize);

					// Get the number of bytes in the file	
					long sizeInBytes = file.length();
					//transform in MB
					long sizeInMb = sizeInBytes / (1024 * 1024);
					
					System.out.println(file+"sizeInMb==== " + sizeInMb);

					String filePath = uploadPath + File.separator + uploadfile;

					//System.out.println("filePath==== " + filePath);

					File storeFile = new File(filePath);

					if (sizeInMb > THRESHOLD_SIZE) {

						request.setAttribute("message",
								"File size should not be greater than 5MB");
					} else {

						item.write(storeFile);

						request.setAttribute("message",
								"Upload has been done successfully!");

						finalResponse = "Success";

					}

					// saves the file on disk

				}
			}

		} catch (Exception ex) {
			request.setAttribute("message",
					"There was an error: " + ex.getMessage());

			finalResponse = "Failed";
		}
		System.out.println("finalResponse====" + finalResponse);
		out.println(finalResponse);
	}
}
