<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimal-ui"/>
	<meta name="apple-mobile-web-app-capable" content="yes"/>
	<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
	<meta name="format-detection" content="telephone=no, email=no"/>
	<meta charset="UTF-8">
	<title>签到领豆</title>
	<link rel="stylesheet" href="themes/css/core.css">
	<link rel="stylesheet" href="themes/css/icon.css">
	<link rel="stylesheet" href="themes/css/home.css">
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
	<style>
		.n-tabs {
			position: fixed;
			top:44px;
			left: 0;
			width: 100%;
			height: 41px;
			overflow: hidden;
			z-index: 1000;
			background-color: #fff;
			box-shadow: 0 0 10PX 0PX rgba(155,143,143,0.6);
			-webkit-box-shadow: 0 0 10PX 0PX rgba(155,143,143,0.6);
			-moz-box-shadow: 0 0 10PX 0PX rgba(155,143,143,0.6);
		}
		.n-tabs .edge {
			position: fixed;
			top: 0;
			height: 41px;
			width: 100%;
			border-bottom: 1px solid #e5e5e5;
		}
		.n-tabs .n-tabContainer {
			-webkit-overflow-scrolling: touch;
			position: relative;
			top: 0;
			left: 0;
			overflow-x: auto;
			overflow-y: hidden;
			padding-left: 16px;
			height: 51px;
			font-size: 14px;
			color: #333;
			white-space: nowrap;
		}
		.n-tabs .n-tabContainer .navtab {
			display: -webkit-box;
			display: -webkit-flex;
			display: flex;
		}

		.n-tabs .n-tabContainer .n-tabItem {
			-webkit-box-flex: 1;
			-webkit-flex-grow: 1;
			flex-grow: 1;
			-webkit-flex-shrink: 0;
			flex-shrink: 0;
			display: inline-block;
			height: 41px;
			line-height: 41px;
			text-align: center;
			margin-left: 20px;
		}
		.n-tabs .n-tabContainer .n-tabItem:first-child {
			margin-left: 0;
		}
		.n-tabs .n-tabContainer .n-tabItem .current {
			display: inline-block;
			height: 41px;
			border-bottom: 2px solid #e31436;
			color: #e31436;
		}
	</style>

