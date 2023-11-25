package com.java.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import com.java.beans.Admin;
public class AdminDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template)
	{
		this.template = template;
	}
	/*public int save(Admin a) {
		String sql = "insert into staff(sname,spass,sdept) values(\""+a.getName()+"\",\""+a.getPassword()+"\",\""+a.getDept()+"\""+a.getUsername()+")";
		return template.update(sql);
	}
	public int update(Admin a) {
		String sql = "update staff set sname=\""+a.getName()+"\", spass="+a.getPassword()+",sdept=\""+a.getDept()+"\""+a.getUsername()+"\" where sid="+a.getId()+"";
		return template.update(sql);
	}
	public int delete(int id){ 
		 String sql="delete from staff where sid="+id+""; 
		 return template.update(sql); 
		}*/
	/*@SuppressWarnings("deprecation") 
	public String getAdminByName(String name,String dept){ 
		try {
	 String sql="select username from staff where dept='"+dept+"' and username='"+name+"'"; 
	 String na = this.template.queryForObject(sql,String.class);	 
		 //return template.queryForObject(sql, new Object[]{name},new BeanPropertyRowMapper<Admin>(Admin.class)); 
		 return na;
		}catch (EmptyResultDataAccessException e) {
			return null;
		}
	 
	 }*/	
	@SuppressWarnings("deprecation") 
	public int getAdminByUserNameandPassword(String name,String pass){ 
		try {
	 String sql="select count(*) from staff where dept='Admin' and password='"+pass+"' and username='"+name+"'";
	 int count = template.queryForObject(sql,Integer.class);
		 return count;
		
		}catch (EmptyResultDataAccessException e) {
			return 0;
		}
	 
	 
	 }	
	/*
	@SuppressWarnings("unused")
	public Admin getAdminByPassword(String pass){ 
		String sql="select * from staff where spass='"+pass+"'";
		String password;
		try {
			password = template.queryForObject(sql,String.class);
			return template.queryForObject(sql, new RowMapper<Admin>(){
				@Override
				public Admin mapRow(ResultSet rs, int row) throws SQLException{
					Admin admin = new Admin();
					admin.setId(rs.getInt(1));
					admin.setName(rs.getString(2));
					admin.setPassword(rs.getString(3));
					admin.setDept(rs.getString(4));
					admin.setUsername(rs.getString(5));
					return admin;
				}
			});		
		} catch(EmptyResultDataAccessException e) {
			return null;
		}
		
		}*/
	
	/*public List<Admin> getStaffsByPage(int pageid,int total){ 
		 String sql="select * from staff limit "+(pageid-1)+","+total; 
		 System.out.println(sql); 
		 return template.query(sql,new RowMapper<Admin>(){ 
		 public Admin mapRow(ResultSet rs, int row) throws SQLException { 
		 Admin s=new Admin(); 
		 String name=rs.getString(2); 
		 System.out.println(name); 
		 s.setId(rs.getInt(1)); 
		 s.setName(name); 
		 s.setPassword(rs.getString(4)); 
		 s.setDept(rs.getString(4)); 
		 return s; 
		 } 
		 }); 
		}*/
}
