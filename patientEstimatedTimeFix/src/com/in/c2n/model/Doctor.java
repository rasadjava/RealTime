package com.in.c2n.model;
/*@Javeed_Prasad*/
public class Doctor {
	private int doctorid;
	private String doctorname;
	 private  String  departmentname;
	 private  String doctortime;
	public String getDoctortime() {
		return doctortime;
	}
	public void setDoctortime(String doctortime) {
		this.doctortime = doctortime;
	}
	public int getDoctorid() {
		return doctorid;
	}
	public void setDoctorid(int doctorid) {
		this.doctorid = doctorid;
	}
	public String getDoctorname() {
		return doctorname;
	}
	public void setDoctorname(String doctorname) {
		this.doctorname = doctorname;
	}
	public String getDepartmentname() {
		return departmentname;
	}
	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}

}
