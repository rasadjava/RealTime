package com.in.c2n.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import com.in.c2n.dao.AppointmentDAO;
import com.in.c2n.dao.DepartmentDAO;
import com.in.c2n.model.Appointment;
import com.in.c2n.model.Department;
import com.in.c2n.model.ToDaysAppointments;


@Controller
public class AppointmentController {
@Autowired DepartmentDAO departmentDAO;
@Autowired AppointmentDAO appointmentDAO;	
	
@RequestMapping(value="/appointment")
public ModelAndView appointment_page(){
	
	List<Department> list= departmentDAO.getDepartments();
    return new ModelAndView("appointment","list",list);  
}

@RequestMapping(value="/appointment_action",method=RequestMethod.POST)

public ModelAndView appointment_action(@Valid @ModelAttribute("appointment") Appointment appointment,BindingResult result){
		
		
		int status=appointmentDAO.insert(appointment);
		String	success_message=null;
		System.out.println("status..."+status);
		if(status==1){
			 return new ModelAndView("redirect:/appointment"); 
	//success_message="doctor  was  added successfully..";
		}else
			success_message="appointment adding failed..";
		return new ModelAndView("success","message",success_message);
	}

@RequestMapping(value="/TodayAppointment")
public ModelAndView TodayAppointment(){
List<ToDaysAppointments> toDaysAppointments_list= null;
toDaysAppointments_list=appointmentDAO.get_today_appointments();

    //System.out.println("list of patients..."+toDaysAppointments_list);
	ModelAndView modelAndView= new ModelAndView();
	
	modelAndView.addObject("patient_today_appointments",toDaysAppointments_list);
	modelAndView.setViewName("TodaysAppointments");
	return modelAndView;
}

	
}
	

	
	
	

