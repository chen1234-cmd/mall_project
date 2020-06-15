<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimal-ui"/>
	<meta name="apple-mobile-web-app-capable" content="yes"/>
	<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
	<meta name="format-detection" content="telephone=no, email=no"/>
	<meta charset="UTF-8">
	<title>够味达精选网</title>
	<link rel="stylesheet" type="text/css" href="themes/css/core.css">
	<link rel="stylesheet" type="text/css" href="themes/css/icon.css">
	<link rel="stylesheet" type="text/css" href="themes/css/home.css">
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
</head>
<body>

	<header class="aui-header-default aui-header-fixed aui-header-bg">
		<a href="#" class="aui-header-item">
			<i class="aui-icon aui-icon-code"></i>
		</a>
		<div class="aui-header-center aui-header-center-clear">
			<div class="aui-header-search-box">
				<i class="aui-icon aui-icon-small-search"></i>
				<input id="" type="text"  placeholder="手机箱包" class="aui-header-search">
			</div>
		</div>
		<a href="#" class="aui-header-item-icon">
			<i class="aui-icon aui-icon-packet"></i>
			<i class="aui-icon aui-icon-member"></i>
		</a>
	</header>
	<div class="aui-content-box">
		<div class="aui-banner-content aui-fixed-top" data-aui-slider>
			<div class="aui-banner-wrapper">
			<c:forEach var="ad1" items="${adlist1}">
				<div class="aui-banner-wrapper-item">
					<a href="${ad1.url} }">
						<img src="${ad1.pic}">
					</a>
				</div>
			</c:forEach>
			</div>
			<div class="aui-banner-pagination"></div>
		</div>
		<section class="aui-grid-content">
			<div class="aui-grid-row">
				<a href="my-sign.html" class="aui-grid-row-item">
					<i class="aui-icon-large aui-icon-sign"></i>
					<p class="aui-grid-row-label">每日签到</p>
				</a>
				<a href="my-time.html" class="aui-grid-row-item">
					<i class="aui-icon-large aui-icon-time"></i>
					<p class="aui-grid-row-label">限时抢购</p>
				</a>
				<a href="my-membership.html" class="aui-grid-row-item">
					<i class="aui-icon-large aui-icon-vip"></i>
					<p class="aui-grid-row-label">会员专享</p>
				</a>
				<a href="my-purchase.html" class="aui-grid-row-item">
					<i class="aui-icon-large aui-icon-group"></i>
					<p class="aui-grid-row-label">好货拼团</p>
				</a>
				<a href="my-invitation.html" class="aui-grid-row-item">
					<i class="aui-icon-large aui-icon-share"></i>
					<p class="aui-grid-row-label">分享领券</p>
				</a>
			</div>
		</section>
		<div class="aui-avd-content clearfix">
		<c:forEach var="ad2" items="${adlist2}" begin="0">
			<a href="${ad2.url}">
				<img src="${ad2.pic}" alt="">
			</a>
		</c:forEach>
		</div>
		<div class="aui-slide-box aui-slide-box-clear">
			<div class="aui-slide-list">
				<ul class="aui-slide-item-list">
				<c:forEach var="ad3" items="${adlist3}" begin="0">
				
					<li class="aui-slide-item-item">
						<a href="${ad3.url}" class="v-link">
							<img class="v-img" src="${ad3.pic}">
						</a>
					</li>
				</c:forEach>
				</ul>
			</div>

		</div>
		<div class="aui-dri"></div>
		<div class="aui-list-content">
			<div class="aui-list-item">
				<div class="aui-list-item-img">
					<img src="${adlist4[0].pic}" alt="">
				</div>
				<div class="aui-slide-box">
					<div class="aui-slide-list">
						<ul class="aui-slide-item-list">
						<c:forEach var="ad4" items="${adlist4}" begin="1">
							<li class="aui-slide-item-item">
								<a href="${ad4.url}" class="v-link">
									<img class="v-img" src="${ad4.pic }">
									<p class="aui-slide-item-title aui-slide-item-f-els">${ad4.title}</p>
									<p class="aui-slide-item-info">
										<span class="aui-slide-item-price">¥${ad4.subTitle}</span>&nbsp;&nbsp;<span class="aui-slide-item-mrk">¥${ad4.titleDesc}</span>
									</p>
								</a>
							</li>
						</c:forEach>
						</ul>
					</div>

				</div>
			</div>
			<div class="aui-list-item">
				<div class="aui-list-item-img">
					<img src="${adlist4[9].pic }" alt="">
				</div>
				<div class="aui-slide-box">
					<div class="aui-slide-list">
						<ul class="aui-slide-item-list">
						<c:forEach var="ad4" items="${adlist4}" begin="5" end="8">
							<li class="aui-slide-item-item">
								<a href="${ad4.url }" class="v-link">
									<img class="v-img" src="${ad4.pic}">
									<p class="aui-slide-item-title aui-slide-item-f-els">${ad4.title }</p>
									<p class="aui-slide-item-info">
										<span class="aui-slide-item-price">¥${ad4.subTitle}</span>&nbsp;&nbsp;<span class="aui-slide-item-mrk">¥${ad4.titleDesc}</span>
									</p>
								</a>
							</li>
						</c:forEach>
						</ul>
					</div>

				</div>
			</div>
			<div class="aui-list-item">
				<div class="aui-list-item-img">
					<img src="${adlist4[10].pic }" alt="">
				</div>
				<div class="aui-slide-box">
					<div class="aui-slide-list">
						<ul class="aui-slide-item-list">
						<c:forEach var="ad4" items="${adlist4}" begin="12" end="16">
							<li class="aui-slide-item-item">
								<a href="${ad4.url }" class="v-link">
									<img class="v-img" src="${ad4.pic }">
									<p class="aui-slide-item-title aui-slide-item-f-els">${ad4.title }</p>
									<p class="aui-slide-item-info">
										<span class="aui-slide-item-price">¥${ad4.subTitle}</span>&nbsp;&nbsp;<span class="aui-slide-item-mrk">¥${ad4.titleDesc}</span>
									</p>
								</a>
							</li>
						</c:forEach>
						</ul>
					</div>

				</div>
			</div>
			<div class="aui-list-item">
				<div class="aui-list-item-img">
					<img src="${adlist4[11].pic }" alt="">
				</div>
				<div class="aui-slide-box">
					<div class="aui-slide-list">
						<ul class="aui-slide-item-list">
						<c:forEach var="ad4" items="${adlist4}" begin="16" end="20">
							<li class="aui-slide-item-item">
								<a href="${ad4.url }" class="v-link">
									<img class="v-img" src="${ad4.pic }">
									<p class="aui-slide-item-title aui-slide-item-f-els">${ad4.title }</p>
									<p class="aui-slide-item-info">
										<span class="aui-slide-item-price">¥${ad4.subTitle}</span>&nbsp;&nbsp;<span class="aui-slide-item-mrk">¥${ad4.titleDesc}</span>
									</p>
								</a>
							</li>
						</c:forEach>
						</ul>
					</div>

				</div>
			</div>
		</div>
		<div class="aui-recommend">
			<img src="${adlist5[0].pic }" alt="">
			<!--<h2>为你推荐</h2>-->
		</div>
		<section class="aui-list-product">
			<div class="aui-list-product-box">
			<c:forEach var="ad5" items="${adlist5}" begin="1">
				<a href="${ad5.url }" class="aui-list-product-item">
					<div class="aui-list-product-item-img">
						<img src="${ad5.pic }" alt="">
					</div>
					<div class="aui-list-product-item-text">
						<h3>${ad5.title }</h3>
						<div class="aui-list-product-mes-box">
							<div>
							<span class="aui-list-product-item-price">
								<em>¥</em>
								${ad5.subTitle}
							</span>
								<span class="aui-list-product-item-del-price">
								¥${ad5.titleDesc}
							</span>
							</div>
							<div class="aui-comment">986评论</div>
						</div>
					</div>
				</a>
				</c:forEach>
			</div>
		</section>
	</div>

	<footer class="aui-footer-default aui-footer-fixed">
		<a href="index.html" class="aui-footer-item aui-footer-active">
			<span class="aui-footer-item-icon aui-icon aui-footer-icon-home"></span>
			<span class="aui-footer-item-text">首页</span>
		</a>
		<a href="class.html" class="aui-footer-item">
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
	<script type="text/javascript" src="themes/js/jquery.min.js"></script>
	<script type="text/javascript" src="themes/js/aui.js"></script>
</body>
</html>