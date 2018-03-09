package com.in.c2n.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.in.c2n.dao.ProfileDAO;

import com.in.c2n.model.Profile;

@Controller
public class ProfileController {
@Autowired ProfileDAO profileDAO;



@RequestMapping(value="/user_update",method = RequestMethod.POST)  
public ModelAndView doctor_update(@ModelAttribute("profile") Profile profile,HttpSession session){ 

int status=profileDAO.update_profile(profile,session);  
System.out.println(status);
   return new ModelAndView("redirect:/profile");  
} 



	
	
	
	
	@RequestMapping(value="/profile")
	public ModelAndView profile_page(HttpSession session){
	Profile  profile=profileDAO.get_profile_fields(session);
		return new ModelAndView("profile","profile",profile);
	}
}