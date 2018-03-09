package com.in.c2n.model;


import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;



public class Users {
	 
	    @NotEmpty
	    @Size(min=3,message="username must be atleasr 3 charecters")
	   
	   // @UniqueUsername(message="such user already exists")
	private String username;
	   @NotEmpty
	    private String name;
	    @Email(message="please enter valid email address")
	    @NotEmpty
	private String email;
	    @NotEmpty(message="please enter password")
	private String password;
	    @NotEmpty
	    private String address;
	    
	    @NotEmpty(message="please enter confirm password")
	private String cpassword;
	    
	    
	    
	    @NotEmpty(message="mobile number must be 10 digits")
	    @Pattern(regexp="(^$|[0-9]{10})")
	    private  String phone;
	    @NotEmpty
	private String role;

	    
	    
	    public String getCpassword() {
			return cpassword;
		}
		public void setCpassword(String cpassword) {
			this.cpassword = cpassword;
		}
	    
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	

	 
	

}
