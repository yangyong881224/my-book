<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
	<head>
    	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>访问异常</title>		
		
		<!-- Favicon and touch icons -->
		<link rel="shortcut icon" href="<%= path%>/assets/ico/favicon.ico" type="image/x-icon" />

	    <!-- Css files -->
	    <link href="<%= path%>/assets/css/bootstrap.min.css" rel="stylesheet">		
		<link href="<%= path%>/assets/css/jquery.mmenu.css" rel="stylesheet">			
		<link href="<%= path%>/assets/css/font-awesome.min.css" rel="stylesheet">			  
	    <link href="<%= path%>/assets/css/style.min.css" rel="stylesheet">
		<link href="<%= path%>/assets/css/add-ons.min.css" rel="stylesheet">
		<style>
			footer {
				display: none;
			}
		</style>

	</head>
</head>

<body>
	<div class="container-fluid content">
		<div class="row">
			<div id="content" class="col-sm-12 full">
			
				<div class="row box-error">
				
					<div class="col-lg-12 col-md-12 col-xs-12">
					<div class="text-center">
						<h1>500</h1>
						<h2>Unauthorized ...</h2>
						<p>You need to login first to see this page.</p>
						<a href="javascript: history.go(-1)">
							<button class="btn btn-default"><span class="fa fa-chevron-left"> Go Back</span></button>
						</a>
						<a href="/">
							<button class="btn btn-default"><span class="fa fa-lock"> Login</span></button>
						</a>
						<a href="#">
							<button class="btn btn-default"><span class="fa fa-envelope"> Contact Admin</span></button>	
						</a>
					</div>
					
					</div><!--/col-->
				
				</div><!--/row-->
		
			</div><!--/content-->	
				
		</div><!--/row-->
		
		
		<div id="usage-blank">
			<ul>
				<li>
					<div class="title">Memory</div>
					<div class="bar">
						<div class="progress">
						  	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%"></div>
						</div>
					</div>			
					<div class="desc">2GB of 8GB</div>
				</li>
				<li>
					<div class="title">HDD</div>
					<div class="bar">
						<div class="progress">
						  	<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
						</div>
					</div>			
					<div class="desc">750GB of 1TB</div>
				</li>
				<li>
					<div class="title">SSD</div>
					<div class="bar">
						<div class="progress">
					  		<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%"></div>
						</div>
					</div>			
					<div class="desc">300GB of 1TB</div>
				</li>
				<li>
					<div class="title">Bandwidth</div>
					<div class="bar">
						<div class="progress">
					  		<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
						</div>
					</div>			
					<div class="desc">50TB of 50TB</div>
				</li>				
			</ul>	
		</div>			
		
	</div><!--/container-->
		
		
	<!-- start: JavaScript-->
	<!--[if !IE]>-->

			<script src="<%= path%>/assets/js/jquery-2.1.1.min.js"></script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script src="<%= path%>/assets/js/jquery-1.11.1.min.js"></script>
	
	<![endif]-->

	<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%= path%>/assets/js/jquery-2.1.1.min.js'>"+"<"+"/script>");
		</script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script type="text/javascript">
	 	window.jQuery || document.write("<script src='<%= path%>/assets/js/jquery-1.11.1.min.js'>"+"<"+"/script>");
		</script>
		
	<![endif]-->
	<script src="<%= path%>/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="<%= path%>/assets/js/bootstrap.min.js"></script>	
	
		
	<!-- theme scripts -->
	<script src="<%= path%>/assets/js/SmoothScroll.js"></script>
	<script src="<%= path%>/assets/js/jquery.mmenu.min.js"></script>
	<script src="<%= path%>/assets/js/core.min.js"></script>
		
	<!-- end: JavaScript-->
	
</body>
</html>