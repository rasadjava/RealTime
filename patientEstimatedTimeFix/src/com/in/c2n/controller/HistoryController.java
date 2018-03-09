package com.in.c2n.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.in.c2n.dao.HistoryDAO;
import com.in.c2n.model.History;

@Controller
public class HistoryController {
	
@Autowired
HistoryDAO historyDao;
	
	
	@RequestMapping(value="/history")
	public ModelAndView history_page(HttpSession session){
	List<History> history=historyDao.get_history(session);
		return new ModelAndView("history","histroy_list",history);
	}
	
	
}
