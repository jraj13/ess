package com.ess.common.bean;

import java.sql.Blob;
import java.sql.Date;

//import oracle.sql.DATE;

public class RegistrationActionBean {
	
	/* Employee Registration Form */
	
	private String employeeid;
	private String fname;
	private String lname;
	private Date dob;
	private String pannum;
	private String passportnum;
	private String uid;
	private String phnumone;
	private String phnumtwo;
	private String designation;
	private String rmanager;
	private String ctc;
	private String emailid;
	private String visainfo;
	private Blob image;
	
	
	/* Employee Personal Details */
	private String mstatus;
	private String mothername;
	private String motherdob;
	private String spousename;
	private String spousedob;
	private String childname1;
	private Date   childdob1;
	private String childname2;
	private Date   childdob2;
	
	private String currentaddr;
	private String permaddr;
	private String emergcontact;
	
	/* Employee Educational Information */
	private String hiqualdeg1;
	private String hiqualpassout1;
	private String hiqualperc1;
	private String hiqualdeg2;
	private String hiqualpassout2;
	private String hiqualperc2;
	private String hiqualdeg3;
	private String hiqualpassout3;
	private String hiqualperc3;
	private String certifications1;
	private String certifications2;
	private String certifications3;
	
	/* Previous Employment Information */
	private String experience;
	private String preorgname1;
	private String yearsworked1;
	private String refname1;
	private String refmailid1;
	private String refphnumber1;
	private String preorgname2;
	private String yearsworked2;
	private String refname2;
	private String refmailid2;
	//private String refphnumber2;
	private String preorgname3;
	private String yearsworked3;
	private String refname3;
	private String refmailid3;
	//private String refphnumber3;
	
	
	/* Employee Registration Form setter/getter */
	
