<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<jsp:include page="header.jsp"/>
<!-- end: Header -->

<jsp:include page="menu.jsp"/>
						
		<!-- start: Content -->
		<div class="main sidebar-minified">
		
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2><i class="fa fa-table red"></i><span class="break"></span><strong>习题管理</strong></h2>
							<div class="panel-actions">
								<button type="button" class="btn btn-primary btn-setting" onclick="showConfirm()"><i class="fa fa-plus"></i>新建</button>
							</div>
						</div>
						<div class="panel-body">
							<table class="table table-striped table-bordered bootstrap-datatable datatable">
								<thead>
									  <tr>
										 <th style="width:5%">编号</th>
										 <th>标题</th>
										 <th>答题时间</th>
										 <th>发布情况</th>
										 <th style="width:20%">操作</th>
									  </tr>
								  </thead>   
								  <tbody id="tbody">

								  </tbody>
							 </table>  
							 <ul class="pagination"  style="float:right;margin-right: 50px">
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
	
	<div class="modal fade" id="changeModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">修改</h4>
					<input type="hidden" id="paperId" value="" readonly>
				</div>
				<div class="modal-body">
					<table class="table table-bordered table-striped table-condensed table-hover">
						<tr>
							<td>标题：</td>
							<td><input type="text" id="paperName1"></td>
						</tr>
						<tr>
							<td>答题时间(分钟)：</td>
							<td><input type="number" id="paperTime1"></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="updatePaper()">保存</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">新建</h4>
				</div>
				<div class="modal-body">
					<table class="table table-bordered table-striped table-condensed table-hover">
						<tr>
							<td>标题：</td>
							<td><input type="text" id="paperName"></td>
						</tr>
						<tr>
							<td>答题时间(分钟)：</td>
							<td><input type="number" id="paperTime"></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="createPaper()">保存</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<div class="modal fade" id="deleteModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">警告</h4>
					<input type="hidden" id="paperId2" readonly>
				</div>
				<div class="modal-body">
					<table class="table table-bordered table-striped table-condensed table-hover">
						删除试卷将无法恢复，是否确认删除？
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="deletePaper()">确认</button>
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
				url:"/api/admin/paper/list",
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
						data.list.forEach(function(paper,index){
						    var releaseType = "";
						    if(paper.paperStatus == 1){
								releaseType = "<input type='checkbox' class='switch-input' checked onclick='releasePaper(\""+paper.paperId+"\",\"0\")'>";
							}else{
                                releaseType = "<input type='checkbox' class='switch-input' onclick='releasePaper(\""+paper.paperId+"\",\"1\")'>";
							}
							html += "<tr>" +
									"<td>" + (index + 1) +"</td>" +
									"<td>" + paper.paperName +"</td>" +
									"<td>" + paper.paperTime +"</td>" +

									"<td>" +
										"<div class='col-md-1 col-sm-2 col-xs-3'>" +
										"<label class='switch switch-info'>" +
										releaseType +
										"<span class='switch-label' data-on='已发布' data-off='未发布'></span>" +
										"<span class='switch-handle'></span>" +
										"</label>" +
										"</div>" +
									"</td>" +
									
									"<td><a href='javascript:void(0)' class='btn btn-info' onclick='changePaper(\""+paper.paperId+"\",\""+paper.paperName+"\",\""+paper.paperTime+"\")'><i class='fa fa-edit'></i></a> " +
									"<a href='/"+paper.paperId+"/paper_add_choice' class='btn btn-success'><i class='fa fa-external-link'></i></a> " +
									"<a href='javascript:void(0)' class='btn btn-danger' onclick='showDelete(\""+paper.paperId+"\")'><i class='fa fa-trash-o'></i></a></td>" +
									"</tr>";
						});
						$("#tbody").html(html);

					}else{
						alert(data.msg);
					}
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}

		function changePaper(paperId,paperName,paperTime){
			$("#paperId").val(paperId);
			$("#paperName1").val(paperName);
			$("#paperTime1").val(paperTime);
			$("#changeModal").modal("show");
		}

		function showConfirm(){
			$("#paperName").val("");
		}

		function showDelete(paperId){
			$("#paperId").val(paperId);
			$("#deleteModal").modal("show");
		}

		function createPaper(){
			var paperName = $("#paperName").val();
			var paperTime = $("#paperTime").val();
			$.ajax({
				type:"POST",
				url:"/api/admin/paper/create",
				data:{
					paperName:paperName,
					paperTime:paperTime
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					if(data == true){
						paging(1,20);
					}
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}

		function updatePaper(){
			var paperId = $("#paperId").val();
			var paperName = $("#paperName1").val();
			var paperTime = $("#paperTime1").val();
			$.ajax({
				type:"PUT",
				url:"/api/admin/paper/update",
				data:{
					paperId:paperId,
					paperName:paperName,
					paperTime:paperTime
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					if(data == true){
						paging(pageNo,pageSize);
					}
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}

		function releasePaper(paperId,paperStatus){
            $.ajax({
                type:"PUT",
                url:"/api/admin/paper/update",
                data:{
                    paperId:paperId,
                    paperStatus:paperStatus
                },
                dataType:"json",
                contentType:"application/x-www-form-urlencoded",
                success:function(data){
                    if(data == true){
                        paging(pageNo,pageSize);
					}
                },
                error:function(jqXHR){
                    alert("发生错误："+ jqXHR.status);
                }
            });
		}

		function deletePaper(){
			var paperId = $("#paperId").val();
			$.ajax({
				type:"DELETE",
				url:"/api/admin/paper/delete",
				data:{
					paperId:paperId,
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					if(data == true){
						paging(pageNo,pageSize);
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