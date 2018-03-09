package com.in.c2n.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import com.in.c2n.model.Appointment;
import com.in.c2n.model.AppointmentCount;
import com.in.c2n.model.ToDaysAppointments;



public class AppointmentDAO {

AppointmentCount  appointmentCount=null;

@Autowired
HttpSession session;
private JdbcTemplate jdbcTemplate;


public JdbcTemplate getJdbcTemplate() {
	return jdbcTemplate;
}

public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
	this.jdbcTemplate = jdbcTemplate;
}

	public int insert(Appointment appointment) {
		
		String doctor_id_doctor_name[]= appointment.getDoctorname().split(":");
	
	
		System.out.println(doctor_id_doctor_name[0]+"----"+doctor_id_doctor_name[1]);
	String check_doctorcount="select doctorid,bookingcountdate,count from appointmentcount where doctorid="+doctor_id_doctor_name[0]+" and bookingcountdate='"+appointment.getBookingdate()+"' and count > 0";
	
 System.out.println(check_doctorcount);
	
  appointmentCount=jdbcTemplate.query(check_doctorcount, new ResultSetExtractor<AppointmentCount>(){

				@Override
				public AppointmentCount extractData(ResultSet rs) throws SQLException, DataAccessException 
				{
					
					
					if(rs.next()){
						appointmentCount=new AppointmentCount();
					appointmentCount.setDoctorid(rs.getInt(1));
					appointmentCount.setBookingcountdate(rs.getString(2));
					appointmentCount.setCount(rs.getInt(3));
					
				}
					System.out.println(appointmentCount);
					return appointmentCount;
				}	
				
				
			});
  String sql=null;
	if(appointmentCount==null){
		System.out.println(session.getAttribute("username"));
	sql="insert into appointment(`patientname`,`departmentname`,`slot_no`,`doctorid`,`doctorname`,`bookingdate`,`phonenumber`,`gender`,`timings`,`username`,`visted_status`) VALUES('"+appointment.getPatientname()+"','"+appointment.getDepartmentname()+"',1,"+doctor_id_doctor_name[0]+",'"+doctor_id_doctor_name[1]+"','"+appointment.getBookingdate()+"','"+appointment.getMobilenumber()+"','"+appointment.getGender()+"','"+appointment.getTimings()+"','"+session.getAttribute("username")+"',0)";
String query="insert into appointmentcount(`doctorid`,`bookingcountdate`,`count`) values('"+doctor_id_doctor_name[0]+"','"+appointment.getBookingdate()+"',1)";
		
jdbcTemplate.update(query);
	}else{
		System.out.println("2st");
		String query_update="update  appointmentcount set count="+(appointmentCount.getCount()+1)+" where doctorid="+doctor_id_doctor_name[0]+" and bookingcountdate='"+appointment.getBookingdate()+"'";
		jdbcTemplate.update(query_update);
		sql="insert into appointment(`patientname`,`departmentname`,`slot_no`,`doctorid`,`doctorname`,`bookingdate`,`phonenumber`,`gender`,`timings`,`username`,`visted_status`) VALUES('"+appointment.getPatientname()+"','"+appointment.getDepartmentname()+"',"+(appointmentCount.getCount()+1)+","+doctor_id_doctor_name[0]+",'"+doctor_id_doctor_name[1]+"','"+appointment.getBookingdate()+"','"+appointment.getMobilenumber()+"','"+appointment.getGender()+"','"+appointment.getTimings()+"','"+session.getAttribute("username")+"',0)";

	}
	

	
	
		return	jdbcTemplate.update(sql);
	
	}
	
	
	
	
	
	
public List<ToDaysAppointments> get_today_appointments(){
	
	
	 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	
	 LocalDateTime now = LocalDateTime.now();
    // System.out.println(dtf.format(now));

	
	
	
	
	String sql="SELECT DISTINCT appointment.doctorname,appointment.departmentname ,appointmentcount.count as totalappointments ,appointment.patientname as nextpatient,appointment.slot_no as next_slot_no , '-' as currentpatient,'0' as current_slot_no ,'--' as intime from appointment INNER JOIN appointmentcount ON appointment.doctorid=appointmentcount.doctorid where appointmentcount.bookingcountdate='"+dtf.format(now)+"' and appointment.bookingdate='"+dtf.format(now)+"' and appointment.visted_status=0 and appointment.slot_no=1 union SELECT currentrunningnumber.doctor,currentrunningnumber.department,currentrunningnumber.totalappointments ,currentrunningnumber.nextpatientName as nextpatient,currentrunningnumber.nextPatient_slot_no as next_slot_no,currentrunningnumber.currentpatientName as currentpatient,currentrunningnumber.currentPatient_slot_no as current_slot_no,currentrunningnumber.intime FROM currentrunningnumber where date='"+dtf.format(now)+"'" ;
	System.out.println(sql);
	
	return jdbcTemplate.query(sql,new RowMapper<ToDaysAppointments>(){

		@Override
		public ToDaysAppointments mapRow(ResultSet rs, int arg1) throws SQLException {
			ToDaysAppointments toDaysAppointments= new ToDaysAppointments();
			System.out.println(rs.getString(1));
			toDaysAppointments.setDoctorname(rs.getString(1));
			System.out.println(rs.getString(2));
			toDaysAppointments.setDepartment(rs.getString(2));
			System.out.println(rs.getString(3));
			toDaysAppointments.setTotalAppointments(rs.getString(3));
			System.out.println(rs.getString(4));
			toDaysAppointments.setNextPatient(rs.getString(4)); 
			toDaysAppointments.setNext_patient_slot_number(rs.getInt(5));
			toDaysAppointments.setCurrentPatient(rs.getString(6));
			toDaysAppointments.setCurrent_patient_slot_no(rs.getInt(7));
			toDaysAppointments.setIntime(rs.getString(8));
			return toDaysAppointments;
			
			
		}
		
		
		
	});
}	
	

}
