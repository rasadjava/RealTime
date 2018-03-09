package com.in.c2n.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.in.c2n.dao.LoginDAO;
import com.in.c2n.model.Login;

@Controller
public class LoginController {

@Autowired
LoginDAO loginDAO;



@RequestMapping(value="/signin_Action",method=RequestMethod.POST)
public ModelAndView signIn_Action(@ModelAttribute("login") Login login,HttpSession session){
	Login userLoggedin=loginDAO.validate(login);
	
	if(userLoggedin!=null){
	
	
	if (userLoggedin.getRole()==1) 
	{
		session.setAttribute("username",login.getUsername());
	
		return new ModelAndView("adminHome");
	}
	else if(userLoggedin.getRole()==2)
	{
		session.setAttribute("username",login.getUsername());
		
		return new ModelAndView("superVisor_Home");
		
	}
	else if(userLoggedin.getRole()==3)
	{
		session.setAttribute("username",login.getUsername());
		return new ModelAndView("user_home");
	}
	}
	
			return new ModelAndView("redirect:/index.jsp");	
	
}


@RequestMapping(value="/user_home")
public ModelAndView userhome_page(){
		
return new ModelAndView("user_home");
	}
	


}
