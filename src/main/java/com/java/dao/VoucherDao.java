package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.PersistenceContext;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.RowMapperResultSetExtractor;

import com.java.beans.Voucher;
import com.java.beans.VoucherDetail;
import com.java.beans.*;
public class VoucherDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	public int save(Voucher v) {
		 String sql = "insert into voucher(date,pid,id,time,status) values('"+v.getDate()+"',"+v.getPid()+","+v.getId()+",'"+v.getTime()+"','"+v.getStatus()+"')";
		 return template.update(sql);
	 }	
	 public int getLatestVoucherId() {
		 String sql = "select vid from voucher order by vid desc limit 1";
		 return template.queryForObject(sql, Integer.class);
	 }
	 public int savevoucherdetail(VoucherDetail vd) {
		 String sql = "insert into voucherdetail(vid,date,tid,time,status) values("+vd.getVid()+",'"+vd.getDate()+"',"+vd.getTid()+",'"+vd.getTime()+"','"+vd.getStatus()+"')";
		 return template.update(sql);
	 }
	 public int update(Voucher v) {
		// String sql = "update voucher set date='"+v.getDate()+"', pid= "+v.getPid()+", id="+v.getId()+",time='"+v.getTime()+"'";
		 String sql = "update voucher set date=?,pid=?,id=?,time=? where vid=? and status=?";
		 try {
		 return template.update(sql, v.getDate(),v.getPid(),v.getId(),v.getTime(),v.getVid(),v.getStatus());
		 }catch (DataAccessException e) {
		        // Handle the exception
		        e.printStackTrace();
		        return -1; // Return an appropriate error code
		    }
	 }
	 public int updatestatus(String status) {
		 String sql = "update voucher set status=? order by vid desc limit 1 ";
		 return template.update(sql);
	 }
	 public int updatevoucherdetail(VoucherDetail vd) {
		 //String sql = "update voucherdetail set vid="+vd.getVid()+", date='"+vd.getDate()+"', tid="+vd.getTid()+",time='"+vd.getTime()+"'";
		 String sql= "update voucherdetail set vid=?, date=?, tid=?, time=?, status=? where vid=?";
		 try {
		 return template.update(sql, vd.getVid(),vd.getDate(),vd.getSelectedTests(),vd.getTime(),vd.getStatus(),vd.getVdid(),vd.getVid());
		 }catch (DataAccessException e) {
		        // Handle the exception
		        e.printStackTrace();
		        return -1; // Return an appropriate error code
		    }
	 }
	 public int delete(int vid) {
			String sql="delete from voucher where vid= "+vid;
			return template.update(sql);
		}
	 public int getRowNumber() {
			String sql="select count(*) from voucherdetail";
			int c = template.queryForObject(sql, Integer.class);
			return c;
		}
	 public String getDate() {
		 LocalDateTime currentDateTime = LocalDateTime.now();
	        
	        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
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
	 public List <Voucher> getVoucherList() {
		 String sql = "select v.vid,pd.pid,pd.ptname,pd.pt_password,pd.age,pd.refer,t.test_name,t.price,v.date,v.time,v.status from voucher v,voucherdetail vd,patientdetail pd,test t where v.pid=pd.pid and v.vid=vd.vid and vd.tid=t.tid";
		 return template.query(sql, new RowMapper<Voucher>() {
			 public Voucher mapRow(ResultSet rs,int row) throws SQLException{
				 Voucher v = new Voucher();
				 v.setVid(rs.getInt(1));
				 v.setPid(rs.getInt(2));
				 v.setPtname(rs.getString(3));
				 v.setPt_password(rs.getString(4));
				 v.setAge(rs.getInt(5));
				 v.setRefer(rs.getString(6));
				 v.setTest_name(rs.getString(7));
				 v.setPrice(rs.getFloat(8));
				 v.setDate(rs.getString(9));
				 v.setTime(rs.getString(10));
				 v.setStatus(rs.getString(11));
				 return v;
			 }
		 });
	 }
	 public Voucher getVoucherById(int vid) {
		 String sql = "select v.* from voucherdetail vd, voucher v where v.vid=vd.vid and v.vid = "+vid;
		 return template.queryForObject(sql, new RowMapper<Voucher>(){
			 public Voucher mapRow(ResultSet rs, int row) throws SQLException{
				 Voucher vc = new Voucher();
				 vc.setVid(rs.getInt(1));
				 vc.setDate(rs.getString(2));
				 vc.setPid(rs.getInt(3));
				 vc.setId(rs.getInt(4));
				 vc.setTime(rs.getString(5));
				 vc.setStatus(rs.getString(6));
				 return vc;
				 }
		 });
	 }
	public VoucherDetail getVoucherDetailByDetailId(int vdid) {
		 String sql = "select vd.vdid,vd.vid,vd.date,vd.tid from voucherdetail vd, voucher v where v.vid=vd.vid and vd.vdid= "+vdid;
		 try {
		 return template.queryForObject(sql,new RowMapper<VoucherDetail>() {
			 public VoucherDetail mapRow(ResultSet rs, int row)throws SQLException{
				 VoucherDetail vd= new VoucherDetail();
				 vd.setVdid(rs.getInt("vdid"));
				 vd.setVid(rs.getInt("vid"));
				 vd.setDate(rs.getString("date"));
				 vd.setTid(rs.getInt("tid"));
				 vd.setTime(rs.getString("time"));
				 return vd;
			 }
		 });
		 }catch (EmptyResultDataAccessException ex) {return null;}
	 }
	public List<Test> getSelectTestByVoucherId(int vid){
		String sql = "SELECT t.* FROM test t,voucherdetail vd, voucher v where t.tid=vd.tid and vd.vid=v.vid and v.vid= "+vid;
			return template.query(sql, new RowMapper<Test>() {
				public Test mapRow(ResultSet rs, int row)throws SQLException{
					Test t = new Test();
					t.setTid(rs.getInt("tid"));
					t.setTestgroup(rs.getString("testgroup"));
					t.setPrice(rs.getFloat("price"));
					t.setRefergroup(rs.getString("refergroup"));
					t.setTest_name(rs.getString("test_name"));
					return t;
				}
			});
	}
	public List<Test> getTestByVoucherId(int vid){
		String sql = "select vd.tid from voucher v, voucherdetail vd where v.vid=vd.vid and v.vid="+vid+" and v.status=Active";
		return template.query(sql, new RowMapper<Test>() {
			public Test mapRow(ResultSet rs, int row)throws SQLException {
				Test t = new Test();
				t.setTid(rs.getInt("tid"));
				return t;
			}
		});
			
	}
	 public Integer getTestByVoucherId2(int vid) {
		 String sql = "select vd.tid from voucherdetail vd,voucher v,test t where v.vid=vd.vid and vd.tid=t.tid and vd.vdid= "+vid;
		 try {
		 Integer testid= template.queryForObject(sql, Integer.class);
		 return testid != null ? testid:0;
		 }catch (EmptyResultDataAccessException ex) {return 0;}
	 }
	 public List<Voucher> FindVoucher(String svalue){
		 String sql = "select v.vid,pd.pid,pd.ptname,pd.pt_password,pd.age,pd.refer,t.test_name,v.date from voucher v,voucherdetail vd,patientdetail pd,test t where v.pid=pd.pid and v.vid=vd.vid and vd.tid=t.tid and (v.vid like '"+svalue+"' or v.date like '"+svalue+"')";
		 return template.query(sql, new RowMapper<Voucher>() {
			 public Voucher mapRow(ResultSet rs, int row) throws SQLException{
				 Voucher vd = new Voucher();
				 vd.setVid(rs.getInt(1));
				 vd.setPid(rs.getInt(2));
				 vd.setPtname(rs.getString(3));
				 vd.setPt_password(rs.getString(4));
				 vd.setAge(rs.getInt(5));
				 vd.setRefer(rs.getString(6));
				 vd.setTest_name(rs.getString(7));
				 vd.setDate(rs.getString(8));
				 vd.setTime(rs.getString(9));
				 return vd;
			 }
		 });
	 }
	 public int getTestByVoucherId1(int vid) {
		 try {
		 String sql = "select count(voucherdetail.tid) from voucherdetail,test,voucher where voucherdetail.vid=voucher.vid and voucherdetail.tid=test.tid";
		int count = template.queryForObject(sql, Integer.class);
		return count;
		 } catch(EmptyResultDataAccessException e) {
			 return 0;
		 }
	 }
	 public Test getTestByTid(int tid){
		 String sql = "select * from test where tid= "+tid;
		 return template.queryForObject(sql, new RowMapper<Test>() {
			 public Test mapRow(ResultSet rs,int row)throws SQLException {
				 Test t = new Test();
				 t.setTid(rs.getInt("tid"));
				 t.setTestgroup(rs.getString("testgroup"));
				 t.setPrice(rs.getFloat("price"));
				 t.setRefergroup(rs.getString("refergroup"));
				 t.setTest_name(rs.getString("test_name"));
				 return t;
			 }
		 });
	 }
	    
}