	public String getEmployeeid() {
		return employeeid;
	}
	public void setEmployeeid(String employeeid) {
		this.employeeid = employeeid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getPannum() {
		return pannum;
	}
	public void setPannum(String pannum) {
		this.pannum = pannum;
	}
	public String getPassportnum() {
		return passportnum;
	}
	public void setPassportnum(String passportnum) {
		this.passportnum = passportnum;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPhnumone() {
		return phnumone;
	}
	public void setPhnumone(String phnumone) {
		this.phnumone = phnumone;
	}
	public String getPhnumtwo() {
		return phnumtwo;
	}
	public void setPhnumtwo(String phnumtwo) {
		this.phnumtwo = phnumtwo;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getRmanager() {
		return rmanager;
	}
	public void setRmanager(String rmanager) {
		this.rmanager = rmanager;
	}
	public String getCtc() {
		return ctc;
	}
	public void setCtc(String ctc) {
		this.ctc = ctc;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getVisainfo() {
		return visainfo;
	}
	public void setVisainfo(String visainfo) {
		this.visainfo = visainfo;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	
	/* Employee Personal Details setter/getter */
	public String getMstatus() {
		return mstatus;
	}
	public void setMstatus(String mstatus) {
		this.mstatus = mstatus;
	}
	public String getMothername() {
		return mothername;
	}
	public void setMothername(String mothername) {
		this.mothername = mothername;
	}
	public String getMotherdob() {
		return motherdob;
	}
	public void setMotherdob(String motherdob) {
		this.motherdob = motherdob;
	}
	public String getSpousename() {
		return spousename;
	}
	public void setSpousename(String spousename) {
		this.spousename = spousename;
	}
	public String getSpousedob() {
		return spousedob;
	}
	public void setSpousedob(String spousedob) {
		this.spousedob = spousedob;
	}
	public String getChildname1() {
		return childname1;
	}
	public void setChildname1(String childname1) {
		this.childname1 = childname1;
	}
	public Date getChilddob1() {
		return childdob1;
	}
	public void setChilddob1(Date childdob1) {
		this.childdob1 = childdob1;
	}
	public String getChildname2() {
		return childname2;
	}
	public void setChildname2(String childname2) {
		this.childname2 = childname2;
	}
	public Date getChilddob2() {
		return childdob2;
	}
	public void setChilddob2(Date childdob2) {
		this.childdob2 = childdob2;
	}
	public String getCurrentaddr() {
		return currentaddr;
	}
	public void setCurrentaddr(String currentaddr) {
		this.currentaddr = currentaddr;
	}
	public String getPermaddr() {
		return permaddr;
	}
	public void setPermaddr(String permaddr) {
		this.permaddr = permaddr;
	}
	public String getEmergcontact() {
		return emergcontact;
	}
	public void setEmergcontact(String emergcontact) {
		this.emergcontact = emergcontact;
	}
	
	/* Employee Educational Information setter/getter */
	public String getHiqualdeg1() {
		return hiqualdeg1;
	}
	public void setHiqualdeg(String hiqualdeg1) {
		this.hiqualdeg1 = hiqualdeg1;
	}
	public String getHiqualpassout1() {
		return hiqualpassout1;
	}
	public void setHiqualpassout1(String hiqualpassout1) {
		this.hiqualpassout1 = hiqualpassout1;
	}
	public String getHiqualperc1() {
		return hiqualperc1;
	}
	public void setHiqualperc1(String hiqualperc1) {
		this.hiqualperc1 = hiqualperc1;
	}
	
	public String getHiqualdeg2() {
		return hiqualdeg2;
	}
	public void setHiqualdeg2(String hiqualdeg2) {
		this.hiqualdeg2 = hiqualdeg2;
	}
	public String getHiqualpassout2() {
		return hiqualpassout2;
	}
	public void setHiqualpassout2(String hiqualpassout2) {
		this.hiqualpassout2 = hiqualpassout2;
	}
	public String getHiqualperc2() {
		return hiqualperc2;
	}
	public void setHiqualperc2(String hiqualperc2) {
		this.hiqualperc2 = hiqualperc2;
	}
	public String getHiqualdeg3() {
		return hiqualdeg3;
	}
	public void setHiqualdeg3(String hiqualdeg3) {
		this.hiqualdeg3 = hiqualdeg3;
	}
	public String getHiqualpassout3() {
		return hiqualpassout3;
	}
	public void setHiqualpassout3(String hiqualpassout3) {
		this.hiqualpassout3 = hiqualpassout3;
	}
	public String getHiqualperc3() {
		return hiqualperc3;
	}
	public void setHiqualperc3(String hiqualperc3) {
		this.hiqualperc3 = hiqualperc3;
	}
	
	public String getCertifications1() {
		return certifications1;
	}
	public void setCertifications1(String certifications1) {
		this.certifications1 = certifications1;
	}
	public String getCertifications2() {
		return certifications2;
	}
	public void setCertifications2(String certifications2) {
		this.certifications2 = certifications2;
	}
	public String getCertifications3() {
		return certifications3;
	}
	public void setCertifications3(String certifications3) {
		this.certifications3 = certifications3;
	}
	
	/* Previous Employment Information setter/getter */
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getPreorgname1() {
		return preorgname1;
	}
	public void setPreorgname1(String preorgname1) {
		this.preorgname1 = preorgname1;
	}
	public String getYearsworked1() {
		return yearsworked1;
	}
	public void setYearsworked1(String yearsworked1) {
		this.yearsworked1 = yearsworked1;
	}
	public String getRefname1() {
		return refname1;
	}
	public void setRefname1(String refname1) {
		this.refname1 = refname1;
	}
	public String getRefmailid1() {
		return refmailid1;
	}
	public void setRefmailid1(String refmailid1) {
		this.refmailid1 = refmailid1;
	}
	public String getRefphnumber1() {
		return refphnumber1;
	}
	public void setRefphnumber1(String refphnumber1) {
		this.refphnumber1 = refphnumber1;
	}
	public String getPreorgname2() {
		return preorgname2;
	}
	public void setPreorgname2(String preorgname2) {
		this.preorgname2 = preorgname2;
	}
	public String getYearsworked2() {
		return yearsworked2;
	}
	public void setYearsworked2(String yearsworked2) {
		this.yearsworked2 = yearsworked2;
	}
	public String getRefname2() {
		return refname2;
	}
	public void setRefname2(String refname2) {
		this.refname2 = refname2;
	}
	public String getRefmailid2() {
		return refmailid2;
	}
	public void setRefmailid2(String refmailid2) {
		this.refmailid2 = refmailid2;
	}
	/*public String getRefphnumber2() {
		return refphnumber2;
	}
	public void setRefphnumber2(String refphnumber2) {
		this.refphnumber2 = refphnumber2;
	}*/
	public String getPreorgname3() {
		return preorgname3;
	}
	public void setPreorgname3(String preorgname3) {
		this.preorgname3 = preorgname3;
	}
	public String getYearsworked3() {
		return yearsworked3;
	}
	public void setYearsworked3(String yearsworked3) {
		this.yearsworked3 = yearsworked3;
	}
	public String getRefname3() {
		return refname3;
	}
	public void setRefname3(String refname3) {
		this.refname3 = refname3;
	}
	public String getRefmailid3() {
		return refmailid3;
	}
	public void setRefmailid3(String refmailid3) {
		this.refmailid3 = refmailid3;
	}
	/*public String getRefphnumber3() {
		return refphnumber3;
	}
	public void setRefphnumber3(String refphnumber3) {
		this.refphnumber3 = refphnumber3;
	}*/
	public void setHiqualdeg1(String hiqualdeg1) {
		this.hiqualdeg1 = hiqualdeg1;
	}
	
	
}
