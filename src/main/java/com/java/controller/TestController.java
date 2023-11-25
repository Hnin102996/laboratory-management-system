package com.java.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.beans.Reception;
import com.java.beans.Test;
import com.java.dao.TestDao;
@Controller
public class TestController {
	@Autowired
	TestDao dao;
	@RequestMapping(value="/edittest/{tid}")
	public String editTest(@PathVariable int tid, Model m, HttpSession session) {
		Test t = dao.getTestById(tid);
		m.addAttribute("test", t);
		m.addAttribute("rec", new Reception());
		int recId = (Integer)session.getAttribute("recId");
		m.addAttribute("recId", recId);
		return "reception/showEditTestForm";
	}
	@RequestMapping(value="/editsavetest",method = RequestMethod.POST) 
	 public String editsave(@ModelAttribute("Test") Test test){ 		
	 dao.update(test); 
	 return "redirect:/showVoucher"; 
	 }	
	@RequestMapping(value="/showTest")
	public String showTestList(Model m, @ModelAttribute ("test") Test test) {
		List <Test> list = dao.getTestList();
		m.addAttribute("tlist", list);
		int rowno= dao.getRowNumber();
		 m.addAttribute("count", rowno);
		return "reception/showtestlist";
	}	
}
