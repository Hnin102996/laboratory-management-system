package com.java.controller;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;
import org.apache.tomcat.util.log.UserDataHelper.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestMethod;
import com.java.beans.Doctor;
import com.java.beans.Patient;
import com.java.beans.Reception;
import com.java.beans.Staff;
import com.java.beans.Test;
import com.java.beans.Voucher;
import com.java.beans.VoucherDetail;
import com.java.dao.ReceptionDao;
import com.java.dao.*;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

@Controller
public class ReceptionController {
	@Autowired
	ReceptionDao dao;
	
	@Autowired
	PatientDao pdao;
	
	@Autowired
	TestDao tdao;
	
	@Autowired
	StaffDao sdao;
	@RequestMapping("/signOut")
	public String signOutReception(HttpSession session,Model m) {
		
		session.invalidate();
		
		m.addAttribute("reception",new Reception());
		//m.addAttribute("driver",new Driver());
		return "reception_login";
	}
	

	@RequestMapping("/LabHomePage")
	public String ShowLabHomePage(Model model,@ModelAttribute ("reception") Reception reception) {
		Reception rec=new Reception();
		model.addAttribute("reception", rec);
		return "index";
	}
	@RequestMapping(value="/validReception", method=RequestMethod.POST)
	public String validReception(@ModelAttribute("reception") Reception reception,HttpSession session, Model m, RedirectAttributes reAtt) throws NoSuchAlgorithmException,IOException {
		int value = dao.getReceptionByUserNameandPassword(reception.getUsername(),reception.getPassword());
		int val = dao.getUsername(reception.getUsername());
		int val2 = dao.getPassword(reception.getPassword());
		String st;
		if (val>0) {
			if(val2>0) {
				if (value>0) {
			Reception rec = dao.getReception(reception.getUsername(),reception.getPassword());
			session.setMaxInactiveInterval(90000);
			session.setAttribute("recSession", rec);
			reAtt.addAttribute("resultFlag",1);
			Reception r = dao.getReception(reception.getUsername(), reception.getPassword());
			session.setAttribute("userName",reception.getUsername());
			session.setAttribute("recId", reception.getId());
			session.setAttribute("userObject",r);
			return "redirect:/showReceptionHome";
				} else {
					reAtt.addAttribute("resultFlag", 0);
					st="Please Enter Username and Password";					
					reAtt.addAttribute("errormessage", "Invalid Username and Password! Please Try Again.");
					return "redirect:/ReceptionLogin";
				}	
			}else {
				reAtt.addAttribute("resultFlag", 0);
				st="Wrong Password! Please Try Again.";
				reAtt.addAttribute("errorpass", "Invalid Password! Please Try Again.");
				return "redirect:/ReceptionLogin";
				
				
			}
		} else {
			reAtt.addAttribute("resultFlag", 0);
			st="Wrong Username! Please Try Again. ";
			reAtt.addAttribute("errorname", "Invalid Username! Please Try Again.");			
			return "redirect:/ReceptionLogin";
		}
	}
	
	
	@RequestMapping("/ReceptionLogin")
	public String ShowLoginForm(Model model) {
		Reception rec = new Reception();
		model.addAttribute("reception", rec);
		return "reception_login";
	}
	@RequestMapping("/showReceptionHome")
	public String showReceptionPage( Model model,HttpSession session) {
		model.addAttribute("patient",new Patient());
		Reception rec = (Reception)session.getAttribute("recSession");
		session.setAttribute("recSession", rec);		
		model.addAttribute("pageName", "Dashboard");
		String st = dao.getRandomPassword(8);
		model.addAttribute("pt_password", st);
		return "recdashboard";
		
		/*int value = dao.getReceptionByUserNameandPassword(reception.getUsername(),reception.getPassword());
		int val = dao.getUsername(reception.getUsername());
		int val2 = dao.getPassword(reception.getPassword());
		if (val2>0) {			
			if(val>0) {				
				if (value>0) {
					model.addAttribute("patient",new Patient());
					model.addAttribute("doctor",new Doctor());	
					String st = dao.getRandomPassword(8);
					model.addAttribute("pt_password", st);
					Reception r = dao.getReception(reception.getUsername(), reception.getPassword());
					
					model.addAttribute("rec",r);
					session.setAttribute("userName",reception.getUsername());
					session.setAttribute("recId", reception.getId());
					Reception re = (Reception) session.getAttribute("recSession");
					session.setAttribute("recSession", re);
					session.setAttribute("userObject",r);
					model.addAttribute("pageName", "Dashboard");
					return "recdashboard";
					}else {
						String st="Please Enter Username and Password";
						model.addAttribute("errormsg", st);
						return "reception_login";
					}	
				}else {
					
					String st="Wrong Username! Please Try Again. ";
					model.addAttribute("errorname", st);
					return "reception_login";
				}	
			} else {
				
				String st="Wrong Password! Please Try Again.";
				model.addAttribute("errorpass", st);
				return "reception_login";
			}*/
		
		
	}
	@RequestMapping("/ShowRegistrationPage")
	public String showRegistrationPage(Model m, @ModelAttribute ("reception") Reception reception) {
		m.addAttribute("patient", new Patient());
		m.addAttribute("pageName", "Patient Registration");
		return "reception/reception_home";
	}
	@RequestMapping("/changePasswordForm")
	public String showchangePasswordForm(Model m) {
//		m.addAttribute("staff",new Reception());
		return "changepasswordform";
	}
	@RequestMapping ("/changePassword")
	public String changePassword(@RequestParam("currentPassword") String currentPassword, @RequestParam("newPassword") String newPassword, @RequestParam("confirmPassword") String confirmPassword,@ModelAttribute("staff") Staff staff, Model m, HttpSession session) {
		Reception r = new Reception();
		m.addAttribute("reception", r);
		
		Reception receptoin=(Reception)session.getAttribute("recSession");
		
		
		if(currentPassword.equals(receptoin.getPassword())) {
			System.out.println("Current Password is true!");
			
			 if(newPassword.equals(confirmPassword)) {
				 System.out.println("Password  match");
				 m.addAttribute("successmsg","Successful Change Password!!");
				 sdao.updatePassword(newPassword, currentPassword);
				 
			 }else {
				 System.out.println("Password doesn't  match");
				 m.addAttribute("ncerrormsg", "New Password and Confirmed Password Not Math!!!");
				 return "changepasswordform";
			 }
		}else {
			//System.out.println("Current password is incorrect!!!");
			m.addAttribute("cuerrormsg", "Current Password is incorrect!!");
			return "changepasswordform";
		}
		return "recdashboard";
	}

	
	/*private boolean isValidCurrentPassword(String CurrentPassword)
	{
		Staff s = new Staff();
		Staff staff = sdao.findByPassword(s.getPassword());
		if(staff!=null) {
			String cpass = staff.getPassword();
			return cpass.equals(CurrentPassword);
		}else return false;
	}
	private boolean isValidNewPassword(String newPassword, String confirmPassword) 
	{
		return newPassword.equals(confirmPassword);
	}*/
	
