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
	    <title>Proton - Admin Template</title>		

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
						<h1>404</h1>
						<h2>您呼叫的页面跑丢了......</h2>
						<p>请尝试以下操作</p>
						<a href="javascript: history.go(-1)">
							<button class="btn btn-default"><span class="fa fa-chevron-left"> 返回</span></button>
						</a>
						<a href="page-login.html">
							<button class="btn btn-default"><span class="fa fa-lock"> 登录</span></button>
						</a>
						<a href="#">
							<button class="btn btn-default"><span class="fa fa-envelope"> 去死</span></button>
						</a>
					</div>
					
					</div><!--/col-->
				
				</div><!--/row-->
		
			</div><!--/content-->	
				
		</div><!--/row-->
		
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