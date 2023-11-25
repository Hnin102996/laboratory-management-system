package com.java.beans;

import java.util.Objects;

public class Test {
	int tid;
	String test_name;
	String testgroup;
	float price;
	String refergroup;
	int pid;
	
	public String getTest_name() {
		return test_name;
	}
	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}
	
	
		public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTestgroup() {
		return testgroup;
	}
	public void setTestgroup(String group) {
		this.testgroup = group;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getRefergroup() {
		return refergroup;
	}
	public void setRefergroup(String refergroup) {
		this.refergroup = refergroup;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	// Test.java
	@Override
	public boolean equals(Object obj) {
	    if (this == obj) return true;
	    if (obj == null || getClass() != obj.getClass()) return false;
	    Test otherTest = (Test) obj;
	    return Objects.equals(this.tid, otherTest.tid);
	}

	@Override
	public int hashCode() {
	    return Objects.hash(tid);
	}

	
	
	
}
