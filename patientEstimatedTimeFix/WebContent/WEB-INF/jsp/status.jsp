<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<link
	href="${pageContext.request.contextPath}/resources/images/logo.png"
	rel="icon" />
<title>Online Hospital Management System</title>
<!-- Bootstrap -->

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style1.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script>
  
// $(document).ready(function(){
	
// 	$('#status_table tr').each(function(){
		
// 		//alert($(this).find('td:nth-child(2)').text()+"--"+$(this).find('td:nth-child(3)').text());
		
// 		var doctor=$(this).find('td:nth-child(2)').text();
// 		var deptname=$(this).find('td:nth-child(3)').text();
// 		var current_no=$(this).find('td:nth-child(5)');
// 		var time_value=$(this).find('td:nth-child(6)')
// 		$.ajax({
			
			
// 	        type : "POST",
// 			contentType : "application/json",
// 			url : "${pageContext.request.contextPath}/current_running_number",
// 			dataType : 'json',
// 			data:{ doctor:doctor,deptname:deptname},
			
// 			method:'GET',
			
			
			
// 			success : function(data) {
				
			
// 			 var minutes=10;
// 				$.each(data, function( index, value )
// 				 {  
// 					var slot_time=value.split(",");
// 					minutes=minutes+10;
// 					current_no.text(slot_time[0]); 
// 					var timeSample=parseInt(slot_time[1])+minutes;
// // 					time_value.text(minutes);
// 					console.log(value);
					
					
					
// 					 time_value.text(slot_time[1]);
					
//      			 });	 		        
	
// 			}
			
// 		});
		
		
		
// 	});
	
	
	
// });
  
  </script>


</head>
<body>
	<div class="container-fluid">

		<!--- Header Start -------->
		<div class="row header">

			<div class="col-md-10">
				<h2>Hospital Mangement System</h2>
			</div>

			<div class="col-md-2 ">
				<ul class="nav nav-pills ">
					<li class="dropdown dmenu"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">${sessionScope.username }<span
							class="caret"></span></a>
						<ul class="dropdown-menu ">
							<li><a href="profile">Change Profile</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="logout">Logout</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!--- Header Ends --------->

		<div class="row">

			<!----- Menu Area Start ------>
			<div class="col-md-2 menucontent">

				<h1>
					<a href="#">Dashboard</a>
				</h1>

				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="user_home">Home</a></li>

					<li role="presentation"><a href="appointment">Appointment</a></li>
					<li role="presentation"><a href="history">History</a></li>
					<li role="presentation"><a href="status">Status</a></li>
				</ul>
			</div>
			<!---- Menu Ares Ends  -------->
			<!---- Content Ares Start  -------->

			<div class="col-md-10 maincontent" id="appointment">
				<div class="panel panel-primary"
					style='margin-top: 5%; width: 80%; margin-left: auto; margin-right: auto'>
					<div class="panel-heading">Status</div>
					<div class="panel-body">
						<!-- History -->

						<div id="doctorlist" class="switchgroup">
							<table class="table table-bordered table-hover"
								style="width: 40%; margin: auto;">
								<tr class="active">
									<th>patientName</th>
									<th>Doctor</th>
									<th>Department</th>

									<th>Waiting Number</th>
									<th>Current Running No</th>
									<th>Estimated consult Time</th>
								</tr>
								<tbody id='status_table'>
									<c:forEach items="${appointment}" var="todaySataus">
										<c:set var="count" value="${count + 10}" scope="request"/>
										<tr>
											<td>${todaySataus.patientname}</td>
											<td>${todaySataus.doctorname}</td>
											<td>${todaySataus.departmentname}</td>
											<td>${todaySataus.waitingNumber}</td>
											<td>--</td>
											<td>${todaySataus.estimatedConsultTime}</td>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<!-- end  History -->





					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>