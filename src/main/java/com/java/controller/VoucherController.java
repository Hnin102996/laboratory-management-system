package com.java.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.beans.Patient;
import com.java.beans.Reception;
import com.java.beans.Staff;
import com.java.beans.Test;
import com.java.beans.Voucher;
import com.java.beans.VoucherDetail;
import com.java.dao.*;
import com.java.dao.ReceptionDao;
@Controller
public class VoucherController {
	@Autowired
	VoucherDao dao;
	
	@Autowired
	ReceptionDao rdao;
	
	@Autowired
	PatientDao pdao;
	
	@Autowired
	TestDao tdao;
	@RequestMapping(value="/savevoucher",method= RequestMethod.POST)
	public String savevoucher(@ModelAttribute("voucher") Voucher voucher,@RequestParam("selecttestid") String[] selecttestid, Model m, HttpSession session,RedirectAttributes rattribute) {
		Reception user=(Reception)session.getAttribute("userObject");
		System.out.println(user.getUsername());
		System.out.println(user.getName());
		
		Reception rect = rdao.getReception(user.getUsername(), user.getPassword());
		int sid = rect.getId();
		m.addAttribute("sid", sid);			
		Voucher v = new Voucher();
		m.addAttribute("patient", new Patient());
		Patient pt = pdao.getPatientById(voucher.getPid());
		m.addAttribute("patient", pt);
		int pid = pt.getPid();
		m.addAttribute("pid", pid);
		
		v.setId(sid);		
		v.setPid(pid);
		System.out.println(sid);		
		String voucherdate = dao.getDate();
		v.setDate(voucherdate);	
		String vouchertime = dao.getTime();
		v.setTime(vouchertime);
		v.setStatus("Active");
		dao.save(v);		
		m.addAttribute("test",new Test());
		List <Test> list = tdao.getTestList();
		m.addAttribute("testlist", list);
		m.addAttribute("selectTests",selecttestid);
		//dao.savevoucherdetail(voucher);
		//For saving voucher
		int vid= dao.getLatestVoucherId();
		m.addAttribute("idv", vid);
		m.addAttribute("cdate", voucherdate);
		m.addAttribute("ctime", vouchertime);
		  for(String id:selecttestid){
		    int id1=Integer.parseInt(id);
		    
		    VoucherDetail vd=new VoucherDetail();
		    
		     vd.setVid(vid);
		     vd.setTid(id1);
		     vd.setDate(voucherdate);
		     vd.setTime(vouchertime);
		     vd.setStatus("Active");
		     System.out.println(vd.getStatus());
		     dao.savevoucherdetail(vd);
		  }
		 
		return "redirect:/showPreviewVoucher";
	}
	@RequestMapping(value="/showPreviewVoucher")
	public String showPreviewVoucher(Model m, @ModelAttribute("voucher")Voucher voucher)
	{
		Voucher v= new Voucher();
		m.addAttribute("voucher", v);
		VoucherDetail vde = new VoucherDetail();
		m.addAttribute("voucherdetail",vde);
		int vid= dao.getLatestVoucherId();
		m.addAttribute("idv", vid);
		String voucherdate = dao.getDate();
		String vouchertime = dao.getTime();
		m.addAttribute("cdate", voucherdate);
		m.addAttribute("ctime", vouchertime);
		m.addAttribute("patient", new Patient());
		Patient pt = pdao.getPatientById(voucher.getPid());
		m.addAttribute("patient", pt);
		int pid = pt.getPid();
		m.addAttribute("pid", pid);
		m.addAttribute("test",new Test());
		List <Test> list = tdao.getTestList();
		m.addAttribute("testlist", list);
		//reatt.addAttribute("selectTests",selecttestid);
		return "reception/previewvoucher";
	}
	@RequestMapping(value="/showVoucherlist")
	public String showVoucherlist(Model m, @ModelAttribute("voucher") Voucher voucher) {
		List<Voucher> list = dao.getVoucherList();
		m.addAttribute("vlist", list);
		int rowno= dao.getRowNumber();
		 m.addAttribute("count", rowno);
		return "reception/viewvoucher";
	}
	/*@RequestMapping(value="/showVoucher")
	public String showVoucher(Model m,@RequestParam("selecttestid") String[] selecttestid,@ModelAttribute ("patient") Patient patient,@ModelAttribute ("test") Test test,@ModelAttribute ("voucher") Voucher voucher,HttpSession session) {
		m.addAttribute("selectTests", selecttestid);
		m.addAttribute("test",new Test());
		m.addAttribute("patient",new Patient());		
		List <Test> list = tdao.getTestList();
		m.addAttribute("testlist", list);		
		String p = pdao.getRandomPassword(8);		 
		 m.addAttribute("pt_password", p);
		Patient pt = pdao.getPatientById(test.getPid());
		m.addAttribute("voucher",new Voucher());
		m.addAttribute("staff", new Staff());
		//System.out.print(patient.getPid());
		//System.out.println(patient.getPtname());
		//int recId = (Integer)session.getAttribute("recId");
		//m.addAttribute("recId", recId);
		//voucher.setId(recId);
		String userName=(String)session.getAttribute("userName");
		m.addAttribute("userName",userName);
		m.addAttribute("patient", pt);
		String regdate = pdao.getLocalDate();		
		voucher.setDate(regdate);
				return "reception/previewvoucher";
		
	}*/
	@RequestMapping(value="/showptinfo",method=RequestMethod.POST)
	public String showptlist(Model m, @ModelAttribute ("patient") Patient patient) {
		try {
			
			Patient p = pdao.getPatientById(patient.getPid());
			m.addAttribute("test",new Test());
			if(p==null) {
				m.addAttribute("isError", true);
				String msg = "Not Found Patient For This ID No.";
				m.addAttribute("errormsg", msg);
				m.addAttribute("test", new Test());
			}
			m.addAttribute("pid",p.getPid());
			m.addAttribute("patient", p);
			
			
		}catch(Exception e) {
			
			m.addAttribute("isError", true);
			String msg = "Not Found Patient For This ID No.";
			m.addAttribute("errormsg", msg);
			m.addAttribute("isError", true);
			m.addAttribute("patient", new Patient());

		}
		List <Test> list = tdao.getTestList();
		m.addAttribute("testlist", list);
		m.addAttribute("test",new Test());
		//m.addAttribute("patient", new Patient());
		return "reception/voucher";
			
	}
	@RequestMapping(value="/searchbyall",method=RequestMethod.POST)
	public String searchbyall(@ModelAttribute("voucher") Voucher voucher,Model m) {
		List<Voucher> vd = dao.FindVoucher(voucher.getSvalue());
		m.addAttribute("vdlist", vd);
		if (vd.isEmpty()) {
			String mes = "Your Voucher ID does'nt exit.";
			m.addAttribute("ermes", mes);
			return "reception/showvoucher";
		}else {
		return "reception/showvoucher";
		}
	}
	@RequestMapping("/showAddVoucher")
	public String showAddVocher(Model model, HttpServletRequest req) {
			model.addAttribute("patient", new Patient());
			model.addAttribute("test", new Test());
			List <Test> list = tdao.getTestList();
			model.addAttribute("testlist", list);
			model.addAttribute("voucher",new Voucher());	
			String st = pdao.getRandomPassword(8);
			model.addAttribute("pt_password", st);
			return "reception/voucher";
	}	
	
