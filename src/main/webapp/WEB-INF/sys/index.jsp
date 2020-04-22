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
    <title>登录</title>

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="<%= path%>/assets/ico/favicon.ico" type="image/x-icon" />

    <!-- Css files -->
    <link href="<%= path%>/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= path%>/assets/css/jquery.mmenu.css" rel="stylesheet">
    <link href="<%= path%>/assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%= path%>/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
    <link href="<%= path%>/assets/css/style.min.css" rel="stylesheet">
    <link href="<%= path%>/assets/css/add-ons.min.css" rel="stylesheet">
    <style>
        footer {
            display: none;
        }
    </style>
</head>
</head>

<body>
<div class="container-fluid content">
    <div class="row">
        <div id="content" class="col-sm-12 full">
            <div class="row">
                <div class="login-box">

                    <div class="header">
                        图书管理后台
                    </div>
                    <form class="form-horizontal login" action="/welcome" method="get" onsubmit="return checkLogin();">

                        <fieldset class="col-sm-12">
                            <div class="form-group">
                                <div class="controls row">
                                    <div class="input-group col-sm-12">
                                        <input type="text" class="form-control" id="username" placeholder="请输入用户名"/>
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="controls row">
                                    <div class="input-group col-sm-12">
                                        <input type="password" class="form-control" id="password" placeholder="请输入密码"/>
                                        <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                    </div>
                                </div>
                            </div>

                            <div class="confirm">
                                <%--@declare id="remember"--%><input type="checkbox" onclick="javascript:void(alert('点我也没用，我记性不好！'))"/>
                                <label for="remember">记住密码</label>
                            </div>

                            <div class="row">

                                <button type="submit" class="btn btn-lg btn-primary col-xs-12">登录</button>

                            </div>

                        </fieldset>

                    </form>

                    <a class="pull-left" href="javascript:void(alert('完了吧？傻了吧？'))">忘记密码?</a>
<%--                    <a class="pull-right" href="page-register.html">注册!</a>--%>

                    <div class="clearfix"></div>

                </div>
            </div><!--/row-->

        </div>

    </div><!--/row-->

</div><!--/container-->


<!-- start: JavaScript-->
<!--[if !IE]>-->

<script src="<%= path%>/assets/js/jquery-2.1.1.min.js"></script>

<!--<![endif]-->

<!--[if IE]>

<script src="<%= path%>/assets/js/jquery-1.11.1.min.js"></script>

<![endif]-->

<!--[if !IE]>-->

<script type="text/javascript">
    window.jQuery || document.write("<script src='<%= path%>/assets/js/jquery-2.1.1.min.js'>"+"<"+"/script>");
</script>

<!--<![endif]-->

<!--[if IE]>

<script type="text/javascript">
    window.jQuery || document.write("<script src='<%= path%>/assets/js/jquery-1.11.1.min.js'>"+"<"+"/script>");
</script>

<![endif]-->
<script src="<%= path%>/assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%= path%>/assets/js/bootstrap.min.js"></script>


<!-- page scripts -->

<!-- theme scripts -->
<script src="<%= path%>/assets/js/SmoothScroll.js"></script>
<script src="<%= path%>/assets/js/jquery.mmenu.min.js"></script>
<script src="<%= path%>/assets/js/core.min.js"></script>
<script>
    function checkLogin(){
        var username = $("#username").val();
        var password = $("#password").val();
        var result = false;
        $.ajax({
            type:"POST",
            url:"/api/admin/login",
            data:{
                username: username,
                password:password
            },
            dataType:"json",
            async: false,
            contentType:"application/x-www-form-urlencoded",
            success: function (data) {
                result = data;
            }
        });
        if(!result){
            alert("用户名密码错误");
        }
        return result;
    }
</script>
</body>
</html>