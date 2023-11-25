package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.beans.Phlebotomy;
import com.java.beans.*;

public class PhlebotomyDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	public int getPhlebotomyByUsernameandPassword(String username, String password) {
		try {
		String sql = "select count(*) from staff where dept='Phlebotomy' and username= '"+username+"' and password= '"+password+"'";
		int count = template.queryForObject(sql,Integer.class);
		return count;
		} catch (EmptyResultDataAccessException e) {
			return 0;
		}		
	}
	public int getUsername(String name) {
		try {
			String sql = "select count(*) from staff where dept='Phlebotomy' and username='"+name+"'";
			int count = template.queryForObject(sql, Integer.class);
			return count;
		}catch (EmptyResultDataAccessException e) {
			return 0;
		}
	}
	public int getPassword(String pass) {
		try {
			String sql = "select count(*) from staff where dept='Phlebotomy' and password='"+pass+"'";
			int count = template.queryForObject(sql, Integer.class);
			return count;
		}catch (EmptyResultDataAccessException e) {
			return 0;
		}
	}
	public int updatestaff(Staff s) {
		String sql = "update staff set name='"+s.getName()+"', password= '"+s.getPassword()+"', username= '"+s.getUsername()+"', dept ='"+s.getDept()+"' where id ="+s.getId()+"";
		return template.update(sql);
	}
	public Phlebotomy getPhlebotomy(String name, String pass) {
		String sql = "select * from staff where username= '"+name+"' and password= '"+pass+"'";
		return template.queryForObject(sql, new RowMapper<Phlebotomy>() {
			public Phlebotomy mapRow (ResultSet rs, int row) throws SQLException {
				Phlebotomy p = new Phlebotomy();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setPassword(rs.getString(3));
				p.setUsername(rs.getString(4));
				p.setDept(rs.getString(5));
				return p;
			}
		});
	}
	public String getLocalDate() {
		 Date date = new Date();
		 DateFormat df = new SimpleDateFormat();
		 String currentDate = df.format(date);
		 return currentDate;
	 }
	public List<Voucher> getVoucherList(){
		String sql = "select p.pid,p.ptname,p.age,t.test_name,t.testgroup,p.refer,v.date from voucher v,patientdetail p,test t,voucherdetail vd where v.vid=vd.vid and v.pid=p.pid and vd.tid=t.tid";
		return template.query(sql, new RowMapper<Voucher>() {
			public Voucher mapRow(ResultSet rs,int row)throws SQLException{
				Voucher v = new Voucher();
				v.setPid(rs.getInt(1));
				v.setPtname(rs.getString(2));
				v.setAge(rs.getInt(3));
				v.setTest_name(rs.getString(4));
				v.setTestgroup(rs.getString(5));
				v.setRefer(rs.getString(6));
				v.setDate(rs.getString(7));
				return v;
			}
		});
	}
	public int getDateFromVoucher() {
		try {
		String sql = "select count(date) from voucher";
		int count = template.queryForObject(sql, Integer.class);
		return count;
		} catch (EmptyResultDataAccessException e) {
			return 0;
		}
	}
}
