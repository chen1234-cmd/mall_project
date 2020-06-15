<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>添加用户</title>
<meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="layui/css/layui.css">
	<script type="text/javascript" src="layui/js/jquery.js"></script>
	<script src="layui/layui.js"></script>
</head>

<body>
	<div id="editForm" style="width: 700px; padding-top: 20px;">
		<form id="formData" class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input type="text" name="username" id="bannerName" required
						lay-verify="required" placeholder="请输用户名" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
					<input type="password" name="password" id="bannerUrl" required
						lay-verify="required" placeholder="请输入密码" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">电话</label>
				<div class="layui-input-block">
					<input type="text" name="phone" lay-verify="phone" placeholder="请输入号码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱</label>
				<div class="layui-input-block">
					<input type="text" name="email" lay-verify="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" pane="">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block userSex" id="sex">
					<input type="radio" name="sex" value="男" title="男" checked="">
					<input type="radio" name="sex" value="女" title="女">
					<input type="radio" name="sex" value="保密" title="保密">
				</div>
			</div>
			
			<div class="layui-form-item" lay-filter="test" >
					<label class="layui-form-label">分配权限</label> 
				<div class="layui-input-inline"> 
				   <select name="roleId" id="province" lay-filter="province"  lay-verify="required" lay-search="" style="width: 30px;">
					 <option value="">请选择</option>
				   </select>
				</div>
			</div>
			
			
			<div class="layui-form-item">
				<label class="layui-form-label">头像</label> 
				<div class="layui-input-block">
					<button type="button" class="layui-btn layui-btn-normal" id="test1">
					  <i class="layui-icon">&#xe67c;</i>上传图片
					</button>
					<div style="display:inline-block" id="newImg"></div>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left:110px;">
				<button type="button" lay-submit lay-filter="*" class="layui-btn layui-btn-lg" style="margin-right:50px;">添加</button>
				<button type="reset" class="layui-btn layui-btn-warm layui-btn-lg">重置</button>
			</div>
		</form>
	</div>
</body>
<script>
	$(function(){
		layui.use(['layer', 'table','form','upload'], function ()
		        {
		            var table = layui.table;
		            var layer = layui.layer;
		            var form =layui.form;
					var upload=layui.upload;
					var uploadInst = upload.render({
					    elem: '#test1' //绑定元素
					    ,url: '/banner/uploadBannerImg' //上传接口
					    ,done: function(res){
					      layer.msg("上传图片成功！",{icon:1,time:1000});
					      var str="<img style='width:280px;height:160px;' src='"+res.url+"' /><input type='hidden' value='"+res.url+"' name='face' />"
					      $("#newImg").html(str);
					    }
					    ,error: function(){
					      layer.msg("上传图片失败！请重试！",{icon:5,anim: 6,time:1000});
					    }
					  });
					form.on('submit(*)',function(){
						$.ajax({
							type:"post",
							url:"test/addUser",
							data:$("#formData").serialize(),
							success:function(data){
								if(data.status==200){
									layer.msg("添加用户成功！",{icon:1,shade:0.4, anim:1,time:1000},function(){
										window.location.href="UserList.html";
									});
								}else if(data.status==500){
									layer.msg("用户存在！请重试！",{icon:5,shade:0.4,anim:6,time:1000});
								}else{
									layer.msg("添加用户失败！请重试！",{icon:5,shade:0.4,anim:6,time:1000});
								}
							}
						});
						return false;
					});
	});
	
	layui.use(['form','layer','jquery'],function(){
		var form = layui.form,
		 layer = parent.layer === undefined ? layui.layer : parent.layer,
		 $ = layui.jquery;
		
		var provinceText = "";
		var cityText = "";
		var areaText = "";
	  //异步加载下拉框数据
	  $.get("user/rolse",function (data) {
		  console.log(data.data);
	    if(!data.status==200){
	      layer.msg(data.msg)
	    }else{
	      var $html = "";
	      if(data.data != null) {
	        $.each(data.data, function (index, item) {
	          $html += "<option  value='" + item.roleId + "'>" + item.roleName + "</option>";
	        });
	        $("#province").append($html);
	        //append后必须从新渲染
	        form.render('select');
	      }
	    }
	  });
	});
	
});
</script>
</html>
