	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Online Hospital Management System</title>
        <!-- Bootstrap -->
        
		 
		<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
		 
		 <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" >
		 <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
		 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		<script>       
		$(function() {
    if (window.history && window.history.pushState) {
        window.history.pushState('', null, './');
        $(window).on('popstate', function() {
            // alert('Back button was pressed.');
            document.location.href = '#';

        });
    }
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
				  <a class="navbar-brand logo"  href="#">
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
					<div class="panel-heading logintitle">Login</div>
					
					<div class="panel-body">
                            <form class="form-horizontal center-block" role="form" action="signin_Action" method="post">
							
								<div class="input-group input-group-lg">
								  <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
								 
								 <select class="form-control" name="role" >
													<option selected="selected" value="userrole">Select User</option>
													  <option value="1">Admin</option>
													  <option value="2">SuperVisor</option>
													  <option value="3">Patient</option>
													  
								</select>
								
								</div>
								<br/>
                                                                <div>
                                                                    
                                                                </div>
								<div class="input-group input-group-lg">
								  <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></span>
								  <input type="text" class="form-control" name="username" placeholder="enter username" required aria-describedby="sizing-addon1">
								</div>
								
								<br/>
								<div class="input-group input-group-lg">
								  <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
								  <input type="password" name="password" class="form-control" placeholder="Password" required aria-describedby="sizing-addon1">
			 					</div>
								<br/>
								<div class="col-sm-7 col-sm-offset-2">
								  <button type="submit" class="btn btn-primary">Login</button>
								  <a href='signUp' class='btn btn-primary'>SignUp</a>
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
		 
    

    </body>
</html>