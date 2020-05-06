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
	    <title>消息审核</title>

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
							<h2><i class="fa fa-table red"></i><span class="break"></span><strong>消息审核</strong></h2>
							<div class="panel-actions">
								<button type="button" class="btn btn-primary" onclick="createChoice()"><i class="fa fa-plus"></i>新建</button>
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
					<input type="hidden" id="choiceId" readonly>
				</div>
				<div class="modal-body">
					<span id="msg">删除后将无法恢复，是否确认删除</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="deleteChoice()">确认</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<div class="clearfix"></div>

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
				url:"/api/admin/message_examine/paging",
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

							if(message.examineStatus == 0){
								statusHtml = "未审核";
							}else if (message.examineStatus == 1){
								statusHtml = "审核通过，消息已发送";
							}else{
								statusHtml = "审核未通过";
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
                                "<td>" + "审核" + "</td>" +
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

		function showConfirm(choiceId){
			$("#choiceId").val(choiceId);
			$("#deleteModal").modal("show");
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


	</script>

</body>

</html>