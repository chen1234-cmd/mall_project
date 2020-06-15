<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layuiAdmin 控制台主页一</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
   <link rel="stylesheet" href="layui/css/admin.css" media="all">
   <style type="text/css">
   	#img1{
		width: 40px;
		height: 40px;
	}
   </style>
</head>
<body>
	<!-- <blockquote class="layui-elem-quote">欢迎!!!"${USER_SESSION.username}"登录农汇购商城后台管理系统</blockquote> -->
		<fieldset class="layui-elem-field">
		  <legend class="layui-bg-orange">欢迎您</legend>
		  <div class="layui-field-box">
			<img id="img1" class="layui-upload-img layui-circle userFaceBtn userAvatar" src="${USER_SESSION.face}">
			<span class="layui-badge-dot"></span>
			<span class="layui-badge-dot layui-bg-orange"></span>
			<span class="layui-badge-dot layui-bg-green"></span>
			<span class="layui-badge-dot layui-bg-cyan"></span>
			<span class="layui-badge-dot layui-bg-blue"></span>
			<span class="layui-badge-dot layui-bg-black"></span>
			<span class="layui-badge-dot layui-bg-gray"></span>
			<span class="layui-badge layui-bg-black">用户：</span>
			<span class="layui-badge">${USER_SESSION.username}</span>
			<span class="layui-badge layui-bg-orange">登录</span>
			<span class="layui-badge layui-bg-green">农汇</span>
			<span class="layui-badge layui-bg-cyan">购商</span>
			<span class="layui-badge layui-bg-blue">城后</span>
			<span class="layui-badge layui-bg-black">管理</span>
			<span class="layui-badge layui-bg-green">系统</span>
		  </div>
		</fieldset>
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md8">
        <div class="layui-row layui-col-space15">
          
          <div class="layui-col-md13">
            <div class="layui-card">
              <div class="layui-card-header">待办事项</div>
              <div class="layui-card-body">

                <div class="layui-carousel layadmin-carousel layadmin-backlog">
                  <div carousel-item>
                    <ul class="layui-row layui-col-space10">
                      <li class="layui-col-xs6">
                        <a lay-href="List_com" class="layadmin-backlog-body">
                          <h3>商品总数</h3>
                          <p><cite id="itemsize">0</cite></p>
                        </a>
                      </li>
                      <li class="layui-col-xs6">
                        <a lay-href="orderlist" class="layadmin-backlog-body">
                          <h3>待发货</h3>
                          <p><cite id="orStatus2">0</cite></p>
                        </a>
                      </li>
                      <li class="layui-col-xs6">
                        <a lay-href="orderlist" class="layadmin-backlog-body">
                          <h3>待付款</h3>
                          <p><cite id="orStatus1">0</cite></p>
                        </a>
                      </li>
                      <li class="layui-col-xs6">
                        <a lay-href="refund" class="layadmin-backlog-body">  <!-- onclick="layer.tips('不跳转', this, {tips: 3});" -->
                          <h3>待退款</h3>
                          <p><cite id="orStatus7">0</cite></p>
                        </a>
                      </li>
                    </ul>
                    <ul class="layui-row layui-col-space10">
                      <li class="layui-col-xs6">
                        <a href="javascript:;" class="layadmin-backlog-body">
                          <h3>待审友情链接</h3>
                          <p><cite style="color: #FF5722;">5</cite></p>
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
		  <div class="layui-col-md13">
		    <div class="layui-card">
		      <div class="layui-card-header">最新广告</div>
		      <div class="layui-card-body" style="height:448px;">
		        <div class="layui-carousel" id="test1" style="height:500px;">
		          <div carousel-item="" style="width: 100%;">
		            <div><img src="../layui/images/1.png" style="width: 100%;"></div>
		            <div><img src="../layui/images/2.png" style="width: 100%;"></div>
		            <div><img src="../layui/images/3.png" style="width: 100%;"></div>
		            <div><img src="../layui/images/4.png" style="width: 100%;"></div>
		            <div><img src="../layui/images/5.png" style="width: 100%;"></div>
		            <div><img src="../layui/images/6.png" style="width: 100%;"></div>
		            <div><img src="../layui/images/7.png" style="width: 100%;"></div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		  
          <div class="layui-col-md12">
            <div class="layui-card">
              <div class="layui-card-header">数据概览</div>
              <div class="layui-card-body">
                
                <div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-dataview">
                  <div carousel-item id="LAY-index-dataview">
                    <div><i class="layui-icon layui-icon-loading1 layadmin-loading"></i></div>
                    <div></div>
                    <div></div>
                  </div>
                </div>
                
              </div>
            </div>
								<div class="layui-card">
								  <div class="layui-tab layui-tab-brief layadmin-latestData">
									<ul class="layui-tab-title">
									  <li class="layui-this">今日热搜</li>
									  <li>今日热帖</li>
									</ul>
									<div class="layui-tab-content">
									  <div class="layui-tab-item layui-show">
												
											<table class="layui-table" id="result" >
											  <colgroup>
												<col width="150">
												<col width="200">
												<col>
											  </colgroup>
											  <thead>
												<tr>
												  <th>热搜话题</th>
												  <th>热搜指数</th>
											  
												</tr> 
											  </thead>
											</table>
										
									  </div>
									  <div class="layui-tab-item">
										<table class="layui-table"id="relstest">
											<colgroup>
												<col width="150">
												<col width="200">
												<col width="150">
											</colgroup>
										    <tr>
										      <th>排行版</th>
										      <th>关键词</th>
										      <th>热搜指数</th>
										      
										    </tr>
										</table>
									  </div>
									</div>
								  </div>
								</div>
          </div>
        </div>
      </div>
      <!--右边区域-->
      <div class="layui-col-md4">
		  <!-- <div class="layui-card">
		      <div class="layui-card-header">快捷方式</div>
		      <div class="layui-card-body">
		        
		        <div class="layui-carousel layadmin-carousel layadmin-shortcut">
		          <div carousel-item>
		            <ul class="layui-row layui-col-space10">
		              <li class="layui-col-xs3">
		                <a lay-href="List_com.html">
		                  <i class="layui-icon layui-icon-console"></i>
		                  <cite>商品列表</cite>
		                </a>
		              </li>
		              <li class="layui-col-xs3">
		                <a lay-href="home/homepage2.html">
		                  <i class="layui-icon layui-icon-chart"></i>
		                  <cite>主页二</cite>
		                </a>
		              </li>
		              <li class="layui-col-xs3">
		                <a lay-href="component/layer/list.html">
		                  <i class="layui-icon layui-icon-template-1"></i>
		                  <cite>弹层</cite>
		                </a>
		              </li>
		              <li class="layui-col-xs3">
		                <a layadmin-event="im">
		                  <i class="layui-icon layui-icon-chat"></i>
		                  <cite>聊天</cite>
		                </a>
		              </li>
		              <li class="layui-col-xs3">
		                <a lay-href="component/progress/index.html">
		                  <i class="layui-icon layui-icon-find-fill"></i>
		                  <cite>进度条</cite>
		                </a>
		              </li>
		              <li class="layui-col-xs3">
		                <a lay-href="app/workorder/list.html">
		                  <i class="layui-icon layui-icon-survey"></i>
		                  <cite>工单</cite>
		                </a>
		              </li>
		              <li class="layui-col-xs3">
		                <a lay-href="user/user/list.html">
		                  <i class="layui-icon layui-icon-user"></i>
		                  <cite>用户</cite>
		                </a>
		              </li>
		              <li class="layui-col-xs3">
		                <a lay-href="set/system/website.html">
		                  <i class="layui-icon layui-icon-set"></i>
		                  <cite>设置</cite>
		                </a>
		              </li>
		            </ul>
		            <ul class="layui-row layui-col-space10">
		              <li class="layui-col-xs3">
		                <a lay-href="set/user/info.html">
		                  <i class="layui-icon layui-icon-set"></i>
		                  <cite>我的资料</cite>
		                </a>
		              </li>
		            </ul>
		            
		          </div>
		        </div>
		        
		      
		    </div>
		  </div> -->
        <div class="layui-card">
          <div class="layui-card-header">项目周期</div>
          <div class="layui-card-body layui-text">
            <table class="layui-table">
              <colgroup>
                <col width="100">
                <col>
              </colgroup>
              <tbody>
                <ul class="layui-timeline">
                  <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                      <h3 class="layui-timeline-title">10月18日</h3>
                      <p>
							商城功能基本完善<br>
                        <br>不枉近百个日日夜夜与之为伴。因小而大，因弱而强。
                        <br>无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔 <i class="layui-icon"></i>
                      </p>
                    </div>
                  </li>
                  <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                      <h3 class="layui-timeline-title">10月16日</h3>
					  <p>Maven聚合功能工程</p>
                      <p>“<em>Spring，SpringMvc，mybeats”</p>
                      <ul>
                        <li>缓存层：Redis</li>
                        <li>检索层：solr</li>
						<li>单点层：SSO</li>
						<li>后端开发框架：{Spring</li>
						<li>SpringMvc</li>
						<li>mybeats</li>
						<li>Redis缓存 </li>
						<li>Tomcat 7</li>
						<li>Mysql 5.6</li>
						<li>Solr搜索</li>
						<li>httpclient(调用系统服务)}</li>
						<li>后端开发工具：Eclipse</li>
						<li>前端开发工具：HbuilderX</li>
						<li>数据库：Navicat</li>
						<li>缓存工具：RedisDesktopManager</li>
						<li>请求响应工具：Postman</li>
                      </ul>
                    </div>
                  </li>
                  <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                      <h3 class="layui-timeline-title">8月15日</h3>
                      <p>
                        中国人民抗日战争胜利72周年
                        <br>常常在想，尽管对这个国家有这样那样的抱怨，但我们的确生在了最好的时代
                        <br>铭记、感恩
                        <br>所有为中华民族浴血奋战的英雄将士
                        <br>永垂不朽
                      </p>
                    </div>
                  </li>
                  <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                      <div class="layui-timeline-title">过去</div>
                    </div>
                  </li>
                </ul>
                
              
              </tbody>
            </table>
          </div>
        </div>
        
        <div class="layui-card">
          <div class="layui-card-header">商城效果报告</div>
          <div class="layui-card-body layadmin-takerates">
            <div class="layui-progress" lay-showPercent="yes">
              <h3>转化率（日同比 28% <span class="layui-edge layui-edge-top" lay-tips="增长" lay-offset="-15"></span>）</h3>
              <div class="layui-progress-bar" lay-percent="65%"></div>
            </div>
            <div class="layui-progress" lay-showPercent="yes">
              <h3>签到率（日同比 11% <span class="layui-edge layui-edge-bottom" lay-tips="下降" lay-offset="-15"></span>）</h3>
              <div class="layui-progress-bar" lay-percent="32%"></div>
            </div>
          </div>
        </div>
        
        <div class="layui-card">
          <div class="layui-card-header">店铺实时监控</div>
          <div class="layui-card-body layadmin-takerates">
            <div class="layui-progress" lay-showPercent="yes">
              <h3>商品浏览量</h3>
              <div class="layui-progress-bar" lay-percent="58%"></div>
            </div>
            <div class="layui-progress" lay-showPercent="yes">
              <h3>商品收藏量</h3>
              <div class="layui-progress-bar layui-bg-red" lay-percent="70%"></div>
            </div>
          </div>
        </div>
  </div>

        
      </div>
      
    </div>
  </div>

    <script src="/layui/layui.js"></script> 
	<script src="../layui/js/jquery.js"></script>
  <script>
	  layui.config({
		base: 'layuiadmin/' //静态资源所在路径
	  }).extend({
		index: 'lib/index' //主入口模块
	  }).use(['index', 'console']);
			
  //待办事项
		//商品相关
		$.ajax({
		type:"GET", 
			url:"http://localhost:8080/demo/table/user?page=1&limit=40000", 
			dataType:"json", 
				success:function(resp){ 
					var data = resp.data;
					$('#itemsize').text(data.length);
				} 
		}); 
	  //订单相关
	  $.ajax({
	  type:"GET", 
	  	url:"http://localhost:8894/order/getOrder", 
	  	dataType:"json", 
		success:function(resp){ 
			var data = resp.data;
			console.log(data); 
			var a= 0;
			var b= 0;
			var c= 0;
			for (var i = 0; i < data.length; i++) {
				switch (data[i].status){
					case 1:
						a++;
						break;
					case 2:
						b++;
						break;
					case 7:
						c++;
						break;
					default:
						break;
				}
			}
			$('#orStatus1').text(a);
			$('#orStatus2').text(b);
			$('#orStatus7').text(c);
		} 
	  }); 
	  
	  
	  //
	  $.ajax({
	  type:"GET", 
	  	url:"http://api.tianapi.com/txapi/weibohot/?key=772f3de546f3551e56137c4d327aae40", 
	  	dataType:"json", 
		success:function(data){ 
	  	var txapi="<tbody>"; 
	  for(var i=0; i<10; i++) 
	  {
	  	txapi+="<tr><td>"+data["newslist"][i]["hotword"]+"</td>"; 
	  	txapi+="<td>"+data["newslist"][i]["hotwordnum"]+"</td></tr>"; 
	  }
	  	txapi+="</tbody>"; 
	  $('#result').append(txapi); 
	  } 
	  }); 
	
