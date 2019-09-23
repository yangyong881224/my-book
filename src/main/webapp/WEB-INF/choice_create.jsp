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
	    <title>用户管理</title>

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
		</div>
		<!-- start: Content -->
		<div class="main sidebar-minified">
			<div class="row" style="height:80vh">
				<div class="col-lg-12"  style="height:100%">
					<div class="panel panel-default"  style="height:100%">
						<div class="panel-heading">
							<h2><i class="fa fa-table red"></i><span class="break"></span><strong><a href="/choice">题库管理</a>/ 新建习题</strong></h2>
						</div>
						<div class="panel-body" style="height:90%;">
							<div style="height:100% ;width: 20%;border:1px solid #000;float:left">
								<div style="height:5%;width:100%;" class="panel-heading">
									<h2><i class="fa fa-list red"></i><span class="break"></span><strong>一级类目</strong></h2>
								</div>
								<div style="height:95%;width:100%;" class="panel-body">
									<div id="dhead" style="height: 10%;">
										<div class="input-group">
											<input type="text" id="input2" name="input1-group2" class="form-control" placeholder="类目名称">
											<span class="input-group-btn">
				                            	<button type="button" class="btn btn-primary"><i class="fa fa-search"></i> 搜索</button>
				                            </span>
										</div>
									</div>
									<div id="dbody" style="height: 80%;margin-left: 10px">

									</div>
								</div>
							</div>
							<div style="height:100% ;width: 20%;border:1px solid #000;float: left" hidden id="categories2">
								<div style="height:5%;width:100%;" class="panel-heading">
									<h2><i class="fa fa-list red"></i><span class="break"></span><strong>二级类目</strong></h2>
								</div>
								<div style="height:95%;width:100%;" class="panel-body">
									<div id="dhead2" style="height: 10%;">
										<div class="input-group">
											<input type="text" id="input1" name="input1-group2" class="form-control" placeholder="类目名称">
											<span class="input-group-btn">
				                            <button type="button" class="btn btn-primary"><i class="fa fa-search"></i> 搜索</button>
				                            </span>
										</div>
									</div>
									<div id="dbody2" style="height: 80%;margin-left: 10px">

									</div>
								</div>
							</div>
							<div style="height:100% ;width: 60%;border:1px solid #000;float: left" hidden id="categories3">
								<div class="panel-heading">
									<h2><i class="fa fa-list red"></i><span class="break"></span><strong>选择题录入</strong></h2>
									<ul class="nav tab-menu nav-tabs" id="myTab">
										<li class="active"><a href="#info">人工录入</a></li>
										<li><a href="#custom">批量导入</a></li>
									</ul>
								</div>
								<div class="panel-body" style="height:95%">

									<div id="myTabContent" class="tab-content">
										<div class="tab-pane active" id="info">
											<div class="form-horizontal ">
												<div class="form-group">
													<label class="col-md-3 control-label" for="textarea-input">问题</label>
													<div class="col-md-9">
														<textarea id="textarea-input" name="textarea-input" rows="4" class="form-control" placeholder="请输入问题" style="resize: none"></textarea>
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 control-label">题型</label>
													<div class="col-md-9">
														<label class="radio-inline" for="inline-radio1">
															<input type="radio" id="inline-radio1" name="inline-radios" value="1" checked onclick="changeType(1)"> 单选题
														</label>
														<label class="radio-inline" for="inline-radio2">
															<input type="radio" id="inline-radio2" name="inline-radios" value="2" onclick="changeType(2)"> 多选题
														</label>
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 control-label">答案</label>
													<div class="col-md-9" id="oneAnswer">
														<div class="radio">
															<label for="radio1">
																<input type="radio" id="radio1" name="radios" value="A">
																<input type="text" name="text-input1" class="form-control" placeholder="答案A">
															</label>
														</div>
														<div class="radio">
															<label for="radio2">
																<input type="radio" id="radio2" name="radios" value="B">
																<input type="text" name="text-input1" class="form-control" placeholder="答案B">
															</label>
														</div>
														<div class="radio">
															<label for="radio3">
																<input type="radio" id="radio3" name="radios" value="C">
																<input type="text" name="text-input1" class="form-control" placeholder="答案C">
															</label>
														</div>
														<div class="radio">
															<label for="radio4">
																<input type="radio" id="radio4" name="radios" value="D">
																<input type="text" name="text-input1" class="form-control" placeholder="答案D">
															</label>
														</div>
													</div>

													<div class="col-md-9" id="moreAnswer" hidden>
														<div class="checkbox">
															<label for="checkbox1">
																<input type="checkbox" id="checkbox1" name="checkbox" value="A">
																<input type="text" name="text-input2" class="form-control" placeholder="答案A">
															</label>
														</div>
														<div class="checkbox">
															<label for="checkbox2">
																<input type="checkbox" id="checkbox2" name="checkbox" value="B">
																<input type="text" name="text-input2" class="form-control" placeholder="答案B">
															</label>
														</div>
														<div class="checkbox">
															<label for="checkbox3">
																<input type="checkbox" id="checkbox3" name="checkbox" value="C">
																<input type="text" name="text-input2" class="form-control" placeholder="答案C">
															</label>
														</div>
														<div class="checkbox">
															<label for="checkbox4">
																<input type="checkbox" id="checkbox4" name="checkbox" value="D">
																<input type="text" name="text-input2" class="form-control" placeholder="答案D">
															</label>
														</div>
													</div>
												</div>
											</div>
											<div id="dfoot" style="height:5%;width: 100%;">
												<button type="button" class="btn btn-sm btn-success" style="float: right;margin-right: 30px" onclick="createChoice()"><i class="fa fa-dot-circle-o"></i> 保存</button>
											</div>
										</div>
										<div class="tab-pane" id="custom">
											<form action="/api/admin/choice/create_batch" enctype="multipart/form-data" method="post" target="upload">
												<div class="form-group">
													<label class="col-md-3 control-label">归属类别请填写：</label>
													<div class="col-md-9">
														<p class="form-control-static" id="parent3"></p>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label" for="file-input">批量导入</label>
													<div class="col-md-9">
														<input type="file" id="file-input" name="file">
													</div>
												</div>
												<div style="height:5%;width: 100%;">
													<button type="submit" class="btn btn-sm btn-success" style="float: right;margin-right: 30px" onclick="createBatch()"><i class="fa fa-dot-circle-o"></i> 保存</button>
												</div>
											</form>
											<iframe name="upload"></iframe>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end: Content -->
		<!--/container-->
	</div>
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">提示</h4>
					<input type="hidden" id="paperId" value="" readonly>
				</div>
				<div class="modal-body">
					<span id="msg"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
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

		getCategories(0);

		//类目数据展示
		function getCategories(parentId){
			$.ajax({
				type:"GET",
				url:"/api/admin/categories/list",
				data:{
					parentId:parentId
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					var html = "";

					if(parentId == 0){
						$("#categoriesName1").val("");
						$("#dbody").html("");
						data.forEach(function(categories,index){
							html += "<div style='cursor:pointer' onmouseenter='mouseOver(this)' onmouseleave='mouseOut(this)' onclick='addCategories(this,\""+categories.categoriesId+"\")'>" +
									"<input hidden readonly value='"+categories.categoriesId+"'>" +
									"<i>"+categories.categoriesName+"</i>" +
									"</div>";
						});
						$("#dbody").html(html);
					}else if(parentId != 0){
						$("#categoriesName2").val("");
						$("#dbody2").html("");
						data.forEach(function(categories,index){
							html += "<div style='cursor:pointer' onmouseenter='mouseOver(this)' onmouseleave='mouseOut(this)' onclick='addCategories2(this,\""+categories.categoriesId+"\")' >" +
									"<input hidden readonly value='"+categories.categoriesId+"'>" +
									"<i>"+categories.categoriesName+"</i>" +
									"</div>";
						});
						$("#dbody2").html(html);
					}
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}
		function mouseOver(obj){
			var div=$(obj);
			if(div.css("background-color") == "rgba(0, 0, 0, 0)")
				div.css("background-color","#C0C0C0");
		}
		function mouseOut(obj){
			var div=$(obj);
			if(div.css("background-color")=="rgb(192, 192, 192)")
				div.css("background-color","");
		}
		//弹出二级类目
		function addCategories(obj,parentId){
			var div=$(obj);
			div.css("background-color","#A0A0A0");
			var ds = div.siblings();
			for(var i = 0 ; i < ds.length ; i ++){
				ds[i].style.backgroundColor = "";
			}
			$("#categories2").show();
			getCategories(parentId);
		}

		//弹出添加习题框
		function addCategories2(obj,parentId){
			var div=$(obj);
			div.css("background-color","#A0A0A0");
			var ds = div.siblings();
			for(var i = 0 ; i < ds.length ; i ++){
				ds[i].style.backgroundColor = "";
			}
			$("#categories3").show();
			$("#parent3").html(parentId);
		}

		//题型变更
		function changeType(type){
			if(type == 2){
				$("#oneAnswer").hide();
				$("#moreAnswer").show();
			}else if(type == 1){
				$("#oneAnswer").show();
				$("#moreAnswer").hide();
			}
		}
		//插入
		function createChoice(){
			var categoriesId = $("#parent3").html();
			var choiceQuestion = $("#textarea-input").val();
			var choiceType = $("input[name='inline-radios']:checked").val();
			var choiceAnswer = "";
			var choiceTrue = "";
			var params = [];
			//判断题型，拼接相应的答案与正确答案
			if(choiceType == 1){
				choiceTrue = $("input[name='radios']:checked").val();
				var answers = $("input[name='text-input1']");
				var num = $("input[name='radios']");
				for(var i = 0; i < answers.length; i ++){
					if(answers[i].value.trim() != ""){
						params.push({"num":num[i].value,"answer":answers[i].value});
					}
				}
			}else if(choiceType == 2){
				var checkeds = $("input[name='checkbox']:checked");
				for(var i = 0 ; i < checkeds.length ; i ++){
					choiceTrue += checkeds[i].value + ",";
				}
				choiceTrue = choiceTrue.substring(0,choiceTrue.length-1);
				var answers = $("input[name='text-input2']");
				var num = $("input[name='checkbox']");
				for(var i = 0 ; i < answers.length ; i ++){
					if(answers[i].value.trim() != ""){
						params.push({"num":num[i].value,"answer":answers[i].value})
					}
				}
			}
			//将答案转换成JSON格式
			choiceAnswer = JSON.stringify(params);
			$.ajax({
				type:"POST",
				url:"/api/admin/choice/create",
				data:{
					categoriesId : categoriesId,
					choiceQuestion : choiceQuestion,
					choiceAnswer : choiceAnswer,
					choiceTrue : choiceTrue,
					choiceType : choiceType
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					if(data == true){
						$("#msg").html("保存成功！");
						$("#myModal").modal("show");
						$("#textarea-input").val("");
						$("#inline-radio1").attr("checked",true);
						$("input[name='radios']:checked").attr("checked",false);
						$("input[name='text-input1']").attr("value","");
						$("#oneAnswer").show();
						$("input[name='checkbox']:checked").attr("checked",false);
						$("input[name='text-input2']").attr("value","");
						$("#moreAnswer").hide();

					}else{
						$("#msg").html("保存失败，请刷新页面重试或者联系管理员！")
						$("#myModal").modal("show");
					}
				},
				error:function(jqXHR){
					$("#msg").html("发生错误："+ jqXHR.status)
					$("#myModal").modal("show");
				}
			});
		}
		//批量插入
		function createBatch(){

		}
	</script>

</body>

</html>