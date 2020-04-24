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
			<div class="row" style="height:80vh">
				<div class="col-lg-12"  style="height:100%">
					<div class="panel panel-default"  style="height:100%">
						<div class="panel-heading">
							<h2><i class="fa fa-table red"></i><span class="break"></span><strong>类目管理</strong></h2>
						</div>
						<div class="panel-body" style="height:90%;">
							<div style="height:100% ;width: 20%;border:1px solid #000;float:left">
								<div style="height:10%;width:100%;">一级类目</div>
								<div style="height:90%;width:100%;">
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
									<div id="dfoot" style="height: 10%;">
										<input hidden readonly value="0" id="parent1">
										<div class="input-group">
											<input type="text" id="categoriesName1" class="form-control" placeholder="类目名称">
											<span class="input-group-btn">
												<button type="button" class="btn btn-success" onclick="newCategories(1)">添加</button>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div style="height:100% ;width: 20%;border:1px solid #000;float: left" hidden id="categories2">
								<div style="height:10%;width:100%;">二级类目</div>
								<div style="height:90%;width:100%;">
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
									<div id="dfoot2" style="height: 10%;">
										<input hidden readonly value="0" id="parent2">
										<div class="input-group">
											<input type="text" id="categoriesName2" class="form-control" placeholder="类目名称">
											<span class="input-group-btn">
												<button type="button" class="btn btn-success" onclick="newCategories(2)">添加</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div><!--/col-->
			</div><!--/row-->
   
		</div>
		<!-- end: Content -->
	</div><!--/container-->
	</div>
	
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">警告</h4>
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

	<script>

		getCategories(0);

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
					console.log()
					if(parentId == 0){
						$("#categoriesName1").val("");
						$("#dbody").html("");
						data.forEach(function(categories,index){
						    console.log(categories);
							html += "<div style='cursor:pointer' onmouseenter='mouseOver(this)' onmouseleave='mouseOut(this)' onclick='addCategories(this,\""+categories.categoriesId+"\")'>" +
									"<input hidden readonly value='"+categories.categoriesId+"'>" +
									"<i>"+categories.categoriesName+"</i>" +
									"<span class='fa fa-trash-o' style='display: none' onclick='deleteCategories(\""+categories.categoriesId+"\",\""+categories.categoriesParent+"\")'></span>" +
									"<span class='fa fa-pencil' style='display: none' onclick='updateCategories(\""+categories.categoriesId+"\",\""+categories.categoriesParent+"\",\""+categories.categoriesName +"\")'></span>" +
									"</div>";
						});
						$("#dbody").html(html);
					}else if(parentId != 0){
						$("#categoriesName2").val("");
						$("#dbody2").html("");
						data.forEach(function(categories,index){
							html += "<div style='cursor:pointer' onmouseenter='mouseOver(this)' onmouseleave='mouseOut(this)' >" +
									"<input hidden readonly value='"+categories.categoriesId+"'>" +
									"<i>"+categories.categoriesName+"</i>" +
									"<span class='fa fa-trash-o' style='display: none' onclick='deleteCategories(\""+categories.categoriesId+"\",\""+categories.categoriesParent+"\")'></span>" +
									"<span class='fa fa-pencil' style='display: none' onclick='updateCategories(\""+categories.categoriesId+"\",\""+categories.categoriesParent+"\",\""+categories.categoriesName +"\")'></span>" +
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
			div.children("span")[0].style = "float:right;margin-right: 10px;color:red;";
			div.children("span")[1].style = "float:right;margin-right: 10px;color:green;";
		}
		function mouseOut(obj){
			var div=$(obj);
			if(div.css("background-color")=="rgb(192, 192, 192)")
				div.css("background-color","");
			div.children("span")[0].style = "float:right;margin-right: 10px;color:red;display:none";
			div.children("span")[1].style = "float:right;margin-right: 10px;color:green;display:none";
		}
		//弹出二级类目
		function addCategories(obj,parentId){
			var div=$(obj);
			div.css("background-color","#A0A0A0");
			var ds = div.siblings();
			for(var i = 0 ; i < ds.length ; i ++){
				ds[i].style.backgroundColor = "";
			}
			$("#categories2").show();
			$("#parent2").val(parentId);
			getCategories(parentId);
		}
		//添加类目
		function newCategories(type){
			var parentId = 0;
			var categoriesName = "";
			if(type == 1){
				$("#categories2").hide();
				parentId = 0;
				categoriesName = $("#categoriesName1").val();
			}else if (type == 2){
				parentId = $("#parent2").val();
				categoriesName = $("#categoriesName2").val();
			}else{
				return ;
			}
			if(categoriesName.trim() == ""){
				return ;
			}
			$.ajax({
				type:"POST",
				url:"/api/admin/categories/insert",
				data:{
					categoriesName:categoriesName,
					categoriesParent:parentId
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					if(data == true){
						if(type == 1){
							getCategories(0);
						}else{
							getCategories(parentId);
						}
					}
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}

		//删除类目
		function deleteCategories(categoriesId,parentId){
			$.ajax({
				type:"DELETE",
				url:"/api/admin/categories/delete",
				data:{
					categoriesId:categoriesId
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					if(data == true ){
						if(parentId == 0){
							getCategories(0);
							$("#categories2").hide();
						}else{
							getCategories(parentId);
						}
					}else if(data == false){
						$("#msg").html("请先清空类目再删除或者刷新重试");
						$("#myModal").modal("show");
					}
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}

		function updateCategories(categoriesId,parentId,categoriesName){
			return ;
			$.ajax({
				type:"PUT",
				url:"/api/admin/categories/update",
				data:{
					categoriesId:categoriesId,
					categoriesName:categoriesName
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					if(data == true ){
						if(parentId == 0){
							getCategories(0);
							$("#categories2").hide();
						}else{
							getCategories(parentId);
						}
					}else if(data == false){
						$("#msg").html("更新失败，请刷新页面重试");
						$("#myModal").modal("show");
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