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

                    <li><a href="/user"><i class="fa fa-table"></i><span class="text"> 用户管理</span></a></li>
                    <li>
                        <a href="#"><i class="fa fa-signal"></i><span class="text"> 习题管理</span> <span class="fa fa-angle-down pull-right"></span></a>
                        <ul class="nav sub">
                            <li><a href="/categories"><i class="fa fa-random"></i><span class="text"> 类目管理</span></a></li>
                            <li><a href="/choice"><i class="fa fa-retweet"></i><span class="text"> 题库管理</span></a></li>
                            <li><a href="/paper"><i class="fa fa-bar-chart-o"></i><span class="text"> 试卷管理</span></a></li>
                        </ul>
                    </li>
                    <li><a href="#l"><i class="fa fa-life-bouy"></i><span class="text"> 图书管理</span></a></li>
                    <li>
                        <a href="#"><i class="fa fa-bolt"></i><span class="text"> 消息管理</span> <span class="fa fa-angle-down pull-right"></span></a>
                        <ul class="nav sub">
                            <li><a href="#"><i class="fa fa-meh-o"></i><span class="text"> 消息类型</span></a></li>
                            <li><a href="#"><i class="fa fa-meh-o"></i><span class="text"> 消息列表</span></a></li>
                            <li><a href="#"><i class="fa fa-meh-o"></i><span class="text"> 消息审核</span></a></li>
                        </ul>
                    </li>
                    <li><a href="/templates"><i class="fa fa-picture-o"></i><span class="text">模版下载</span></a></li>
                </ul>
            </div>
        </div>
        <div class="sidebar-footer">

            <div class="sidebar-brand">
                图书馆
            </div>

            <ul class="sidebar-terms">
                <li><a href="index.html#">Terms</a></li>
                <li><a href="index.html#">Privacy</a></li>
                <li><a href="index.html#">Help</a></li>
                <li><a href="index.html#">About</a></li>
            </ul>

            <div class="copyright text-center">
                <small>my-book <i class="fa fa-coffee"></i> from <a href="javascript:void(0)" title="Yayo" target="_blank">Yayo</a></small>
            </div>
        </div>
    </div>
    </div>
</div>


    <!-- end: JavaScript-->

</body>
</html>