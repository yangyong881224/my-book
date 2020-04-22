<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/3/28
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>


    </div>
</body>

<script>
    $.ajax({
        type: "POST",
        url: "/user/api/study/exam",
        data: {
            pageNo: pageNo,
            pageSize: pageSize
        },
        dataType: "json",
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            $("#tbody").html("");
            var html = "";
            data.data.forEach(function(paper,index){
                html += "<tr>";
                html += "<td style='float:left'>";
                html += paper.paperName;
                html += "</td>";
                html += "<td>"+ paper.paperTime +"</td>";
                html += "<td><a href=""><input type='button' value='考试'></a></td>";
                html += "</tr>";
            });
            $("#tbody").html(html);

        },
        error: function (jqXHR) {
            alert("发生错误：" + jqXHR.status);
        }
    })

</script>
</html>
