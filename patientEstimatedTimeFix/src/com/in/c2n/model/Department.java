package com.in.c2n.model;

public class Department {
private int departmentid;
private String departmentname;
public int getDepartmentid() {
	return departmentid;
}
public void setDepartmentid(int departmentid) {
	this.departmentid = departmentid;
}
public String getDepartmentname() {
	return departmentname;
}
public void setDepartmentname(String departmentname) {
	this.departmentname = departmentname;
}

public String toString(){  
    return departmentid+" "+departmentname; 
} 
}