	@RequestMapping(value="/editvoucher/{vid}")
	public String editvoucher(@PathVariable int vid,Model m,@ModelAttribute ("voucher") Voucher voucher){			 
		Voucher vd = dao.getVoucherById(vid);
	    m.addAttribute("voucher",vd);
	    if (voucher!=null)
	    {
	    	voucher.setStatus("Edited");
	    }
	    //VoucherDetail vdetail = new VoucherDetail();
	   //VoucherDetail vdt = dao.getVoucherDetailByDetailId(vdetail.getVdid());
	    //m.addAttribute("testId", vdt.getTid());
	   // System.out.println(vdetail.getVdid());
	    //System.out.println(vdetail.getTid());
	    //VoucherDetail v = dao.getTestByVoucherId(voucher.getVid());
	    //System.out.println(voucher.getVid());
	    //m.addAttribute("voucher1", v);
	    Patient p1 = pdao.getPatientByIdNo(vd.getPid());
	    String pname = p1.getPtname();
	    vd.setPtname(pname);
	    int ptage = p1.getAge();
	    vd.setAge(ptage);
	    String gen = p1.getSex();
	    vd.setSex(gen);
	    String refer = p1.getRefer();
	    vd.setRefer(refer);
	    //Test te = new Test();
	    //m.addAttribute("test", te);
		
		List<Test> testlist = dao.getTestByVoucherId(vid);
		List<Test> selectedTests = new ArrayList<>();
	    for (Test testId : testlist) {
	    	//Test test = dao.getTestByTid(tid);
	        if (testId!= null) {
	        	
	            selectedTests.add(testId);
	        }
	    }
	    List <Test> list = tdao.getTestList();
		m.addAttribute("testlist", list);
		m.addAttribute("selectedTests",selectedTests);
		
		 return "reception/showEidtVoucherForm";
	}
	@RequestMapping(value="/cancelvoucher/{vid}")
	public String CancelVoucher(@PathVariable int vid, @ModelAttribute("voucher") Voucher voucher, Model m)
	{
		Voucher vd = dao.getVoucherById(vid);
	    m.addAttribute("voucher",vd);
	    if(vd!=null) {
	    	
	    	vd.setStatus("Deactive");
	    	String cstatus=vd.getStatus();
	    	m.addAttribute("cstatus", cstatus);
	    	System.out.println(vd.getStatus());
	    	dao.update(vd);
	    	VoucherDetail vde = new VoucherDetail();
	    	vde.setStatus("Deactive");
	    	dao.updatevoucherdetail(vde);
			
	    }
	    List<Voucher> list = dao.getVoucherList();
		m.addAttribute("vlist", list);
	    return "reception/viewvoucher";
	    
	}
	@RequestMapping(value="/editsavevoucher",method = RequestMethod.POST) 
	 public String editsavevoucher(@ModelAttribute("voucher") Voucher voucher,@RequestParam("selecttestid") String[] selecttestid,HttpSession session, Model m){ 
	 //VoucherDetail vd = new VoucherDetail();
	 //m.addAttribute("voucher", vd);
	 Reception user=(Reception)session.getAttribute("userObject");
	 Reception rect = rdao.getReception(user.getUsername(), user.getPassword());
		int sid = rect.getId();
		m.addAttribute("sid", sid);		
		Voucher v = new Voucher();
		m.addAttribute("patient", new Patient());
		Patient pt = pdao.getPatientById(voucher.getPid());
		m.addAttribute("patient", pt);
		int pid = pt.getPid();
		m.addAttribute("pid", pid);		
		v.setId(sid);		
		v.setPid(pid);
		String voucherdate = dao.getDate();
		v.setDate(voucherdate);
		String vouchertime = dao.getTime();
		v.setTime(vouchertime);
		v.setStatus("Edited");
	 dao.update(voucher);
	 m.addAttribute("test",new Test());
		List <Test> list = tdao.getTestList();
		m.addAttribute("testlist", list);
		m.addAttribute("selectTests",selecttestid);
		//dao.savevoucherdetail(voucher);
		//For saving voucher
		int vid= dao.getLatestVoucherId();
		m.addAttribute("idv", vid);
		m.addAttribute("cdate", voucherdate);
		m.addAttribute("ctime", vouchertime);
		for(String id:selecttestid){
		    int id1=Integer.parseInt(id);
		    
		    VoucherDetail vdetail=new VoucherDetail();
		    
		     vdetail.setVid(vid);
		     vdetail.setTid(id1);
		     vdetail.setDate(voucherdate);
		     vdetail.setTime(vouchertime);
		     dao.updatevoucherdetail(vdetail);
		  }
		  
	
	 return "reception/previewvoucher"; 
	 }

}
