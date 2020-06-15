<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>登录农职商城后台管理系统</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="layuiadmin/style/admin.css" media="all">
  <link rel="stylesheet" href="layuiadmin/style/login.css" media="all">
 <style>
 </style>
</head>
<body>
  <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">

    <div class="layadmin-user-login-main" style="width:350px;">
      <div class="layadmin-user-login-box layadmin-user-login-header">
        <h2 style="font-weight: 500; font-size: 30px;">农职商城</h2>
        <p style="font-size: 18px; font-weight: 300;">后台管理系统</p>
      </div>
      <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
          <input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input">
        </div>
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
          <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
        </div>
        <div class="layui-form-item">
          <div class="layui-row">
            <div class="layui-col-xs7">
              <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
              <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">
            </div>
            <div class="layui-col-xs5">
              <div style="margin-left: 10px;">
                <img  src="/verification" class="LAY-user-login-codeimg" onclick="vcode()" name="randImage" id="randImage" >
              </div>
            </div>
          </div>
        </div>
        <div class="layui-form-item" style="margin-bottom: 20px;">
          <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
          <a href="forget" class="layadmin-user-jump-change layadmin-link"  style="margin-top: 7px;">忘记密码？</a>
        </div>
        <div class="layui-form-item">
          <button class="layui-btn layui-btn-fluid"  lay-submit lay-filter="LAY-user-login-submit">登 录</button>
        </div>
       
      </div>
	  
    </div>
    
    <div class="layui-trans layadmin-user-login-footer">
      
      <p>© 2019 <a href="javascript:;" target="_blank">农职商城</a></p>
    </div>
    <div class="ladmin-user-login-theme">
     <!-- <script type="text/html" template>
        <ul>
          <li data-theme=""><img src="../design/css/modules/layer/default/loading-1.gif"></li>
          <li data-theme="#03152A" style="background-color: #03152A;"></li>
          <li data-theme="#2E241B" style="background-color: #2E241B;"></li>
          <li data-theme="#50314F" style="background-color: #50314F;"></li>
          <li data-theme="#344058" style="background-color: #344058;"></li>
          <li data-theme="#20222A" style="background-color: #20222A;"></li>
        </ul>
      </script> -->
    </div>
    
  </div>
<script src="../layui/js/jquery.js"></script>
<script src="../../layuiadmin/layui/layui.js"></script>  
  <script>
	  function vcode() {
	  	$("#randImage").attr('src', '/verification?' + Math.random());
	  };
	  
  layui.config({
    base: '../../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'user'], function(){
    var $ = layui.$
    ,setter = layui.setter
    ,admin = layui.admin
    ,form = layui.form
    ,router = layui.router()
    ,search = router.search;
		

  //提交
    form.on('submit(LAY-user-login-submit)', function(obj){
		var username =$('#LAY-user-login-username').val();
		var password=$('#LAY-user-login-password').val();
		var verification=$('#LAY-user-login-vercode').val().toLowerCase(); //大写转小写
		$.post("/login",
			{username:username,
			 password:password,
			 verification:verification,
			},
			function(result)
				{
				if(result.status==200){
						layer.msg('登入成功', {offset: '15px',icon: 1 ,time: 1000});
						window.location.href="index.html";
				}else{
					layer.msg('登录失败', {offset: '15px',icon: 1 ,time: 1000});
					$("#randImage").attr('src', '/verification?' + Math.random());
					}
				}
			);
    });
    
		//实际使用时记得删除该代码
		layer.msg('为了方便演示，用户名密码为：123', {
		  offset: '15px'
		  ,icon: 1
		}); 
    
  });
  </script>
</body>
</html>