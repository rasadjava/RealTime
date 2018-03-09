package com.in.c2n.model;

public class todayAppointmentStatus {
	
	private String patientname;
	private String  departmentname;
	private String doctorname;
	private String bookingdate;
	private String mobilenumber;
	private String gender;
	private String timings;
	private String waitingNumber;
	private String estimatedConsultTime;
	
	
	
	
	public String getEstimatedConsultTime() {
		return estimatedConsultTime;
	}
	public void setEstimatedConsultTime(String estimatedConsultTime) {
		this.estimatedConsultTime = estimatedConsultTime;
	}
	public String getWaitingNumber() {
		return waitingNumber;
	}
	public void setWaitingNumber(String waitingNumber) {
		this.waitingNumber = waitingNumber;
	}
	public String getPatientname() {
		return patientname;
	}
	public void setPatientname(String patientname) {
		this.patientname = patientname;
	}
	public String getDepartmentname() {
		return departmentname;
	}
	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}
	
	public String getDoctorname() {
		return doctorname;
	}
	public void setDoctorname(String doctorname) {
		this.doctorname = doctorname;
	}
	public String getBookingdate() {
		return bookingdate;
	}
	public void setBookingdate(String bookingdate) {
		this.bookingdate = bookingdate;
	}
	public String getMobilenumber() {
		return mobilenumber;
	}
	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}
	public String getTimings() {
		return timings;
	}
	public void setTimings(String timings) {
		this.timings = timings;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
