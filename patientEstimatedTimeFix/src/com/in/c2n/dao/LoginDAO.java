package com.in.c2n.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;

import com.in.c2n.model.Login;

@Component
public class LoginDAO {
 @Autowired
 private JdbcTemplate jdbcTemplate;
 
 public Login validate(Login login){
	 String sql="select role, username,password from users where role="+login.getRole()+" and username='"+login.getUsername()+"' and password='"+login.getPassword()+"'";
	 return  jdbcTemplate.query(sql,new ResultSetExtractor<Login>(){ 
		 @Override
		 public Login extractData(ResultSet rs)throws SQLException,DataAccessException{
			 Login login=null;
			 
			 if(rs.next()){
				 System.out.println("username"+rs.getString(1));
				 System.out.println("password"+rs.getString(2));
				 login=new Login();
				 login.setRole(rs.getInt(1));
				 login.setUsername(rs.getString(2));
				 login.setPassword(rs.getString(3));
				 
			 }
			 return login;
		 }
		 
		 
	 });
	 
	 
 }
}
