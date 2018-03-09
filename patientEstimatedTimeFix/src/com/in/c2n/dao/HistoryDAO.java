package com.in.c2n.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.in.c2n.model.History;

@Component
public class HistoryDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	List<History> history=null;
	
	
	public List<History> get_history(HttpSession session){
		String sql="select patientname,phonenumber,bookingdate,doctorname,departmentname from appointment where username='"+session.getAttribute("username")+"'";
		history=jdbcTemplate.query(sql, new RowMapper<History>(){

			@Override
			public History mapRow(ResultSet history_result_Set, int arg1) throws SQLException {
			
				History history = new History();
				history.setPatientname(history_result_Set.getString(1));
				history.setPhonenumber(history_result_Set.getString(2));
				history.setDateofvisit(history_result_Set.getString(3));
				history.setDoctorname(history_result_Set.getString(4));
				history.setDepartment(history_result_Set.getString(5));
				return history;
			
			
			}
			
			
			
			
		});
		return history;
		
		
		
	}
	
}
