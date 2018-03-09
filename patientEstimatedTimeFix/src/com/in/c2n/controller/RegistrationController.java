package com.in.c2n.controller;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.in.c2n.dao.UserDAO;
import com.in.c2n.model.Users;

@Controller
public class RegistrationController {
	
	@Autowired
	UserDAO userDAO;
	 @Autowired
	private HttpSession httpSession;
	
	 
	 
	 
	 @RequestMapping(value="/signUp_Action",method=RequestMethod.POST)
		public ModelAndView signUp_action(  @Valid @ModelAttribute("user")  Users user,BindingResult result){
			
			
			 if (result.hasErrors()) {

					ModelAndView model1 = new ModelAndView("signUp");
					
					return model1;
			 }

			
			 else{   
			
			int status=userDAO.insert(user);
			System.out.println("status..."+status);
			if(status==1){
			httpSession.setAttribute("user",user.getName());
		//success_message="registration was success..";
			
			
			}
			return new ModelAndView("success");}
			
	 }
		
	 @RequestMapping(value="/signUp")
	 public ModelAndView signup_page(){
	 	
	 	return new ModelAndView("signUp");
	 }

	 	
	 }
