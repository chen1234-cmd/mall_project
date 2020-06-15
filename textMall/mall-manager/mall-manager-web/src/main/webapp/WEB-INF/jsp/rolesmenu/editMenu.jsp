<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>编辑菜单</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all" />
	<style type="text/css">
		.layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
		@media(max-width:1240px){
			.layui-form-item .layui-inline{ width:100%; float:none; }
		}
	</style>
</head>
<body class="childrenBody">
	<form class="layui-form" style="width: 80%; padding-top: 35px;" id="fromdata">
		<input type="hidden" name="menuId" id="menuId" />
		<div class="layui-form-item">
			<label class="layui-form-label">菜单名</label>
			<div class="layui-input-block">
				<input type="text" id="title" class="layui-input userName"
					lay-verify="required" placeholder="请输入菜单名" name="title" value="">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">图标</label>
			<div class="layui-input-block">
				<input type="text" id="icon" class="layui-input userName"
					 placeholder="请填写图标代码" name="icon" value="">
					<label>（例：<text>&amp;#xe642;</text>）</label>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">资源路径</label>
			<div class="layui-input-block">
				<input type="text" id="href" name="href" class="layui-input userName"
					 placeholder="请输入资源路径" value="">
					<label>（<span style="color: red">*</span>例：log/logList）</label>
			</div>
		</div>
		<div class="layui-form-item" style="padding-top: 10px;">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="editRole">立即提交</button>
		    </div>
		</div>
	</form>
</body>
<script src="../layui/js/jquery.js"></script>
<script src="../../../layuiadmin/layui/layui.js"></script>  
<script>
// var table;
// var layer;
// var form;
// var upload;
// var laydate;
	layui.config({
	  base: '../../../layuiadmin/' //静态资源所在路径
	}).extend({
	  index: 'lib/index' //主入口模块
	}).use(['index','useradmin', 'table','layer'], function(){
	 table = layui.table;
	 layer = layui.layer;
	 form =layui.form;
	 laydate=layui.laydate
	 var menuId =sessionStorage.getItem("menuId");
	// var href =sessionStorage.getItem("href");
	// var icon =sessionStorage.getItem("icon");
	// var title =sessionStorage.getItem("title");
		$('#menuId').val(menuId);
		// $('#icon').val(icon);
		// $('#href').val(href);
		// $('#title').val(title);
		
	 form.on("submit(editRole)",function(data){
		 
			// $.post("/edtMenuList",$("#fromdata").serialize(),function(data){
			// 	console.log('data'+data);
			// 		// if(data.status==200){
			// 		// 	msg="修改成功";
			// 		// }else{
			// 		// 	msg="修改失败";
			// 		// }
			// });
			 $.ajax({
				 type:'post',
			      url: "/edtMenuList",
			      data:$("#fromdata").serialize(),
				  dataType: "json",
			      success:function(resule){
					  console.log(resule);
					  alert(123);
			 		if(resule.status==200){
			 			// msg="修改成功";
						alert("修改成功");
			 		}else{
			 			msg="修改失败";
			 		}
			 	}
			  });
		 
	 });
	 
})


</script>
</html>