	@RequestMapping("/showReturnReceptionHome")
	public String showReturnReceptionHome(Model model, HttpServletRequest req) 
	{
			model.addAttribute("patient",new Patient());	
			String st = dao.getRandomPassword(8);
			model.addAttribute("pt_password", st);
			return "recdashboard";
	}
	
	@RequestMapping("/showAddForm")
	public String showAddForm(Model model, HttpServletRequest req) {
			model.addAttribute("patient",new Patient());	
			String st = dao.getRandomPassword(8);
			model.addAttribute("pt_password", st);
			return "reception/reception_home";
	}
	
	/*@RequestMapping(value="/viewptlist/{pageid}") 
	 public String edit(@PathVariable int pageid,Model m){ 
	 int total=10; 
	 if(pageid==1){} 
	 else{ 
	 pageid=(pageid-1)*total+1; 
	 } 
	 System.out.println(pageid); 
	 List<Patient> list=dao.getPatientsByPage(pageid,total); 
	 m.addAttribute("list", list); 
	 return "reception/viewptlist"; 
	 }*/ 		
	@RequestMapping("/ReceptionRegisterPage")
	public String showRegisterPage(Model model, @ModelAttribute("reception") Reception reception) {
		model.addAttribute("patient", new Patient());
		return "reception/reception_home";
	}
	@RequestMapping("/ReceptionVoucherPage")
	public String showVoucherPage(Model model, @ModelAttribute("reception") Reception reception,@ModelAttribute("voucher") Voucher voucher,@ModelAttribute("patient") Patient patient,@ModelAttribute ("test") Test test) {
		return "reception/voucher";
	}
	@RequestMapping("/ReceptionTestCancelPage")
	public String showTestCancelPage(Model model, @ModelAttribute("reception") Reception reception) {
		return "reception/testcancel";
	}
	@RequestMapping("/ReceptionViewCancelTestPage")
	public String showViewCancaelTestPage(Model model, @ModelAttribute("reception") Reception reception) {
		return "reception/viewcanceltest";
	}
	@RequestMapping("/ReceptionViewPatientHistoryPage")
	public String showPtHistoryPage(Model model, @ModelAttribute("reception") Reception reception) {
		return "reception/viewpt_history";
	}
	@RequestMapping("/ReceptionViewTestListPage")
	public String showViewTestListPage(Model model, @ModelAttribute("reception") Reception reception) {
		return "reception/showtestlist";
	}
	@RequestMapping("/ReceptionViewVoucherPage")
	public String showViewVoucherPage(Model model, @ModelAttribute("reception") Reception reception) {
		return "reception/viewvoucher";
	}
	@RequestMapping("/ShowPatientList")
	public String showPatientList(Model model,@ModelAttribute("reception")Reception reception) {
		model.addAttribute("name",reception.getName());
		model.addAttribute("pass",reception.getPassword());
		
		return "reception/registerlist";
	}
	@RequestMapping("/ShowPatientDetailList")
		public String showPatientDetail(Model m,@ModelAttribute("patient")Patient patient) {
		String st = dao.getRandomPassword(8);
		m.addAttribute("pt_password", st);
		List<Patient>list =pdao.getPatientList();
		m.addAttribute("list", list);
			return "reception/patientdetail";
		}
}

