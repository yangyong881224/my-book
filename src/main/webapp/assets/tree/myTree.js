(function(angular) {
    'use strict';

    //// JavaScript Code ////

    //// Angular Code ////

    angular.module('ngJsTreeDemo').controller('myTree', function($scope){
        var scope = $scope;
        var vm = this;
        this.confirmForm = function(){
            var selected_nodes = scope.myTree.jstree(true).get_selected();
            var rolePermission = selected_nodes.toString();
            var roleName = scope.roleName;
            var roleCode = scope.roleCode;
            var targetType = scope.targetType;
            if(rolePermission==null || rolePermission == ""
            || roleName == null || roleName == ""
            || roleCode == null || roleCode == ""
            || targetType == null || targetType == ""){
                alert("不能有空值");
                return false;
            }
            $.ajax({
                type:"POST",
                url:"/api/admin/role/create",
                data:{
                    roleName:roleName,
                    roleCode:roleCode,
                    targetType:targetType,
                    rolePermission:rolePermission
                },
                dataType:"json",
                contentType:"application/x-www-form-urlencoded",
                success:function(data){
                    if(data){
                        $("#roleForm").submit();
                    }else{
                        alert("系统异常！");
                    }
                },
                error:function(jqXHR){
                    alert("发生错误："+ jqXHR.status);
                }
            });
        }
    });

})(angular);