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
	    <title>用户资料管理</title>

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
							<h2><i class="fa fa-table red"></i><span class="break"></span><strong><a href="/welcome">首页</a>/ 个人资料管理</strong></h2>
						</div>
						<div class="panel-body" style="height:90%;">
							<div id="myTabContent" class="tab-content">
								<div class="form-horizontal ">
									<div class="form-group">
										<label class="col-md-3 control-label">登录账号</label>
										<div class="col-md-9">
											<p class="form-control-static">${user.username}</p>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" for="user-nickname">昵称</label>
										<div class="col-md-9">
											<input type="text" id="user-nickname" value="${user.userNickName}" class="form-control" placeholder="填写昵称">
											<span class="help-block">This is a help text</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" for="user-emaill">邮箱</label>
										<div class="col-md-9">
											<input type="text" id="user-emaill" class="form-control" placeholder="填写邮箱">
											<span class="help-block">邮箱用于修改密码，如未填写邮箱，修改密码需联系管理员</span>
										</div>
									</div>
								</div>
								<div id="dfoot" style="height:5%;width: 100%;">
									<button type="button" class="btn btn-sm btn-success" style="float: right;margin-right: 30px" onclick="udpateUserInfo()"><i class="fa fa-dot-circle-o"></i> 保存</button>
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
		var choiceId = ${choiceId};
		initChoice(choiceId)
		function initChoice(choiceId){
			$.ajax({
				type:"GET",
				url:"/api/admin/choice/" + choiceId,
				data:{
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					var choice = data;
					if(data != null){
						$("#textarea-input").val(choice.choiceQuestion);
						changeType(choice.choiceType);
						if(choice.choiceType == 1){
							$("#inline-radio1").attr("checked",true);
							//单选正确答案checked
							var radios = $("input[name='radios']");
							for(var i = 0; i < radios.length; i ++){
								if(radios[i].value == choice.choiceTrue){
									radios[i].checked = true;
									break;
								}
							}
							//答案value赋值
							var inputs = $("input[name='text-input1']");
							inputs[0].value = choice.answerMap["A"];
							inputs[1].value = choice.answerMap["B"];
							inputs[2].value = choice.answerMap["C"];
							inputs[3].value = choice.answerMap["D"];
						}else if(choice.choiceType == 2){
							$("#inline-radio2").attr("checked",true);
							//多选正确答案checked
							var checkboxs = $("input[name='checkbox']");
							var choiceTrues = choice.choiceTrue.split(",");
							for(var i = 0; i < checkboxs.length; i ++){
								for(var j = 0; j < choiceTrues.length; j ++){
									if(checkboxs[i].value == choiceTrues[j]){
										checkboxs[i].checked = true;
										break;
									}
								}
							}
							//答案value赋值
							var inputs = $("input[name='text-input2']");
							inputs[0].value = choice.answerMap["A"];
							inputs[1].value = choice.answerMap["B"];
							inputs[2].value = choice.answerMap["C"];
							inputs[3].value = choice.answerMap["D"];
						}
					}else{
						$("#msg").html("保存失败，请刷新页面重试或者联系管理员！")
						$("#myModal").modal("show");
					}
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
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
		//更新
		function udpateChoice(){
			var choiceId = ${choiceId};
			var categoriesId = $("#parent3").val();
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
				type:"PUT",
				url:"/api/admin/choice/update",
				data:{
					choiceId: choiceId,
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
						$("#msg").html("修改成功！");
						$("#myModal").modal("show");
					}else{
						$("#msg").html("保存失败，请刷新页面重试或者联系管理员！")
					}
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}

	</script>

</body>

</html>