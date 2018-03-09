package com.in.c2n.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.in.c2n.dao.DoctorDAO;
import com.in.c2n.model.Doctor;
import com.in.c2n.model.DoctorList;

@Controller
public class DoctorController {
	
	@Autowired
	DoctorDAO doctorDAO;


	@RequestMapping(value="doctor_action",method=RequestMethod.POST)
	public ModelAndView doctor_action(@ModelAttribute("doct") Doctor doct){
		
		
		int status=doctorDAO.insert(doct);
		String	success_message=null;
		System.out.println("status..."+status);
		if(status==1){
			 return new ModelAndView("redirect:/doctor"); 
	//success_message="doctor  was  added successfully..";
		}else
			success_message="doctor adding failed..";
		return new ModelAndView("success","message",success_message);
	}
	
	
	@RequestMapping(value="/deleteDoctor/{doctorid}",method = RequestMethod.GET)  
	public ModelAndView deleteDoctor( @PathVariable int doctorid){ 
		System.out.println("test");
	    doctorDAO.delete(doctorid);  
	    return new ModelAndView("redirect:/doctor");  
	} 


	@RequestMapping(value="/doctor_update_action",method = RequestMethod.POST)  
	public ModelAndView doctor_update_action(@ModelAttribute("doct") Doctor doct){ 
		
	    doctorDAO.update(doct);  
	    return new ModelAndView("redirect:/doctor");  
	} 
	
	
	
	
	
	@RequestMapping("/doctor")  
	public ModelAndView doctor(){  
	    List<Doctor> doct= doctorDAO.getDoctors();
    return new ModelAndView("doctor","doct",doct);  
		
	}  



	
	@RequestMapping(value="/doctor_names",params = {"date","deptname"})
	public @ResponseBody   List<DoctorList> get_Doctors_value(
		
			
	@RequestParam(value="date") String date,@RequestParam(value="deptname") String deptname){
		
		
		 List<DoctorList> doct1= doctorDAO.get_Doctors_value(date,deptname);
		    return doct1;
	}
	
	
	
	
	@RequestMapping(value="/department_time",params = {"doctorname","departmentname"})
	public @ResponseBody  List<Doctor> get_Doctors_time(
	@RequestParam(value = "doctorname") String doctorname,@RequestParam(value = "departmentname") String departmentname){
		 List<Doctor> time= doctorDAO.get_Doctors_time(departmentname, doctorname);
		    return time;
	}
	
	
	

}
