package com.java.controller;
import java.net.http.HttpRequest;
import java.util.List; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;
import org.springframework.validation.BindingResult; 
import org.springframework.web.bind.annotation.ModelAttribute; 
import org.springframework.web.bind.annotation.PathVariable; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import com.java.beans.Admin;
import com.java.dao.AdminDao;

@Controller
public class AdminController {	
	@Autowired
	AdminDao dao;
	@RequestMapping("/Adminlogin") 
	 public String loginForm(Model model){		
		Admin adm = new Admin();
	model.addAttribute("admin", adm);
	return "adminlogin_page";		
	}
	
	//@SuppressWarnings("unlikely-arg-type")
	@RequestMapping("/showAdminHomepage")
	public String showAdminHomePage(@ModelAttribute("admin") Admin admin,Model model,HttpRequest req) {	
		
		int value= dao.getAdminByUserNameandPassword(admin.getUsername(), admin.getPassword());
		
		if (value>0) {
			
			return "admin/admin_home";
		}
		else {
			String msg="Wrong Username or Password.";
			model.addAttribute("error", msg);
			return "adminlogin_page";
		}
	}
	
}
