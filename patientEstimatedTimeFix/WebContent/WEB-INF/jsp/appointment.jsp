<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/images/logo.png" rel="icon"/>
        <title>Online Hospital Management System</title>
        <!-- Bootstrap -->
        
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <style>
    .error {
        color: red; font-weight: bold;
    }
</style>
        
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
	$(document).ready(function() {
	$("#date").change(function() {
		
		$.ajax({
			
			method:'POST',
			
			url : "${pageContext.request.contextPath}/check_for_previous_registration",
			
			data :{
				patientName:$("#patientName").val(),
				department : $("#department_name option:selected").val(),
				date	   : $("#date").val()
				},
			
			success:function(data){
			 //alert(data);
				if(data==1){
					
					alert("patient already booked a slot on selected date");
					 
				}else{
					
					
					$.ajax({
				        type : "POST",
						contentType : "application/json",
						url : "${pageContext.request.contextPath}/doctor_names",
						data:{ date: $("#date").val(),deptname:$("#department_name option:selected").val()},
						
						method:'GET',
						dataType : 'json',
						timeout : 100000,
						
						success : function(data) {
						console.log("SUCCESS:", data); 
						 var row="<option  value='-1'>--select--</option>";	
				$.each(data, function( index, value ) {
	              row =row +"<option value='"+value.doctorid+":"+value.doctorname+"'>" + value.doctorname + "</option>";
	              });	 		        
				$("#request_doctor").html(row);
						},
						error : function(e) {
							console.log("ERROR: ", e);
						
						},
						done : function(e) {
							console.log("DONE");
						}
					});
					
					
					
					
					
				}
				
				
				
				
				
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			}
			
			
			
		});
		
		
		
		
		
			 
			 
			  }); 	 
			 
			 
 	});
</script>
 
 
 <script>
	$(document).ready(function() { 
	
			 $("#request_doctor").change(function() {
				 
				 $.ajax({
				        type : "POST",
						contentType : "application/json",
						url : "${pageContext.request.contextPath}/department_time",
						data:{ doctorname: $(this).find("option:selected").val(),departmentname:$('#department_name option:selected').val()},
						
						method:'GET',
						dataType : 'json',
						timeout : 100000,
						success : function(data) {
						console.log("SUCCESS:", data); 
						var row="<option  value='-1'>--select--</option>";	
				$.each(data, function( index, value ) {
	              row =row +"<option  value='"+value.doctortime+"'>"+ value.doctortime+"</option>";

	              });				        
				$("#timings").html(row);
						},
						error : function(e) {
							console.log("ERROR: ", e);
							display(e);
						},
						done : function(e) {
							console.log("DONE");
						}
					});
				 

					});
			 
			 
			 
			
			 
 	});
</script>
  
  
   
</head>
<body>
  <div class="container-fluid">
            
        <!--- Header Start -------->
        <div class="row header">

            <div class="col-md-10">
                    <h2 >Hospital Mangement System</h2>
            </div>

            <div class="col-md-2 ">
                <ul class="nav nav-pills ">
                    <li class="dropdown dmenu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.username }<span class="caret"></span></a>
                            <ul class="dropdown-menu ">
                                <li><a href="profile">Change Profile</a></li>
                                <li role="separator" class="divider"></li>
                                 <li><a href="logout">Logout</a></li>
                            </ul>
                     </li>
                </ul>
            </div>
        </div>
	<!--- Header Ends --------->
       
        <div class="row">
		
        <!----- Menu Area Start ------>
        <div class="col-md-2 menucontent">
          
           <h1> <a href="#">Dashboard</a></h1>
                
                <ul class="nav nav-pills nav-stacked">
                   <li role="presentation"><a href="user_home">Home</a></li>
                
                  <li role="presentation"><a href="appointment">Appointment</a></li>
                  <li role="presentation"><a href="history">History</a></li>
                  <li role="presentation"><a href="status">Status</a></li>
                 
                 
                </ul>
        </div>
        <!---- Menu Ares Ends  -------->
        
        
        
        
        
        
        
        
        
        
        
        
<!---- Content Ares Start  -------->


    <div class="col-md-10 maincontent"  id="appointment">
        <div class="panel panel-primary" style='margin-top:5%;margin-left: auto;margin-right:auto;width:50%;'>
      <div class="panel-heading">Appointment</div>
      <div class="panel-body">
      <form action="appointment_action" method="post">
      
      <div class='form-group'>
      <label>Patient Name</label>
      <input type="text" name="patientname" required="required" class='form-control' id='patientName'>
      </div>
      
      
      
      
      <div class='form-group'>
      <label>Department</label>
      
       <select class="form-control" required="required" name="departmentname" id="department_name" >
                       
                       <option value="">select</option>
                       <c:forEach var="dept" items="${list}">  
                
                        <option value="${dept.departmentname}">${dept.departmentname}</option>
                         </c:forEach>    
                        </select>
      
     
      </div>
      
       <div class='form-group'>
      <label>Date</label>
      <input type="date" name="bookingdate"  required="required" class='form-control' id='date'>
      </div>
      
      <div class='form-group' >
      <label>Doctor</label>
      <select class="form-control"  required="required"  name="doctorname" id="request_doctor">
       
      
     
    <option value="-1">--Select--</option>
	  
	  </select>  
	   </div>
      
     
      
      <div class='form-group'>
      <label>MobileNumber</label>
      <input type="text" name="mobilenumber"  required="required"  class='form-control' id='mobilenumber'>
      <form:errors path="profile.mobilenumber"  cssClass="error"/>
      </div>
      
       <div class='form-group'>
      <label>Gender</label>
      <select class="form-control"  required="required"  name="gender" id="gender">
	  <option value=""></option>
	  <option value="-1">--Select--</option>
	  <option value="male">Male</option>
	  <option value="female">Female</option>
	  </select>    
	   </div>
      
      
      <div class='form-group'>
      <label>Timings</label>
	 <select class="form-control" required="required"  name="timings" id="timings">
	 <option value=""></option>
	 <option value="-1">--Select--</option>
	 
	 </select>
      </div>
      
      <div class='form-group'>
      
      <input type="submit"   class='btn btn-primary' id='btn_submit'>
      </div>
      
      
      
      </form>
      
      </div>
    </div>
    
    
    </div>
    
        
    
	</div>
</div>
	

</body>
</html>