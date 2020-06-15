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
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
			<div class="aui-scroll-nav" id="firstNav">
				<!-- 第一层 -->
				
				
				
			</div>
			<div class="aui-scroll-content" id='twoNav'>
				<div class="aui-scroll-content-item" >
					<!-- 第二层 -->
					<div class="aui-class-img">
						<img src="themes/img/pd/cf-4.jpg" alt="">
					</div>
					<h2 class="aui-scroll-content-title">热门推荐</h2>
					<section class="aui-grid-content">
						<div class="aui-grid-row aui-grid-row-clear">
							<!-- 第三层 -->
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
	<script type="text/javascript">
		
		axios.get('http://localhost:8888/rest/parentId', {
		    params: {
		      parentId: 0
		    }
		  })
		  .then(function (response) {
		   var JsonData =  response.data;
		   if (JsonData.status == 200) {
			   var arr = JsonData.data;
			   for (var i = 0 ;i <arr.length;i++) {
					var z = arr[i];
					initFirst(z.id,z.name);
			   }
		   	
		   }
		  })
		  .catch(function (error) {
		    console.log(error);
		  });
		  
		function initFirst(parentId,name){
			/* <div class="aui-scroll-nav">
					<a href="#" class="aui-scroll-item aui-crt">
						<div class="aui-scroll-item-icon"></div>
						<div class="aui-scroll-item-text">热门推荐</div>
					</a>
					
				</div>
			*/
			var firstNav = document.getElementById("firstNav");
			/* 动态创建a标签 */
			var navA = document.createElement('a');
			navA.setAttribute('href',' '+parentId);
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
		
		function initTwo(){
			/* 
			<div class="aui-scroll-content" id='twoNav'>
			<!-- 第二层 -->
				<div class="aui-scroll-content-item" >
					<div class="aui-class-img">
						<img src="themes/img/pd/cf-4.jpg" alt="">
					</div>
					<h2 class="aui-scroll-content-title">热门推荐</h2>
					<section class="aui-grid-content">
						<div class="aui-grid-row aui-grid-row-clear">
							<!-- 第三层 -->
							<a href="#" class="aui-grid-row-item">
								<i class="aui-icon-large aui-icon-sign"><img src="themes/img/ad/x-sf-1.jpg" alt=""></i>
								<p class="aui-grid-row-label">手机数码</p>
							</a>
							
						</div>
					</section>
				</div>
			</div> 
			 */
			/* 获取id为"twoNav" 的div*/
			var twoNav = document.getElementById('twoNav');
			/* 动态创建div */
			var navB = document.createElement('div');
			navB.setAttribute('class','aui-scroll-content-item');
			/* 给第二层添加内容 */
				var navB_1 = document.createElement('div');
				navB_1.setAttribute('class','aui-class-img');
				navB.appendChild(navB_1);
					/* 图片 */
					var navB_1_1 = document.createElement('img');
					navB_1_1.setAttribute('src','themes/img/pd/cf-4.jpg');
					navB_1.appendChild(navB_1_1);
					
			twoNav.appendChild(navB);
		}
		initTwo();
	</script>

	<script src="themes/js/jquery.min.js"></script>
	<script src="themes/js/aui.js"></script>
</body>
</html>