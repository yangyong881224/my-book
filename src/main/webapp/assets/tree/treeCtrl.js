(function(angular) {
    'use strict';

    //// JavaScript Code ////
    function treeCtrl($log,$timeout,toaster) {
        var vm = this;

        var newId = 1;
        vm.ignoreChanges = false;
        vm.newNode = {};
        vm.originalData = [
            { id : 'user', parent : '#', text : ' 用户管理', state: { opened: true} },
            { id : 'role', parent : '#', text : ' 权限管理', state: { opened: true} },
            { id : 'role_made', parent : 'role', text : ' 角色管理', state: { opened: true} },
            { id : 'role_user', parent : 'role', text : ' 账号管理', state: { opened: true} },
            { id : 'exercises', parent : '#', text : ' 习题管理', state: { opened: true} },
            { id : 'exercises_categories', parent : 'exercises', text : ' 类目管理', state: { opened: true} },
            { id : 'exercises_choice', parent : 'exercises', text : ' 题库管理', state: { opened: true} },
            { id : 'exercises_paper', parent : 'exercises', text : ' 试卷管理', state: { opened: true} },
            { id : 'book', parent : '#', text : ' 图书管理', state: { opened: true} },
            { id : 'message', parent : '#', text : ' 消息管理' , state: { opened: true} },
            { id : 'message_type', parent : 'message', text : ' 消息类型' , state: { opened: true}},
            { id : 'message_list', parent : 'message', text : ' 消息列表' , state: { opened: true}},
            { id : 'message_examine', parent : 'message', text : ' 消息审核' , state: { opened: true}},
            { id : 'templates', parent : '#', text : ' 模板下载' , state: { opened: true}}
        ];
        vm.treeData = [];
        angular.copy(vm.originalData,vm.treeData);
        vm.treeConfig = {
            core : {
                multiple : true,
                animation: true,
                error : function(error) {
                    $log.error('treeCtrl: error from js tree - ' + angular.toJson(error));
                },
                check_callback : true,
                worker : true
            },
            types : {
                default : {
                    icon : 'glyphicon glyphicon-flash'
                },
                star : {
                    icon : 'glyphicon glyphicon-star'
                },
                cloud : {
                    icon : 'glyphicon glyphicon-cloud'
                }
            },
            version : 1,
            plugins : ['types','checkbox']
        };


        vm.reCreateTree = function() {
            vm.ignoreChanges = true;
            angular.copy(this.originalData,this.treeData);
            vm.treeConfig.version++;
        };

        vm.simulateAsyncData = function() {
            vm.promise = $timeout(function(){
                vm.treeData.push({ id : (newId++).toString(), parent : vm.treeData[0].id, text : 'Async Loaded' })
            },3000);
        };

        vm.addNewNode = function() {
            vm.treeData.push({ id : (newId++).toString(), parent : vm.newNode.parent, text : vm.newNode.text });
        };

        this.setNodeType = function() {
            var item = _.findWhere(this.treeData, { id : this.selectedNode } );
            item.type = this.newType;
            toaster.pop('success', 'Node Type Changed', 'Changed the type of node ' + this.selectedNode);
        };

        this.readyCB = function() {
            $timeout(function() {
                vm.ignoreChanges = false;
                // toaster.pop('success', 'JS Tree Ready', 'Js Tree issued the ready event')
            });
        };

        this.createCB  = function(e,item) {
            $timeout(function() {toaster.pop('success', 'Node Added', 'Added new node with the text ' + item.node.text)});
        };

        this.applyModelChanges = function() {
            return !vm.ignoreChanges;
        };

    }

    //// Angular Code ////

    angular.module('ngJsTreeDemo').controller('treeCtrl', treeCtrl);

})(angular);