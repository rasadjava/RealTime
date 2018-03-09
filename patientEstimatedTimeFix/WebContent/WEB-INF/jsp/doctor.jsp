<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${pageContext.request.contextPath}/resources/images/logo.png" rel="icon"/>
        <title>Online Hospital Management System</title>
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript">
                $(document).ready(function()
                {

                        $('#doctorlist').show();
                        $('.doctor li:first-child a').addClass('active');
                        $('.doctor li a').click(function(e){

                                var tabDiv=this.hash;
                                $('.doctor li a').removeClass('active');
                                $(this).addClass('.active');
                                $('.switchgroup').hide();
                                $(tabDiv).fadeIn();
                                e.preventDefault();

                        });


                });
        </script>
        <script type="text/javascript">
        
        
        $(document).ready(function()
                {
        
        	$(".doctor_update").click(function(){
        		
        		$("#doct_id").val($(this).parent().find("#doct_id_value").val());
        		$("#doct_name").val($(this).parent().find("#doct_name_value").val());
        		$("#dept_name").val($(this).parent().find("#dept_name_value").val());
        		$("#doct_time").val($(this).parent().find("#doct_time_value").val());

        		
        		//alert($(this).parent().find("#dept_name_value").val());
        	})
                });
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
                    <li class="dropdown dmenu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin <span class="caret"></span></a>
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
          
            <h1>Dashboard</h1>
                
                <ul class="nav nav-pills nav-stacked">
                  <li role="presentation"><a href="department">Department</a></li>
                  <li role="presentation"><a href="doctor">Doctors</a></li>
                  
                </ul>
        </div>
        <!---- Menu Ares Ends  -------->
<!---- Content Ares Start  -------->
    <div class="col-md-10 maincontent" >
    <!----------------   Menu Tab   --------------->
        <div class="panel panel-default contentinside">
                <div class="panel-heading">Manage Doctor</div>
                <!----------------   Panel body Start   --------------->
                <div class="panel-body">
                        <ul class="nav nav-tabs doctor">
                                <li role="presentation"><a href="#doctorlist">Doctor List</a></li>
                                <li role="presentation"><a href="#adddoctor">Add Doctor</a></li>
                        </ul>

    <!----------------   Display Doctor Data List Start  --------------->
    
 <sql:setDataSource
        var="deparmentlist"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/hospital"
        user="root" password="admin"
    />
     
    <sql:query var="listDepartments"   dataSource="${deparmentlist}">
        SELECT * FROM department;
    </sql:query>
     
    <sql:setDataSource
        var="dt"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/hospital"
        user="root" password="admin"
    />
     
    <sql:query var="listTimings"   dataSource="${dt}">
        SELECT * FROM timetable;
    </sql:query>
    
   
    
    
    
    
        <div id="doctorlist" class="switchgroup">
        <table class="table table-bordered table-hover">
                <tr class="active">
                        <td>Doctor ID</td>
                        <td>Doctor Name</td>
                        <td>Department</td>
                        <td>DoctorAvailblity</td>
                        
                </tr>
                
                    <c:forEach var="doctor" items="${doct}">
                <tr>
                    <td><c:out value="${doctor.doctorid}" /></td>
                    <td><c:out value="${doctor.doctorname}" /></td>
                    <td><c:out value="${doctor.departmentname}" /></td>
                     <td><c:out value="${doctor.doctortime}" /></td>

                   
                           <td>
                            <input type="hidden" value="${doctor.doctorid}" id="doct_id_value">
                          <input type="hidden" value="${doctor.doctorname}" id="doct_name_value">
                           <input type="hidden" value="${doctor.departmentname}" id="dept_name_value">
                          
                              <input type="hidden" value="${doctor.doctortime}" id="doct_time_value">
                          
                           
                           
						    <button type="button" class="btn btn-primary doctor_update" data-toggle="modal" data-target="#myModal">
						    <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button>
                            <a  href="deleteDoctor/${doctor.doctorid}" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true">
                            </span></a>
                            
						   </td>
                    </tr>
            </c:forEach>
                   
        </table>
        </div>
    <!----------------   Display Doctor Data List Ends  --------------->
   
    <!------ Doctor Edit Info Modal Start Here ---------->
                            
           
              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Doctor Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="doctor_update_action" method="post">
                             _
                                 <div class="form-group">
                    <label  class="col-sm-2 control-label">Doctor Id:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="doctorid" id="doct_id" placeholder="Doctor ID" readonly="readonly" required="required">
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">DoctorName</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="doctorname" id="doct_name" placeholder="Name" required="required">
                    </div>
                    </div>

                     <div class="form-group">
                    <label  class="col-sm-2 control-label">DepartmentName</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="departmentname" id="dept_name" required="required" readonly="readonly">
                    </div>
                    </div>
                                 
                   
                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Doctor Timings</label>
                        <div class="col-sm-10">

                        <select class="form-control" name="doctortime" id="doct_time">
                        <option value="-1">Select Doctor Timings</option>
                        <c:forEach var="doctor" items="${listTimings.rows}">
                
                        <option value="${doctor.timings}">${doctor.timings}</option>
                         </c:forEach>    
                        </select>
                        </div>
                    </div>
                
                                                                              
                                 <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input type="submit" class="btn btn-primary" value="Update">
                                 </div>
                            </form>
                             </div>
                         </div>
                         </div>
                    </div>
                 </div>
               </div>
<!----------------   Modal ends here  --------------->


    <!----------------   Add Doctor Start   --------------->
    <div id="adddoctor" class="switchgroup">
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-horizontal" action="doctor_action" method="post">
                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Doctor Id:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="doctorid" placeholder="Doctor ID" required="required">
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">DoctorName</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="doctorname" placeholder="Name" required="required">
                    </div>
                    </div>

                                 
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-10">

                        <select class="form-control" name="departmentname">
                        <option value="-1">Select Department</option>
                        
                   <c:forEach var="user" items="${listDepartments.rows}">
                
                   <%--  <c:out value="${user.departmentname}" /> --%>
                   <option value="${user.departmentname}">${user.departmentname}</option>
                     </c:forEach>
                                               
                        </select>
                        </div>
                    </div>
                    
                    
                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Doctor Timings</label>
                        <div class="col-sm-10">

                        <select class="form-control" name="doctortime">
                        <c:forEach var="doctor" items="${listTimings.rows}">
                
                        <option value="${doctor.timings}">${doctor.timings}</option>
                         </c:forEach>    
                        </select>
                        </div>
                    </div>
                
                    
                    


                    <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Add Doctor</button>
                          </div>
                    </div>
                </form>

               </div>
        </div>
    </div>
                           <!----------------   Add Doctor Ends   --------------->
                </div>
           <!----------------   Panel body Ends   --------------->
         </div>
    </div>
	</div>
</div>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	</body>
</html>