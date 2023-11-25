package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.beans.Patient;

public class PatientDao {
	
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	public int getPatientDate(String pdate) {
		try {
		String sql = "select count(*) from patientdetail where date="+pdate;
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
	 public int save(Patient pt) {
			String sql = "insert into patientdetail(pt_password,ptname,age,sex,address,email,fathername,refer,nrc,nation,country,state,dob,phone,date) values ('"+pt.getPt_password()+"','"+pt.getPtname()+"',"+pt.getAge()+",'"+pt.getSex()+"','"+pt.getAddress()+"','"+pt.getEmail()+"','"+pt.getFathername()+"','"+pt.getRefer()+"','"+pt.getNrc()+"','"+pt.getNation()+"','"+pt.getCountry()+"','"+pt.getState()+"','"+pt.getDob()+"','"+pt.getPhone()+"','"+pt.getDate()+"')";
			return template.update(sql);
		}
	 public int update(Patient p) {
		 String sql = "update patientdetail set pt_password='"+p.getPt_password()+"', ptname='"+p.getPtname()+"', age= "+p.getAge()+", sex= '"+p.getSex()+"', address = '"+p.getAddress()+"', email = '"+p.getEmail()+"', fathername = '"+p.getFathername()+"',refer = '"+p.getRefer()+"', nrc = '"+p.getNrc()+"',nation = '"+p.getNation()+"', country = '"+p.getCountry()+"', state = '"+p.getState()+"',dob = '"+p.getDob()+"',phone = "+p.getPhone()+",date = '"+p.getDate()+"' where pid = "+p.getPid()+"";
		 return template.update(sql);		
	 }
	 public int delete(int pid){ 
		 String sql="delete from patientdetail where pid="+pid+""; 
		 return template.update(sql); 
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
	 public Patient getPatientById(int pid) {
			String sql = "select * from patientdetail where pid="+pid;
			return template.queryForObject(sql, new RowMapper<Patient>() {
				public Patient mapRow(ResultSet rs, int row) throws SQLException {
					Patient m= new Patient();
			        m.setPid(rs.getInt(1));
			        m.setPt_password(rs.getString(2));
			        m.setPtname(rs.getString(3));
			        m.setAge(rs.getInt(4));
			        m.setSex(rs.getString(5));
			        m.setAddress(rs.getString(6));
			        m.setEmail(rs.getString(7));
			        m.setFathername(rs.getString(8));
			        m.setRefer(rs.getString(9));
			        m.setNrc(rs.getString(10));
			        m.setDob(rs.getString(11));
			        m.setNation(rs.getString(12));		        
			        m.setCountry(rs.getString(13));
			        m.setState(rs.getString(14));		       
			        m.setPhone(rs.getString(15));
			        m.setDate(rs.getString(16));
					return m;
		
				}
			});
		}
	 public Patient getPatientByIdNo(int pid) {
		 String sql = "select pid,ptname,age,sex,refer from patientdetail where pid="+pid;
		 return template.queryForObject(sql, new RowMapper<Patient>() {
			 public Patient mapRow(ResultSet rs, int row)throws SQLException{
			 Patient p = new Patient();
			 p.setPid(rs.getInt(1));
			 p.setPtname(rs.getString(2));
			 p.setAge(rs.getInt(3));
			 p.setSex(rs.getString(4));
			 p.setRefer(rs.getString(5));
			 return p;
			 }
		 });
	 }
	 @SuppressWarnings("deprecation")
		public Patient FindPatientById(int id) {
			String sql = "select * from patientdetail where pid=?";
			return template.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<Patient>(Patient.class));
		}
	 public List<Patient> getPatientDetailList(){ 
		 return template.query("select * from patientdetail",new RowMapper<Patient>(){ 
		 public Patient mapRow(ResultSet rs, int row) throws SQLException { 
		 Patient pt=new Patient(); 
		 pt.setPid(rs.getInt(1)); 
		 pt.setPt_password(rs.getString(2)); 
		 pt.setPtname(rs.getString(3)); 
		 pt.setAge(rs.getInt(4));
		 pt.setSex(rs.getString(5));		 
		 pt.setAddress(rs.getString(6));
		 pt.setEmail(rs.getString(7));
		 pt.setFathername(rs.getString(8));
		 pt.setRefer(rs.getString(9));
		 pt.setNrc(rs.getString(10));
		 pt.setDob(rs.getString(11));
		 pt.setNation(rs.getString(12));		 
		 pt.setCountry(rs.getString(13));
		 pt.setState(rs.getString(14));
		 pt.setPhone(rs.getString(15));
		 pt.setDate(rs.getString(16));
		 return pt; 
		 } 
		 }); 		 
	 }
	 public List<Patient> getPatientList(){
		 String sql = "select ptname,age,sex,address,fathername,refer,date from patientdetail";
		 return template.query(sql, new RowMapper<Patient>() {
			 public Patient mapRow(ResultSet rs, int row) throws SQLException{
				 Patient p = new Patient();
				 p.setPtname(rs.getString("ptname"));
				 p.setAge(rs.getInt("age"));
				 p.setSex(rs.getString("sex"));
				 p.setAddress(rs.getString("address"));
				 p.setFathername(rs.getString("fathername"));
				 p.setRefer(rs.getString("refer"));
				 p.setDate(rs.getString("date"));
				 return p;
			 }
		 });
	 }
	 public List<Patient> FindPatientByMe(String searchvalue) {
			String sql = "select * from patientdetail where refer like '%"+searchvalue+"%' or pid like '"+searchvalue+"' or ptname like '%"+searchvalue+"%'";
			return template.query(sql,new RowMapper<Patient>() {
				public Patient mapRow(ResultSet rs,int row) throws SQLException{
					Patient p = new Patient();
					p.setPid(rs.getInt(1));
					p.setPt_password(rs.getString(2));
					p.setPtname(rs.getString(3));
					p.setAge(rs.getInt(4));
					p.setSex(rs.getString(5));
					p.setAddress(rs.getString(6));
					p.setEmail(rs.getString(7));
					p.setFathername(rs.getString(8));
					p.setRefer(rs.getString(9));
					p.setNrc(rs.getString(10));
					p.setDob(rs.getString(11));
					p.setNation(rs.getString(12));
					p.setCountry(rs.getString(13));
					p.setState(rs.getString(14));
					p.setPhone(rs.getString(15));
					p.setDate(rs.getString(16));
					return p;
				}
			});
		 
		}
	 /*public List<Patient> getPatientsByPage(int pageid,int total){ 
	 String sql="select * from patientdetail limit "+(pageid-1)+","+total; 
	 System.out.println(sql); 
	 return template.query(sql,new RowMapper<Patient>(){ 
	 public Patient mapRow(ResultSet rs, int row) throws SQLException { 
	 Patient pt=new Patient(); 
	 String name=rs.getString(3); 
	 System.out.println(name); 
	 pt.setPid(rs.getInt(1));
	 pt.setPt_password(rs.getString(2));
	 pt.setPtname(name); 
	 pt.setAge(rs.getInt(4));
	 pt.setSex(rs.getString(5));
	 pt.setPhone(rs.getString(16));
	 pt.setAddress(rs.getString(6));
	 pt.setEmail(rs.getString(7));
	 pt.setFathername(rs.getString(8));
	 pt.setRefer(rs.getString(9));
	 pt.setNrc(rs.getString(10));
	 pt.setNation(rs.getString(11));
	 pt.setReligion(rs.getString(12));
	 pt.setCountry(rs.getString(13));
	 pt.setState(rs.getString(14));
	 pt.setDob(rs.getString(15));
	 pt.setDate(rs.getString(16));
	 return pt; 
	 } 
	 }); 
 }*/
}
