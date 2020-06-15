<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimal-ui" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no, email=no" />
		<meta charset="UTF-8">
		<title>农汇购</title>
		<link rel="stylesheet" href="themes/css/core.css">
		<link rel="stylesheet" href="themes/css/icon.css">
		<link rel="stylesheet" href="themes/css/home.css">
		<link rel="icon" type="image/x-icon" href="favicon.ico">
		<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
		<script src="themes/js/axios.min.js"></script>
		<script src="themes/js/public.js"></script>
	</head>
	<body>

		<header class="aui-header-default aui-header-fixed aui-header-bg">
			<a href="#" class="aui-header-item"> <i class="aui-icon aui-icon-code"></i>
			</a>
			<div class="aui-header-center aui-header-center-clear">
				<div class="aui-header-search-box">
					<i class="aui-icon aui-icon-small-search"></i> <input id="" type="text" placeholder="农汇购" class="aui-header-search">
				</div>
			</div>
			<a href="#" class="aui-header-item-icon"> <i class="aui-icon aui-icon-packet"></i> <i class="aui-icon aui-icon-member"></i>
			</a>
		</header>
		<section class="aui-scroll-contents">
			<div class="aui-scroll-box" data-ydui-scrolltab>
				<div id="first-nav" class="aui-scroll-nav">
					<!-- js 中动态添加 -->
				</div>
				<div id="second-div" class="aui-scroll-content">
					<!-- 需要加载第二级别  网络请求后填充 -->
				</div>
			</div>
		</section>


		<footer class="aui-footer-default aui-footer-fixed">
			<a href="index.html" class="aui-footer-item "> <span class="aui-footer-item-icon aui-icon aui-footer-icon-home"></span>
				<span class="aui-footer-item-text">首页</span>
			</a> <a href="class.html" class="aui-footer-item aui-footer-active"> <span class="aui-footer-item-icon aui-icon aui-footer-icon-class"></span>
				<span class="aui-footer-item-text">分类</span>
			</a> <a href="car.html" class="aui-footer-item"> <span class="aui-footer-item-icon aui-icon aui-footer-icon-car"></span>
				<span class="aui-footer-item-text">购物车</span>
			</a> <a href="ui-me.html" class="aui-footer-item"> <span class="aui-footer-item-icon aui-icon aui-footer-icon-me"></span>
				<span class="aui-footer-item-text">我的</span>
			</a>
		</footer>
		<script type="text/javascript">
			var firstNav = document.getElementById("first-nav");
			var secondDiv = document.getElementById("second-div");
			var isFirst = true;
			
			/* 通过axios 网络请求数据，动态加载 */
			axios.get(geturld(), {
					params: {
						parentId: 0
					}
				})
				.then(function(response) {

					var jsonData = response.data;
					if (jsonData.status == 200) {
						var arr = jsonData.data;
						for (var i = 0; i < arr.length; i++) {
							var z = arr[i];
							initFirst(z.id, z.name);
						}
					}


				})
				.catch(function(error) {
					console.log(error);
				});




			function initFirst(parentId, name) {
				var firstNav = document.getElementById("first-nav");
				/* 动态创建a标签 */
				var navA = document.createElement("a");
				navA.setAttribute("id", parentId);
				navA.setAttribute("href", "javascript:loadSecond(" + parentId + ")");
				navA.setAttribute('class','aui-scroll-item aui-crt');
				/* 创建 a标签里面的div */
				var navADivIcon = document.createElement("div");
				navADivIcon.setAttribute('class','aui-scroll-item-icon');
				navA.appendChild(navADivIcon);

				var navADivTest = document.createElement("div");
				navADivTest.setAttribute('calss','aui-scroll-item-text');
				navADivTest.innerText = name;
				navA.appendChild(navADivTest);
				
				firstNav.appendChild(navA);
				if(isFirst){
					isFirst = false;
					loadSecond(parentId);
				}
			}
			/* 第二级别网络请求 */
			function loadSecond(parentId) {
				/* 清空secondDiv 内容 */
				secondDiv.innerHTML = "";
				/* 更改第一级别nav 的是否选定的状态 */
				var items = document.getElementsByClassName("aui-scroll-item");
				for(var i = 0;i<items.length;i++){
					var item = items[i];
					item.setAttribute("class","aui-scroll-item");
				}
				var navA = document.getElementById(parentId);
				navA.setAttribute("class","aui-scroll-item aui-crt");
				
				/* 通过axios 网络请求数据，动态加载 */
				axios.get(geturld(), {
						params: {
							parentId: parentId
						}
					})
					.then(function(response) {

						var jsonData = response.data;
						if (jsonData.status == 200) {
							var arr = jsonData.data;
							for (var i = 0; i < arr.length; i++) {
								var z = arr[i];
								/* initFirst(z.id, z.name); */
								initSecond(z.id,z.image,z.name)
							}
						}


					})
					.catch(function(error) {
						console.log(error);
					});
			}

			function initSecond(parentId,image, name) {
				var secondDiv = document.getElementById("second-div");
				/* 第二级别，外层div */
				var contentItemDiv = document.createElement("div");
				contentItemDiv.setAttribute("class", "aui-scroll-content-item");
				/* 创建 第二级别 内层 div  */
				var auiClassImgDiv = document.createElement("div");
				auiClassImgDiv.setAttribute("class", "aui-class-img");
				/* 创建 内层div 的 img */
				var auiClassImgDivImg = document.createElement("img");
				auiClassImgDivImg.setAttribute("src", image);
				auiClassImgDiv.appendChild(auiClassImgDivImg);

				contentItemDiv.appendChild(auiClassImgDiv);

				/* 创建  第二级别的 h2*/
				var contentTitleH2 = document.createElement("h2");
				contentTitleH2.setAttribute("class", "aui-scroll-content-title");
				contentTitleH2.innerText = name;
				contentItemDiv.appendChild(contentTitleH2);

				/* 创建 第二级别 section */
				var contentSection = document.createElement("section");
				contentSection.setAttribute("class", "aui-grid-content")
				/* 创建section 里面 div */
				var gridRowDiv = document.createElement("div");
				gridRowDiv.setAttribute("class","aui-grid-row aui-grid-row-clear");
				/* 加载第三级别 数据 ，返回一个a标签 */
				loadThree(gridRowDiv,parentId);
				contentSection.appendChild(gridRowDiv);
				contentItemDiv.appendChild(contentSection);
				secondDiv.appendChild(contentItemDiv);
			}


			function loadThree(gridRowDiv,parentId) {
				/* 通过axios 网络请求数据，动态加载 */
				axios.get(geturld(), {
						params: {
							parentId: parentId
						}
					})
					.then(function(response) {
				
						var jsonData = response.data;
						if (jsonData.status == 200) {
							var arr = jsonData.data;
							for (var i = 0; i < arr.length; i++) {
								var z = arr[i];
							/* 	initFirst(z.id, z.name); */
								/* 返回a标签对象，进行添加操作 */
								var a = initThree(z.id,z.name,z.image);
								gridRowDiv.appendChild(a);
							}
						}
				
				
					})
					.catch(function(error) {
						console.log(error);
					});
			}

			function initThree(id,name,image) {
					var a = document.createElement("a");
					a.setAttribute("class","aui-grid-row-item");
					a.setAttribute("href","#");
					/* 创建a标签底下i标签 */
					var i = document.createElement("i");
					i.setAttribute("class","aui-icon-large aui-icon-sign");
					/* 创建i标签底下 img标签 */
					var img = document.createElement("img");
					img.setAttribute("src",image);
					i.appendChild(img);
					a.appendChild(i);
								
					/* 添加a标签底下p标签 */
					var p = document.createElement("p");
					p.setAttribute("class","aui-grid-row-label");
					p.innerText = name;
					a.appendChild(p);
					
					return a;
					
			}
		</script>

		<script src="themes/js/jquery.min.js"></script>
		<script src="themes/js/aui.js" async="async"></script>
	</body>
</html>
