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
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        
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

                        
                        $('#profile_update_form')
                		.each(function(){
                			$(this).data('serialized', $(this).serialize())
                		})
                        .on('change input', function(){
                            $(this)				
                                .find('input:submit, button:submit')
                                    .attr('disabled', $(this).serialize() == $(this).data('serialized'))
                            ;
                         })
                		.find('input:submit, button:submit')
                			.attr('disabled', true)
                	;    
                        
                        

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
          
            <h1><a href="#">Dashboard</a></h1>
                
                 <ul class="nav nav-pills nav-stacked">
                  <li role="presentation"><a href="#appointment">Appointment</a></li>
                  <li role="presentation"><a href="history">History</a></li>
                  <li role="presentation"><a href="user_status.jsp">Status</a></li>
                 
                 
                </ul>
        </div>
        <!---- Menu Ares Ends  -------->
       
<!---- Content Ares Start  -------->
    <div class="col-md-10 maincontent" >
    
    <!----------------   Menu Tab   --------------->
    <div class="panel panel-default contentinside">
        <div class="panel-heading">Manage Profile</div>
        <!----------------   Panel body Start   --------------->
            <div class="panel-body">
                <form class="form-horizontal" id='profile_update_form' action="user_update">
                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Name</label>
                            <div class="col-sm-10">
                            <input type="text" class="form-control" name="name" value='${profile.name}' placeholder="Name">
                            </div>
                    </div>
                    <div class="form-group">
                            <label class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                              <input type="email" class="form-control" value='${profile.email}' name="email" placeholder="Email">
                            </div>
                     </div>
                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Address</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" value='${profile.address}' name="address" placeholder="Address">
                            </div>
                    </div>
                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Phone</label>
                            <div class="col-sm-10">
                              <input type="text" class="form-control" value='${profile.phone}' name="phone" placeholder="Phone No.">
                            </div>
                    </div>
                    <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary">Update Profile</button>
                            </div>
                    </div>
                </form>															
            </div>
                        <!----------------   Panel body Ends   --------------->
    </div>
							
    <div class="panel panel-default contentinside">
        <div class="panel-heading">Change Password</div>
        <!----------------   Panel body Start   --------------->
        <div class="panel-body">
            <form class="form-horizontal" action="#">
                <div class="form-group">
                       <label class="col-sm-2 control-label">Password</label>
                       <div class="col-sm-10">
                       <input type="password" class="form-control" name="password"  placeholder="Current Password">
                       </div>
                </div>
                <div class="form-group">
                       <label class="col-sm-2 control-label">New Password</label>
                       <div class="col-sm-10">
                       <input type="password" class="form-control" name="newpwd" placeholder="Enter New Password">
                       </div>
                </div>
                <div class="form-group">
                       <label class="col-sm-2 control-label">Confirm New Password</label>
                       <div class="col-sm-10">
                       <input type="password" class="form-control" name="conpwd" placeholder="Confirm New Password">
                       </div>
                </div>
                <div class="form-group">
                       <div class="col-sm-offset-2 col-sm-10">
                       <button type="submit" class="btn btn-primary">Update Password</button>
                       </div>
               </div>
            </form>
        </div>
        <!----------------   Panel body Ends   --------------->
    </div>
    </div>
            
    </div>
</div>
    </body>
</html>