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
	    <title>添加习题</title>

		<!-- Favicon and touch icons -->
		<link rel="shortcut icon" href="<%= path%>/assets/ico/favicon.ico" type="image/x-icon" />

	    <!-- Css files -->
	    <link href="<%= path%>/assets/css/bootstrap.min.css" rel="stylesheet">		
		<link href="<%= path%>/assets/css/jquery.mmenu.css" rel="stylesheet">		
		<link href="<%= path%>/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="<%= path%>/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
	    <link href="<%= path%>/assets/css/style.min.css" rel="stylesheet">
		<link href="<%= path%>/assets/css/add-ons.min.css" rel="stylesheet">
	</head>

<body>
	<!-- start: Header -->
	<div class="navbar" role="navigation">
	
		<div class="container-fluid">		
			
			<ul class="nav navbar-nav navbar-actions navbar-left">
				<li class="visible-md visible-lg"><a href="table.html#" id="main-menu-toggle"><i class="fa fa-th-large"></i></a></li>
				<li class="visible-xs visible-sm"><a href="table.html#" id="sidebar-menu"><i class="fa fa-navicon"></i></a></li>			
			</ul>
			
			<form class="navbar-form navbar-left">
				<button type="submit" class="fa fa-search"></button>
				<a><input type="text" class="form-control" placeholder="Search..."></a>
			</form>
			
	        <ul class="nav navbar-nav navbar-right">
				<li class="dropdown visible-md visible-lg">
	        		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope-o"></i><span class="badge">5</span></a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header">
							<strong>Messages</strong>
							<div class="progress thin">
							  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
							    <span class="sr-only">30% Complete (success)</span>
							  </div>
							</div>
						</li>
						<li class="avatar">
							<a href="page-inbox.html">
								<img class="avatar" src="<%= path%>/assets/img/avatar1.jpg">
								<div>New message</div>
								<small>1 minute ago</small>
								<span class="label label-info">NEW</span>
							</a>
						</li>
						<li class="avatar">
							<a href="page-inbox.html">
								<img class="avatar" src="<%= path%>/assets/img/avatar2.jpg">
								<div>New message</div>
								<small>3 minute ago</small>
								<span class="label label-info">NEW</span>
							</a>
						</li>
						<li class="avatar">
							<a href="page-inbox.html">
								<img class="avatar" src="<%= path%>/assets/img/avatar3.jpg">
								<div>New message</div>
								<small>4 minute ago</small>
								<span class="label label-info">NEW</span>
							</a>
						</li>
						<li class="avatar">
							<a href="page-inbox.html">
								<img class="avatar" src="<%= path%>/assets/img/avatar4.jpg">
								<div>New message</div>
								<small>30 minute ago</small>
							</a>
						</li>
						<li class="avatar">
							<a href="page-inbox.html">
								<img class="avatar" src="<%= path%>/assets/img/avatar5.jpg">
								<div>New message</div>
								<small>1 hours ago</small>
							</a>
						</li>						
						<li class="dropdown-menu-footer text-center">
							<a href="page-inbox.html">View all messages</a>
						</li>	
	        		</ul>
	      		</li>
				<li class="dropdown visible-md visible-lg">
	        		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell-o"></i><span class="badge">3</span></a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header">
							<strong>Notifications</strong>
							<div class="progress thin">
							  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
							    <span class="sr-only">30% Complete (success)</span>
							  </div>
							</div>
						</li>							
                        <li class="clearfix">
							<i class="fa fa-comment"></i> 
                            <a href="page-activity.html" class="notification-user"> Sharon Rose </a> 
                            <span class="notification-action"> replied to your </span> 
                            <a href="page-activity.html" class="notification-link"> comment</a>
                        </li>
                        <li class="clearfix">
                            <i class="fa fa-pencil"></i> 
                            <a href="page-activity.html" class="notification-user"> Nadine </a> 
                            <span class="notification-action"> just write a </span> 
                            <a href="page-activity.html" class="notification-link"> post</a>
                        </li>
                        <li class="clearfix">
                            <i class="fa fa-trash-o"></i> 
                            <a href="page-activity.html" class="notification-user"> Lorenzo </a> 
                            <span class="notification-action"> just remove <a href="#" class="notification-link"> 12 files</a></span> 
                        </li>                        
						<li class="dropdown-menu-footer text-center">
							<a href="page-activity.html">View all notification</a>
						</li>
	        		</ul>
	      		</li>
				<li class="dropdown visible-md visible-lg">
					 <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-gears"></i></a>					
					<ul class="dropdown-menu update-menu" role="menu">
						<li><a href="#"><i class="fa fa-database"></i> Database </a>
                        </li>
                        <li><a href="#"><i class="fa fa-bar-chart-o"></i> Connection </a>
                        </li>
                        <li><a href="#"><i class="fa fa-bell"></i> Notification </a>
                        </li>
                        <li><a href="#"><i class="fa fa-envelope"></i> Message </a>
                        </li>
                        <li><a href="#"><i class="fa fa-flash"></i> Traffic </a>
                        </li>
						<li><a href="#"><i class="fa fa-credit-card"></i> Invoices </a>
                        </li>
                        <li><a href="#"><i class="fa fa-dollar"></i> Finances </a>
                        </li>
                        <li><a href="#"><i class="fa fa-thumbs-o-up"></i> Orders </a>
                        </li>
						<li><a href="#"><i class="fa fa-folder"></i> Directories </a>
                        </li>
                        <li><a href="#"><i class="fa fa-users"></i> Users </a>
                        </li>		
					</ul>
				</li>
				<li class="dropdown visible-md visible-lg">
	        		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img class="user-avatar" src="<%= path%>/assets/img/avatar.jpg" alt="user-mail">jhonsmith@mail.com</a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header">
							<strong>Account</strong>
						</li>						
						<li><a href="page-profile.html"><i class="fa fa-user"></i> Profile</a></li>
						<li><a href="page-login.html"><i class="fa fa-wrench"></i> Settings</a></li>
						<li><a href="page-invoice.html"><i class="fa fa-usd"></i> Payments <span class="label label-default">10</span></a></li>
						<li><a href="gallery.html"><i class="fa fa-file"></i> File <span class="label label-primary">27</span></a></li>
						<li class="divider"></li>						
						<li><a href="index.html"><i class="fa fa-sign-out"></i> Logout</a></li>	
	        		</ul>
	      		</li>
				<li><a href="index.html"><i class="fa fa-power-off"></i></a></li>
			</ul>
			
		</div>
		
	</div>
	<!-- end: Header -->
	
	<div class="container-fluid content">
	
		<div class="row">
				
			<!-- start: Main Menu -->
			<div class="sidebar ">
								
				<div class="sidebar-collapse">
					<div class="sidebar-header t-center">
                        <span><img class="text-logo" src="<%= path%>/assets/img/logo1.png"><i class="fa fa-space-shuttle fa-3x blue"></i></span>
                    </div>										
					<div class="sidebar-menu">						
						<ul class="nav nav-sidebar">
							<li><a href="index.html"><i class="fa fa-laptop"></i><span class="text"> Dashboard</span></a></li>
							<li>
								<a href="#"><i class="fa fa-file-text"></i><span class="text"> Pages</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">
									<li><a href="page-activity.html"><i class="fa fa-car"></i><span class="text"> Activity</span></a></li>
									<li><a href="page-inbox.html"><i class="fa fa-envelope"></i><span class="text"> Mail</span></a></li>
									<li><a href="page-invoice.html"><i class="fa fa-credit-card"></i><span class="text"> Invoice</span></a></li>
									<li><a href="page-profile.html"><i class="fa fa-heart-o"></i><span class="text"> Profile</span></a></li>
									<li><a href="page-pricing-tables.html"><i class="fa fa-columns"></i><span class="text"> Pricing Tables</span></a></li>
									<li><a href="page-404.html"><i class="fa fa-puzzle-piece"></i><span class="text"> 404</span></a></li>
									<li><a href="page-500.html"><i class="fa fa-puzzle-piece"></i><span class="text"> 500</span></a></li>
									<li><a href="page-lockscreen.html"><i class="fa fa-lock"></i><span class="text"> LockScreen1</span></a></li>
									<li><a href="page-lockscreen2.html"><i class="fa fa-lock"></i><span class="text"> LockScreen2</span></a></li>
									<li><a href="page-login.html"><i class="fa fa-key"></i><span class="text"> Login Page</span></a></li>
									<li><a href="page-register.html"><i class="fa fa-sign-in"></i><span class="text"> Register Page</span></a></li>
								</ul>	
							</li>
							<li>
								<a href="#"><i class="fa fa-list-alt"></i><span class="text"> Forms</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">
									<li><a href="form-elements.html"><i class="fa fa-indent"></i><span class="text"> Form elements</span></a></li>
									<li><a href="form-wizard.html"><i class="fa fa-tags"></i><span class="text"> Wizard</span></a></li>
									<li><a href="form-dropzone.html"><i class="fa fa-plus-square-o"></i><span class="text"> Dropzone Upload</span></a></li>
									<li><a href="form-x-editable.html"><i class="fa fa-pencil"></i><span class="text"> X-editable</span></a></li>
								</ul>
							</li>
							<li><a href="table.html"><i class="fa fa-table"></i><span class="text"> Tables</span></a></li>
							<li>
								<a href="#"><i class="fa fa-signal"></i><span class="text"> Visual Chart</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">
									<li><a href="chart-flot.html"><i class="fa fa-random"></i><span class="text"> Flot Chart</span></a></li>
									<li><a href="chart-xchart.html"><i class="fa fa-retweet"></i><span class="text"> xChart</span></a></li>
									<li><a href="chart-other.html"><i class="fa fa-bar-chart-o"></i><span class="text"> Other</span></a></li>
								</ul>
							</li>
							<li>
								<a href="#"><i class="fa fa-briefcase"></i><span class="text"> UI Features</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">
									<li><a href="ui-sliders-progress.html"><i class="fa fa-align-left"></i><span class="text"> Progress</span></a></li>
									<li><a href="ui-nestable-list.html"><i class="fa fa-outdent"></i><span class="text"> Nestable Lists</span></a></li>
									<li><a href="ui-elements.html"><i class="fa fa-list"></i><span class="text"> Elements</span></a></li>
									<li><a href="ui-panels.html"><i class="fa fa-list-alt"></i><span class="text"> Panels</span></a></li>
									<li><a href="ui-buttons.html"><i class="fa fa-th"></i><span class="text"> Buttons</span></a></li>
								</ul>
							</li>
							<li><a href="widgets.html"><i class="fa fa-life-bouy"></i><span class="text"> Widgets</span></a></li>
							<li><a href="typography.html"><i class="fa fa-font"></i><span class="text"> Typography</span></a></li>
							<li>
								<a href="#"><i class="fa fa-bolt"></i><span class="text"> Icons</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">									
									<li><a href="icons-font-awesome.html"><i class="fa fa-meh-o"></i><span class="text"> Font Awesome</span></a></li>
									<li><a href="icons-climacons.html"><i class="fa fa-meh-o"></i><span class="text"> Climacons</span></a></li>
								</ul>
							</li>
							<li><a href="gallery.html"><i class="fa fa-picture-o"></i><span class="text"> Gallery</span></a></li>							
							<li><a href="calendar.html"><i class="fa fa-calendar"></i><span class="text"> Calendar</span></a></li>
						</ul>
					</div>					
				</div>
				<div class="sidebar-footer">					
					
					<div class="sidebar-brand">
						Proton
					</div>
					
					<ul class="sidebar-terms">
						<li><a href="index.html#">Terms</a></li>
						<li><a href="index.html#">Privacy</a></li>
						<li><a href="index.html#">Help</a></li>
						<li><a href="index.html#">About</a></li>
					</ul>
					
					<div class="copyright text-center">
						<small>Proton <i class="fa fa-coffee"></i> from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></small>
					</div>					
				</div>	
				
			</div>
			<!-- end: Main Menu -->
						
		<!-- start: Content -->
		<div class="main sidebar-minified">
			<div class="row">

				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2><i class="fa fa-table red"></i><span class="break"></span><strong>试卷</strong></h2>
							<div class="panel-actions">
								<a href="javascript:void(0)"><button type="button" class="btn btn-primary" onclick="deleteChoice()">删除选中</button></a>
							</div>
						</div>
						<div class="panel-body">
							<table class="table table-bordered">
								<thead>
								<tr>
									<th style="width:5%">全选<input type="checkbox" name="allcheckDel" onclick="allCheckDel()"></th>
									<th style="width:5%">编号</th>
									<th>问题</th>
								</tr>
								</thead>
								<tbody id="myChoice">

								</tbody>
							</table>
						</div>
					</div>
				</div><!--/col-->

				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2><i class="fa fa-table red"></i><span class="break"></span><strong>题库</strong></h2>
							<div class="panel-actions">
								<a href="javascript:void(0)"><button type="button" class="btn btn-primary" onclick="addChoice()">保存选中</button></a>
							</div>
						</div>
						<div class="panel-body">
							<table class="table table-bordered">
								<thead>
								<tr>
									<th style="width:5%">全选<input type="checkbox" name="allcheck" onclick="allCheck()"></th>
									<th style="width:5%">编号</th>
									<th>一级类目</th>
									<th>二级类目</th>
									<th>问题</th>
								</tr>
								</thead>
								<tbody id="tbody">

								</tbody>
							</table>
							<ul class="pagination" style="float:right;margin-right: 50px">
								<li><a href="javascript:void(0)" onclick="prew()">上一页</a></li>
								<li><a href="javascript:void(0)" onclick="next()">下一页</a></li>
							</ul>
						</div>
					</div>
				</div><!--/col-->
			</div><!--/row-->
		</div>
		<!-- end: Content -->
	</div><!--/container-->
	</div>
	
	<div class="modal fade" id="deleteModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">提示</h4>
				</div>
				<div class="modal-body">
					<span id="msg"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<div class="clearfix"></div>

		
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
	
	
	<!-- page scripts -->
	<script src="<%= path%>/assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
	<script src="<%= path%>/assets/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="<%= path%>/assets/plugins/datatables/js/dataTables.bootstrap.min.js"></script>
	
	<!-- theme scripts -->
	<script src="<%= path%>/assets/js/SmoothScroll.js"></script>
	<script src="<%= path%>/assets/js/jquery.mmenu.min.js"></script>
	<script src="<%= path%>/assets/js/core.min.js"></script>
	
	<!-- end: JavaScript-->
	<script>

		var pageNo = 1;
		var pageSize = 10;
		var total = 0;
		paging(pageNo,pageSize);
		choiceIdsInPaper();

		function prew(){
			if(total != 0 && pageNo > 1){
				pageNo = pageNo - 1;
				paging(pageNo,pageSize);
			}
		}

		function next(){
			var totalPage = Math.ceil(total/pageSize);
			if(pageNo < totalPage){
				pageNo = pageNo + 1;
				paging(pageNo,pageSize);
			}
		}


		function paging(pageNo,pageSize){
			var paperId = ${paperId}
			$.ajax({
				type:"GET",
				url:"/api/admin/paper/paper_choice_list",
				data:{
					pageNo:pageNo,
					pageSize:pageSize,
					paperId:paperId
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					$("#tbody").html("");
					if(data.total != 0 ){
						total = data.total;
						var html = "";
						data.list.forEach(function(choiceDTO,index){
							html += "<tr>" +
									"<td><input type='checkbox' name='mycheck' onclick='changeCheck(this)' value='\""+ choiceDTO.choice.choiceId +"\"'></td>" +
									"<td>" + (index + 1) +"</td>" +
									"<td>" + choiceDTO.categories1.categoriesName + "</td>" +
									"<td>" + choiceDTO.categories2.categoriesName + "</td>" +
									"<td>" + choiceDTO.choice.choiceQuestion + "</td>" +
									"</tr>";
						});
						$("#tbody").html(html);

					}else{
						$("#tbody").html("<tr><td colspan='4'>题库已空~<td><tr>");
					}
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}

		function choiceIdsInPaper(){
			var paperId = ${paperId}
			$.ajax({
				type:"GET",
				url:"/api/admin/paper/choice_ids_in_paper",
				data:{
					paperId:paperId
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					$("#myChoice").html("");
					if(data.length != 0 ){
						var html = "";
						data.forEach(function(choice,index){
							html += "<tr>" +
									"<td><input type='checkbox' name='mycheckDel' onclick='changeCheckDel(this)' value='\""+ choice.choiceId +"\"'></td>" +
									"<td>" + (index + 1) +"</td>" +
									"<td>" + choice.choiceQuestion + "</td>" +
									"</tr>";
						});
						$("#myChoice").html(html);

					}else{
						$("#myChoice").html("<tr><td colspan='2'>尚未添加~<td><tr>");
					}
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}

		function showConfirm(msg){
			$("#msg").html(msg);
			$("#deleteModal").modal("show");
		}

		function allCheck() {
			var mycheck = $("input[name='mycheck']");
			var isTrue = true;
			for(var i = 0 ; i < mycheck.length ; i ++){
				if(mycheck[i].checked == false){
					isTrue = false;
					break;
				}
			}
			if(isTrue){
				mycheck.attr("checked",false);
			}else{
				mycheck.attr("checked",true);
			}

		}

		function changeCheck(obj){
			if($(obj)[0].checked == false){
				$("input[name='allcheck']").attr("checked",false);
			}
		}
		function allCheckDel() {
			var mycheck = $("input[name='mycheckDel']");
			var isTrue = true;
			for(var i = 0 ; i < mycheck.length ; i ++){
				if(mycheck[i].checked == false){
					isTrue = false;
					break;
				}
			}
			if(isTrue){
				mycheck.attr("checked",false);
			}else{
				mycheck.attr("checked",true);
			}

		}

		function changeCheckDel(obj){
			if($(obj)[0].checked == false){
				$("input[name='allcheckDel']").attr("checked",false);
			}
		}

		function addChoice() {
			var paperId = ${paperId};
			var mycheck = $("input[name='mycheck']");
			var choiceIds = "";
			for (var i = 0; i < mycheck.length; i++) {
				if(mycheck[i].checked == true)
					choiceIds += mycheck[i].value + ",";
			}
			choiceIds = choiceIds.substring(0,choiceIds.length-1).replace(/"/g,"")
			$.ajax({
				type: "POST",
				url: "/api/admin/paper/add_choice",
				data: {
					paperId: paperId,
					choiceIds: choiceIds
				},
				dataType: "json",
				contentType: "application/x-www-form-urlencoded",
				success: function (data) {
					if(data == true){
						showConfirm("保存成功")
						paging(pageNo,pageSize);
						choiceIdsInPaper();
					}else{
						showConfirm("保存失败")
					}
				},
				error: function (jqXHR) {
					alert("发生错误：" + jqXHR.status);
				}
			})
		}

		function deleteChoice(){
			var paperId = ${paperId};
			var mycheck = $("input[name='mycheckDel']");
			var choiceIds = "";
			for (var i = 0; i < mycheck.length; i++) {
				if(mycheck[i].checked == true)
					choiceIds += mycheck[i].value + ",";
			}
			choiceIds = choiceIds.substring(0,choiceIds.length-1).replace(/"/g,"")
			$.ajax({
				type: "DELETE",
				url: "/api/admin/paper/del_choice",
				data: {
					paperId: paperId,
					choiceIds: choiceIds
				},
				dataType: "json",
				contentType: "application/x-www-form-urlencoded",
				success: function (data) {
					if(data == true){
						showConfirm("删除成功")
						paging(pageNo,pageSize);
						choiceIdsInPaper();
					}else{
						showConfirm("删除失败")
					}
				},
				error: function (jqXHR) {
					alert("发生错误：" + jqXHR.status);
				}
			})
		}

	</script>

</body>

</html>