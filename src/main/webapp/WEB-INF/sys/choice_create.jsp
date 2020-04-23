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
		//插入
		function createChoice(){

		}

	</script>

</body>

</html>