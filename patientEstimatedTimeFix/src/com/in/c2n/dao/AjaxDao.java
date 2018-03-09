package com.in.c2n.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;

import com.in.c2n.model.Registerd_patient;

@Component
public class AjaxDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	private Registerd_patient patient1 = null;

	public int check_user(Registerd_patient patient) {

		String sql = "SELECT patientname, departmentname, bookingdate FROM appointment where patientname='"
				+ patient.getPatientName() + "' and departmentname='" + patient.getDepartment() + "' and bookingdate='"
				+ patient.getDate() + "'";
		patient1 = jdbcTemplate.query(sql, new ResultSetExtractor<Registerd_patient>() {

			@Override
			public Registerd_patient extractData(ResultSet rs) throws SQLException, DataAccessException {
				if(rs.next()){
				Registerd_patient patient = new Registerd_patient();
				patient.setPatientName(rs.getString(1));
				patient.setDepartment(rs.getString(2));
				patient.setDate(rs.getString(3));
				return patient;
				}
				else
				return null;
			}

		});

		if (patient1 != null) {

			return 1;
		} else {
			return 0;

		}
	}
}
