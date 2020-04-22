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
<jsp:include page="header.jsp"/>
<!-- end: Header -->

<jsp:include page="menu.jsp"/>
						
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
                    $("input[name='allcheck']").attr("checked",false);
                    $("input[name='allcheckDel']").attr("checked",false);
					if(data.total != 0 ){
						total = data.total;
						var html = "";
						data.data.forEach(function(choiceDTO,index){
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
						$("#tbody").html("<tr><td colspan='5'>题库已空~</td></tr>");
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
                    $("input[name='allcheck']").attr("checked",false);
                    $("input[name='allcheckDel']").attr("checked",false);
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
						$("#myChoice").html("<tr><td colspan='3'>尚未添加~</td></tr>");
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
			}else{
//todo 检查所有选框是否全选
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