package com.in.c2n.dao;



import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.in.c2n.model.Department;



	public class DepartmentDAO {
	
		
		private  JdbcTemplate jdbcTemplate;
		

		public JdbcTemplate getJdbcTemplate() {
			return jdbcTemplate;
		}


		public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
			this.jdbcTemplate = jdbcTemplate;
		}


	public int insert(Department dept){
		String sql="insert into department (`departmentid`,`departmentname`) VALUES('"+dept.getDepartmentid()+"','"+dept.getDepartmentname()+"') ";
		System.out.println(sql);
		return	jdbcTemplate.update(sql);
			
		}
		
		public int update(Department dept){
			String sqlquery="update department set departmentname='"+dept.getDepartmentname()+"'  where departmentid='"+dept.getDepartmentid()+"'";
			System.out.println(sqlquery);
			return jdbcTemplate.update(sqlquery);
		}


		public int delete(int departmentid) {
			String sql="delete from department where departmentid='"+departmentid+"'";
			return jdbcTemplate.update(sql);
		}

		
		
		
		public List<Department> getDepartments(){  
		    return jdbcTemplate.query("select * from department", new RowMapper<Department>(){
		        public Department mapRow(ResultSet rs, int row) throws SQLException {  
		            Department department=new Department();  
		            department.setDepartmentid(rs.getInt(1));  
		            department.setDepartmentname(rs.getString(2));  
		            
		            return department;  
		        }  
		    });  
		}  
		
			}

