package com.in.c2n.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import com.in.c2n.model.Appointment;
import com.in.c2n.model.todayAppointmentStatus;


@Component
public class StatusDAO {
@Autowired
private JdbcTemplate jdbcTemplate;

@RequestMapping(value="/get_status")
public List<todayAppointmentStatus> get_status(){
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	LocalDateTime now = LocalDateTime.now();

	String sql="select patientname,doctorname,departmentname,slot_no,est_consult_time from appointment where appointment.bookingdate='"+dtf.format(now)+"' and  not appointment.visted_status='1'";
	System.out.println(sql); 
	return jdbcTemplate.query(sql, new RowMapper<todayAppointmentStatus> (){

		@Override
		public todayAppointmentStatus mapRow(ResultSet rs, int arg1) throws SQLException {
			todayAppointmentStatus appointment= new todayAppointmentStatus();
			System.out.println(rs.getString(1));
			appointment.setPatientname(rs.getString(1));
			System.out.println(rs.getString(2));
			appointment.setDoctorname(rs.getString(2));
			System.out.println(rs.getString(3));
			appointment.setDepartmentname(rs.getString(3));
			appointment.setWaitingNumber(rs.getString(4));
			appointment.setEstimatedConsultTime(rs.getString(5));
			
			return appointment;
		}
		
		
		
		
	});



	
}
}
