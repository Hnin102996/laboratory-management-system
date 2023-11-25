package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.beans.Staff;

public class StaffDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	public int update(Staff s) {
		String sql = "update staff set password='"+s.getPassword()+"' where password=?";
		return template.update(sql);
	}
	public Staff findByPassword(String password) {
		String sql = "select * from staff where username= '"+password+"'";
		try {
		return template.queryForObject(sql,new RowMapper<Staff>() {
			public Staff mapRow(ResultSet rs, int row)throws SQLException{
				Staff s = new Staff();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setPassword(rs.getString("password"));
				s.setUsername(rs.getString("username"));
				s.setDept(rs.getString("dept"));
				return s;
			}
		});
		} catch (EmptyResultDataAccessException ex) {
			return null;
		}
	}
	public int updatePassword(String newPassword, String oldPassword) {
		String sql = "update staff set password= ? where password= ?";
		return template.update(sql, newPassword,oldPassword);
	}
}
