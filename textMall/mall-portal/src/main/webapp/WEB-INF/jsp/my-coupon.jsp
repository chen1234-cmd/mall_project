<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimal-ui"/>
	<meta name="apple-mobile-web-app-capable" content="yes"/>
	<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
	<meta name="format-detection" content="telephone=no, email=no"/>
	<meta charset="UTF-8">
	<title>我的优惠券</title>
	<link rel="stylesheet" href="themes/css/core.css">
	<link rel="stylesheet" href="themes/css/icon.css">
	<link rel="stylesheet" href="themes/css/home.css">
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">

</head>
<body>

	<header class="aui-header-default aui-header-fixed aui-header-bg">
		<a href="javascript:history.back(-1)" class="aui-header-item">
			<i class="aui-icon aui-icon-back-white"></i>
		</a>
		<div class="aui-header-center aui-header-center-clear">
			<div class="aui-header-center-logo">
				<div class="aui-car-white-Typeface">我的优惠券</div>
			</div>
		</div>
		<a href="#" class="aui-header-item-icon"   style="min-width:0">
			<i class="aui-icon aui-icon-search"></i>
		</a>
	</header>

	<section class="aui-myOrder-content">
		<div class="m-tab demo-small-pitch" data-ydui-tab>
			<div class="aui-myOrder-fix">
				<ul class="tab-nav">
					<li class="tab-nav-item tab-active"><a href="javascript:;">未使用</a></li>
					<li class="tab-nav-item"><a href="javascript:;">已使用</a></li>
					<li class="tab-nav-item"><a href="javascript:;">已过期</a></li>

				</ul>
			</div>
			<div class="aui-prompt"><i class="aui-icon aui-prompt-sm"></i>兑换码现已关闭,请使用优惠券</div>
			<div class="tab-panel">
				<div class="tab-panel-item tab-active">
					<div class="aui-coupon-item">
						<img src="themes/img/icon/icon-c1.jpg" alt="">
					</div>
					<div class="aui-coupon-item">
						<img src="themes/img/icon/icon-c2.jpg" alt="">
					</div>
				</div>
				<div class="tab-panel-item">
					<div class="aui-coupon-item">
						<img src="themes/img/icon/icon-c3.jpg" alt="">
					</div>
				</div>
				<div class="tab-panel-item">
					<div class="aui-coupon-item">
						<img src="themes/img/icon/icon-c4.jpg" alt="">
					</div>
				</div>

			</div>
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