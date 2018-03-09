package com.in.c2n.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PatientsController {
	

	@RequestMapping(value="/patients")
	public ModelAndView patients_page(){
		
		return new ModelAndView("patients");
	}


}
