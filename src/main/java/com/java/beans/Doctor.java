package com.java.beans;

public class Doctor {
	int did;
	String dname;
	String specialist;
	public int getID() {
		return did;
	}
	public void setID(int id) {
		this.did = id;
	}
	public String getName() {
		return dname;
	}
	public void setName(String name) {
		this.dname = name;
	}
	public String getSpecialist() {
		return specialist;
	}
	public void setSpecialist(String spec) {
		this.specialist = spec;
	}
}
