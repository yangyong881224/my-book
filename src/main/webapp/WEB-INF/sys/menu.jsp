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
    <title>图书馆后台</title>

    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="<%= path%>/assets/ico/favicon.ico" type="image/x-icon" />

    <!-- Css files -->
    <link href="<%= path%>/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= path%>/assets/css/jquery.mmenu.css" rel="stylesheet">
    <link href="<%= path%>/assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%= path%>/assets/css/climacons-font.css" rel="stylesheet">
    <link href="<%= path%>/assets/plugins/xcharts/css/xcharts.min.css" rel=" stylesheet">
    <link href="<%= path%>/assets/plugins/fullcalendar/css/fullcalendar.css" rel="stylesheet">
    <link href="<%= path%>/assets/plugins/morris/css/morris.css" rel="stylesheet">
    <link href="<%= path%>/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
    <link href="<%= path%>/assets/plugins/jvectormap/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
    <link href="<%= path%>/assets/css/style.min.css" rel="stylesheet">
    <link href="<%= path%>/assets/css/add-ons.min.css" rel="stylesheet">

</head>
</head>

<body>
<div class="container-fluid content">

    <div class="row">
    <div class="sidebar ">

        <div class="sidebar-collapse">
            <div class="sidebar-header t-center">
                <span><img class="text-logo" src="<%= path%>/assets/img/logo1.png"><i class="fa fa-space-shuttle fa-3x red"></i></span>
            </div>
            <div class="sidebar-menu">
                <ul class="nav nav-sidebar">

                    <li id="user" style="display:none"><a href="/user"><i class="fa fa-table"></i><span class="text"> 用户管理</span></a></li>
                    <li id="role" style="display:none">
                        <a href="#"><i class="fa fa-bolt"></i><span class="text"> 权限管理</span> <span class="fa fa-angle-down pull-right"></span></a>
                        <ul class="nav sub">
                            <li id="role_made" style="display:none"><a href="/role"><i class="fa fa-meh-o"></i><span class="text"> 角色管理</span></a></li>
                            <li id="role_user" style="display:none"><a href="/role_user"><i class="fa fa-meh-o"></i><span class="text"> 账号管理</span></a></li>
                        </ul>
                    </li>
                    <li id="exercises" style="display:none">
                        <a href="#"><i class="fa fa-signal"></i><span class="text"> 习题管理</span> <span class="fa fa-angle-down pull-right"></span></a>
                        <ul class="nav sub">
                            <li id="exercises_categories" style="display:none"><a href="/categories"><i class="fa fa-random"></i><span class="text"> 类目管理</span></a></li>
                            <li id="exercises_choice" style="display:none"><a href="/choice"><i class="fa fa-retweet"></i><span class="text"> 题库管理</span></a></li>
                            <li id="exercises_paper" style="display:none"><a href="/paper"><i class="fa fa-bar-chart-o"></i><span class="text"> 试卷管理</span></a></li>
                        </ul>
                    </li>
                    <li id="book" style="display:none"><a href="#"><i class="fa fa-life-bouy"></i><span class="text"> 图书管理</span></a></li>
                    <li id="message" style="display:none">
                        <a href="#"><i class="fa fa-bolt"></i><span class="text"> 消息管理</span> <span class="fa fa-angle-down pull-right"></span></a>
                        <ul class="nav sub">
                            <li id="message_type" style="display:none"><a href="/message_type"><i class="fa fa-meh-o"></i><span class="text"> 消息类型</span></a></li>
                            <li id="message_list" style="display:none"><a href="/message"><i class="fa fa-meh-o"></i><span class="text"> 消息列表</span></a></li>
                            <li id="message_examine" style="display:none"><a href="/message_examine"><i class="fa fa-meh-o"></i><span class="text"> 消息审核</span></a></li>
                        </ul>
                    </li>
                    <li id="templates"  style="display:none"><a href="/templates"><i class="fa fa-picture-o"></i><span class="text">模版下载</span></a></li>

                </ul>
            </div>
        </div>
        <div class="sidebar-footer">

            <div class="sidebar-brand">
                图书馆
            </div>

            <ul class="sidebar-terms">
                <li><a href="#">Terms</a></li>
                <li><a href="#">Privacy</a></li>
                <li><a href="#">Help</a></li>
                <li><a href="#">About</a></li>
            </ul>

            <div class="copyright text-center">
                <small>my-book <i class="fa fa-coffee"></i> from <a href="javascript:void(0)" title="Yayo" target="_blank">Yayo</a></small>
            </div>
        </div>
    </div>
    </div>
</div>
<script>

    $.ajax({
        type:"GET",
        url:"/api/admin/checkRole",
        data:{},
        dataType:"json",
        contentType:"application/x-www-form-urlencoded",
        async: false,
        success:function(data){

            var permissionList = data;
            for(var i = 0 ; i < permissionList.length; i ++){
                if("user" == permissionList[i]){
                    $("#user").show();
                }else if("role" == permissionList[i]){
                    $("#role").show();
                }else if("role_made" == permissionList[i]){
                    $("#role").show();
                    $("#role_made").show();
                }else if("role_user" == permissionList[i]){
                    $("#role").show();
                    $("#role_user").show();
                }else if("exercises" == permissionList[i]){
                    $("#exercises").show();
                }else if("exercises_categories" == permissionList[i]){
                    $("#exercises").show();
                    $("#exercises_categories").show();
                }else if("exercises_choice" == permissionList[i]){
                    $("#exercises").show();
                    $("#exercises_choice").show();
                }else if("exercises_paper" == permissionList[i]){
                    $("#exercises").show();
                    $("#exercises_paper").show();
                }else if("book" == permissionList[i]){
                    $("#book").show();
                }else if("message" == permissionList[i]){
                    $("#message").show();
                }else if("message_type" == permissionList[i]){
                    $("#message").show();
                    $("#message_type").show();
                }else if("message_list" == permissionList[i]){
                    $("#message").show();
                    $("#message_list").show();
                }else if("message_examine" == permissionList[i]){
                    $("#message").show();
                    $("#message_examine").show();
                }else if("templates" == permissionList[i]){
                    $("#templates").show();
                }
            }
        },
        error:function(jqXHR){
            alert("发生错误："+ jqXHR.status);
        }
    });
</script>
</body>
</html>