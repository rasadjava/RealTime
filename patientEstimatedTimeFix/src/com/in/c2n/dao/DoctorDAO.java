package com.in.c2n.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.in.c2n.model.Doctor;
import com.in.c2n.model.DoctorList;

public class DoctorDAO {

	private  JdbcTemplate jdbcTemplate;
	

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}


	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


	public int insert(Doctor doct){
	String sql="insert into doctor(`doctorid`,`doctorname`,`departmentname`,`doctortime`) VALUES('"+doct.getDoctorid()+"','"+doct.getDoctorname()+"','"+doct.getDepartmentname()+"','"+doct.getDoctortime()+"') ";
	System.out.println(sql);
	return	jdbcTemplate.update(sql);
		
	}
	
	public int delete(int doctorid) {
		String sql="delete from doctor where doctorid='"+doctorid+"'";
		return jdbcTemplate.update(sql);
	}


	public List<Doctor> getDoctors(){  
	    return jdbcTemplate.query("select * from doctor", new RowMapper<Doctor>(){
	        public Doctor mapRow(ResultSet rs_doc, int row) throws SQLException {  
	            Doctor doct=new Doctor();  
	            doct.setDoctorid(rs_doc.getInt(1));  
	            doct.setDoctorname(rs_doc.getString(2));  
	            doct.setDepartmentname(rs_doc.getString(3));
	            doct.setDoctortime(rs_doc.getString(4));
	            return doct;  
	        }  
	    });  
	}  

	public List<DoctorList> get_Doctors_value(String date,String deptname){
		System.out.println("gfghsfsgf");
return jdbcTemplate.query("select doctor.doctorid,doctor.doctorname FROM doctor LEFT JOIN appointmentcount on doctor.doctorid=appointmentcount.doctorid where doctor.departmentname='"+deptname+"' and appointmentcount.count<20 and appointmentcount.bookingcountdate='"+date+"' UNION   SELECT doctor.doctorid,doctor.doctorname FROM doctor where doctor.doctorname not in (select doctor.doctorname FROM doctor LEFT JOIN appointmentcount on doctor.doctorid=appointmentcount.doctorid where doctor.departmentname='"+deptname+"' and appointmentcount.count<20 and appointmentcount.bookingcountdate='"+date+"') and doctor.departmentname='"+deptname+"'", new RowMapper<DoctorList>(){
	       
	   public DoctorList mapRow(ResultSet rs, int row) throws SQLException {  
	            DoctorList doct1=new DoctorList();  
	             
	            doct1.setDoctorid(rs.getInt(1));  
	            doct1.setDoctorname(rs.getString(2));
	            System.out.println(rs.getInt(1));
	            System.out.println(rs.getString(2));
	            return doct1;  
	        }  
	    });  
	}  
	
	
	
	public List<Doctor> get_Doctors_time(String departmentname,String doctorname ){
	    return jdbcTemplate.query("select doctortime from doctor where doctorid='"+doctorname+"' and departmentname='"+departmentname+"'", new RowMapper<Doctor>(){
	        
	    	public Doctor mapRow(ResultSet rs, int row) throws SQLException {  
	            Doctor time=new Doctor();  
	             
	          time.setDoctortime(rs.getString(1));
	            System.out.println(rs.getString(1));
	            return time;  
	        }  
	    });  
	}
	
	
	
	


	public int update(Doctor doct) {
		String sqlquery="update doctor set doctorname='"+doct.getDoctorname()+"',departmentname='"+doct.getDepartmentname()+"',doctortime='"+doct.getDoctortime()+"' where doctorid='"+doct.getDoctorid()+"'";
		System.out.println(sqlquery);
		return jdbcTemplate.update(sqlquery);
		
	}  

/*	
	select DISTINCT appointment.doctorname from appointment INNER JOIN 
	appointmentcount on appointment.doctorid=appointmentcount.doctorid where appointment.bookingdate=appointmentcount.bookingcountdate and appointmentcount.count<=20; 
	*/



}
