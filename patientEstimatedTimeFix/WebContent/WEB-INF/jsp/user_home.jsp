<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#Date" ).datepicker();
  } );
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
                  <li role="presentation"><a href="appointment">Appointment</a></li>
                  <li role="presentation"><a href="history">History</a></li>
                  <li role="presentation"><a href="status">Status</a></li>
                 
                 
                </ul>
        </div>
        <!---- Menu Ares Ends  -------->
        
        
        
        
        
        
        
        
        
        
        
        
<!---- Content Ares Start  -------->


    <div class="col-md-10 maincontent"  id="appointment">
    
     <div class="container" style="width:812px;">
  <h2>Welcome  ${sessionScope.username}</h2>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="${pageContext.request.contextPath}/resources/images/img1.jpg" alt="img1" style="width:100%;">
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/img2.jpg" alt="img2" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/img3.jpg" alt="img3" style="width:100%;">
      </div>
      
       <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/img4.jpg" alt="img4" style="width:100%;">
      </div>
      
       <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/img5.jpg" alt="img4" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
        
   </div>
    
        
    
	</div>
</div>
	

</body>
</html>