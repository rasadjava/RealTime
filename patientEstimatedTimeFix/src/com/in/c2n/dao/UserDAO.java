package com.in.c2n.dao;

import org.springframework.jdbc.core.JdbcTemplate;

import com.in.c2n.model.Users;

public class UserDAO {
	
	private JdbcTemplate jdbcTemplate;
	

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}


	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


	public int insert(Users user){
	String sql="insert into users (`username`,`name`,`email`,`password`,`address`,`phone`,`role`) VALUES('"+user.getUsername()+"','"+user.getName()+"','"+user.getEmail()+"','"+user.getPassword()+"' ,'"+user.getAddress()+"',"+user.getPhone()+",3) ";
	System.out.println(sql);
	return	jdbcTemplate.update(sql);
		
	}
}
