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
        
        	$(".department_update").click(function(){
        		
        		$("#departmentid").val($(this).parent().find("#dept_name_value").val());
        		//alert($(this).parent().find("#dept_name").val());
        		$("#departmentname").val($(this).parent().find("#dept_name").val());
        		
        		
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
          
          <h1><a href="#">Dashboard</a></h1>
                
                <ul class="nav nav-pills nav-stacked">
                  <li role="presentation"><a href="department">Department</a></li>
                  <li role="presentation"><a href="doctor">Doctors</a></li>
		                   </ul>
        </div>
        <!---- Menu Ares Ends  -------->
        
<!-------   Content Area start  --------->
<div class="col-md-10 maincontent" >

    <!-----------  Content Menu Tab Start   ------------>
    <div class="panel panel-default contentinside">
        <div class="panel-heading">Manage Department</div>

        <!----------------   Panel Body Start   --------------->
        <div class="panel-body">
            <ul class="nav nav-tabs doctor">
                    <li role="presentation"><a href="#doctorlist">Department List</a></li>
                    <li role="presentation"><a href="#adddoctor">Add Department</a></li>
            </ul>

            <!----------------   Display Department Data List start   --------------->
           
               
               
               
               
               
               <div id="doctorlist" class="switchgroup">
                   <table class="table table-bordered table-hover">
                   <tr class="active">
                           <td>Department ID</td>
                           <td>Department Name</td>
                           <td></td>
                   </tr>
                   
                   
                   <c:forEach var="dept" items="${list}">  
                <tr>
                    <td><c:out value="${dept.departmentid}" /></td>
                    <td><c:out value="${dept.departmentname}" /></td>
                    
             
                   
                           <td>
                           <input type="hidden" value="${dept.departmentid}" id="dept_name_value" class="dept_id">
                          <input type="hidden" value="${dept.departmentname}" id="dept_name" class="dept">

						  <button type="button"  class="btn btn-primary department_update" data-toggle="modal"   id="${dept.departmentid}" data-target="#myModal" onclick="vali()">
						    <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button>
                            <a  href="deleteDepartment/${dept.departmentid}" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true">
                            </span></a>
                            
						   </td>
                    </tr>
            </c:forEach>
           
                  </table>
               </div>  
              <!----------------   Display Department Data List ends   --------------->
              
              <!------ Edit Department Modal Start ---------->
                            
             
              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
            
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Department Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal"  method="post"  action="department_update" >
                                    
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">Department ID</label>
                                    <div class="col-sm-4">
                                        <input type="number" class="form-control" id='departmentid' name="departmentid" readonly="readonly" >
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">Department Name</label>
                                    <div class="col-sm-4">
                                      <input type="text" class="form-control" id="departmentname" name="departmentname" >
                                    </div>
                                 </div>

                                 
                                 <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Update</button>
                                 </div>
                            </form>
      </div>
                         </div>
                         </div>
                    </div>
                 </div>
               </div>
<!----------------   Modal ends here  --------------->

        
              
              
              <!----------------   Add Department Start   --------------->
               <div id="adddoctor" class="switchgroup">
                   <div class="panel panel-default">
                       <div class="panel-body">
                           <form class="form-horizontal"  method="post"  action="department_action">

                            <div class="form-group">
                                <label  class="col-sm-4 control-label">Department ID</label>
                                <div class="col-sm-4">
                                  <input type="number" class="form-control" name="departmentid" placeholder="Enter Department id">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-4 control-label">Department Name</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" name="departmentname" placeholder="Enter Department Name">
                                </div>
                             </div>

                           


                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-10">
                                  <button type="submit" class="btn btn-primary">Add Department</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    </div>
                </div>
                   <!----------------   Add Department Ends   --------------->
        </div>
        <!----------------   Panel Body Ends   --------------->
    </div>
    <!-----------  Content Menu Tab Ends   ------------>
</div>
<!-------   Content Area Ends  --------->
        </div>
        </div>
        
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    </body>
</html>
