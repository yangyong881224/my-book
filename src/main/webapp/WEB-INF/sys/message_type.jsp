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
								<a href="javascript:void(0)"><button type="button" class="btn btn-primary" onclick="showCreate()"><i class="fa fa-plus"></i>新建</button></a>
							</div>
						</div>
						<div class="panel-body">
							<table class="table table-bordered table-striped table-condensed table-hover">
								<thead>
									  <tr>
										 <th style="width:5%">编号</th>
										 <th>消息图标</th>
										 <th>消息类型</th>
										 <th>是否可见</th>
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
					<input type="hidden" id="choiceId" readonly>
				</div>
				<div class="modal-body">
					<span id="msg">删除后将无法恢复，是否确认删除</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="deleteType()">确认</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

<div class="modal fade" id="createModel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">新建消息类型</h4>
			</div>
			<div class="modal-body">
				<div><img id="miscIcon" src="<%=path %>/assets/upload/misc_icon/default_misc_icon.png" style="width: 50px; height:50px;"></div>
				<div>消息图标：<input type="file" id="messageIcon"></div>
				<div>消息类型：<input type="text" id="messageType"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="createOrUpdate()">确认</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

	<div class="clearfix"></div>

	<!-- end: JavaScript-->
	<script>
		var id = null;
		var viewStatus = null;
		var imagePath = null;

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
				url:"/api/admin/message_type/paging",
				data:{
					pageNo:pageNo,
					pageSize:pageSize
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					$("#tbody").html("");
					if(data.total != 0 ){
						total = data.total;
						var html = "";
						data.data.forEach(function(messageType,index){
                            if(messageType.viewStatus == 1){
                                releaseType = "<input type='checkbox' class='switch-input' checked onclick='updateMessageType(\""+messageType.id+"\",0)'>";
                            }else{
                                releaseType = "<input type='checkbox' class='switch-input' onclick='updateMessageType(\""+messageType.id+"\",1)'>";
                            }
							html += "<tr>" +
									"<td>" + (index + 1) +"</td>" +
									"<td><img src='"+messageType.messageIcon+"' style='height:50px;width:50px'></td>" +
									"<td>" + messageType.messageType + "</td>" +
									"<td>" +
										"<div class='col-md-1 col-sm-2 col-xs-3'>" +
										"<label class='switch switch-info'>" +
										releaseType +
										"<span class='switch-label' data-on='可见' data-off='不可见'></span>" +
										"<span class='switch-handle'></span>" +
										"</label>" +
										"</div>" +
									"</td>" +
									"<td>" +
									"<a href='javascript:void(0)' class='btn btn-info' onclick='showUpdate()'><i class='fa fa-edit'></i></a> " +
									// "<a href='javascript:void(0)' class='btn btn-danger' onclick='showConfirm(\""+messageType.id+"\")'><i class='fa fa-trash-o'></i></a> " +
									"</td>" +
									"</tr>";
						});
						$("#tbody").html(html);

					}else{
                        $("#tbody").html("<tr><td colspan='5'>请添加类型...</td></tr>");
					}
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}

		function showCreate(){
			$("#createModel").modal("show");
		}

		function deleteChoice(){
			var choiceId = $("#choiceId").val();
			$.ajax({
				type:"DELETE",
				url:"/api/admin/choice/delete",
				data:{
					choiceId:choiceId
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

		function updateMessageType(typeId,typeViewStatus){
		    id = typeId;
		    viewStatus = typeViewStatus;
		    createOrUpdate();
		}

		function createOrUpdate(){
		    var messageType = $("#messageType").val();
            $.ajax({
                type:"POST",
                url:"/api/admin/message_type/create_or_update",
                data:{
                    id:id,
					messageIcon:imagePath,
					messageType:messageType,
					viewStatus:viewStatus
                },
                dataType:"json",
                contentType:"application/x-www-form-urlencoded",
                success:function(data){
					viewStatus = null;
					id = null;
					imagePath = null;
                    $("#messageType").val("");
                    // paging(pageNo,pageSize);
					window.location.reload();
                },
                error:function(jqXHR){
                    alert("发生错误："+ jqXHR.status);
                }
            });
		}


        var upload_file = document.getElementById("messageIcon");
        upload_file.addEventListener('change', upload, false);
        function upload(){
            var formData = new FormData();
            formData.append("image", document.getElementById("messageIcon").files[0]);
            formData.append("fileType", "miscIcon");
            $.ajax({
                url: "/api/admin/upload/image",
                type: "POST",
                data: formData,
                cache:false,
                /**
                 *必须false才会自动加上正确的Content-Type
                 */
                contentType: false,
                /**
                 * 必须false才会避开jQuery对 formdata 的默认处理
                 * XMLHttpRequest会对 formdata 进行正确的处理
                 */
                processData: false,
                xhr :function () {//这里我们先拿到jQuery产生的 XMLHttpRequest对象，为其增加 progress 事件绑定，然后再返回交给ajax使用
                    var xhr = new window.XMLHttpRequest();
                    //Upload progress, request sending to server
                    xhr.upload.addEventListener("progress", function(evt){
                        if (evt.lengthComputable) {
                            var percentComplete = evt.loaded / evt.total;
                            $("#percent").html(Math.round(percentComplete * 100) + "%");
                        }
                    }, false);
                    //Download progress
                    xhr.addEventListener("progress", function (evt) {
                        if (evt.lengthComputable) {
                            var percentComplete = evt.loaded / evt.total;
                            console.log(Math.round(percentComplete * 100) + "%");
                        }
                    }, false);
                    return xhr;
                },

                success: function (data) {
					imagePath = data;
					$("#miscIcon").attr("src","<%=path %>"+imagePath);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.responseText);
                    alert(thrownError);
                }
            });
        }
	</script>

</body>

</html>