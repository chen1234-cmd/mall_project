<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改密码</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../layui/css/layui.css">

</head>

<body>
	<div class="layui-card">
					<div class="layui-card-header">修改密码</div>
					<div class="layui-card-body" pad15="">
					<form id="passForm">
						<input type="hidden" name="id" id="UserId1" value="${USER_SESSION.id}" />
						<div class="layui-form" lay-filter="">
							<div class="layui-form-item">
								<label class="layui-form-label">旧的密码</label>
								<div class="layui-input-inline">
									<input type="password" id="oldpass" name="oldpass" lay-verify="required" lay-verType="tips" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">新密码</label>
								<div class="layui-input-inline">
									<input type="password" name="password1" lay-verify="required|newPass"
										id="newPass" lay-vertype="tips" autocomplete="off" id="LAY_password"
										class="layui-input">
								</div>
								<div class="layui-form-mid layui-word-aux">6到16个字符</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">确认新密码</label>
								<div class="layui-input-inline">
									<input type="password" name="password" lay-verify="required|repass"
										lay-vertype="tips" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" type="button" lay-submit="" lay-filter="setmypass">确认修改</button>
								</div>
							</div>
						</div>
						</form>
					</div>
				</div>
	
</body>
<script type="text/javascript" src="../../layui/js/jquery.js"></script>
<script src="../layui/layui.js"></script>
<script>
	$(function() {
		layui.use([ 'layer', 'form'],function() {
				var layer = layui.layer;
				var form = layui.form;
				form.verify({
					oldPass: function (value) {
		                if (!/^[a-z0-9_-]{1,6}$/.test(value)) {
		                    return "密码格式不正确！";
		                }
		            },
		            newPass:function(value){
		            	if(!/^[a-z0-9_-]{1,6}$/.test(value)){
		            		return "密码格式不正确！";
		            	}
		            },
		            repass:function(value){
		            	var pass=$("#newPass").val();
		            	if(pass!=value){
		            		return "两次输入密码不一致！";
		            	}
		            }
		        });
				form.on('submit(setmypass)',function(){
					$.post("http://localhost:8080/user/updatePass",$("#passForm").serialize(),function(data){
						if(data.status==200){
							layer.msg("修改密码成功！请重新登陆！",{icon:1,anim:4,time:2000},function(){
								 // top.location.href="http://localhost:8080/SingOut"; 
								 
								 $.post("/SingOut",
								 	function(data){
								     if (data.status=200)
								     {
								         // parent.layer.msg('密码修改', { icon: 1, shade: 0.4, time: 1000 });
								 		top.location.href="login.html";
								 		//top.location.href.reload();  //刷新页面
								     }
								   
								 }); 
							});
						}else{
							layer.msg("修改密码失败！请重试！",{icon:5,anim:6,time:2000});
						}
					});
				});
		});
	});
</script>
</html>
