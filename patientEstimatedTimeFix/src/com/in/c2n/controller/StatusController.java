package com.in.c2n.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.in.c2n.dao.StatusDAO;
import com.in.c2n.model.Appointment;
import com.in.c2n.model.todayAppointmentStatus;

@Controller
public class StatusController {
	
	@Autowired
	StatusDAO statusDao;
	
	@RequestMapping(value="/status")
	public ModelAndView status_page(){
		List<todayAppointmentStatus> appointment=statusDao.get_status();
		return new ModelAndView("status","appointment",appointment);
	}

	

}
