package com.java.beans;

import java.util.List;

public class VoucherDetail {
	int vdid;
	int vid;
	String date;
	String time;
	String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	int tid;
	int pid;
	String ptname;
	String pt_password;
	int age;
	String refer;
	String test_name;
	String svalue;
	private List<Test> selectedTests;
	public List<Test> getSelectedTests() {
		return selectedTests;
	}
	public void setSelectedTests(List<Test> selectedTests) {
		this.selectedTests = selectedTests;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPtname() {
		return ptname;
	}
	public void setPtname(String ptname) {
		this.ptname = ptname;
	}
	public String getPt_password() {
		return pt_password;
	}
	public void setPt_password(String pt_password) {
		this.pt_password = pt_password;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getRefer() {
		return refer;
	}
	public void setRefer(String refer) {
		this.refer = refer;
	}
	public String getTest_name() {
		return test_name;
	}
	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}
	public String getSvalue() {
		return svalue;
	}
	public void setSvalue(String svalue) {
		this.svalue = svalue;
	}
	
	public int getVdid() {
		return vdid;
	}
	public void setVdid(int vdid) {
		this.vdid = vdid;
	}
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
		
}
