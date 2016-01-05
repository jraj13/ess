<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date"%>
<%@page import="com.ess.util.GetConnection"%>
<%@page import="com.ess.common.action.LoginAction"%>
<%@page import="com.ess.common.action.UserCheckAction"%>
<%@page import="com.ess.common.action.RegistrationMailPusher" %>

<%@page import="com.ess.common.action.CryptoUtil"%>

<%-- <%@ page import="javax.crypto.BadPaddingException"%>
<%@ page import="javax.crypto.Cipher"%>
<%@ page import="javax.crypto.IllegalBlockSizeException"%>
<%@ page import="javax.crypto.NoSuchPaddingException"%>
<%@ page import="javax.crypto.SecretKey"%>
<%@ page import="javax.crypto.SecretKeyFactory"%>
<%@ page import="javax.crypto.spec.PBEKeySpec"%>
<%@ page import="javax.crypto.spec.PBEParameterSpec"%>

<%@ page import="java.io.IOException"%>
<%@ page import="java.io.UnsupportedEncodingException"%>
<%@ page import="java.security.InvalidAlgorithmParameterException"%>
<%@ page import="java.security.InvalidKeyException"%>
<%@ page import="java.security.NoSuchAlgorithmException"%>
<%@ page import="java.security.spec.AlgorithmParameterSpec"%>
<%@ page import="java.security.spec.InvalidKeySpecException"%>
<%@ page import="java.security.spec.KeySpec"%>

 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	
	/* Cipher ecipher;
	Cipher dcipher;
	// 8-byte Salt
	byte[] salt = {
	    (byte) 0xA9, (byte) 0x9B, (byte) 0xC8, (byte) 0x32,
	    (byte) 0x56, (byte) 0x35, (byte) 0xE3, (byte) 0x03
	};
	// Iteration count
	int iterationCount = 19; */
	
	//EMPLOYEE REGISTRATION INFORMATION
	String msg="";
	System.out.println("msg.//."+msg);
	
		 String emp_first = request.getParameter("employeeid").toUpperCase().trim();
		String employeeid=emp_first.trim();
	
		System.out.println("employeeid..." + employeeid);
		String fname = request.getParameter("fname").toUpperCase().trim();
		System.out.println("fname..." + fname);
		String lname = request.getParameter("lname").toUpperCase().trim();
		System.out.println("lname..." + lname);
		String dob = request.getParameter("datepicker");
		System.out.println("datepicker...." + dob);
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    Date tempDate=simpleDateFormat.parse(dob);
	    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/yyyy");           
	    Object dob1=outputDateFormat.format(tempDate);
			 System.out.println("emp dob1.."+dob1); 
		
		String pannum = request.getParameter("pannum").toUpperCase();
		String passportnum = request.getParameter("passportnum");
		System.out.println("passportnum...." + passportnum);
		String uid = request.getParameter("uid");
		String phnumone = request.getParameter("phnumone");
		String phnumtwo = request.getParameter("phnumtwo");
		String designation = request.getParameter("designation").toUpperCase();
		String rmmanager = request.getParameter("rmmanager");
		String ctc = request.getParameter("ctc");
		String emailid_first = request.getParameter("emailid").toUpperCase().trim();
		
		System.out.println("personal mai id u entered is"+emailid_first);
		
		String fname_new = fname.replaceAll("\\s","");
		System.out.println("fname_new.."+fname_new);
		String lname_new = lname.replaceAll("\\s","");
		System.out.println("lname_new.."+lname_new);
		
		
		/* String emailid=fname.toUpperCase()+"."+lname.toUpperCase()+"@CLOCKSOFT.INFO".trim(); */
		String emailid=fname_new.toUpperCase()+"."+lname_new.toUpperCase()+"@CLOCKSOFT.INFO".trim();
		
		//String emailid=emailid_first.trim();
		
			System.out.println("NEW MAIL ID IS CREATED is"+emailid);
		
		
		String visa = request.getParameter("visa");
		String uploadImage = request.getParameter("uploadImage");
		int rolename = Integer.parseInt(request.getParameter("rolename"));
		System.out.println("rolename..."+rolename);
		String remarks = ""; 
		
		String gender = request.getParameter("gender");
		//System.out.println("gender.."+gender);
		
		String bgroup = request.getParameter("bgroup").trim();
		System.out.println("bgroup.."+bgroup);
		
		
		int bonus=0;
		
		java.sql.Date dt1 = new java.sql.Date(System.currentTimeMillis());
		String dt1Text = dt1.toString();
		System.out.println("Current Date1 : " + dt1Text);
		
		SimpleDateFormat simpleDateFormat11 = new SimpleDateFormat("yyyy-MM-dd");
		 Date tempDate11=simpleDateFormat.parse(dt1Text);
	    System.out.println("tempdate.."+tempDate11);
	    SimpleDateFormat outputDateFormat11 = new SimpleDateFormat("dd/MMM/yyyy");           
	    System.out.println("Output date is = "+outputDateFormat.format(tempDate11));
	   /*  String doj=outputDateFormat.format(tempDate11); */
	    Object doj=outputDateFormat.format(tempDate11);
			 System.out.println(" monthdate1.."+doj); 
		
			 String status="Active";
			 
			 CryptoUtil cryptObj=new CryptoUtil();
			 String encrypt_pwd=cryptObj.execute(employeeid);
			 
			 
			 UserCheckAction check=new UserCheckAction();
			 
			 boolean isValid=check.isUserNameAndPasswordVAlid(employeeid,emailid);
			 System.out.println("isValid..."+isValid);
			 if(isValid==false)
			 {

			 String RegSQLReginfo = "INSERT INTO NCSS_EMP_MASTER_INFO(EMP_ID,EMP_FNAME,EMP_LNAME,PAN,PASSPORTNUM,EMP_UID,PHONENUM1,PHONENUM2,EMP_DESIG,EMP_RM,EMP_CTC,EMP_MAILID,EMP_VISA_INFO,REMARKS,EMP_DOB,BONUS,EMP_JOINING_DATE,STATUS,ROLE_ID,GENDER,PERSONAL_MAILID,BLOOD_GROUP,ACTUAL_PASSWORD,PWD_MODIFY_DATE) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
			
				Connection conn = null;
				int rs = 0;
				try {
					Connection con = GetConnection.getConnection();
					PreparedStatement st = con.prepareStatement(RegSQLReginfo);
					st.setString(1, employeeid);
					st.setString(2, fname);
					st.setString(3, lname);
					// st.setString(4, datepicker);
					st.setString(4, pannum);
					st.setString(5, passportnum);
					st.setString(6, uid);
					st.setString(7, phnumone);
					st.setString(8, phnumtwo);
					st.setString(9, designation);
					st.setString(10, rmmanager);
					st.setString(11, ctc);
					st.setString(12, emailid.trim());
					st.setString(13, visa);
					//st.setString(14,uploadImage);
					//st.setDate(16, sqlDate);
				//	st.setString(14, adhar);
					st.setString(14, remarks);
					st.setObject(15, dob1);
					st.setInt(16, bonus);
					st.setObject(17,doj);
					st.setString(18,status);
					st.setInt(19,rolename);
					st.setString(20,gender);
					st.setString(21,emailid_first);
					st.setString(22,bgroup);
					st.setString(23,encrypt_pwd);
					st.setObject(24,doj);

					rs = st.executeUpdate();
					if (rs > 0) {
						System.out.println("successfully insert in EMPLOYEE REGISTRATION INFORMATION");
						msg="Employee Registered successfully";
						
						
						RegistrationMailPusher mp=new RegistrationMailPusher();
							mp.executeMailRegister(employeeid,emailid_first,emailid);   
						
						
					} else {
						System.out.println("not success in EMPLOYEE REGISTRATION INFORMATION");
						
					}
				}catch (Exception e) {
					e.printStackTrace();
					System.out.println("NOT success in EMPLOYEE REGISTRATION INFORMATION");
					msg="Employee Not Registered";
				} 
				finally{
				}
		
		//EMPLOYEE PERSONAL INFORMATION
		
	String msstatus = request.getParameter("msstatus");
	String mothername = request.getParameter("mothername");
	String motherdob = request.getParameter("motherdob");
	String cadd=request.getParameter("cadd");
	String padd = request.getParameter("padd");
	String emrgcontnum = request.getParameter("emrgcontnum");
	int count=0;
	int rs2 = 0;
	String fathername=request.getParameter("fathername");
	
		 
	
	String spousename = request.getParameter("spousename");
	String spousedob = request.getParameter("spousedob");
	System.out.println("spousedob.."+spousedob);
	
	
		 
	String ch1name = request.getParameter("ch1name");
	String ch1dob = request.getParameter("ch1dob");
	System.out.println("ch1dob.."+ch1dob);
	
	
		 
	String ch2name = request.getParameter("ch2name");
	String ch2dob = request.getParameter("ch2dob");
	System.out.println("ch2dob.."+ch2dob);
	
		 
	
	String personal = "INSERT INTO NCSS_EMP_PERSONAL_INFO(EMP_MARITAL_STATUS,EMP_MOTHER_NAME,EMP_SPOUSE_NAME,EMP_CHAILD1_NAME,EMP_CHAILD2_NAME,EMP_CURR_ADDRESS,EMP_PER_ADDRESS,EMP_EMG_CON,REMARKS,EMP_ID,COUNT,EMP_FATHER_NAME) VALUES(?,?,?,?,?,?,?,?,?,?,?,?) ";
	try {
		Connection con2 = GetConnection.getConnection();
		PreparedStatement st2 = con2.prepareStatement(personal);
		st2.setString(1, msstatus);
		st2.setString(2, mothername);
		//st2.setString(3, motherdob);
		st2.setString(3, spousename);
		//st2.setString(5, spousedob);
		st2.setString(4, ch1name);
		//st2.setString  (7, ch1dob);
		st2.setString(5, ch2name);
		//st2.setString  (9, ch2dob);
		st2.setString(6, cadd);
		st2.setString(7, padd);
		st2.setString(8, emrgcontnum);
		st2.setString(9, remarks);
		st2.setString(10,employeeid);
		st2.setInt(11,count);
		//st2.setObject(12, motherdob1);
		//st2.setObject(13, spousedob1);
		//st2.setObject(14, ch1dob1);
		//st2.setObject(15, ch2dob1);
		st2.setString(12,fathername);
		
		rs2 = st2.executeUpdate();
		if (rs2 > 0) {
			System.out.println("success from personal info");
			msg="Employee Registered successfully";
			
			
			//EMP_MOTHER_DOB,EMP_SPOUSE_DOB,EMP_CHAILD1_NAME_DOB,EMP_CHAILD2_NAME_DOB
			if(motherdob=="")
			{
				System.out.println("motherdob in if statement.."+motherdob);
			}
			else{
				System.out.println("motherdob.."+motherdob);
			
				SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		 	    Date tempDate2=simpleDateFormat.parse(motherdob);
			    SimpleDateFormat outputDateFormat2 = new SimpleDateFormat("dd/MMM/yyyy");           
			    Object motherdob1=outputDateFormat.format(tempDate2);
				 System.out.println("emp motherdob1.."+motherdob1); 
				 Connection con_mdb=null;
				 PreparedStatement m_ps=null;
				 int m_rs=0;
				 String m_db_update="update NCSS_EMP_PERSONAL_INFO set EMP_MOTHER_DOB=? where EMP_ID=?";
				 try{
					 con_mdb = GetConnection.getConnection();
					  m_ps = con_mdb.prepareStatement(m_db_update);
					  m_ps.setObject(1, motherdob1);
					  m_ps.setString(2,employeeid);

					  m_rs = m_ps.executeUpdate();
					  if(m_rs>0)
					  {
						  System.out.println("successfully inserting mother date of birth");
						  msg="Employee Registered successfully";
					  }
					  else
					  {
						  System.out.println("Problem is raising in inserting mother date of birth");
						  msg="Employee Not Registered";
					  }

				 }catch(Exception e){
					 System.out.println("Problem is raising in inserting mother date of birth");
					 msg="Employee Not Registered";
				 }

				 finally{
					 m_ps.close();
					 con_mdb.close();
				 }
			}
				
			
			if(spousedob=="")
			{
				System.out.println("spouse dob in if statement.."+spousedob);
			}
			else{
				System.out.println("spouse db.."+spousedob);
			
				 SimpleDateFormat simpleDateFormat3 = new SimpleDateFormat("yyyy-MM-dd");
			     Date tempDate3=simpleDateFormat.parse(spousedob);
			     SimpleDateFormat outputDateFormat3 = new SimpleDateFormat("dd/MMM/yyyy");           
			     Object spousedob1=outputDateFormat.format(tempDate3);
					 System.out.println("emp spousedob1.."+spousedob1);  
				 Connection con_mdb=null;
				 PreparedStatement m_ps=null;
				 int m_rs=0;
				 String m_db_update="update NCSS_EMP_PERSONAL_INFO set EMP_SPOUSE_DOB=? where EMP_ID=?";
				 try{
					 con_mdb = GetConnection.getConnection();
					  m_ps = con_mdb.prepareStatement(m_db_update);
					  m_ps.setObject(1, spousedob1);
					  m_ps.setString(2,employeeid);

					  m_rs = m_ps.executeUpdate();
					  if(m_rs>0)
					  {
						  System.out.println("successfully inserting spousee of birth");
						  msg="Employee Registered successfully";
					  }
					  else
					  {
						  System.out.println("Problem is raising in inserting spouse of birth");
						  msg="Employee Not Registered";
					  }

				 }catch(Exception e){
					 System.out.println("Problem is raising in inserting spouse of birth inside catch");
					 msg="Employee Not Registered";
				 }
				 finally{
					 m_ps.close();
					 con_mdb.close();
				 }
				
			}
			
			
			if(ch1dob=="")
			{
				System.out.println("child1 in if statement.."+ch1dob);
			}
			else{
				 SimpleDateFormat simpleDateFormat4 = new SimpleDateFormat("yyyy-MM-dd");
			     Date tempDate4=simpleDateFormat.parse(ch1dob);
			     SimpleDateFormat outputDateFormat4 = new SimpleDateFormat("dd/MMM/yyyy");           
			     Object ch1dob1=outputDateFormat.format(tempDate4);
					 System.out.println("emp ch1dob1.."+ch1dob1);   
				 Connection con_mdb=null;
				 PreparedStatement m_ps=null;
				 int m_rs=0;
				 String m_db_update="update NCSS_EMP_PERSONAL_INFO set EMP_CHAILD1_NAME_DOB=? where EMP_ID=?";
				 try{
					 con_mdb = GetConnection.getConnection();
					  m_ps = con_mdb.prepareStatement(m_db_update);
					  m_ps.setObject(1, ch1dob1);
					  m_ps.setString(2,employeeid);

					  m_rs = m_ps.executeUpdate();
					  if(m_rs>0)
					  {
						  System.out.println("successfully inserting child1 of birth");
						  msg="Employee Registered successfully";
					  }
					  else
					  {
						  System.out.println("Problem is raising in inserting child1 of birth");
						  msg="Employee Not Registered";
					  }

				  }catch(Exception e){
					 System.out.println("Problem is raising in inserting child1 of birth inside catch");
					 msg="Employee Not Registered";
				 }
				 finally{
					 m_ps.close();
					 con_mdb.close();
				 }
			  }
			
			  if(ch2dob=="")
		     	{
				System.out.println("child2 in if statement.."+ch2dob);
			    }
			 else{
				 SimpleDateFormat simpleDateFormat5 = new SimpleDateFormat("yyyy-MM-dd");
			     Date tempDate5=simpleDateFormat.parse(ch2dob);
			     SimpleDateFormat outputDateFormat5 = new SimpleDateFormat("dd/MMM/yyyy");           
			     Object ch2dob1=outputDateFormat.format(tempDate5);
					 System.out.println("emp ch2dob1.."+ch2dob1);  
				 Connection con_mdb=null;
				 PreparedStatement m_ps=null;
				 int m_rs=0;
				 String m_db_update="update NCSS_EMP_PERSONAL_INFO set EMP_CHAILD2_NAME_DOB=? where EMP_ID=?";
				 try{
					 con_mdb = GetConnection.getConnection();
					  m_ps = con_mdb.prepareStatement(m_db_update);
					  m_ps.setObject(1, ch2dob1);
					  m_ps.setString(2,employeeid);

					  m_rs = m_ps.executeUpdate();
					  if(m_rs>0)
					  {
						  System.out.println("successfully inserting child2 of birth");
						  msg="Employee Registered successfully";
					  }
					  else
					  {
						  System.out.println("Problem is raising in inserting child2 of birth");
						  msg="Employee Not Registered";
					  }

				 }catch(Exception e){
					 System.out.println("Problem is raising in inserting child2 of birth in catch block");
					 msg="Employee Not Registered";
				 }
				 finally{
					 m_ps.close();
					 con_mdb.close();
				 }
			}
			
			
		} 
		else {
			System.out.println("not success from personal info");
			msg="Employee Not Registered";
		}
	}catch(Exception e)
	{
		e.printStackTrace();
		msg="Employee Not Registered";
		
	}
	finally{
	}
			
		String hiqualdeg1 = request.getParameter("hiqualdeg1");
		String hiqualpassout1 = request.getParameter("hiqualpassout1");
		String hiqualperc1 = request.getParameter("hiqualperc1");
		String hiqualdeg2 = request.getParameter("hiqualdeg2");
		String hiqualpassout2 = request.getParameter("hiqualpassout2");
		String hiqualperc2 = request.getParameter("hiqualperc2");
		String hiqualdeg3 = request.getParameter("hiqualdeg3");
		String hiqualpassout3 = request.getParameter("hiqualpassout3");
		String hiqualperc3 = request.getParameter("hiqualperc3");
		String cert1=request.getParameter("cert1");
		String cert2 = request.getParameter("cert2");
		String cert3 = request.getParameter("cert3");
		String count3="0";
		int rs3 = 0;
		String education = "INSERT INTO NCSS_EMP_EDUCATION (EMP_QUAL1,EMP_QUAL1_PERC,EMP_QUAL1_PASSOUT,EMP_QUAL2,EMP_QUAL2_PERC,EMP_QUAL2_PASSOUT,EMP_QUAL3,EMP_QUAL3_PERC,EMP_QUAL3_PASSOUT, CERT1,CERT2,CERT3,EMP_ID,COUNT) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		try {
			Connection con3 = GetConnection.getConnection();
			PreparedStatement st3 = con3.prepareStatement(education);
			//st1.setString(1, getEmployeeid());
			st3.setString(1,hiqualdeg1);
			st3.setString(2,hiqualperc1);
			st3.setString(3,hiqualpassout1);  
			  
			st3.setString(4,hiqualdeg2);
			st3.setString(5,hiqualperc2);
			st3.setString(6,hiqualpassout2);  
			  
			st3.setString(7,hiqualdeg3);
			st3.setString(8,hiqualperc3);
			st3.setString(9,hiqualpassout3);  
			  
			st3.setString(10,cert1);
			st3.setString(11,cert2);  
			st3.setString(12,cert3); 
			st3.setString(13, employeeid);
			st3.setString(14, count3);
			
			rs3 = st3.executeUpdate();
			if (rs3 > 0) {
				System.out.println("success from education info");
				msg="Employee Registered successfully";
			} else {
				System.out.println("not success from education info");
				msg="Employee Not Registered";
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("not success from education info inside catch");
			msg="Employee Not Registered";
		} 
		finally{
		}
			
		
		
		
		 /* FOR EMPLOYEE NOMINIES DETIALS */
		 
		  String emp_first11 = request.getParameter("employeeid").toUpperCase().trim();
		String employeeid11=emp_first.trim();
		
			int rs5 = 0;
			
		String nominieQry="	INSERT INTO NCSS_EMP_NOMINIES(EMP_ID) VALUES ((SELECT m.EMP_ID FROM NCSS_EMP_MASTER_INFO m WHERE m.EMP_ID ='"+employeeid11+"'))";
			
			try {
				Connection con5 = GetConnection.getConnection();
				PreparedStatement st5 = con5.prepareStatement(nominieQry);
				//rs5.setString(1,employeeid11);
				rs5 = st5.executeUpdate();
				if (rs5 > 0) {
					System.out.println("success from nominee id info");
					msg="Employee Registered successfully";
				} else {
					System.out.println("not success from nominee id info");
					msg="Employee Not Registered";
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				System.out.println("not success from nominee id info inside catch");
				msg="Employee Not Registered";
			} 
			finally{
			}		 
		
		
		
		
		
		
		
		
		//inserting Previous  Employee  details
		
		
		
		
		String totalexp = request.getParameter("totalexp");
		String preorgname1 = request.getParameter("preorgname1");
		String yearsworked1 = request.getParameter("yearsworked1");
		String refname1 = request.getParameter("refname1");
		String refmailid1 = request.getParameter("refmailid1");
		String refnumber1 = request.getParameter("refnumber1");
		String preorgname2 = request.getParameter("preorgname2");
		String yearsworked2 = request.getParameter("yearsworked2");
		String refname2 = request.getParameter("refname2");
		String refmailid2=request.getParameter("refmailid2");
		String refnumber2 = request.getParameter("refnumber2");
		String preorgname3 = request.getParameter("preorgname3");
		String yearsworked3 = request.getParameter("yearsworked3");
		String refname3 = request.getParameter("refname3");
		String refmailid3=request.getParameter("refmailid3");
		String refnumber3 = request.getParameter("refnumber3");
		
		
		String count4="0";
		int rs4 = 0;
		int rs6 = 0;
		int rs7 = 0;
		int rs8 = 0;
		int rs9=0;
		int rs10=0;
		int rs11=0;
		
		
		String arra_entry=request.getParameter("datesArray");	
		System.out.println("prev org array list in jsp is.."+arra_entry);
		int size1=arra_entry.length();
		System.out.println("datesArray size without split.."+size1); 
		
		
		if(size1==0){
			
			String previnfo = "INSERT INTO NCSS_EMP_PREV_ORG_INFO(TOTAL_EXP,ORG1_NAME,ORG1_EXP,ORG1_REF_NAME,ORG1_REF_MAIL,ORG1_REF_PHNUM,ORG2_NAME,ORG2_EXP,ORG2_REF_NAME,ORG2_REF_MAIL,ORG3_NAME,ORG3_EXP,ORG3_REF_NAME,ORG3_REF_MAIL,EMP_ID,COUNT,ORG2_REF_PHNUM,ORG3_REF_PHNUM)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
			 try {
				Connection con8= GetConnection.getConnection();
				PreparedStatement st8 = con8.prepareStatement(previnfo);
				st8.setString(1,totalexp);
				st8.setString(2,preorgname1);  
				st8.setString(3,yearsworked1);  
				st8.setString(4, refname1);
				st8.setString(5,refmailid1);  
				st8.setString(6,refnumber1);  
				st8.setString(7,preorgname2);  
				st8.setString(8,yearsworked2);  
				st8.setString(9, refname2);
				st8.setString(10,refmailid2);  
				st8.setString(11,preorgname3);  
				st8.setString(12,yearsworked3);  
				st8.setString(13, refname3);
				st8.setString(14,refmailid3);
				st8.setString(15,employeeid);
					//extra column
				st8.setString(16,count4);
				st8.setString(17,refnumber2);
				st8.setString(18,refnumber3);
					
						rs8 = st8.executeUpdate();
						if (rs8 > 0) {
						System.out.println("success in previous organization info without split");
						msg="Employee Registered successfully";
						} else {
						System.out.println("not success in previous organization info without split");
						msg="Employee Not Registered";
						}
					}
					catch (Exception e) {
						e.printStackTrace();
						System.out.println("not success in previous organization info inside catch without split");
						msg="Employee Not Registered";
					} 
		
			 finally{
					out.println(msg);
				} 
			
		}
		
		
		
		
			else{
				
				String[] str_els=arra_entry.split(";");
				
				int size=str_els.length;
				System.out.println("the  size in else part "+size);		
				
				if(size==1){
					System.out.println("if size==1 size is more than 1");
					String preorgnameADD1="";
					String yearsworkedADD1="";
					String refnameADD1="";
					String refmailidADD1="";
					String refnumberADD1="";
					
					for(int i=0;i<str_els.length;i++)
					{
				String[] inner = str_els[i].split(",");
		 
		 		preorgnameADD1=inner[0].trim();
		 			 System.out.println("ogname  ---"+preorgnameADD1);
		 		yearsworkedADD1=inner[1].trim();
		 			 System.out.println("years ---"+yearsworkedADD1);
		 		refnameADD1=inner[2].trim();
		 			 System.out.println("refname  ---"+refnameADD1);
		 		refmailidADD1=inner[3].trim();
					 System.out.println("mailid  ---"+refmailidADD1);
				refnumberADD1=inner[4].trim();
					 System.out.println("refnumber  ---"+refnumberADD1);
		  
					 
						}
					
					
			String previnfo = "INSERT INTO NCSS_EMP_PREV_ORG_INFO(TOTAL_EXP,ORG1_NAME,ORG1_EXP,ORG1_REF_NAME,ORG1_REF_MAIL,ORG1_REF_PHNUM,ORG2_NAME,ORG2_EXP,ORG2_REF_NAME,ORG2_REF_MAIL,ORG3_NAME,ORG3_EXP,ORG3_REF_NAME,ORG3_REF_MAIL,EMP_ID,COUNT,ORG2_REF_PHNUM,ORG3_REF_PHNUM,ORG1_NAME_E,ORG1_EXP_E,ORG1_REF_NAME_E,ORG1_REF_MAIL_E,ORG1_REF_PHNUM_E)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
									 try {
										Connection con4 = GetConnection.getConnection();
										PreparedStatement st4 = con4.prepareStatement(previnfo);
											st4.setString(1,totalexp);
											st4.setString(2,preorgname1);  
											st4.setString(3,yearsworked1);  
									        st4.setString(4, refname1);
											st4.setString(5,refmailid1);  
											st4.setString(6,refnumber1);  
											st4.setString(7,preorgname2);  
											st4.setString(8,yearsworked2);  
									        st4.setString(9, refname2);
											st4.setString(10,refmailid2);  
											st4.setString(11,preorgname3);  
											st4.setString(12,yearsworked3);  
									        st4.setString(13, refname3);
											st4.setString(14,refmailid3);
											st4.setString(15,employeeid);
											//extra column
											st4.setString(16,count4);
											st4.setString(17,refnumber2);
											st4.setString(18,refnumber3);
											
											st4.setString(19,preorgnameADD1);
											st4.setString(20,yearsworkedADD1);
											st4.setString(21,refnameADD1);
											st4.setString(22,refmailidADD1);
											st4.setString(23,refnumberADD1);
											
											
												rs4 = st4.executeUpdate();
												if (rs4 > 0) {
												System.out.println("success in previous organization info extra1");
												msg="Employee Registered successfully";
												} else {
												System.out.println("not success in previous organization info extra1");
												msg="Employee Not Registered";
												}
											}
											catch (Exception e) {
												e.printStackTrace();
												System.out.println("not success in previous organization info inside catch extra1");
												msg="Employee Not Registered";
											} 
									 
										 finally{
												out.println(msg);
												}
					
					
					}
				 
				  
					else if(size==2)
						{
						System.out.println("if size==2 size is more than 1");
						
						String preorgnameADD1="";
						String yearsworkedADD1="";
						String refnameADD1="";
						String refmailidADD1="";
						String refnumberADD1="";
						
						String preorgnameADD2="";
						String yearsworkedADD2="";
						String refnameADD2="";
						String refmailidADD2="";
						String refnumberADD2="";
						
						for(int i=0;i<str_els.length;i++)
						{
							 System.out.println("inside size 2 length of the for loop"+i);
							if(i==0)
							{
								System.out.println("i==0::::::::::"+i);
								String[] inner = str_els[i].split(",");
								 
						 		preorgnameADD1=inner[0].trim();
						 			 System.out.println("org anme  ---"+preorgnameADD1);
						 		yearsworkedADD1=inner[1].trim();
						 			 System.out.println("year ---"+yearsworkedADD1);
						 		refnameADD1=inner[2].trim();
						 			 System.out.println("refname  ---"+refnameADD1);
						 		refmailidADD1=inner[3].trim();
									 System.out.println("refmailid  ---"+refmailidADD1);
								refnumberADD1=inner[4].trim();
									 System.out.println("refnumber  ---"+refnumberADD1);
									
									
									String previnfo = "INSERT INTO NCSS_EMP_PREV_ORG_INFO(TOTAL_EXP,ORG1_NAME,ORG1_EXP,ORG1_REF_NAME,ORG1_REF_MAIL,ORG1_REF_PHNUM,ORG2_NAME,ORG2_EXP,ORG2_REF_NAME,ORG2_REF_MAIL,ORG3_NAME,ORG3_EXP,ORG3_REF_NAME,ORG3_REF_MAIL,EMP_ID,COUNT,ORG2_REF_PHNUM,ORG3_REF_PHNUM,ORG1_NAME_E,ORG1_EXP_E,ORG1_REF_NAME_E,ORG1_REF_MAIL_E,ORG1_REF_PHNUM_E)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
									 try {
										Connection con6 = GetConnection.getConnection();
										PreparedStatement st6 = con6.prepareStatement(previnfo);
										st6.setString(1,totalexp);
										st6.setString(2,preorgname1);  
										st6.setString(3,yearsworked1);  
										st6.setString(4, refname1);
										st6.setString(5,refmailid1);  
										st6.setString(6,refnumber1);  
										st6.setString(7,preorgname2);  
										st6.setString(8,yearsworked2);  
										st6.setString(9, refname2);
										st6.setString(10,refmailid2);  
											st6.setString(11,preorgname3);  
											st6.setString(12,yearsworked3);  
											st6.setString(13, refname3);
											st6.setString(14,refmailid3);
											st6.setString(15,employeeid);
											//extra column
											st6.setString(16,count4);
											st6.setString(17,refnumber2);
											st6.setString(18,refnumber3);
											
											st6.setString(19,preorgnameADD1);
											st6.setString(20,yearsworkedADD1);
											st6.setString(21,refnameADD1);
											st6.setString(22,refmailidADD1);
											st6.setString(23,refnumberADD1);
											
											
												rs6 = st6.executeUpdate();
												if (rs6 > 0) {
												System.out.println("success in previous organization info extra2(0)");
												msg="Employee Registered successfully";
												} else {
												System.out.println("not success in previous organization info extra2(0)");
												msg="Employee Not Registered";
												}
											}
											catch (Exception e) {
												e.printStackTrace();
												System.out.println("not success in previous organization info inside catch extra2(0)");
												msg="Employee Not Registered";
											} 
									 
										 finally{
												out.println(msg);
												}
									 
									 
							}
							if(i==1)
							{
								System.out.println("i==1:::::::::"+i);
					String[] inner = str_els[i].split(",");
			 
					 String unnessary=inner[0].trim();
					 System.out.println("unnessary---"+unnessary);
					 		preorgnameADD2=inner[1].trim();
					 			 System.out.println("org2  ---"+preorgnameADD2);
					 		yearsworkedADD2=inner[2].trim();
					 			 System.out.println("years2 ---"+yearsworkedADD2);
					 		refnameADD2=inner[3].trim();
					 			 System.out.println("refname2 ---"+refnameADD2);
					 		refmailidADD2=inner[4].trim();
								 System.out.println("refmailid2  ---"+refmailidADD2);
							refnumberADD2=inner[5].trim();
								 System.out.println("refnumber2  ---"+refnumberADD2);
								 
								// String previnfo = "INSERT INTO NCSS_EMP_PREV_ORG_INFO(TOTAL_EXP,ORG1_NAME,ORG1_EXP,ORG1_REF_NAME,ORG1_REF_MAIL,ORG1_REF_PHNUM,ORG2_NAME,ORG2_EXP,ORG2_REF_NAME,ORG2_REF_MAIL,ORG3_NAME,ORG3_EXP,ORG3_REF_NAME,ORG3_REF_MAIL,EMP_ID,COUNT,ORG2_REF_PHNUM,ORG3_REF_PHNUM,ORG1_NAME_E,ORG1_EXP_E,ORG1_REF_NAME_E,ORG1_REF_MAIL_E,ORG1_REF_PHNUM_E)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
								 String previnfo = "update  NCSS_EMP_PREV_ORG_INFO set  ORG2_NAME_E='"+preorgnameADD2+"',ORG2_EXP_E='"+yearsworkedADD2+"',ORG2_REF_NAME_E='"+refnameADD2+"',ORG2_REF_MAIL_E='"+refmailidADD2+"',ORG2_REF_PHNUM_E='"+refnumberADD2+"' where emp_id='"+employeeid+"' ";
								 try {
									Connection con7 = GetConnection.getConnection();
									PreparedStatement st7 = con7.prepareStatement(previnfo);
									
										
											rs7 = st7.executeUpdate();
											if (rs7 > 0) {
											System.out.println("success in previous organization info extra2(1)");
											msg="Employee Registered successfully";
											} else {
											System.out.println("not success in previous organization info extra2(1)");
											msg="Employee Not Registered";
											}
										}
										catch (Exception e) {
											e.printStackTrace();
											System.out.println("not success in previous organization info inside catch extra2(1)");
											msg="Employee Not Registered";
										} 
								 
									 finally{
											//out.println(msg);
											}
								 
								 
								 
							}
						
						
						}
						
						
						
						}
						
					 	else if(size==3)
						{
					 		System.out.println("if size==3 size is more than 1");
					 		
					 		String preorgnameADD1="";
							String yearsworkedADD1="";
							String refnameADD1="";
							String refmailidADD1="";
							String refnumberADD1="";
							
							String preorgnameADD2="";
							String yearsworkedADD2="";
							String refnameADD2="";
							String refmailidADD2="";
							String refnumberADD2="";
							
							String preorgnameADD3="";
							String yearsworkedADD3="";
							String refnameADD3="";
							String refmailidADD3="";
							String refnumberADD3="";
							
							for(int i=0;i<str_els.length;i++)
							{
								 System.out.println("inside size 2 length of the for loop"+i);
								if(i==0)
								{
									System.out.println("i==0;;;;;;"+i);
									String[] inner = str_els[i].split(",");
									
									 
							 		preorgnameADD1=inner[0].trim();
							 			 System.out.println("orgname1  ---"+preorgnameADD1);
							 		yearsworkedADD1=inner[1].trim();
							 			 System.out.println("years1 ---"+yearsworkedADD1);
							 		refnameADD1=inner[2].trim();
							 			 System.out.println("refname1  ---"+refnameADD1);
							 		refmailidADD1=inner[3].trim();
										 System.out.println("refmailid1 ---"+refmailidADD1);
									refnumberADD1=inner[4].trim();
										 System.out.println("refnumber1  ---"+refnumberADD1);
										// System.out.println("insert query**********************");
										 
										 
										 String previnfo = "INSERT INTO NCSS_EMP_PREV_ORG_INFO(TOTAL_EXP,ORG1_NAME,ORG1_EXP,ORG1_REF_NAME,ORG1_REF_MAIL,ORG1_REF_PHNUM,ORG2_NAME,ORG2_EXP,ORG2_REF_NAME,ORG2_REF_MAIL,ORG3_NAME,ORG3_EXP,ORG3_REF_NAME,ORG3_REF_MAIL,EMP_ID,COUNT,ORG2_REF_PHNUM,ORG3_REF_PHNUM,ORG1_NAME_E,ORG1_EXP_E,ORG1_REF_NAME_E,ORG1_REF_MAIL_E,ORG1_REF_PHNUM_E)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
										 try {
											Connection con9 = GetConnection.getConnection();
											PreparedStatement st9 = con9.prepareStatement(previnfo);
											st9.setString(1,totalexp);
											st9.setString(2,preorgname1);  
											st9.setString(3,yearsworked1);  
											st9.setString(4, refname1);
											st9.setString(5,refmailid1);  
											st9.setString(6,refnumber1);  
											st9.setString(7,preorgname2);  
											st9.setString(8,yearsworked2);  
											st9.setString(9, refname2);
											st9.setString(10,refmailid2);  
												//extra column
												//st4.setString(11,refnumber2);
												st9.setString(11,preorgname3);  
												st9.setString(12,yearsworked3);  
												st9.setString(13, refname3);
												st9.setString(14,refmailid3);
												st9.setString(15,employeeid);
												//extra column
												st9.setString(16,count4);
												st9.setString(17,refnumber2);
												st9.setString(18,refnumber3);
												
												st9.setString(19,preorgnameADD1);
												st9.setString(20,yearsworkedADD1);
												st9.setString(21,refnameADD1);
												st9.setString(22,refmailidADD1);
												st9.setString(23,refnumberADD1);
												
												
													rs9 = st9.executeUpdate();
													if (rs9 > 0) {
													System.out.println("success in previous organization info extra3(0)");
													msg="Employee Registered successfully";
													} else {
													System.out.println("not success in previous organization info extra3(0)");
													msg="Employee Not Registered";
													}
												}
												catch (Exception e) {
													e.printStackTrace();
													System.out.println("not success in previous organization info inside catch extra3(0)");
													msg="Employee Not Registered";
												} 
										 
											 finally{
													out.println(msg);
													}
										 
										 
										 
										 
								}
								if(i==1)
								{
									System.out.println("i==1"+i);
						String[] inner = str_els[i].split(",");
						
						 String unnessary=inner[0].trim();
						 System.out.println("unnessary---"+unnessary);
						 preorgnameADD2=inner[1].trim();
			 			 System.out.println("org2  ---"+preorgnameADD2);
			 		yearsworkedADD2=inner[2].trim();
			 			 System.out.println("years2 ---"+yearsworkedADD2);
			 		refnameADD2=inner[3].trim();
			 			 System.out.println("refname2 ---"+refnameADD2);
			 		refmailidADD2=inner[4].trim();
						 System.out.println("refmailid2  ---"+refmailidADD2);
					refnumberADD2=inner[5].trim();
						 System.out.println("refnumber2  ---"+refnumberADD2);
									
									 String previnfo = "update  NCSS_EMP_PREV_ORG_INFO set  ORG2_NAME_E='"+preorgnameADD2+"',ORG2_EXP_E='"+yearsworkedADD2+"',ORG2_REF_NAME_E='"+refnameADD2+"',ORG2_REF_MAIL_E='"+refmailidADD2+"',ORG2_REF_PHNUM_E='"+refnumberADD2+"' where emp_id='"+employeeid+"' ";
									 try {
										Connection con10 = GetConnection.getConnection();
										PreparedStatement st10 = con10.prepareStatement(previnfo);
												
										rs10 = st10.executeUpdate();
												if (rs10 > 0) {
												System.out.println("success in previous organization info extra3(1)");
												msg="Employee Registered successfully";
												} else {
												System.out.println("not success in previous organization info extra3(1)");
												msg="Employee Not Registered";
												}
											}
											catch (Exception e) {
												e.printStackTrace();
												System.out.println("not success in previous organization info inside catch extra3(1)");
												msg="Employee Not Registered";
											} 
									 
										 finally{
												//out.println(msg);
												}
									 
									 
									 
								}
							
								if(i==2)
								{
						System.out.println("i==1:::::"+i);
						String[] inner = str_els[i].split(",");
						
				 String unnessary=inner[0].trim();
				 System.out.println("unnessary---"+unnessary);
				 		preorgnameADD3=inner[1].trim();
				 			 System.out.println("org3  ---"+preorgnameADD3);
				 		yearsworkedADD3=inner[2].trim();
				 			 System.out.println("years3 ---"+yearsworkedADD3);
				 		refnameADD3=inner[3].trim();
				 			 System.out.println("refname3 ---"+refnameADD3);
				 		refmailidADD3=inner[4].trim();
							 System.out.println("refmailid3  ---"+refmailidADD3);
						refnumberADD3=inner[5].trim();
							 System.out.println("refnumber3  ---"+refnumberADD3);
							 
							 String previnfo = "update  NCSS_EMP_PREV_ORG_INFO set  ORG3_NAME_E='"+preorgnameADD3+"',ORG3_EXP_E='"+yearsworkedADD3+"',ORG3_REF_NAME_E='"+refnameADD3+"',ORG3_REF_MAIL_E='"+refmailidADD3+"',ORG3_REF_PHNUM_E='"+refnumberADD3+"' where emp_id='"+employeeid+"' ";
							 try {
								Connection con11 = GetConnection.getConnection();
								PreparedStatement st11 = con11.prepareStatement(previnfo);
										
								rs11 = st11.executeUpdate();
										if (rs11 > 0) {
										System.out.println("success in previous organization info extra3(2)");
										msg="Employee Registered successfully";
										} else {
										System.out.println("not success in previous organization info extra3(2)");
										msg="Employee Not Registered";
										}
									}
									catch (Exception e) {
										e.printStackTrace();
										System.out.println("not success in previous organization info inside catch extra3(2)");
										msg="Employee Not Registered";
									} 
							 
								 finally{
										//out.println(msg);
										}
							 
								}
							
							
							}
					 		
						
						} 
				
						else{
							
							System.out.println("size is more than 1 else part");
						}
				}
			
			
			
	
		
			 
		 /* FOR EMPLOYEE NOMINIES DETIALS */
		 
		 /*  String emp_first11 = request.getParameter("employeeid").toUpperCase().trim();
		String employeeid11=emp_first.trim();
		
			int rs5 = 0;
			
		String nominieQry="	INSERT INTO NCSS_EMP_NOMINIES(EMP_ID) VALUES ((SELECT m.EMP_ID FROM NCSS_EMP_MASTER_INFO m WHERE m.EMP_ID ='"+employeeid11+"'))";
			
			try {
				Connection con5 = GetConnection.getConnection();
				PreparedStatement st5 = con5.prepareStatement(nominieQry);
				//rs5.setString(1,employeeid11);
				rs5 = st5.executeUpdate();
				if (rs5 > 0) {
					System.out.println("success from nominee id info");
					msg="Employee Registered successfully";
				} else {
					System.out.println("not success from nominee id info");
					msg="Employee Not Registered";
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				System.out.println("not success from nominee id info inside catch");
				msg="Employee Not Registered";
			} 
			finally{
			}		  */
		 
			
		}
	 else
		 
		 {
			 System.out.println("Username & password exist");
			 msg="Username and password Exist";
			 System.out.println("msg.."+msg);
		}
	
	
%>

</body>
</html>