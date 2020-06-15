<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title></title>
<meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="layui/css/layui.css">
	<script type="text/javascript" src="../layui/js/jquery.js"></script>
	<script src="layui/layui.js"></script>
</head>

<body>
	<div id="editForm" style="width: 700px; padding-top: 20px;">
		<form id="formData" class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">轮播名称</label>
				<div class="layui-input-block">
					<input type="text" name="title" id="bannerName" required
						lay-verify="required" placeholder="请输入轮播名称" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">轮播路径</label>
				<div class="layui-input-block">
					<input type="text" name="url" id="bannerUrl" required
						lay-verify="required" placeholder="请输入轮播URL" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">价格</label>
				<div class="layui-input-block">
					<input type="text" name="titleDesc" id="titleDesc" required
						lay-verify="required" placeholder="请输入价格" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">评论</label>
				<div class="layui-input-block">
					<input type="text" name="content" id="content" required
						lay-verify="required" placeholder="请输入评论" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">子标题</label>
				<div class="layui-input-block">
					<input type="text" name="subTitle" id="subTitle" required
						lay-verify="required" placeholder="请输入子标题" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item" lay-filter="test" >
					<label class="layui-form-label">选择广告</label> 
				<div class="layui-input-inline"> 
				   <select name="categoryId" id="province" lay-filter="province"  lay-verify="required" lay-search="">
					 <option value="">请选择</option>
				   </select>
				</div>
				</div>
		
			<div class="layui-form-item">
				<label class="layui-form-label">轮播图片</label> 
				<div class="layui-input-block">
					<button type="button" class="layui-btn layui-btn-normal" id="test1">
					  <i class="layui-icon">&#xe67c;</i>上传图片
					</button>
					<div style="display:inline-block" id="newImg"></div>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left:110px;">
				<button type="button" lay-submit lay-filter="*" class="layui-btn layui-btn-lg layui-bg-red" style="margin-right:50px;">添加</button>
				<button type="reset" class="layui-btn layui-btn-warm layui-btn-lg">重置</button>
			</div>
		</form>
	</div>
</body>
<script>
	$(function(){
		layui.use(['layer', 'table','form','upload'], function ()
		        {
		            var table = layui.table;
		            var layer = layui.layer;
		            var form =layui.form;
					var upload=layui.upload;
					var uploadInst = upload.render({
					    elem: '#test1' //绑定元素
					    ,url: '/banner/uploadBannerImg' //上传接口
					    ,done: function(res){
					      layer.msg("上传图片成功！",{icon:1,time:1000});
					      var str="<img style='width:280px;height:160px;' src='"+res.url+"' /><input type='hidden' value='"+res.url+"' name='pic' />"
					      $("#newImg").html(str);
					    }
					    ,error: function(){
					      layer.msg("上传图片失败！请重试！",{icon:5,anim: 6,time:1000});
					    }
					  });
					form.on('submit(*)',function(){
						$.ajax({
							type:"post",
							url:"banner/addBanner",
							data:$("#formData").serialize(),
							success:function(data){
								if(data.status==200){
									layer.msg("添加轮播图成功！",{icon:1,shade:0.4, anim:1,time:1000},function(){
										window.location.href="bannerlist.html";
									});
								}else{
									layer.msg("添加轮播图失败！请重试！",{icon:5,shade:0.4,anim:6,time:1000});
								}
							}
						});
						return false;
					});
					
					layui.use(['form','layer','jquery'],function(){
					  var form = layui.form,
					   layer = parent.layer === undefined ? layui.layer : parent.layer,
					   $ = layui.jquery;
					  
					  var provinceText = "";
					  var cityText = "";
					  var areaText = "";
					  //异步加载下拉框数据
					  $.get("http://localhost:8080/test/content/",function (data) {
						  console.log(data.data);
					    if(!data.status==200){
					      layer.msg(data.msg)
					    }else{
					      var $html = "";
					      if(data.data != null) {
					        $.each(data.data, function (index, item) {
					          $html += "<option  value='" + item.id + "'>" + item.name + "</option>";
					        });
					        $("#province").append($html);
					        //append后必须从新渲染
					        form.render('select');
					      }
					    }
					  });
					});
	});
});
</script>
</html>
