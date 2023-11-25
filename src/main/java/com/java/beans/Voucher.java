package com.java.beans;

import java.util.List;

public class Voucher {
	int vdid;
	String ptname;
	int age;
	String pt_password;
	String refer;
	String test_name;
	float price;
	String username;
	String spassword;
	int vid;
	String date;
	String time;
	String status;
	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}
	int pid;
	String sex;
	int tid;
	int id;
	String testgroup;

	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getTestgroup() {
		return testgroup;
	}
	public void setTestgroup(String testgroup) {
		this.testgroup = testgroup;
	}
	List<Test> test;
    String svalue;
    String deletionReason;
    public List<String> getSelecttestids() {
		return selecttestids;
	}
	public void setSelecttestids(List<String> selecttestids) {
		this.selecttestids = selecttestids;
	}
	private List<String> selecttestids;
	public String getDeletionReason() {
		return deletionReason;
	}
	public void setDeletionReason(String deletionReason) {
		this.deletionReason = deletionReason;
	}
	public String getSvalue() {
		return svalue;
	}
	public void setSvalue(String svalue) {
		this.svalue = svalue;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getVdid() {
		return vdid;
	}
	public void setVdid(int vdid) {
		this.vdid = vdid;
	}
	public String getPtname() {
		return ptname;
	}
	public void setPtname(String ptname) {
		this.ptname = ptname;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPt_password() {
		return pt_password;
	}
	public void setPt_password(String pt_password) {
		this.pt_password = pt_password;
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
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String sname) {
		this.username = sname;
	}
	public String getSpassword() {
		return spassword;
	}
	public void setSpassword(String spassword) {
		this.spassword = spassword;
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
	
}
