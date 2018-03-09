  package com.in.c2n.model;

public class ToDaysAppointments {

	private String doctorname;
	private String department;
	private String totalAppointments;
	private String currentPatient;
	private int current_patient_slot_no;
	private int next_patient_slot_number;
	private String nextPatient;
	private String intime;
	
	
	
	
	public String getIntime() {
		return intime;
	}
	public void setIntime(String intime) {
		this.intime = intime;
	}
	public int getCurrent_patient_slot_no() {
		return current_patient_slot_no;
	}
	public void setCurrent_patient_slot_no(int current_patient_slot_no) {
		this.current_patient_slot_no = current_patient_slot_no;
	}
	public int getNext_patient_slot_number() {
		return next_patient_slot_number;
	}
	public void setNext_patient_slot_number(int next_patient_slot_number) {
		this.next_patient_slot_number = next_patient_slot_number;
	}
	public String getDoctorname() {
		return doctorname;
	}
	public void setDoctorname(String doctorname) {
		this.doctorname = doctorname;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getTotalAppointments() {
		return totalAppointments;
	}
	public void setTotalAppointments(String totalAppointments) {
		this.totalAppointments = totalAppointments;
	}
	public String getCurrentPatient() {
		return currentPatient;
	}
	public void setCurrentPatient(String currentPatient) {
		this.currentPatient = currentPatient;
	}
	public String getNextPatient() {
		return nextPatient;
	}
	public void setNextPatient(String nextPatient) {
		this.nextPatient = nextPatient;
	}
	
}
