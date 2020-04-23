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
	    <title>角色管理</title>

		<!-- Favicon and touch icons -->
		<link rel="shortcut icon" href="<%= path%>/assets/ico/favicon.ico" type="image/x-icon" />

	    <!-- Css files -->
	    <link href="<%= path%>/assets/css/bootstrap.min.css" rel="stylesheet">
		<link href="<%= path%>/assets/css/jquery.mmenu.css" rel="stylesheet">
		<link href="<%= path%>/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="<%= path%>/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
	    <link href="<%= path%>/assets/css/style.min.css" rel="stylesheet">
		<link href="<%= path%>/assets/css/add-ons.min.css" rel="stylesheet">

		<%--tree start--%>
		<link rel="stylesheet" href="<%= path%>/assets/tree/bower_components/jstree/dist/themes/default/style.min.css">
		<link rel="stylesheet" href="<%= path%>/assets/tree/bower_components/AngularJS-Toaster/toaster.css">
		<link rel="stylesheet" href="<%= path%>/assets/tree/bower_components/angular-busy/dist/angular-busy.css">

		<script src="<%= path%>/assets/tree/bower_components/jquery/dist/jquery.min.js"></script>
		<script src="<%= path%>/assets/tree/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
		<script src="<%= path%>/assets/tree/bower_components/angular/angular.min.js"></script>
		<script src="<%= path%>/assets/tree/bower_components/angular-animate/angular-animate.min.js"></script>
		<script src="<%= path%>/assets/tree/bower_components/angular-busy/dist/angular-busy.js"></script>
		<script src="<%= path%>/assets/tree/bower_components/jstree/dist/jstree.js"></script>
		<script src="<%= path%>/assets/tree/bower_components/AngularJS-Toaster/toaster.js"></script>
		<script src="<%= path%>/assets/tree/bower_components/underscore/underscore-min.js"></script>
		<script src="<%= path%>/assets/tree/ngJsTree.js"></script>
		<script src="<%= path%>/assets/tree/app.js"></script>
		<script src="<%= path%>/assets/tree/treeCtrl.js"></script>
		<script src="<%= path%>/assets/tree/myTree.js"></script>
		<%--tree end--%>
	</head>

<body ng-app="ngJsTreeDemo">
<jsp:include page="header.jsp"/>
<!-- end: Header -->

<jsp:include page="menu.jsp"/>
		</div>
		<!-- start: Content -->
		<div class="main sidebar-minified">
			<div class="row" style="height:80vh">
				<div class="col-lg-12"  style="height:100%">
					<div class="panel panel-default"  style="height:100%">
						<div class="panel-heading">
							<h2><i class="fa fa-table red"></i><span class="break"></span><strong><a href="/role">角色管理</a>/ 新建角色</strong></h2>
						</div>
						<div class="panel-body" style="height:90%;" ng-controller="treeCtrl as vm">

							<div class="row" cg-busy="vm.promise">
								<toaster-container></toaster-container>

								<div class="col-xs-6">
									<div class="panel panel-default">
										<div class="panel-heading"><i class="glyphicon glyphicon-tree-conifer"></i> 权限</div>
										<form action="/role" method="get" id="roleForm">
											<div class="panel-body" ng-controller="myTree as myt">
												角色名称：<input type="text" ng-model="roleName">
												角色编码：<input type="text" ng-model="roleCode">
												业务类型：<select ng-model="targetType"><option value="ADMIN" selected>管理员</option>
																<option value="EDITOR">网络编辑</option>
																<option value="AUTHOR">网文作者</option>
																<option value="MEMBER">会员</option>
																<option value="USER">普通用户</option>
															</select>
												<div tree="myTree" js-tree="vm.treeConfig" should-apply="vm.applyModelChanges()" ng-model="vm.treeData" tree="vm.treeInstance" tree-events="ready:vm.readyCB;create_node:vm.createCB"></div>
												<input type="button" value="确认" ng-click="myt.confirmForm()">
											</div>
										</form>
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
</body>

</html>