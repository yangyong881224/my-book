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
	    <title>账号管理</title>

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
<jsp:include page="header.jsp"/>
<!-- end: Header -->

<jsp:include page="menu.jsp"/>
		<!-- start: Content -->
		<div class="main sidebar-minified">
		
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2><i class="fa fa-table red"></i><span class="break"></span><strong>账号管理</strong></h2>
							<div class="panel-actions">
								<a href="javascript:void(0)"><button type="button" class="btn btn-primary" onclick="showCreate()"><i class="fa fa-plus"></i>新建</button></a>
							</div>
						</div>
						<div class="panel-body">
							<table class="table table-bordered table-striped table-condensed table-hover">
								<thead>
									  <tr>
										 <th style="width:5%">编号</th>
										 <th>用户昵称</th>
										 <th>用户手机</th>
										 <th>用户角色</th>
										 <th style="width:20%">操作</th>
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
					<h4 class="modal-title">警告</h4>
					<input type="hidden" id="userRoleId" readonly>
				</div>
				<div class="modal-body">
					<span id="msg">删除后将无法恢复，是否确认删除</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="deleteUserRole()">确认</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

<div class="modal fade" id="createModel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<input type="hidden" id="userId">
				<div>用户昵称：<span id="userNickname"></span></div>
				<div>用户登陆手机号码：<input type="number" id="userPhone" onchange="checkUser()"></div>
				<div>用户角色：
					<select id="roleSelect">

					</select>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearCreate()">取消</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="confirmForm()" id="confirmButton" disabled>确认</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

	<div class="clearfix"></div>

	<!-- end: JavaScript-->
	<script>

		var pageNo = 1;
		var pageSize = 10;
		var total = 0;
		paging(pageNo,pageSize);

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
			$.ajax({
				type:"GET",
				url:"/api/admin/role_user/paging",
				data:{
					pageNo:pageNo,
					pageSize:pageSize
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					$("#tbody").html("");
					if(data.empty == false){
						total = data.total;
						var html = "";
						data.data.forEach(function(userRole,index){
							html += "<tr>" +
									"<td>" + (index + 1) +"</td>" +
									"<td>" + userRole.userName + "</td>" +
									"<td>" + userRole.userPhone + "</td>" +
									"<td>" + userRole.roleName + "</td>" +
									"<td><a href='javascript:void(0)' class='btn btn-info'onclick='showUpdate(\""+userRole.id+"\",\""+userRole.userName+"\",\""+userRole.userPhone+"\")'><i class='fa fa-edit'></i></a> " +
									"<a href='javascript:void(0)' class='btn btn-danger' onclick='showDelete(\""+userRole.id+"\")'><i class='fa fa-trash-o'></i></a> </td>" +
									"</tr>";
						});
						$("#tbody").html(html);

					}else{
                        $("#tbody").html("啥也没有");
					}
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}

        function regExpPhone(phone){
            if((/^1[3456789]\d{9}$/.test(phone))){
                return true;
            }else{
                return false;
			}
        }

		function checkUser(){
		    $("#userNickname").html("");
		    var userPhone = $("#userPhone").val();
            var result = false;
            //手机号满足正则，后台查询是否有该用户
		    if(regExpPhone(userPhone)){
                $.ajax({
                    type:"GET",
                    url:"/api/admin/role/check_user",
                    data:{
						username:userPhone
                    },
                    dataType:"json",
					async:false,
                    contentType:"application/x-www-form-urlencoded",
                    success:function(data){
						if(data === null){
                            $("#userNickname").html("<strong style='color:red'>未查询到该用户...</strong>");
                            $("#confirmButton").attr("disabled","disabled");
                        }else{
							$("#userNickname").html("<strong style='color:black'>"+data.userNickname+"</strong>");
                            result = true;
                            $("#userId").val(data.userId);
                            $("#confirmButton").removeAttr("disabled")
						}
                    },
                    error:function(jqXHR){
                        alert("发生错误："+ jqXHR.status);
                    }
                });
			}else{
                $("#confirmButton").attr("disabled","disabled");
                $("#userNickname").html("<strong style='color:red'>请输入正确手机号...</strong>");
			}
			return result;
		}

		function showCreate(){
		    //查询角色列表
            $.ajax({
                type:"GET",
                url:"/api/admin/role/list_all",
                data:{},
                dataType:"json",
                contentType:"application/x-www-form-urlencoded",
                success:function(data){
                    $("#roleSelect").html("");
                    var html = "";
                    if(data.length == 0){
                        html = "<option value='-1'>--请添加角色--</option>";
					}else{
                        data.forEach(function(role,index){
                           html += "<option value='"+role.roleId+"' target="+role.targetType+">"+role.roleName+"</option>";
						});
					}
                    $("#roleSelect").html(html);
                    $("#createModel").modal("show");
                },
                error:function(jqXHR){
                    alert("发生错误："+ jqXHR.status);
                }
            });
		}

		function showUpdate(id,name,phone){
		    $("#userRoleId").val(id);
		    $("#userNickname").html("<strong>"+name+"</strong>");
		    $("#userPhone").val(phone);
		    $("#userPhone").attr("readonly","true");
            $("#confirmButton").removeAttr("disabled")
            $.ajax({
                type:"GET",
                url:"/api/admin/role/list_all",
                data:{},
                dataType:"json",
                contentType:"application/x-www-form-urlencoded",
                success:function(data){
                    $("#roleSelect").html("");
                    var html = "";
                    if(data.length == 0){
                        html = "<option value='-1'>--请添加角色--</option>";
                    }else{
                        data.forEach(function(role,index){
                            html += "<option value='"+role.roleId+"' target="+role.targetType+">"+role.roleName+"</option>";
                        });
                    }
                    $("#roleSelect").html(html);
                    $("#createModel").modal("show");
                },
                error:function(jqXHR){
                    alert("发生错误："+ jqXHR.status);
                }
            });
		}

		function showDelete(userRoleId){
			$("#userRoleId").val(userRoleId);
			$("#deleteModal").modal("show");
		}

		function confirmForm(){
		    if(checkUser()){
		        var id = $("#userRoleId").val();
		        var userId = $("#userId").val();
		        var roleId = $("#roleSelect").val();
		        var targetType = $("#roleSelect").find("option:selected").attr("target");
                $.ajax({
                    type:"POST",
                    url:"/api/admin/role_user/create_or_update",
                    data:{
                        id:id,
						userId:userId,
						roleId:roleId,
						targetType:targetType
                    },
                    dataType:"json",
                    contentType:"application/x-www-form-urlencoded",
                    success:function(data){
                        if(data == true){
                            paging(pageNo,pageSize);
                        }else{
                            alert("绑定失败，请刷新页面重试！");
						}
                        $("#confirmButton").attr("disabled","disabled");
                        clearCreate();
                    },
                    error:function(jqXHR){
                        alert("发生错误："+ jqXHR.status);
                    }
                });
			}
		}

		function clearCreate(){
		    $("#userRoleId").val("")
		    $("#userId").val("");
		    $("#userNickname").html("");
		    $("#userPhone").val("");
		    $("#roleSelect").html("");
		    $("#userPhone").removeAttr("readonly")
		}

		function deleteUserRole(){
			var userRoleId = $("#userRoleId").val();
			$.ajax({
				type:"DELETE",
				url:"/api/admin/role_user/delete",
				data:{
					id:userRoleId
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
				    $("#userRoleId").val("");
					paging(pageNo,pageSize)
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}


	</script>

</body>

</html>