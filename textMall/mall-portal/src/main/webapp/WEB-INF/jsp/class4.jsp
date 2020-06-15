<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimal-ui"/>
	<meta name="apple-mobile-web-app-capable" content="yes"/>
	<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
	<meta name="format-detection" content="telephone=no, email=no"/>
	<meta charset="UTF-8">
	<title>够味达精选网</title>
	<link rel="stylesheet" href="themes/css/core.css">
	<link rel="stylesheet" href="themes/css/icon.css">
	<link rel="stylesheet" href="themes/css/home.css">
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
	<script src="../../themes/js/axios.min.js"></script>
	<script src="../../themes/js/public.js"></script>
</head>
<body>

	<header class="aui-header-default aui-header-fixed aui-header-bg">
		<a href="#" class="aui-header-item">
			<i class="aui-icon aui-icon-code"></i>
		</a>
		<div class="aui-header-center aui-header-center-clear">
			<div class="aui-header-search-box">
				<i class="aui-icon aui-icon-small-search"></i>
				<input id="" type="text"  placeholder="够味达女性服饰" class="aui-header-search">
			</div>
		</div>
		<a href="#" class="aui-header-item-icon">
			<i class="aui-icon aui-icon-packet"></i>
			<i class="aui-icon aui-icon-member"></i>
		</a>
	</header>
	<section class="aui-scroll-contents">
		<div class="aui-scroll-box" data-ydui-scrolltab>
			<!-- 一级分类 -->
			<div id="first-nav" class="aui-scroll-nav">
				
				
			</div>
			<div class="aui-scroll-content">
			<!-- 二级分类 -->
				<div class="aui-scroll-content-item">
					<div class="aui-class-img">
						<img src="themes/img/pd/cf-4.jpg" alt="">
					</div>
					<h2 class="aui-scroll-content-title">热门推荐</h2>
					<section class="aui-grid-content">
					
						<div class="aui-grid-row aui-grid-row-clear">
						<!-- 三级分类 -->
							<a href="#" class="aui-grid-row-item">
								<i class="aui-icon-large aui-icon-sign"><img src="themes/img/ad/x-sf-1.jpg" alt=""></i>
								<p class="aui-grid-row-label">手机数码</p>
							</a>
						</div>
					</section>
				</div>
			</div>
		</div>
	</section>


	<footer class="aui-footer-default aui-footer-fixed">
		<a href="index.html" class="aui-footer-item ">
			<span class="aui-footer-item-icon aui-icon aui-footer-icon-home"></span>
			<span class="aui-footer-item-text">首页</span>
		</a>
		<a href="class.html" class="aui-footer-item aui-footer-active">
			<span class="aui-footer-item-icon aui-icon aui-footer-icon-class"></span>
			<span class="aui-footer-item-text">分类</span>
		</a>
	
		<a href="car.html" class="aui-footer-item">
			<span class="aui-footer-item-icon aui-icon aui-footer-icon-car"></span>
			<span class="aui-footer-item-text">购物车</span>
		</a>
		<a href="ui-me.html" class="aui-footer-item">
			<span class="aui-footer-item-icon aui-icon aui-footer-icon-me"></span>
			<span class="aui-footer-item-text">我的</span>
		</a>
	</footer>

	
	<script>
			var firstNav = document.getElementById("first-nav");
			var secondDiv = document.getElementById("second-div");
		/*一级大分类*/
		<!--ajax请求动态加载-->
			axios.get(geturl(), {
			    params: {
			      parentId: 0
			    }
			  })
			  .then(function (response) {
			    var jsonData = response.data;
			    	if(jsonData.status == 200){
					var arr = jsonData.data;
					for(var i = 0 ;i < arr.length;i++){
						var z = arr[i];
						initFirst(z.id,z.name);
						}
					}
			  })
			  .catch(function (error) {
			    console.log(error);
			  });
			
			function initFirst(parentId,name){
				var firstNav = document.getElementById("first-nav");
				/* 动态创建a标签 */
				var navA = document.createElement('a');
				navA.setAttribute('href','JavaScript:alert(0)');
				navA.setAttribute('class','aui-scroll-item aui-crt');
				/* 给a标签下插入div */
				var navAItemIcon = document.createElement('div');
				navAItemIcon.setAttribute('class','aui-scroll-item-icon')
				navA.appendChild(navAItemIcon);
				
				var navAItemText = document.createElement('div');
				navAItemText.setAttribute('calss','aui-scroll-item-text')
				navAItemText.innerText=name;
				navA.appendChild(navAItemText);
				
				firstNav.appendChild(navA);
			}
			/*二级分类*/
			/*二级网络请求*/
			function loadSecond(parentId){
				/*清空内容*/
				axios.get(geturld(), {
					params: {
					  parentId: 0
					}
				  })
				  .then(function (response) {
					var jsonData = response.data;
						if(jsonData.status == 200){
						var arr = jsonData.data;
						for(var i = 0 ;i < arr.length;i++){
							var z = arr[i];
							initFirst(z.id,z.name);
							}
						}
				  })
				  .catch(function (error) {
					console.log(error);
				  });
			}
	</script>
	<script src="themes/js/jquery.min.js"></script>
	<script src="themes/js/aui.js"></script>
</body>
</html>