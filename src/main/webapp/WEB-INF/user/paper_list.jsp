<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/3/28
  Time: 23:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>试卷列表</title>
</head>
<body>
    <table>
        <thead>
            <th>试卷名</th>
            <th>考试时长</th>
            <th>操作</th>
        </thead>
        <tbody id="tbody">

        </tbody>
    </table>
</body>
<script src="/assets/js/jquery-2.1.1.min.js"></script>
<script>
    paging(1,20);
    function paging(pageNo,pageSize){
        $.ajax({
            type: "GET",
            url: "/user/api/study/paging",
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
                    html += "<td><a href='/user/api/extra/"+paper.paperId+"'><input type='button' value='考试'></a></td>";
                    html += "</tr>";
                });
                $("#tbody").html(html);

            },
            error: function (jqXHR) {
                alert("发生错误：" + jqXHR.status);
            }
        })
    }
</script>
</html>
