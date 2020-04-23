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
	<jsp:include page="header.jsp"/>
	<!-- end: Header -->

	<jsp:include page="menu.jsp"/>
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
											<p class="form-control-static">${rolePermission.user.username}</p>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" for="user-nickname">昵称</label>
										<div class="col-md-9">
											<input type="text" id="user-nickname" value="${rolePermission.user.userNickname}" class="form-control" placeholder="填写昵称">
											<span class="help-block">秀出你的个性</span>
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

	<!-- end: JavaScript-->
	<script>
		function initChoice(choiceId){
			$.ajax({
				type:"GET",
				url:"/api/admin/choice/" + choiceId,
				data:{
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){

				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}

	</script>

</body>

</html>