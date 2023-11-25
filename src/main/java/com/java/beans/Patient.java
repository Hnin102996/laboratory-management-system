package com.java.beans;
import java.util.List;

import javax.validation.constraints.NotEmpty;
public class Patient {
	int pid;
	String pt_password;
	String ptname;
	int age;
	String sex;
	String phone;
	String address;
	@NotEmpty(message="Please Enter Email.")
	String email;
	String fathername;
	String refer;
	@NotEmpty(message="Please Enter NRC NO.")
	String nrc;
	String dob;
	String nation;	
	String country;
	String state;
	String date;	
	private String searchvalue;
	private List<Test> test;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPt_password() {
		return pt_password;
	}
	public void setPt_password(String pt_password) {
		this.pt_password = pt_password;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFathername() {
		return fathername;
	}
	public void setFathername(String fathername) {
		this.fathername = fathername;
	}
	public String getRefer() {
		return refer;
	}
	public void setRefer(String refer) {
		this.refer = refer;
	}
	public String getNrc() {
		return nrc;
	}
	public void setNrc(String nrc) {
		this.nrc = nrc;
	}

	public String getNation() {
		return nation;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date=date;
	}
	public String getSearchvalue() {
		return searchvalue;
	}
	public void setSearchvalue(String searchvalue) {
		this.searchvalue = searchvalue;
	}
}
