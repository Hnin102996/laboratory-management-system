package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.beans.Test;

public class TestDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	public int update(Test t) {
		 String sql = "update test set testgroup='"+t.getTestgroup()+"', price="+t.getPid()+", refergroup='"+t.getRefergroup()+"', test_name='"+t.getTest_name()+"'";
		 return template.update(sql);
	 }
	public List<Test> getTestList() {
		String sql = "select * from test";
		return template.query(sql,new RowMapper<Test>() {
				public Test mapRow(ResultSet rs,int row) throws SQLException{
			Test t = new Test();
			t.setTid(rs.getInt(1));
			t.setTestgroup(rs.getString(2));
			t.setPrice(rs.getFloat(3));
			t.setRefergroup(rs.getString(4));
			t.setTest_name(rs.getString(5));
			return t;
		}
		});
	}
	 public int getRowNumber() {
			String sql="select count(*) from test";
			int c = template.queryForObject(sql, Integer.class);
			return c;
		}
	public Test getTestById(int tid) {
		String sql = "select tid,test_name from test where tid = "+ tid;
		return template.queryForObject(sql, new RowMapper<Test>() {
			public Test mapRow(ResultSet rs, int row) throws SQLException{
				Test te = new Test();
				te.setTid(rs.getInt(1));
				te.setTest_name(rs.getString(2));
				return te;
			}
		});
	}
	public List<Test> getSelectedTestForVoucher(int vid){
		String sql = "select t.* from test t, voucher v, voucherdetail vd where v.vid=vd.vid and vd.tid=t.tid and v.vid="+vid+"";
		return template.query(sql, new RowMapper<Test>() {
			public Test mapRow(ResultSet rs, int row)throws SQLException {
				Test t = new Test();
				t.setTid(rs.getInt(1));
				t.setTestgroup(rs.getString(2));
				t.setPrice(rs.getFloat(3));
				t.setRefergroup(rs.getString(4));
				t.setTest_name(rs.getString(5));
				return t;
			}
		});
	}
}
