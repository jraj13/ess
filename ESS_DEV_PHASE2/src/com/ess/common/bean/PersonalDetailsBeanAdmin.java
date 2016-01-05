package com.ess.common.bean;

import java.sql.Date;

public class PersonalDetailsBeanAdmin {


	
	private String emp_no;
	private String name;
	private String mailid;
	private String designation;
	private Date date_of_joining;
	private String PAN_no;
	private int total_CTC;


	
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMailid() {
		return mailid;
	}
	public void setMailid(String mailid) {
		this.mailid = mailid;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public Date getDate_of_joining() {
		return date_of_joining;
	}
	public void setDate_of_joining(Date date_of_joining) {
		this.date_of_joining = date_of_joining;
	}
	public String getPAN_no() {
		return PAN_no;
	}
	public void setPAN_no(String pAN_no) {
		PAN_no = pAN_no;
	}
	public int getTotal_CTC() {
		return total_CTC;
	}
	public void setTotal_CTC(int total_CTC) {
		this.total_CTC = total_CTC;
	}
	}
