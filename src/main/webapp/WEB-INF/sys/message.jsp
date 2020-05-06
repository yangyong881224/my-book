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
	    <title>消息管理</title>

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
							<h2><i class="fa fa-table red"></i><span class="break"></span><strong>消息管理</strong></h2>
							<div class="panel-actions">
								<button type="button" class="btn btn-primary" onclick="showCreate()"><i class="fa fa-plus"></i>新建</button>
							</div>
						</div>
						<div class="panel-body">
							<table class="table table-bordered table-striped table-condensed table-hover">
								<thead>
									  <tr>
										  <th style="width:5%">编号</th>
										  <th>消息类型</th>
										  <th>发送对象</th>
										  <th>消息标题</th>
										  <th>消息内容</th>
										  <th>消息状态</th>
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
					<input type="hidden" id="messageId" readonly>
				</div>
				<div class="modal-body">
					<span id="msg">删除后将无法恢复，是否确认删除</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="deleteMessage()">确认</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

<div class="modal fade" id="createModel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">新建消息</h4>
			</div>
			<div class="modal-body">
				<div>
					消息类型：
					<select id="typeName" >

					</select>
				</div>
				<div>
					接收用户：
					<input type="radio" name="sendType" checked value="0" onclick="changeExaminied(0)">所有用户
					<input type="radio" name="sendType" value="1" onclick="changeExaminied(1)">指定用户
				</div>
				<div hidden id="messageUser">
					用户手机：<input type="text" id="userPhone" onchange="checkUser()">
					<input type="text" id="userId" hidden readonly>
					<i class="fa fa-check" id="right" style="display: none;color:greenyellow"></i>
					<i class="fa fa-times" id="wrong" style="display: none;color:red"></i>
				</div>
				<div>
					消息标题：<input type="text" id="title">
				</div>
				<div>
					消息内容：<textarea id="content" cols="30" rows="10"></textarea>
				</div>
				<div>
					是否需要审核：<input type="radio" name="examined" checked value="1">是 <input type="radio" name="examined" value="0">否
				</div>


			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" id="confirmButton" onclick="createMessage()">确认</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>

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
				url:"/api/admin/message/paging",
				data:{
					pageNo:pageNo,
					pageSize:pageSize
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					$("#tbody").html("");
					if(!data.empty){
						total = data.total;
						var html = "";
						data.data.forEach(function(message,index){
						    var statusHtml = "";
						    var sendHtml = "";
                            //判断状态
							if(message.examined == 0){
							    if(message.sendStatus == 0){
							        statusHtml = "消息未发送";
									sendHtml = "<button onclick='sendMessage(\""+message.id+"\")'>发送</button>" +
											"<a href='#' class='btn btn-info'><i class='fa fa-edit'></i></a>" +
											"<a href='javascript:void(0)' class='btn btn-danger' onclick='showDelete(\""+message.id+"\")'><i class='fa fa-trash-o'></i></a> </td>";
								}else if(message.sendStatus == 1){
							        statusHtml = "正在发送..."
								}else{
							        statusHtml = "消息已发送";
								}
							}else{
							    if(message.examineStatus == 0){
							        statusHtml = "消息审核中";
                                    sendHtml = "<a href='javascript:void(0)' class='btn btn-danger' onclick='showDelete(\""+message.id+"\")'><i class='fa fa-trash-o'></i></a> </td>";
								}else if (message.examineStatus == 1){
							        statusHtml = "审核通过，消息已发送";
								}else{
							        statusHtml = "审核未通过";
                                    sendHtml = "<a href='#' class='btn btn-info'><i class='fa fa-edit'></i></a>" +
                                        "<a href='javascript:void(0)' class='btn btn-danger' onclick='showDelete(\""+message.id+"\")'><i class='fa fa-trash-o'></i></a> </td>";
								}
							}
							//发送对象
							var sendTypeHtml = "";
							if(message.sendType == 0){
							    sendTypeHtml = "所有用户";
							}else if(message.sendType == 1){
							    sendTypeHtml = message.userPhone;
							}
							html += "<tr>" +
									"<td>" + (index + 1) +"</td>" +
									"<td>" + message.typeName + "</td>" +
									"<td>" + sendTypeHtml + "</td>" +
									"<td>" + message.title + "</td>" +
									"<td>" + message.content + "</td>" +
									"<td>" + statusHtml + "</td>" +
									"<td>" + sendHtml + "</td>" +
									"</tr>";
						});
						$("#tbody").html(html);
					}else{
                        $("#tbody").html("<tr><td colspan='7'>还没有消息...</td></tr>");
					}
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}

		function sendMessage(id){
            $.ajax({
                type:"POST",
                url:"/api/admin/message/send",
                data:{
                    id:id
				},
                dataType:"json",
                contentType:"application/x-www-form-urlencoded",
                success:function(data){
                    if(data){
                        paging(pageNo,pageSize);
					}else{
                        alert("发送失败");
					}
                },
                error:function(jqXHR){
                    alert("发生错误："+ jqXHR.status);
                }
            });
		}

		function showCreate(){
            $.ajax({
                type:"GET",
                url:"/api/admin/message_type/list",
                data:{},
                dataType:"json",
                contentType:"application/x-www-form-urlencoded",
                success:function(data){
                    $("#typeName").html("");
                    if(data.length != 0){
                        var html = "";
                        data.forEach(function(messageType,index){
                            html += "<option value='"+messageType.id+"'>" + messageType.messageType + "</option>";
                        });
                        $("#typeName").html(html);
                        $("#createModel").modal("show");
                    }else{
                        $("#typeName").html("<option value='-1'>\"--请添加类型--");
                    }
                },
                error:function(jqXHR){
                    alert("发生错误："+ jqXHR.status);
                }
            });

		}

		function showDelete(messageId){
			$("#messageId").val(messageId);
			$("#deleteModal").modal("show");
		}

		function createMessage(){
		    var title = $("#title").val();
            var content = $("#content").val();
            var typeId = $("#typeName").val();
            var userId = $("#userId").val();
            var userPhone = $("#userPhone").val();
            var sendType = $("input[name='sendType']:checked").val();
            var examined = $("input[name='examined']:checked").val();
            $.ajax({
                type:"POST",
                url:"/api/admin/message/create",
                data:{
                    title:title,
					content:content,
					typeId:typeId,
					examined:examined,
					userId:userId,
					userPhone:userPhone,
					sendType:sendType
                },
                dataType:"json",
                contentType:"application/x-www-form-urlencoded",
                success:function(data){
                    paging(pageNo,pageSize)
                },
                error:function(jqXHR){
                    alert("发生错误："+ jqXHR.status);
                }
            });
		}

		function deleteMessage(){
			var id = $("#messageId").val();
			$.ajax({
				type:"DELETE",
				url:"/api/admin/message/delete",
				data:{
					id:id
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					paging(pageNo,pageSize)
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}

		function changeExaminied(status){
		    if(status == 0){
                $("#confirmButton").removeAttr("disabled");
                $("#userId").val("");
                $("#userPhone").val("");
		        $("#messageUser").hide();
			}else{
                $("#confirmButton").attr("disabled","disabled");
		        $("#messageUser").show();
			}
		}

        function regExpPhone(phone){
            if((/^1[3456789]\d{9}$/.test(phone))){
                return true;
            }else{
                return false;
            }
        }

        function checkUser(){
            var userPhone = $("#userPhone").val();
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
                        if(data == null){
                            $("#userId").val(data.userId);
                            $("#wrong").show();
                            $("#right").hide();
						}else{
                            $("#userId").val(data.userId);
                            $("#right").show();
                            $("#wrong").hide();
                            $("#confirmButton").removeAttr("disabled");
						}

                    },
                    error:function(jqXHR){
                        alert("发生错误："+ jqXHR.status);
                    }
                });
            }else{
                $("#userId").val("");
                $("#confirmButton").attr("disabled","disabled");
                $("#right").hide();
                $("#wrong").show();
            }
        }

	</script>

</body>

</html>