</head>
<body style="background:#eee">

	<header class="aui-header-default aui-header-fixed aui-header-bg">
		<a href="javascript:history.back(-1)" class="aui-header-item">
			<i class="aui-icon aui-icon-back-white"></i>
		</a>
		<div class="aui-header-center aui-header-center-clear">
			<div class="aui-header-center-logo">
				<div class="aui-car-white-Typeface">签到领豆</div>
			</div>
		</div>
		<a href="#" class="aui-header-item-icon"   style="min-width:0">
			<i class="aui-icon aui-icon-search"></i>
		</a>
	</header>

	<section class="aui-myOrder-content">
		<div class="aui-Sign-content">
			<div class="aui-Sign-btn">
				<a href="#">
					<img src="themes/img/icon/icon-sign.png" alt="">
				</a>
			</div>
		</div>
	</section>
	<section class="n-tabs" style="position:inherit">
		<ul class="n-tabContainer" id="auto-id-1509603311057">
			<li class="n-tabItem" data-id="homepage">
				<a href="#" id="homepage" class="current">精选</a>
			</li>
			<li class="n-tabItem" data-id="44114">
				<a href="#" id="44114" class="">母婴</a>
			</li>
			<li class="n-tabItem" data-id="15394">
				<a href="#" id="15394" class="">美妆</a>
			</li>
			<li class="n-tabItem" data-id="01436">
				<a href="#" id="01436" class="">保健品</a>
			</li>
			<li class="n-tabItem" data-id="18211">
				<a href="#" id="18211" class="">家居生活</a>
			</li>
			<li class="n-tabItem" data-id="83651">
				<a href="#" id="83651" class="">生鲜</a>
			</li>
			<li class="n-tabItem" data-id="37957">
				<a href="#" id="37957" class="">数码</a>
			</li>
			<li class="n-tabItem" data-id="74029">
				<a href="#" id="74029" class="">个人洗护</a>
			</li>
			<li class="n-tabItem" data-id="73179">
				<a href="#" id="73179" class="">海外直邮</a>
			</li>
			<li class="n-tabItem" data-id="41804">
				<a href="#" id="41804" class="">服饰鞋靴</a>
			</li>
		</ul>
	</section>
	<section class="">
		<div class="aui-list-product-box aui-list-product-box-clear">
			<a href="javascript:;" class="aui-list-product-item">
				<div class="aui-list-product-item-img">
					<img src="themes/img/pd/sf-8.jpg" alt="">
					<span class="aui-Purchase-tag">5豆兑</span>
				</div>
				<div class="aui-list-product-item-text">
					<h3>KOBE LETTUCE 秋冬新款 女士日系甜美纯色半高领宽松套头毛衣针织衫</h3>
					<div class="aui-list-product-mes-box">
						<div>
							<span class="aui-list-product-item-price">
								<em>¥</em>
								399.99
							</span>
							<span class="aui-list-product-item-del-price">
								¥495.65
							</span>
						</div>
						<div class="aui-comment">已兑134件</div>
					</div>
				</div>
			</a>
			<a href="javascript:;" class="aui-list-product-item">
				<div class="aui-list-product-item-img">
					<img src="themes/img/pd/sf-9.jpg" alt="">
					<span class="aui-Purchase-tag">5豆兑</span>
				</div>
				<div class="aui-list-product-item-text">
					<h3>KOBE LETTUCE 秋冬新款 女士日系甜美纯色半高领宽松套头毛衣针织衫</h3>
					<div class="aui-list-product-mes-box">
						<div>
							<span class="aui-list-product-item-price">
								<em>¥</em>
								399.99
							</span>
							<span class="aui-list-product-item-del-price">
								¥495.65
							</span>
						</div>
						<div class="aui-comment">已兑134件</div>
					</div>
				</div>
			</a>
			<a href="javascript:;" class="aui-list-product-item">
				<div class="aui-list-product-item-img">
					<img src="themes/img/pd/sf-10.jpg" alt="">
					<span class="aui-Purchase-tag">5豆兑</span>
				</div>
				<div class="aui-list-product-item-text">
					<h3>KOBE LETTUCE 秋冬新款 女士日系甜美纯色半高领宽松套头毛衣针织衫</h3>
					<div class="aui-list-product-mes-box">
						<div>
							<span class="aui-list-product-item-price">
								<em>¥</em>
								399.99
							</span>
							<span class="aui-list-product-item-del-price">
								¥495.65
							</span>
						</div>
						<div class="aui-comment">已兑134件</div>
					</div>
				</div>
			</a>
			<a href="javascript:;" class="aui-list-product-item">
				<div class="aui-list-product-item-img">
					<img src="themes/img/pd/sf-11.jpg" alt="">
					<span class="aui-Purchase-tag">5豆兑</span>
				</div>
				<div class="aui-list-product-item-text">
					<h3>KOBE LETTUCE 秋冬新款 女士日系甜美纯色半高领宽松套头毛衣针织衫</h3>
					<div class="aui-list-product-mes-box">
						<div>
							<span class="aui-list-product-item-price">
								<em>¥</em>
								399.99
							</span>
							<span class="aui-list-product-item-del-price">
								¥495.65
							</span>
						</div>
						<div class="aui-comment">已兑134件</div>
					</div>
				</div>
			</a>
			<a href="javascript:;" class="aui-list-product-item">
				<div class="aui-list-product-item-img">
					<img src="themes/img/pd/sf-12.jpg" alt="">
					<span class="aui-Purchase-tag">5豆兑</span>
				</div>
				<div class="aui-list-product-item-text">
					<h3>KOBE LETTUCE 秋冬新款 女士日系甜美纯色半高领宽松套头毛衣针织衫</h3>
					<div class="aui-list-product-mes-box">
						<div>
							<span class="aui-list-product-item-price">
								<em>¥</em>
								399.99
							</span>
							<span class="aui-list-product-item-del-price">
								¥495.65
							</span>
						</div>
						<div class="aui-comment">已兑134件</div>
					</div>
				</div>
			</a>
			<a href="javascript:;" class="aui-list-product-item">
				<div class="aui-list-product-item-img">
					<img src="themes/img/pd/sf-13.jpg" alt="">
					<span class="aui-Purchase-tag">5豆兑</span>
				</div>
				<div class="aui-list-product-item-text">
					<h3>KOBE LETTUCE 秋冬新款 女士日系甜美纯色半高领宽松套头毛衣针织衫</h3>
					<div class="aui-list-product-mes-box">
						<div>
							<span class="aui-list-product-item-price">
								<em>¥</em>
								399.99
							</span>
							<span class="aui-list-product-item-del-price">
								¥495.65
							</span>
						</div>
						<div class="aui-comment">已兑134件</div>
					</div>
				</div>
			</a>

		</div>
	</section>




	<script type="text/javascript" src="themes/js/jquery.min.js"></script>
	<script type="text/javascript" src="themes/js/aui.js"></script>
	<script type="text/javascript" >
        /**
         * Javascript API调用Tab
         */
        !function ($) {
            var $tab = $('#J_Tab');

            $tab.tab({
                nav: '.tab-nav-item',
                panel: '.tab-panel-item',
                activeClass: 'tab-active'
            });

			/*
			 $tab.find('.tab-nav-item').on('open.ydui.tab', function (e) {
			 console.log('索引：%s - [%s]正在打开', e.index, $(this).text());
			 });
			 */

            $tab.find('.tab-nav-item').on('opened.ydui.tab', function (e) {
                console.log('索引：%s - [%s]已经打开了', e.index, $(this).text());
            });
        }(jQuery);
	</script>

</body>
</html>