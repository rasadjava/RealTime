<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<link href="${pageContext.request.contextPath}/resources/images/logo.png" rel="icon"/>
        <title>Online Hospital Management System</title>
        <!-- Bootstrap -->
        
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/style1.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

          <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js">
  
          </script>
          
          <script type="text/javascript">
          $(document).ready(function(){
        	  
          $("body").on("click",".next_button",function(){
          		var currentObject=$(this)
          		var item=$(this).parent().parent().find("td:nth-child(4)").text();
          		
          		var doctorname=$(this).parent().parent().find("td:nth-child(1)").text();
          		var department=$(this).parent().parent().find("td:nth-child(2)").text();
          		var totalappointments=$(this).parent().parent().find("td:nth-child(3)").text();
          		var NextPatientName_SlotNo=$(this).parent().parent().find("td:nth-child(4)").text();
          		var currentPatient_SlotNo=$(this).parent().parent().find("td:nth-child(5)").text();
          		var intime=$(this).parent().parent().find("td:nth-child(6)").text();
          		//alert(doctorname+"--"+department);
          		
          		var NextPatientName_SlotNo_array=NextPatientName_SlotNo.split("/");
          		var currentPatient_SlotNo_array=currentPatient_SlotNo.split("/");
          		$.ajax(
          		{	context:this,
          			method:'POST',
          			url:"${pageContext.request.contextPath}/get_next_patient",
          			data:{
          				doctorname:doctorname,
          				department:department,
          				totalappointments:totalappointments,
          				nextPatentname:NextPatientName_SlotNo_array[0],
          				next_slot_no:NextPatientName_SlotNo_array[1],
          				currentPatient:currentPatient_SlotNo_array[0],
          				current_slot_no:currentPatient_SlotNo_array[1],
          				intime:intime
          			
          				},
          			success:function(data){
          				//alert(data);
          				var data_array=data.split("&");
          				if(data_array[0]=="-/0"){
          					
          					$(this).attr('disabled',true);
          				}
          				$(this).parent().parent().find("td:nth-child(5)").text(item);
          				$(this).parent().parent().find("td:nth-child(4)").text(data_array[0]);
          				$(this).parent().parent().find("td:nth-child(6)").text(data_array[1])
          				
          			}
          			
          			
          		}		
          		
          		)
          		
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
                
                   <li role="presentation"><a href="TodayAppointment">TodayAppointments</a></li>
                 
                </ul>
        </div>
        <!---- Menu Ares Ends  -------->
<!---- Content Ares Start  -------->

<div class="col-md-10 maincontent"  id="appointment">
     <div class="panel panel-primary" style='margin-top:5%;width:80%;margin-left: auto;margin-right: auto'>
      <div class="panel-heading">History</div>
      <div class="panel-body">
      <!-- History -->
    
     <div id="doctorlist" class="switchgroup">
        <table class="table table-bordered table-hover" style="width:60%; margin: auto;" >
        <tr class="active">
                        <th>Doctor</th>
                        <th>Department</th>
                        <th>Total Appointments</th>
                        <th>NextPatientName/SlotNo</th>
                        <th>patientName/CurrentNumber</th>
                        <th>In Time</th>
                        
                        <th>Action</th>
                </tr>
                <c:forEach items="${patient_today_appointments}" var="toDaysAppointments"> 
                <tr>
                    <td>${toDaysAppointments.doctorname}</td>
                    <td>${toDaysAppointments.department}</td>
                    <td>${toDaysAppointments.totalAppointments}</td>
                     <td>${toDaysAppointments.nextPatient}/${toDaysAppointments.next_patient_slot_number}</td>
                    <td>${toDaysAppointments.currentPatient}/${toDaysAppointments.current_patient_slot_no}</td>
                    <td>${toDaysAppointments.intime}</td>
                   
                    <td><c:if test="${toDaysAppointments.next_patient_slot_number==0}">
 						<button class='btn btn-primary next_button' disabled="disabled">next</button>
					</c:if>
					
					<c:if test="${toDaysAppointments.next_patient_slot_number!=0}">
 						<button class='btn btn-primary next_button'>next</button>
					</c:if>
					
					</td>
             </tr>
             </c:forEach>
        
        
                
                
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