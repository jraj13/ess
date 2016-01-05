package com.ess.common.bean;

public class HelpDeskBean {
	
	
	private String hdCategory;
	private String hdQuery;
	private String hdAttachment;
	private String mailid;
	private String empid;
	
	
	public String getHdCategory() {
		return hdCategory;
	}
	public void setHdCategory(String hdCategory) {
		this.hdCategory = hdCategory;
	}
	public String getHdQuery() {
		return hdQuery;
	}
	public void setHdQuery(String hdQuery) {
		this.hdQuery = hdQuery;
	}
	public String getHdAttachment() {
		return hdAttachment;
	}
	public void setHdAttachment(String hdAttachment) {
		this.hdAttachment = hdAttachment;
	}
	public String getMailid() {
		return mailid;
	}
	public void setMailid(String mailid) {
		this.mailid = mailid;
		System.out.println(mailid);
	}
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}

}
