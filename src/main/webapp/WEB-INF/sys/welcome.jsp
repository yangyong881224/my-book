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
<!-- start: Header -->
<jsp:include page="header.jsp"/>
<!-- end: Header -->

<jsp:include page="menu.jsp"/>

    <!-- end: JavaScript-->

</body>
</html>