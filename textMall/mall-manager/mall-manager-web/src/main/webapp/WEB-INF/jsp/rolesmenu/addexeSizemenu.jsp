<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>添加菜单</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="../layui/css/layui.css" media="all" />
	<style type="text/css">
		.layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
		@media(max-width:1240px){
			.layui-form-item .layui-inline{ width:100%; float:none; }
		}
	</style>
</head>
<body class="childrenBody">
	<form class="layui-form" style="width: 80%; padding-top: 30px;" id="AddSizeMenu">
			<input type="hidden" name="parentId" value="0" id="parentId" />
			<input type="hidden" name="spread" value="false" id="spread" />
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
			<div class="layui-form-item">
				<label class="layui-form-label">排序</label>
				<div class="layui-input-block">
					<input type="number" id="sorting" name="sorting" class="layui-input userName"
						placeholder="排序(整数)" lay-verify="require" value="">
						<label>（<span style="color: red">*</span>例：999）</label>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">权限标识</label>
				<div class="layui-input-block">
					<input type="text" id="perms" name="perms" class="layui-input userName"
						placeholder="权限标识" value="">
					<label>（例：sys:role:list）</label>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit="" lay-filter="addMEenu">立即提交</button>
			    </div>
			</div>
	</form>
</body>
<script src="../layui/js/jquery.js"></script>
<script src="../../../layuiadmin/layui/layui.js"></script>   
<script>
var table;
var layer;
var form;
var upload;
var laydate;
	layui.config({
	  base: '../../../layuiadmin/' //静态资源所在路径
	}).extend({
	  index: 'lib/index' //主入口模块
	}).use(['jquery','index','useradmin', 'table'], function(){
	 table = layui.table;
	 layer = layui.layer;
	 form =layui.form;
	 laydate=layui.laydate
			
	var parentId= sessionStorage.getItem("menuId");
	$('#parentId').val(parentId);
	 form.on("submit(addMEenu)",function(data){
			$.ajax({
		      type: "POST",
		      url: "/addmenulist",
		      data:$("#AddSizeMenu").serialize(),
			  success:function(data){
				if(data.status==200){
					msg="添加成功";
				}else{
					msg="添加失败";
				}
			 }
		  });
	 })
	 
})


</script>
</html>
