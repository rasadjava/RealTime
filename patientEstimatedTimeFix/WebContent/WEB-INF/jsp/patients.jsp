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
                  <li role="presentation"><a href="patients">Patients</a></li>
                  
                </ul>
        </div>
        <!---- Menu Ares Ends  -------->
				<!---- Content Ares Start  -------->
				<div class="col-md-10 maincontent" >
			<!----------------   Menu Tab   --------------->
					
							<div class="panel panel-default contentinside">
								<div class="panel-heading">Manage Patient</div>
								<!----------------   Panel body Start   --------------->
								<div class="panel-body">
									<ul class="nav nav-tabs doctor">
										<li role="presentation"><a href="#doctorlist">Patient List</a></li>
										<li role="presentation"><a href="#adddoctor">Add Patient</a></li>
									</ul>
							
						
										<!----------------   Display Patients Data List Start  --------------->
										<div id="doctorlist" class="switchgroup">
											<table class="table table-bordered table-hover">
												<tr class="active">
													<td>#</td>
													<td>Patient Name</td>
													<td>Age</td>
													<td>Sex</td>
                                                    <td>Blood Grp</td>
                                                    <td>Birth Date</td>
													<td>Options</td>
													
												</tr>
												<tr>
													<td>1</td>
													<td>abc</td>
													<td>23</td>
													<td>male</td>
                                                    <td>B<sup>+</sup></td>
                                                    <td>12-9-2013</td>
													<td>
													<a  href="#" class="btn btn-primary"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></a>
													<a  href="#" class="btn btn-danger"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
													</td>
												</tr>
												
											</table>
										</div>
										<!----------------   Display Patient Data List Ends  --------------->
								
										<!----------------   Add Patient Start   --------------->
										<div id="adddoctor" class="switchgroup">
											<div class="panel panel-default">
												<div class="panel-body">
													<form class="form-horizontal" action="#">
                                                        <div class="form-group">
															<label  class="col-sm-2 control-label">Patient Id:</label>
															 <div class="col-sm-10">
                                                                <input type="number" class="form-control" name="patientid" placeholder="unique_id">
															</div>
												        </div>
                                                                                                            
															<div class="form-group">
															<label  class="col-sm-2 control-label">Name</label>
															<div class="col-sm-10">
                                                                <input type="text" class="form-control" name="patientname" placeholder="Name">
															</div>
												            </div>
															
														  <div class="form-group">
															<label class="col-sm-2 control-label">Email</label>
															<div class="col-sm-10">
															  <input type="email" class="form-control" name="email" placeholder="Email">
															</div>
														  </div>
														  
														  <div class="form-group">
															<label class="col-sm-2 control-label">Password</label>
															<div class="col-sm-10">
															  <input type="password" class="form-control" name="pwd" placeholder="Password">
															</div>
														  </div>
														  
														  <div class="form-group">
															<label  class="col-sm-2 control-label">Address</label>
															<div class="col-sm-10">
															  <input type="text" class="form-control" name="add" placeholder="Address">
															</div>
															</div>
															
															 <div class="form-group">
															<label  class="col-sm-2 control-label">Phone</label>
															<div class="col-sm-10">
															  <input type="text" class="form-control" name="phon" placeholder="Phone No.">
															</div>
															</div>
                                                            <div class="form-group">    
                                                                <label class="col-sm-2 control-label">Sex</label>
                                                                <div class="col-sm-2">
                                                            <select class="form-control">
                                                                  <option>Male</option>
                                                                  <option>Female</option>
                                                                  </select>
                                                                    </div>
                                                            </div>
                                                        <div class="form-group">
															<label  class="col-sm-2 control-label">Birth Date</label>
															<div class="col-sm-10">
															  <input type="text" class="form-control" name="bdate" placeholder="Birth date">
															</div>
															</div>
                                                        <div class="form-group">
															<label  class="col-sm-2 control-label">Age</label>
															<div class="col-sm-10">
															  <input type="text" class="form-control" name="age" placeholder="Age">
															</div>
															</div>
                                                        <div class="form-group">    
                                                                <label class="col-sm-2 control-label">Blood Group</label>
                                                                <div class="col-sm-2">
                                                            <select class="form-control">
                                                                  <option value="-1">-----Select-----</option>
	                            <option value="A+">A+</option>
	                            <option value="A-">A-</option>
	                            <option value="A1+">A1+</option>
	                            <option value="A1-">A1-</option>
	                            <option value="A1B+">A1B+</option>
	                            <option value="A1B-">A1B-</option>
	                              <option value="A2+">A2+</option>
	                               <option value="A2-">A2-</option>
	                           <option value="A2B+">A2B+</option>
	                           <option value="A2B-">A2B-</option>
	                            <option value="AB+">AB+</option>
	                            <option value="AB-">AB-</option>
	                             <option value="B+">B+</option>
	                               <option value="B-">B-</option>
	                           <option value="Bombay Blood Group">Bombay Blood Group</option>
	                                  <option value="INRA">INRA</option>
	                           <option value="O+">O+</option>
	                           <option value="O-">O-</option>
                                                                  </select>
                                                                    </div>
                                                            </div>
										
                                                               
															
														 
														  <div class="form-group">
															<div class="col-sm-offset-2 col-sm-10">
															  <button type="submit" class="btn btn-primary">Add Patient</button>
															</div>
														  </div>
													</form>
												
												 </div>
											</div>
										</div>
										<!----------------   Add Patients Ends   --------------->
								</div>
								<!----------------   Panel body Ends   --------------->
							</div>
				</div>
			</div>
	</div>
				
				
				
		
	</body>
</html>