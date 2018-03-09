package com.in.c2n.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.in.c2n.model.Profile;



@Component
public class ProfileDAO {
@Autowired JdbcTemplate jdbcTemplate;


public int update_profile(Profile profile,HttpSession session){
	String sql="update users set name='"+profile.getName()+"' and email='"+profile.getEmail()+"' and address='"+profile.getAddress()+"' and phone='"+profile.getPhone()+"' where userid='"+session.getAttribute("username")+"";
	return jdbcTemplate.update(sql);
	
	
}


/*public int  update(Profile profile,HttpSession session) {
	String sql="update users set name='"+profile.getName()+"' and email='"+profile.getEmail()+"' and address='"+profile.getAddress()+"' and phone='"+profile.getPhone()+"' where userid='"+session.getAttribute("username")+"";
	return jdbcTemplate.update(sql);
	
	
}*/
	
@RequestMapping(value="/get_profile_fields")
public Profile get_profile_fields(HttpSession session){
	String sql="select name ,email, address,phone ,password from users where username='"+session.getAttribute("username")+"'";
 Profile profile=	jdbcTemplate.query(sql, new ResultSetExtractor<Profile>(){

		@Override
		public Profile extractData(ResultSet rs) throws SQLException, DataAccessException {
			rs.next();
			Profile profile= new Profile();
			profile.setName(rs.getString(1));
			profile.setEmail(rs.getString(2));
			profile.setAddress(rs.getString(3));
			profile.setPhone(rs.getString(4));
			profile.setPassword(rs.getString(5));;
			return profile;
		}
	
		
		
	});
	return profile;
}	
	
}
