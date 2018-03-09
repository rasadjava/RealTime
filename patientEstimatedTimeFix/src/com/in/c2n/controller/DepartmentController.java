package com.in.c2n.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.in.c2n.dao.DepartmentDAO;
import com.in.c2n.model.Department;

@Controller
public class DepartmentController {

@Autowired
DepartmentDAO departmentDAO;


@RequestMapping(value="department_action",method=RequestMethod.POST)
public ModelAndView department_action(@ModelAttribute("dept") Department dept){
	
	
	int status=departmentDAO.insert(dept);
	String	success_message=null;
	System.out.println("status..."+status);
	if(status==1){
success_message="department  was  added successfully..";
	}else
		success_message="department adding failed..";
	return new ModelAndView("success","message",success_message);
}

@RequestMapping(value="/department_update",method = RequestMethod.POST)  
public ModelAndView department_update(@ModelAttribute("dept") Department dept){ 
	System.out.println("test");
    departmentDAO.update(dept);  
    return new ModelAndView("redirect:/department");  
} 

@RequestMapping(value="/deleteDepartment/{departmentid}",method = RequestMethod.GET)  
public ModelAndView deleteDepartment( @PathVariable int departmentid , @ModelAttribute("dept") Department dept){ 
	System.out.println("test");
    departmentDAO.delete(departmentid);  
    return new ModelAndView("redirect:/department");  
} 

@RequestMapping("/department")  
public ModelAndView department(){  
    List<Department> list= departmentDAO.getDepartments();
    return new ModelAndView("department","list",list);  
    
}  
/*@RequestMapping("/departmentnames")  
public ModelAndView departmentnames(){  
    List<Department> list1= departmentDAO.getDepartments();
    System.out.println(list1);
    return new ModelAndView("departmentnames","list1",list1);  
    
}  */




@RequestMapping(value="/adminHome")
public ModelAndView admin_page(){
	
	return new ModelAndView("adminHome");
}



}




