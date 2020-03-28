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
							<h2><i class="fa fa-table red"></i><span class="break"></span><strong><a href="/choice">题库管理</a>/ 修改习题</strong></h2>
						</div>
						<div class="panel-body" style="height:90%;">
							<div id="myTabContent" class="tab-content">
								<div class="form-horizontal ">
									<div class="form-group">
										<label class="col-md-3 control-label" for="textarea-input">问题</label>
										<div class="col-md-9">
											<textarea id="textarea-input" name="textarea-input" rows="4" class="form-control" placeholder="请输入问题" style="resize: none"></textarea>
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">题型</label>
										<div class="col-md-9">
											<label class="radio-inline" for="inline-radio1">
												<input type="radio" id="inline-radio1" name="inline-radios" value="1" checked onclick="changeType(1)"> 单选题
											</label>
											<label class="radio-inline" for="inline-radio2">
												<input type="radio" id="inline-radio2" name="inline-radios" value="2" onclick="changeType(2)"> 多选题
											</label>
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">答案</label>
										<div class="col-md-9" id="oneAnswer">
											<div class="radio">
												<label for="radio1">
													<input type="radio" id="radio1" name="radios" value="A">
													<input type="text" name="text-input1" class="form-control" placeholder="答案A">
												</label>
											</div>
											<div class="radio">
												<label for="radio2">
													<input type="radio" id="radio2" name="radios" value="B">
													<input type="text" name="text-input1" class="form-control" placeholder="答案B">
												</label>
											</div>
											<div class="radio">
												<label for="radio3">
													<input type="radio" id="radio3" name="radios" value="C">
													<input type="text" name="text-input1" class="form-control" placeholder="答案C">
												</label>
											</div>
											<div class="radio">
												<label for="radio4">
													<input type="radio" id="radio4" name="radios" value="D">
													<input type="text" name="text-input1" class="form-control" placeholder="答案D">
												</label>
											</div>
										</div>

										<div class="col-md-9" id="moreAnswer" hidden>
											<div class="checkbox">
												<label for="checkbox1">
													<input type="checkbox" id="checkbox1" name="checkbox" value="A">
													<input type="text" name="text-input2" class="form-control" placeholder="答案A">
												</label>
											</div>
											<div class="checkbox">
												<label for="checkbox2">
													<input type="checkbox" id="checkbox2" name="checkbox" value="B">
													<input type="text" name="text-input2" class="form-control" placeholder="答案B">
												</label>
											</div>
											<div class="checkbox">
												<label for="checkbox3">
													<input type="checkbox" id="checkbox3" name="checkbox" value="C">
													<input type="text" name="text-input2" class="form-control" placeholder="答案C">
												</label>
											</div>
											<div class="checkbox">
												<label for="checkbox4">
													<input type="checkbox" id="checkbox4" name="checkbox" value="D">
													<input type="text" name="text-input2" class="form-control" placeholder="答案D">
												</label>
											</div>
										</div>
									</div>
								</div>
								<div id="dfoot" style="height:5%;width: 100%;">
									<button type="button" class="btn btn-sm btn-success" style="float: right;margin-right: 30px" onclick="udpateChoice()"><i class="fa fa-dot-circle-o"></i> 保存</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end: Content -->
		<!--/container-->
	</div>
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">提示</h4>
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


	<!-- end: JavaScript-->
	<script>
		var choiceId = ${choiceId};
		initChoice(choiceId)
		function initChoice(choiceId){
			$.ajax({
				type:"GET",
				url:"/api/admin/choice/" + choiceId,
				data:{
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					var choice = data;
					if(data != null){
						$("#textarea-input").val(choice.choiceQuestion);
						changeType(choice.choiceType);
						if(choice.choiceType == 1){
							$("#inline-radio1").attr("checked",true);
							//单选正确答案checked
							var radios = $("input[name='radios']");
							for(var i = 0; i < radios.length; i ++){
								if(radios[i].value == choice.choiceTrue){
									radios[i].checked = true;
									break;
								}
							}
							//答案value赋值
							var inputs = $("input[name='text-input1']");
							inputs[0].value = choice.answerMap["A"];
							inputs[1].value = choice.answerMap["B"];
							inputs[2].value = choice.answerMap["C"];
							inputs[3].value = choice.answerMap["D"];
						}else if(choice.choiceType == 2){
							$("#inline-radio2").attr("checked",true);
							//多选正确答案checked
							var checkboxs = $("input[name='checkbox']");
							var choiceTrues = choice.choiceTrue.split(",");
							for(var i = 0; i < checkboxs.length; i ++){
								for(var j = 0; j < choiceTrues.length; j ++){
									if(checkboxs[i].value == choiceTrues[j]){
										checkboxs[i].checked = true;
										break;
									}
								}
							}
							//答案value赋值
							var inputs = $("input[name='text-input2']");
							inputs[0].value = choice.answerMap["A"];
							inputs[1].value = choice.answerMap["B"];
							inputs[2].value = choice.answerMap["C"];
							inputs[3].value = choice.answerMap["D"];
						}
					}else{
						$("#msg").html("保存失败，请刷新页面重试或者联系管理员！")
						$("#myModal").modal("show");
					}
				},
				error:function(jqXHR){
					alert("发生错误："+ jqXHR.status);
				}
			});
		}

		//题型变更
		function changeType(type){
			if(type == 2){
				$("#oneAnswer").hide();
				$("#moreAnswer").show();
			}else if(type == 1){
				$("#oneAnswer").show();
				$("#moreAnswer").hide();
			}
		}
		//更新
		function udpateChoice(){
			var choiceId = ${choiceId};
			var categoriesId = $("#parent3").val();
			var choiceQuestion = $("#textarea-input").val();
			var choiceType = $("input[name='inline-radios']:checked").val();
			var choiceAnswer = "";
			var choiceTrue = "";
			var params = [];
			//判断题型，拼接相应的答案与正确答案
			if(choiceType == 1){
				choiceTrue = $("input[name='radios']:checked").val();
				var answers = $("input[name='text-input1']");
				var num = $("input[name='radios']");
				for(var i = 0; i < answers.length; i ++){
					if(answers[i].value.trim() != ""){
						params.push({"num":num[i].value,"answer":answers[i].value});
					}
				}
			}else if(choiceType == 2){
				var checkeds = $("input[name='checkbox']:checked");
				for(var i = 0 ; i < checkeds.length ; i ++){
					choiceTrue += checkeds[i].value + ",";
				}
				choiceTrue = choiceTrue.substring(0,choiceTrue.length-1);
				var answers = $("input[name='text-input2']");
				var num = $("input[name='checkbox']");
				for(var i = 0 ; i < answers.length ; i ++){
					if(answers[i].value.trim() != ""){
						params.push({"num":num[i].value,"answer":answers[i].value})
					}
				}
			}
			//将答案转换成JSON格式
			choiceAnswer = JSON.stringify(params);
			$.ajax({
				type:"PUT",
				url:"/api/admin/choice/update",
				data:{
					choiceId: choiceId,
					categoriesId : categoriesId,
					choiceQuestion : choiceQuestion,
					choiceAnswer : choiceAnswer,
					choiceTrue : choiceTrue,
					choiceType : choiceType
				},
				dataType:"json",
				contentType:"application/x-www-form-urlencoded",
				success:function(data){
					if(data == true){
						$("#msg").html("修改成功！");
						$("#myModal").modal("show");
					}else{
						$("#msg").html("保存失败，请刷新页面重试或者联系管理员！")
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