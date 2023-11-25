package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.beans.Patient;
import com.java.dao.PatientDao;

@Controller
public class PatientController {
	@Autowired
	PatientDao dao;
	
	@RequestMapping(value="/showList") 
	 public String showList(Model m, @ModelAttribute("patient")Patient patient){ 
		 List <Patient> list = dao.getPatientList();
		 m.addAttribute("patientList", list);		 
		 m.addAttribute("date", dao.getLocalDate());
		 String p = dao.getRandomPassword(8);		 
		 m.addAttribute("pt_password", p);
		 int rowno= dao.getRowCount();
		 m.addAttribute("count", rowno);	
		 
		 m.addAttribute("patient",patient);
		 return "reception/viewptlist";
		 
	 }
	@RequestMapping(value="/showDetailList")
	public String showDetailList(Model m, @ModelAttribute("patient") Patient patient) {
		List <Patient> list = dao.getPatientDetailList();
		 m.addAttribute("patientList", list);		 
		 m.addAttribute("date", dao.getLocalDate());
		 String p = dao.getRandomPassword(8);		 
		 m.addAttribute("pt_password", p);
		 int rowno= dao.getRowCount();
		 m.addAttribute("count", rowno);	
		 
		 m.addAttribute("patient",patient);
		 return "reception/viewdetaillist";
	}
	@RequestMapping(value="/save",method = RequestMethod.POST) 
	 public String save(@ModelAttribute("patient") Patient patient,Model m){ 
		String pass= dao.getRandomPassword(8);		
		patient.setPt_password(pass);
		String regdate = dao.getLocalDate();		
		patient.setDate(regdate);		
	 dao.save(patient);		
	 return "redirect:/showList"; 
	 }
	@RequestMapping(value="/editpatient/{pid}")
	public String edit(@PathVariable int pid,Model m){			 
		Patient patient= dao.getPatientById(pid);		
	    m.addAttribute("patient",patient);
		System.out.println(pid);
		 return "reception/showEditForm";			
	}
	@RequestMapping(value="/editsave",method = RequestMethod.POST) 
	 public String editsave(@ModelAttribute("patient") Patient patient){ 		 
		String pass= dao.getRandomPassword(8);		
		patient.setPt_password(pass);
		String regdate = dao.getLocalDate();		
		patient.setDate(regdate);
	 dao.update(patient); 
	 return "redirect:/showList"; 
	 }
	@RequestMapping(value="/deletepatient/{pid}",method = RequestMethod.GET) 
	 public String delete(@PathVariable int pid,Model m){ 
	 dao.delete(pid); 
	 return "redirect:/showList";
	 }
	@RequestMapping(value="/searchbyme",method=RequestMethod.POST)
	public String searchbyme(@ModelAttribute("patient")Patient patient,Model m) {
		List <Patient> ptlist = dao.FindPatientByMe(patient.getSearchvalue());
		m.addAttribute("list", ptlist);
		String pass= dao.getRandomPassword(8);		
		patient.setPt_password(pass);
		String regdate = dao.getLocalDate();		
		patient.setDate(regdate);		
		return "reception/showpatientbyname";
	}
}
