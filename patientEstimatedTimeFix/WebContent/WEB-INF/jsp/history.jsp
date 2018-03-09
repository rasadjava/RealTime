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

          <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  
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
     <div class="panel panel-primary" style='margin-top:5%;width:80%;margin-left: auto;margin-right: auto'>
      <div class="panel-heading">History</div>
      <div class="panel-body">
      <!-- History -->
    
     <div id="doctorlist" class="switchgroup">
        <table class="table table-bordered table-hover" style="width:60%; margin: auto;" >
        <tr class="active">
                        <td>Patient Name</td>
                        <td>Phone No</td>
                        <td>Date of Visit</td>
                        <td>Doctor</td>
                        <td>Department</td>
                </tr>
                   <c:forEach var="history" items="${histroy_list}">  
                <tr>
                    <td><c:out value="${history.patientname}" /></td>
                    <td><c:out value="${history.phonenumber}" /></td>
                    <td><c:out value="${history.dateofvisit}" /></td>
                    <td><c:out value="${history.doctorname}" /></td>
                    <td><c:out value="${history.department}" /></td>
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