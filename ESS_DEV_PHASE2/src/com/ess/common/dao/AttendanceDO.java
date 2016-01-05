package com.ess.common.dao;

public class AttendanceDO {

	private String empid;
	private String dbDate;
	private String dateTime;
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	private String inTime;
	private String outTime;
	private String status;
	
	public String getDbDate() {
		return dbDate;
	}
	public void setDbDate(String dbDate) {
		this.dbDate = dbDate;
	}
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public String getInTime() {
		return inTime;
	}
	public void setInTime(String inTime) {
		this.inTime = inTime;
	}
	public String getOutTime() {
		return outTime;
	}
	public void setOutTime(String outTime) {
		this.outTime = outTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
