package com.java.dao;
import java.sql.ResultSet;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Random;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import com.java.beans.Reception;
import com.java.beans.Test;
import com.java.beans.Voucher;
import com.java.beans.VoucherDetail;
import com.mysql.cj.xdevapi.Statement;
import com.java.beans.Patient;
public class ReceptionDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}	
	public int getReceptionByUserNameandPassword(String name,String pass){ 
		try {
	 String sql="select count(*) from staff where dept='Reception' and password='"+pass+"' and username='"+name+"'";
	 int count = template.queryForObject(sql,Integer.class);
		 return count;
		
		}catch (EmptyResultDataAccessException e) {
			return 0;
		} 
	 
	 }	
	public int getUsername(String name) {
		try {
			String sql = "select count(*) from staff where dept='Reception' and username='"+name+"'";
			int count = template.queryForObject(sql, Integer.class);
			return count;
		}catch (EmptyResultDataAccessException e) {
			return 0;
		}
	}
	public int getPassword(String pass) {
		try {
			String sql = "select count(*) from staff where dept='Reception' and password='"+pass+"'";
			int count = template.queryForObject(sql, Integer.class);
			return count;
		}catch (EmptyResultDataAccessException e) {
			return 0;
		}
	}
	public int getRowCount() {
		String sql = "select count(*) from patientdetail";
		int count = template.queryForObject(sql, Integer.class);
		return count;
	}
	public String getLocalDate() {
		 Date date = new Date();
		 DateFormat df = new SimpleDateFormat();
		 String currentDate = df.format(date);
		 return currentDate;
	 }
	public String getDate() {
		 LocalDateTime currentDateTime = LocalDateTime.now();
	        
	        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	        String currentDate = dateFormatter.format(currentDateTime);
	        //System.out.println("Date: " + currentDate);
	        return currentDate;
	}
	public String getTime() {
		LocalDateTime currentDateTime = LocalDateTime.now();
		 DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	        String currentTime = timeFormatter.format(currentDateTime);
	        return currentTime;
	}
	public  String getRandomPassword(int len) {
		    String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		    Random rnd = new Random();

		    StringBuilder sb = new StringBuilder(len);
		    for (int i = 0; i < 8; i++) {
		        sb.append(AB.charAt(rnd.nextInt(AB.length())));
		    }
		    return sb.toString();
		}	
	 public Reception getReception(String name, String password) {
		 String sql = "select * from staff where username='"+name+"' and password='"+password+"'";
		 return template.queryForObject(sql,new RowMapper<Reception>() {
			 public Reception mapRow(ResultSet rs, int row) throws SQLException {				 
				 Reception rp = new Reception();
				 rp.setId(rs.getInt(1));
				 rp.setName(rs.getString(2));
				 rp.setPassword(rs.getString(3));;
				 rp.setUsername(rs.getString(4));
				 rp.setDept(rs.getString(5));
				 return rp;
			 }
		 });
		 
	 }	
	 
	
}
