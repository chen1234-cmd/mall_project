<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="/layuiadmin/style/admin.css" media="all">
  <link rel="stylesheet" href="../layui/css/notice.css" media="all">
  <link rel="stylesheet" href="../layui/css/okadmin.css">
  <style>
	  img{
		  width: 30px;
		  height: 30px;
	  }
	  iframe.layui-layer-load{background:url(loading-1.gif) #eee center center no-repeat;}
  </style>
 
</head>
<body class="layui-layout-body">

  <div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
      <div class="layui-header" >
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item layadmin-flexible" lay-unselect>
            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
              <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
            </a>
          </li>
		
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="#" target="_blank" title="前台">
              <i class="layui-icon layui-icon-website"></i>
            </a>
          </li>
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;" layadmin-event="refresh" title="刷新">
              <i class="layui-icon layui-icon-refresh-3"></i>
            </a>
          </li>
		  <li class="ok-nav-item ok-hide-md">
		      <div class="weather-ok">
		          <iframe frameborder="0" scrolling="no" class="iframe-style" src="weather" frameborder="0"></iframe>
		      </div>
		  </li>
        </ul>
        <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
          
          <li class="layui-nav-item" lay-unselect>
            <a lay-href="message" layadmin-event="message" lay-text="消息中心">
              <i class="layui-icon layui-icon-notice"></i>  
              
              <!-- 如果有新消息，则显示小圆点 -->
              <span class="layui-badge-dot"></span>
            </a>
          </li>
          <!-- <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="admin/theme" layadmin-event="theme">
              <i class="layui-icon layui-icon-theme"></i>
            </a>
          </li> -->
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="note">
              <i class="layui-icon layui-icon-note"></i>
            </a>
          </li>
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="fullscreen">
              <i class="layui-icon layui-icon-screen-full"></i>
            </a>
          </li>
         <img class="layui-upload-img layui-circle userFaceBtn userAvatar" src="${USER_SESSION.face}">
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;">
              <cite>${USER_SESSION.username}</cite>
            </a>
            <dl class="layui-nav-child">
              <dd><a lay-href="/admin/userInfo">基本资料</a></dd>
              <dd><a lay-href="/admin/password">修改密码</a></dd>
              <hr>
               <a onclick="SingOut()" id="SingOut" data-method="offset" data-type="auto" >退出</a>
            </dl>
          </li>
        
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
           <i class="layui-icon layui-icon-more-vertical"></i>
          </li>
          <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
            <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
          </li>
        </ul>
      </div>
      
      <!-- 侧边菜单 -->
       <div class="layui-side layui-side-menu layui-bg-cyan">
		     <div class="layui-logo " lay-href="console.html">
				<span style="font-size: 23px;">文艺爱购</span>
			</div>
          <ul class="layui-nav layui-nav-tree layui-bg-cyan " lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
          <c:forEach items="${TbRolesMenusKey}" var="menu">
			<li data-name="home" class="layui-nav-item  layui-bg-cyan">
              <a href="javascript:;" lay-tips="${menu.title}" lay-direction="2">
                <i class="layui-icon layui-icon-home"></i>
                <cite>${menu.title}</cite>
              </a>
              <dl class="layui-nav-child">
              	<c:forEach items="${menu.list}" var="item">
                <dd data-name="console" ><!--class="layui-this"-->
                  <a lay-href="${item.href}">${item.title}</a>
                </dd>
                </c:forEach>
              </dl>
            </li>
            </c:forEach>
          </ul>
      </div>

      <!-- 页面标签 -->
      <div class="layadmin-pagetabs" id="LAY_app_tabs">
        <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-down">
          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
            <li class="layui-nav-item" lay-unselect>
              <a href="javascript:;"></a>
              <dl class="layui-nav-child layui-anim-fadein">
                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
              </dl>
            </li>
          </ul>
        </div>
        <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
          <ul class="layui-tab-title" id="LAY_app_tabsheader">
            <li lay-id="console.html" lay-attr="console.html" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
          </ul>
        </div>
      </div>
      
      
      <!-- 主体内容 -->
      <div class="layui-body" id="LAY_app_body">
        <div class="layadmin-tabsbody-item layui-show">
          <iframe src="console" frameborder="0" class="layadmin-iframe"></iframe>
        </div>
      </div>
      
      <!-- 辅助元素，一般用于移动设备下遮罩 -->
      <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
  </div>
 <script src="../layui/js/jquery.js"></script>
  <script src="/layuiadmin/layui/layui.js"></script>
<!--  <script src="../layui/js/msg.js"></script> -->
  <script>
  layui.config({
    base: '../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use('index');
  </script>
  
  <!-- 百度统计 -->
  <script>
  var _hmt = _hmt || [];
  (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?d214947968792b839fd669a4decaaffc";
    var s = document.getElementsByTagName("script")[0]; 
    s.parentNode.insertBefore(hm, s);
  })();
	//页面一打开就执行弹层
		function SingOut(){
			layer.open({
			    type: 1,
			    title: '信息',
			    shade: 0.4,  //阴影度
			    fix: false,
			    shadeClose: true,
			    maxmin: false,
				content:'<div style="width:70px;height:13px; margin:auto;margin-top:8%; font-size:16px; ">是否退出</div>',
			    area: ['230px;', '150px;'],    //窗体大小（宽,高）
			    btn:['确认','取消'],
			    yes: function(index, layero){
			    	$.post("/SingOut",
						function(data){
			            if (data.status=200)
			            {
			                parent.layer.msg('退出成功', { icon: 1, shade: 0.4, time: 1000 });
							window.location.href="login.html";
							window.location.reload();  //刷新页面
			               
			            }
			            else
			            {
			                parent.layer.msg('退出失败', { icon: 5, shade: 0.4, time: 1000 });
			            }
			            layer.close(index);
			            $("#newImg").html("");
			    	}); 
			    }
			});
		}
  </script>
</body>
</html>