/* 	$.ajax({
	type:"GET", 
		url:"https://api.shenjian.io/?appid=f296c81c25b1cd8f6194429a0be6127f111" 
		dataType:"json", 
			success:function(data){ 
		var txapi="<tbody>"; 
	for(var i=0; i<10; i++) 
	{
		txapi+="<tr><td>"+data["newslist"][i]["hotword"]+"</td>"; 
		txapi+="<td>"+data["newslist"][i]["hotwordnum"]+"</td></tr>"; 
	}
		txapi+="</tbody>"; 
	$('#relstest').append(txapi); 
	} 
	});
	 */
	
	 layui.use('carousel', function(index){
	        var W = $('#test1').width();//获取容器的宽度
	        var screenImage = $('#test1 img');//获取轮播图DOM
	        var theImage = new Image();
	        theImage.src = screenImage.attr("src");
	        var b =  theImage.width/theImage.height;//获取轮播图的原始宽高比例
	
	        var carousel = layui.carousel;
	        //建造实例
	        carousel.render({
	            elem: '#test1'
	            ,width: '100%' //设置容器宽度
				,height:'100%'
	            ,arrow: 'always' //始终显示箭头
	            //,anim: 'updown' //切换动画方式
	        });
	    });
	
	    //窗口变化是重新加载
	    $(window).resize(function () {
	        window.location.reload()
	    }) 
  </script>
</body>
</html>
