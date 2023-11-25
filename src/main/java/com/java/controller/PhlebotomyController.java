package com.java.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.beans.*;
import com.java.beans.Phlebotomy;
import com.java.beans.Reception;
import com.java.dao.PhlebotomyDao;
import com.java.dao.*;

@Controller
public class PhlebotomyController {
	@Autowired
	PhlebotomyDao dao;	
	@Autowired
	VoucherDao vdao;
	@RequestMapping("/PhlebotomyLogin")
	public String ShowPhlebotomyLogin(Model m, @ModelAttribute("phle") Phlebotomy phle) {
		Phlebotomy p = new Phlebotomy();
		m.addAttribute("phlet", p);
		return "phlebotomy_login";
	}
	@RequestMapping(value="/showPhlebotomyHome")
	public String showPhleHomoe(Model m,HttpSession session)
	{
		m.addAttribute("patient", new Patient());
		m.addAttribute("voucher", new Voucher());
		Phlebotomy phl = (Phlebotomy)session.getAttribute("phleSession");
		session.setAttribute("phleSession", phl);		
		m.addAttribute("pageName", "Dashboard");
		return "phlebotomy/home";
	}
	@RequestMapping(value="/validPhlebotomy", method=RequestMethod.POST)
	public String validReception(@ModelAttribute("phle") Phlebotomy phle,HttpSession session, Model m, RedirectAttributes reAtt) throws NoSuchAlgorithmException,IOException {
		int value = dao.getPhlebotomyByUsernameandPassword(phle.getUsername(),phle.getPassword());
		int val = dao.getUsername(phle.getUsername());
		int val2 = dao.getPassword(phle.getPassword());
		String st;
		if (val>0) {
			if(val2>0) {
				if (value>0) {
			Phlebotomy ph = dao.getPhlebotomy(phle.getUsername(),phle.getPassword());
			session.setMaxInactiveInterval(90000);
			session.setAttribute("recSession", ph);
			reAtt.addAttribute("resultFlag",1);
			Phlebotomy r = dao.getPhlebotomy(phle.getUsername(), phle.getPassword());
			session.setAttribute("userName",phle.getUsername());
			session.setAttribute("recId", phle.getId());
			session.setAttribute("userObject",r);
			return "redirect:/showPhlebotomyHome";
				} else {
					reAtt.addAttribute("resultFlag", 0);
					st="Please Enter Username and Password";					
					reAtt.addAttribute("errormessage", "Invalid Username and Password! Please Try Again.");
					return "redirect:/PhlebotomyLogin";
				}	
			}else {
				reAtt.addAttribute("resultFlag", 0);
				st="Wrong Password! Please Try Again.";
				reAtt.addAttribute("errorpass", "Invalid Password! Please Try Again.");
				return "redirect:/PhlebotomyLogin";
				
				
			}
		} else {
			reAtt.addAttribute("resultFlag", 0);
			st="Wrong Username! Please Try Again. ";
			reAtt.addAttribute("errorname", "Invalid Username! Please Try Again.");			
			return "redirect:/PhlebotomyLogin";
		}
	}
	
	@RequestMapping(value="")
	public String ShowPhleHome(Model m, @ModelAttribute("voucher") Voucher voucher, HttpSession session) {
		Phlebotomy phle= new Phlebotomy();
		int value = dao.getPhlebotomyByUsernameandPassword(phle.getUsername(), phle.getPassword());
		if (value>0) {
			m.addAttribute("patient", new Patient());
			m.addAttribute("doctor", new Doctor());
			m.addAttribute("test", new Test());
			Phlebotomy p = dao.getPhlebotomy(phle.getUsername(), phle.getPassword());
			m.addAttribute("phlet", p);
			session.setAttribute("userName", phle.getUsername());
			session.setAttribute("UserObject", p);
			Voucher v = new Voucher();
			List <Voucher> list = vdao.getVoucherList();	
			m.addAttribute("vlist", list);
			if(!list.isEmpty()) 
			{	
				m.addAttribute("vlist", list);
				/*String cdate = dao.getLocalDate();
				System.out.println(cdate);
				m.addAttribute("tdate", cdate);
				phle.setDate(cdate);
				int value1 = dao.getDateFromVoucher();
				while (value1>0) 
				{
					String vdate = v.getDate();
					if(cdate==vdate) 
						{
							m.addAttribute("vlist",list);
						}
				}*/
			}				
			return "phlebotomy/home";
		}
		else {
			
			String st="Wrong Username or Passowrd! Please Try Again.";
			m.addAttribute("errormsg", st);
			return "phlebotomy_login";
		}
	}
	@RequestMapping("/ShowChangePassword")
	public String ShowChangePassword() {
		return "phlebotomy/pchangepassword";
	}
	@RequestMapping(value="/savechange", method= RequestMethod.POST)
	public String SaveChange(@ModelAttribute("phle") Phlebotomy phle, Model m) {
		Staff staff = new Staff();
		dao.updatestaff(staff);
		return "phlebotomy-login";
	}

}
