<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt">
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>个人资料</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="../../layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="../../layui/css/public.css" media="all" />
</head>
<body class="childrenBody">
<form class="layui-form layui-row" id="form1" style="padding-top: 30px;">
	<div class="layui-col-md3 layui-col-xs12 user_right">
		<div class="layui-upload-list">
			<img class="layui-upload-img layui-circle userFaceBtn userAvatar" id="userFace" src="${USER_SESSION.face}">
		</div>
		<button type="button" class="layui-btn layui-btn-primary userFaceBtn" name="face"><i class="layui-icon">&#xe67c;</i> 掐指一算，我要换一个头像了</button>
	</div>
	<div class="layui-col-md6 layui-col-xs12">
			<input type="hidden" name="id" id="UserId1" value="${USER_SESSION.id}" />
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input type="text" value="${USER_SESSION.username}" disabled class="layui-input layui-disabled">
			</div>
		</div>
	<!-- 	<div class="layui-form-item">
			<label class="layui-form-label">用户组</label>
			<div class="layui-input-block">
				<input type="text" value="超级管理员" disabled class="layui-input layui-disabled">
			</div>
		</div> -->
		<!-- <div class="layui-form-item">
			<label class="layui-form-label">真实姓名</label>
			<div class="layui-input-block">
				<input type="text" value="${USER_SESSION.username}" placeholder="" lay-verify="required" class="layui-input realName">
			</div>
		</div> -->
		<div class="layui-form-item" pane="">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-block userSex">
				<input type="radio" name="sex" value="${USER_SESSION.sex}" title="男" checked="">
				<input type="radio" name="sex" value="${USER_SESSION.sex}" title="女">
				<input type="radio" name="sex" value="${USER_SESSION.sex}" title="保密">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">手机号码</label>
			<div class="layui-input-block">
				<input type="tel" value="${USER_SESSION.phone}" name="phone" placeholder="" lay-verify="phone" class="layui-input userPhone">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">出生日期</label>
			<div class="layui-input-block">
				<input type="text" value="2003年05月01日" placeholder="" lay-verify="userBirthday" readonly class="layui-input userBirthday">
			</div>
		</div>
		<div class="layui-form-item userAddress">
			<div class="layui-form-item" lay-filter="test" >
					 <label class="layui-form-label">家庭地址</label> 
						  <div class="layui-input-inline"> 
								
							   <select id="province" lay-filter="province"  lay-verify="required" lay-search="">
								 <option value="">请选择/省</option>
							   </select>
						  </div>
						  <div class="layui-input-inline">
							   <select id="city" lay-filter="city" lay-verify="required" lay-search="">
								 <option value="">请选择/市</option>
							   </select>
						  </div>
						  <div class="layui-input-inline">
							   <select id="area" lay-filter="area"  lay-verify="required" lay-search="">
								 <option value="">请选择/县</option>
							   </select>
						  </div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">邮箱</label>
			<div class="layui-input-block">
				<input type="text" value="${USER_SESSION.email}" name="email" placeholder="" lay-verify="email" class="layui-input userEmail">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">自我评价</label>
			<div class="layui-input-block">
				<textarea name="msg" value=""  class="layui-textarea myself">${USER_SESSION.msg}</textarea>
			</div>
		</div>
		<div class="layui-form-item" style="margin-left:110px;">
			<button type="button" lay-submit lay-filter="*" class="layui-btn layui-btn-lg" style="margin-right:50px;">立即提交</button>
			<button type="reset" class="layui-btn layui-btn-warm layui-btn-lg" style="margin-right:50px;">重置</button>
		</div>
	</div>
</form>

<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript" src="../../layui/userInfo.js"></script>
<script src="../layui/js/jquery.js"></script>

<script>
	$(function(){
		layui.use(['layer', 'table','form','upload'], function ()
		        {
	
	
	layui.use(['form','layer','jquery'],function(){
	  var form = layui.form,
	   layer = parent.layer === undefined ? layui.layer : parent.layer,
	   $ = layui.jquery;
	  
	  var provinceText = "";
	  var cityText = "";
	  var areaText = "";
	  //异步加载下拉框数据
	  $.get("http://localhost:8080/test/china/"+0,function (data) {
		  console.log(data.data);
	    if(!data.status==200){
	      layer.msg(data.msg)
	    }else{
	      var $html = "";
	      if(data.data != null) {
	        $.each(data.data, function (index, item) {
	          $html += "<option value='" + item.id + "'>" + item.name + "</option>";
	        });
	        $("#province").append($html);
	        //append后必须从新渲染
	        form.render('select');
	      }
	    }
	  
	  });
	  
	  //监听省下拉框
	  form.on('select(province)', function(dataObj){
	    //移除城市下拉框所有选项
	    $("#city").empty();
	    var cityHtml = '<option value="">请选择或分类</option>';
	    $("#city").html(cityHtml);
	    var areaHtml = '<option value="">请选择或分类</option>';
	    $("#area").html(areaHtml);
	    provinceText = $("#province").find("option:selected").text();
	    var value = $("#province").val();
		console.log(value);
	    //异步加载下拉框数据
	    $.get("http://localhost:8080/test/china/"+value,{
			
		},function (data) {
	      if(!data.status==200){
	        layer.msg(data.msg)
	      }else{
	        var $html = "";
	        if(data.data != null) {
	          $.each(data.data, function (index, item) {
	            $html += "<option value='" + item.id + "'>" + item.name + "</option>";
	          });
	          $("#city").append($html);
	          //append后必须从新渲染
	          form.render('select');
	        }
	      }
	  
	    });
	  
	  });
	  
	  //监听市下拉框
	  form.on('select(city)', function(dataObj){
	    //移除县区下拉框所有选项
	    $("#area").empty();
	    var html = '<option value="">请选择或搜索县/区</option>';
	    $("#area").html(html);
	  
	    cityText = $("#city").find("option:selected").text();
	    var value = $("#city").val();
	    //异步加载下拉框数据
	    $.get("http://localhost:8080/test/china/"+value,{
			
		},function (data) {
	      if(!data.status==200){
	        layer.msg(data.msg)
	      }else{
	        var $html = "";
	        if(data.data != null) {
	          $.each(data.data, function (index, item) {
	            $html += "<option value='" + item.id + "'>" + item.name + "</option>";
	          });
	          $("#area").append($html);
	          //append后必须从新渲染
	          form.render('select');
	        }
	      }
	  
	    });
	  
	  });
	  
	  //监听县区下拉框
	  form.on('select(area)', function(dataObj){
	    areaText = $("#area").find("option:selected").text();
	  });
	});
	
	form.on('submit(*)',function(){
		$.ajax({
			type:"post",
			url:"test/updateTbuser",
			data:$("#form1").serialize(),
			success:function(data){
				if(data.status==200){
					layer.msg("修改成功！",{icon:1,shade:0.4, anim:1,time:1000},function(){
						window.location.href="userInfo";
					});
				}else{
					layer.msg("修改失败！请重试！",{icon:5,shade:0.4,anim:6,time:1000});
				}
			}
		});
		return false;
	});
	


	});
});

</script>
</body>
</html>
