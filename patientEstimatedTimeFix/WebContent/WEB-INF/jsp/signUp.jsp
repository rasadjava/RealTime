<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

 <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" >
		 <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
		 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<style>
    .error {
        color: red; font-weight: bold;
    }
</style>
<script type="text/javascript">
$(document).ready(function(){
$("#profile_submit").click(function(){
	
	var pass=$("#password").val();
	var cpass=$("#cpassword").val();
	if(pass!=cpass){
		alert("password not match with confirm password");
		return false;
	}
	})	
});

</script>
		       
</head>
<body>
<div class="container-fluid">
		<!--- Header --------------------------->
		<div class="row navbar-fixed-top">
			<nav class="navbar navbar-default header">
			<div class="container-fluid">
				<div class="navbar-header">
				  <a class="navbar-brand logo" href="#">
					<img alt="Brand" src="${pageContext.request.contextPath}/resources/images/logo.png">
				  </a>
				  <div class="navbar-text title"><p>Hospital Management System<p></div>
				</div>
			</div>
			</nav>
		</div>
		<!--- Header Ends Here --------------------------->
		
		<div class="row ">
			<div class="col-md-12">
				<div class="panel panel-default login">
					<div class="panel-heading logintitle">SignUp</div>
					
					<div class="panel-body">
				
					
                <form class="form-horizontal" action="signUp_Action" method="post">
                    <div class="form-group">
                            <label  class="col-sm-2 control-label">UserName</label>
                            <div class="col-sm-10">
                            <input type="text" class="form-control" name="username" placeholder="Name">
                            <form:errors path="user.username"  cssClass="error"/>
                            </div>
                    </div>
                    <div class="form-group">
                            <label  class="col-sm-2 control-label">FullName</label>
                            <div class="col-sm-10">
                            <input type="text" class="form-control" name="name" placeholder="Name">
                            <form:errors path="user.name"  cssClass="error"/>
                            </div>
                    </div>
                    <div class="form-group">
                            <label class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" name="email" placeholder="Email">
                               <form:errors path="user.email"  cssClass="error"/>
                              
                            </div>
                     </div>
                     <div class="form-group">
                            <label  class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                              <input type="password" class="form-control"  id="password" name="password" placeholder="Password">
                            <form:errors path="user.password"  cssClass="error"/>
                            </div>
                    </div>
                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Re-Password</label>
                            <div class="col-sm-10">
                              <input type="password" class="form-control" id="cpassword" name="cpassword" placeholder="confirm password">
                           <form:errors path="user.cpassword"  cssClass="error"/>
                            </div>
                    </div>
                     
                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Address</label>
                            <div class="col-sm-10">
                            <textarea rows="4" cols="5" class="form-control" name="address" placeholder="Address" ></textarea>
                            
                          <form:errors path="user.address"  cssClass="error"/>
                            
                            </div>
                    </div>
                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Phone</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" name="phone" placeholder="Phone No.">
                            <form:errors path="user.phone"  cssClass="error"/>
                            </div>
                    </div>
                    <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary" id="profile_submit">Submit</button>
                            </div>
                    </div>
                </form>															
          
					</div>
						
				</div>
			</div>				
		</div>
		
		
		<div class="row footer navbar-fixed-bottom">
			<div class="col-md-12">
				
				<p>Copyrights © Hospital Management System 2017. All rights reserved. </p>
			</div>
		</div>
		
		
		
	
		<!--- Footer ---------------------------
		<div class="row marginreset">
			<div class="col-md-12 footer" >
				<p class="developer">Designed and Developed By # Anshul Parekh & Dharmesh Nakum #</p>
				<p>Copyrights © Hospital Management System 2017. All rights reserved. </p>
				
			</div>
			
		</div>
		
		<!--- Footer Ends Here --------------------------->
	</div>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>