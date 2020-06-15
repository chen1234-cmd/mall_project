<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/loaders.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/loading.css"/>
    <link rel="stylesheet" type="text/css" href="css/base.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
      <script src="../../themes/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	  <script src="../../themes/js/axios.min.js"></script>
    <script type="text/javascript">
    	$(window).load(function(){
    		$(".loading").addClass("loader-chanage")
    		$(".loading").fadeOut(300)
    	})
    </script>
</head>
<!--loading页开始-->
<div class="loading">
	<div class="loader">
        <div class="loader-inner pacman">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
	</div>
</div>
<!--loading页结束-->
<body>
	<header class="top-header">
		<a class="text texta" href="index.html">取消</a>
		<h3>登录</h3>
		<a class="text" href="sign.html">注册</a>
	</header>
	
	<div class="login">
		<form>
			<ul>
				<li>
					<img src="../../themes/img/login.png"/>
					<label>账号</label>
					<input type="text" placeholder="请输入账号"/>
				</li>
				<li>
					<img src="../../themes/img/password.png"/>
					<label>密码</label>
					<input type="password" placeholder="请输入密码"/>
				</li>
			</ul>
			<input type="submit" value="登录"/>
		</form>
	</div>

</body>
</html>