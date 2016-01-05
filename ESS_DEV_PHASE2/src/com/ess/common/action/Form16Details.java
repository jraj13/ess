package com.ess.common.action;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;

public class Form16Details {
	public static void main(String[] args) throws IOException
	{/*
		File file = new File("E:/ESS_PROJECT/REDDY YETUR MALLIKARJUNA.pdf");
	    if (file.toString().endsWith(".pdf")) 
	        Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + file);
	    else {
	        Desktop desktop = Desktop.getDesktop();
	        desktop.open(file);
		*/
		try{
		
		File pdfFile = new File("E:\\ESS_PROJECT\\Form16\\KAMAL PRASAD RAMAN.pdf");
		if (pdfFile.exists()) {
 
			if (Desktop.isDesktopSupported()) {
				System.out.println("inside if condition============");
				Desktop.getDesktop().open(pdfFile);
			} else {
				System.out.println("Awt Desktop is not supported!");
			}
 
		} else {
			System.out.println("File is not exists!");
		}
 
		System.out.println("Done");
 
	  } catch (Exception ex) {
		ex.printStackTrace();
	  }
 
	
}
}

