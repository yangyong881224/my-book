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
							<h2><i class="fa fa-table red"></i><span class="break"></span><strong>用户管理</strong></h2>
						</div>
						<div class="panel-body">
							<table class="table table-bordered table-striped table-condensed table-hover">
								<thead>
									<tr>
										<th>编号</th>
										<th>用户名</th>
										<th>昵称</th>
										<th>身份证号</th>
										<th>用户身份</th>
										<th>创建日期</th>
										<th>最后登录</th>
										<th>操作</th>
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
	
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Modal title</h4>
				</div>
				<div class="modal-body">
					<p>Here settings can be configured...</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
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
        }else{
            alert("已经是第一页了，你还要翻上南天门吗？");
		}
    }

    function next(){
        var totalPage = Math.ceil(total/pageSize);
        if(pageNo < totalPage){
            pageNo = pageNo + 1;
            paging(pageNo,pageSize);
        }else{
            alert("这是最后一页了，你要翻到地狱吗？");
		}
    }
    function paging(){
        $.ajax({
            type:"GET",
            url:"/api/admin/user/paging",
            data:{
                pageNo:1,
                pageSize:20
            },
            dataType:"json",
            contentType:"application/x-www-form-urlencoded",
            success:function(data){
                $("#tbody").html("");
                if(data.empty == false){
                    var html = "";
                    data.data.forEach(function(user,index){
                        html += "<tr>" +
                            "<td>" + (index + 1) +"</td>" +
                            "<td>" + user.username +"</td>" +
                            "<td>" + user.userNickname +"</td>" +
                            "<td>" + user.userIdCard +"</td>" +
                            "<td>" + (user.userType=="ADMIN"?"管理员":user.userType=="EDITOR"?"网络编辑":user.userType=="AUTHOR"?"网文作者":user.userType=="MEMBER"?"会员":"普通用户") +"</td>" +
                            "<td>" + user.createdAt +"</td>" +
                            "<td>" + user.userLastLogin +"</td>" +
                            "<td><a href='javascript:void(alert(\"好冷啊~(╯﹏╰)b\"))'>冻结</a></td>" +
                            "</tr>";
                    });
                    $("#tbody").html(html)
                }else{
                    alert("啥也没有");
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