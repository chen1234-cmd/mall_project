<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>addlist</title>
<meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">

<link rel="stylesheet" href="layui/css/layui.css">
	<script type="text/javascript" src="/layui/js/jquery.js"></script>
	<script src="layui/layui.js"></script>
</head>

<body style="background-color: whitesmoke;">
	<div id="editForm" style="width: 750px; padding-top: 30px;">
		<form id="formData" class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">商品名称</label>
				<div class="layui-input-block">
					<input type="text" name="title" id="goodsName" required
						lay-verify="required" placeholder="请输入商品名称" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品价格</label>
				<div class="layui-input-block">
					<input type="text" name="price" id="goodsPrice" required
						lay-verify="required" placeholder="请输入商品价格/元" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品库存</label>
				<div class="layui-input-block">
					<input type="text" name="num" id="goodsNum" required
						lay-verify="required" placeholder="请输入商品库存/件" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品条形码</label>
				<div class="layui-input-block">
					<input type="text" name="barcode" id="goodsNum" required
						lay-verify="required" placeholder="请输入商品库存" value=""
						class="layui-input" />
				</div>
			</div>
			
			 <!--选择分类 联级-->
				 <div class="layui-form-item" lay-filter="test" >
					 <label class="layui-form-label">选择分类</label> 
					<div class="layui-input-inline"> 
						
						   <select id="province" lay-filter="province"  lay-verify="required" lay-search="">
						     <option value="">请选择</option>
						   </select>
						  </div>
						  <div class="layui-input-inline">
						   <select id="city" lay-filter="city" lay-verify="required" lay-search="">
						     <option value="">请选择</option>
						   </select>
						  </div>
						  <div class="layui-input-inline">
						   <select id="area" lay-filter="area" name="cid" lay-verify="required" lay-search="">
						     <option value="">请选择</option>
						   </select>
						  </div>
						</div>
			 		</div> 
				</div> 
				
			<div class="layui-form-item">
				<label class="layui-form-label">商品图片</label> 
				<div class="layui-input-block">
					<button type="button" class="layui-btn layui-btn-normal" id="test1">
					  <i class="layui-icon">&#xe67c;</i>上传图片
					</button>
					<div style="display:inline-block" id="newImg">
							<input name="image" id="image" type='hidden' value=''  />	
						
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">商品描述</label>
				<div class="layui-input-block">
					<textarea name="sellPoint" id="goodsDesc"
					requiredlay-verify="required" 
					class="layui-textarea" style="width: 650px; height: 190px;"></textarea>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left:110px;">
				<button type="button" lay-submit lay-filter="*" class="layui-btn layui-btn-lg" style="margin-right:50px;">添加</button>
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
					      layer.msg("上传图片成功！",{icon:1,time:2000});
					      var str="<img style='width:280px;height:160px;' src='"+res.url+"' />";
					      $("#newImg").append(str);
						  $('#image').attr('value',res.url);
					    }
					    ,error: function(){
					      layer.msg("上传图片失败！请重试！",{icon:5,time:2000});
					    }
					  });
					  
					  
					form.on('submit(*)',function(){
						$.ajax({
							type:"post",
							url:"goods/addGoods",
							data:$("#formData").serialize(),
							success:function(data){
								if(data.status==200){
									layer.msg("添加商品成功！",{icon:1,time:2000},function(){
										window.location.href="List_com.html";
									});
								}else{
									layer.msg("添加商品失败！请重试！",{icon:5,time:2000});
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
							  $.get("http://localhost:8080/test/list/"+0,function (data) {
								  console.log(data.data);
							    if(!data.status==200){
							      layer.msg(data.msg)
							    }else{
							      var $html = "";
							      if(data.data != null) {
							        $.each(data.data, function (index, item) {
										
							          $html += "<option value='" + item.id + "'>" + item.name + "</option>";
							        });
							        $("#province").append($html);
							        //append后必须从新渲染
							        form.render('select');
							      }
							    }
							  
							  });
							  
							  //监听省下拉框
							  form.on('select(province)', function(dataObj){
							    //移除城市下拉框所有选项
							    $("#city").empty();
							    var cityHtml = '<option value="">请选择或分类</option>';
							    $("#city").html(cityHtml);
							    var areaHtml = '<option value="">请选择或分类</option>';
							    $("#area").html(areaHtml);
							    provinceText = $("#province").find("option:selected").text();
							    var value = $("#province").val();
							    //异步加载下拉框数据
							    $.post("http://localhost:8080/test/list/"+value,{
									
								},function (data) {
							      if(!data.status==200){
							        layer.msg(data.msg)
							      }else{
							        var $html = "";
							        if(data.data != null) {
							          $.each(data.data, function (index, item) {
							            $html += "<option value='" + item.id + "'>" + item.name + "</option>";
							          });
							          $("#city").append($html);
							          //append后必须从新渲染
							          form.render('select');
							        }
							      }
							  
							    });
							  
							  });
							  
							  //监听市下拉框
							  form.on('select(city)', function(dataObj){
							    //移除县区下拉框所有选项
							    $("#area").empty();
							    var html = '<option value="">请选择或搜索县/区</option>';
							    $("#area").html(html);
							  
							    cityText = $("#city").find("option:selected").text();
							    var value = $("#city").val();
							    //异步加载下拉框数据
							    $.post("http://localhost:8080/test/list/"+value,{
									
								},function (data) {
							      if(!data.status==200){
							        layer.msg(data.msg)
							      }else{
							        var $html = "";
							        if(data.data != null) {
							          $.each(data.data, function (index, item) {
							            $html += "<option value='" + item.id + "'>" + item.name + "</option>";
							          });
							          $("#area").append($html);
							          //append后必须从新渲染
							          form.render('select');
							        }
							      }
							  
							    });
							  
							  });
							  
							  //监听县区下拉框
							  form.on('select(area)', function(dataObj){
							    areaText = $("#area").find("option:selected").text();
							  });
							});

       
	   
	});
});

 
</script>
</html>
