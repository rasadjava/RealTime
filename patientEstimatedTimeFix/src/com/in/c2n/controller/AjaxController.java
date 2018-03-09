package com.in.c2n.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.in.c2n.dao.AjaxDao;
import com.in.c2n.model.Registerd_patient;

@Controller
public class AjaxController {

	@Autowired
	AjaxDao ajaxDao;
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@RequestMapping(value = "/check_for_previous_registration", params = { "patientName", "department",
			"date" }, method = RequestMethod.POST)
	public @ResponseBody int check_for_previous_registration(@RequestParam("patientName") String patientName,
			@RequestParam("department") String department, @RequestParam("date") String date) {

		Registerd_patient patient = new Registerd_patient();
		patient.setPatientName(patientName);
		patient.setDepartment(department);
		patient.setDate(date);

		int status = ajaxDao.check_user(patient);

		System.out.println("--------------------->" + status);
		return status;
	}

	@RequestMapping(value = "/get_next_patient", params = { "doctorname", "totalappointments", "department",
			"nextPatentname", "next_slot_no", "currentPatient", "current_slot_no",
			"intime" }, method = RequestMethod.POST)
	public @ResponseBody String get_next_patient(@RequestParam("doctorname") String doctorname,
			@RequestParam("department") String department, @RequestParam("nextPatentname") String nextPatentname,
			@RequestParam("totalappointments") String totalappointments,
			@RequestParam("next_slot_no") String next_slot_no, @RequestParam("currentPatient") String currentPatient,
			@RequestParam("current_slot_no") String current_slot_no, @RequestParam("intime") String intime) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		LocalDateTime now = LocalDateTime.now();
		 System.out.println(dtf.format(now));
		 
		 DateTimeFormatter time= DateTimeFormatter.ofPattern("HH:mm");
		String sql = "update appointment set visted_status=1 where doctorname='" + doctorname + "' and departmentname='"
				+ department + "'and patientname='" + nextPatentname + "' and bookingdate='" + dtf.format(now) + "'";
		int status = jdbcTemplate.update(sql);

		if (status == 1) {

			sql = "select patientname,slot_no from appointment WHERE visted_status !=1 and doctorname='" + doctorname
					+ "' and departmentname='" + department + "' and  bookingdate='" + dtf.format(now)
					+ "'ORDER BY slot_no ASC LIMIT 1";
			String string = jdbcTemplate.query(sql, new ResultSetExtractor<String>() {

				@Override
				public String extractData(ResultSet rs) throws SQLException, DataAccessException {
					if (rs.next()) {
						return rs.getString(1) + "/" + rs.getString(2);
					} else
						return "-/0";
				}

			});

			String next_patient_string[] = string.split("/");
			
			//Create estimate time for the next patient with the time interval 10 minutes
			
			String sql_etimatedTime = "select patientname,slot_no from appointment WHERE visted_status !=1 and doctorname='"
					+ doctorname + "' and departmentname='" + department + "' and  bookingdate='" + dtf.format(now)
					+ "'ORDER BY slot_no ASC";
			String getQueuedList = jdbcTemplate.query(sql_etimatedTime, new ResultSetExtractor<String>() {

				@Override
				public String extractData(ResultSet rs) throws SQLException, DataAccessException {
					int count = 0;
					while (rs.next()) {
						count = count + 10;
						DateTimeFormatter time = DateTimeFormatter.ofPattern("mm");
						String HH = String.valueOf(now.plusMinutes(count).getHour());
						String mm = String.valueOf(time.format(now.plusMinutes(count)));
						String slotIntervalTime = HH + ":" + mm;
						String sql = "update appointment set est_consult_time='" + slotIntervalTime
								+ "' where visted_status !=1 and doctorname='" + doctorname + "' and departmentname='"
								+ department + "' and patientname='" + rs.getString(1) + "' and bookingdate='"
								+ dtf.format(now) + "'";
						int status = jdbcTemplate.update(sql);
					}
					return String.valueOf(status);
				}

			});

			//check if the patient has slot 1
			
			if (Integer.parseInt(next_slot_no) == 1) {
			

				
				
				sql = "insert into currentrunningnumber (`doctor`,`department`,`totalappointments`,`nextpatientName`,`nextPatient_slot_no`,`currentpatientName`,`currentPatient_slot_no`,`date`,intime) values('"
						+ doctorname + "','" + department + "','" + totalappointments + "','" + next_patient_string[0]
						+ "'," + next_patient_string[1] + ",'" + nextPatentname + "'," + next_slot_no + ",'"
						+ dtf.format(now) + "','" +time.format(now)+ "')";

			} else
			{
				
				
				sql = "update currentrunningnumber set `nextpatientName`='" + next_patient_string[0] + "' , nextPatient_slot_no="
						+ next_patient_string[1] + ", `currentpatientName`='" + nextPatentname + "', currentPatient_slot_no="
						+ next_slot_no + ",intime='"+time.format(now)+"' where doctor='" + doctorname + "' and department='" + department
						+ "'  and date='" + dtf.format(now) + "'";
			}

			System.out.println(sql);
			jdbcTemplate.update(sql);

			return string+"&"+time.format(now);
		}
		return "un success";
	}
	
	
	@RequestMapping(value="/current_running_number",params={"doctor","deptname"},method=RequestMethod.GET)
	public @ResponseBody List<String> current_running_number(@RequestParam("doctor") String doctor,@RequestParam("deptname") String deptname){
		String sql="select currentPatient_slot_no,intime from currentrunningnumber where doctor='"+doctor+"' and department='"+deptname+"'";
		return jdbcTemplate.query(sql, new RowMapper<String>(){

			@Override
			public String mapRow(ResultSet rs, int arg1) throws SQLException {
			String	string =rs.getString(1);
			String s2=rs.getString(2);
			String res=string+","+s2;
			
		
			

			
			return res;
		
			}
			
			
			
		});
		
	}
	
}
