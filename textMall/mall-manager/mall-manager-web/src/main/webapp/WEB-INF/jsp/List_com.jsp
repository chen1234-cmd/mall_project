<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript" src="../layui/js/jquery.js"></script>
<script src="layui/layui.js"></script>
<style>
	.layui-table-cell{
	    height:45px;
	    line-height: 45px;
	}
</style>

</head>
<body>
	<div class="layui-fluid">
		  <div class="layui-card">
<form class="layui-form">
<div class="layui-form-item" style="margin:15px;height:30px; padding-top:20px ;" >
    	<div style="height:40px;width:80px;float:left;line-height:40px;">商品名称</div>
        <input type="text" class="layui-input" style="width:200px;float:left;" id="title" name="title" value="" lay-verify="" placeholder="请输入商品名称" autocomplete="off">
	    <div class="layui-input-inline" style="width:150px;text-align:center;" id="btn">
	       <button class="layui-btn but_  layui-btn layui-btn-normal " data-type="reload"  onclick="return false;"  id="btn1">搜索</button>
	    </div> 
	   <!-- <div style="float:right;width:130px;height:35px;">
		    <div class="layui-input-inline" style="width:100px;">
		     	<a class="layui-btn layui-btn-normal" id="delete1" name="delete">
		            <i class="layui-icon">&#x1006;</i>批量删除
		        </a>
		    </div>
    	</div> -->
</div>
</form>
<div>
    <table id="banner" lay-filter="banner"></table>
</div>
<div id="formData" style="width:700px;display:none;padding-top:15px;">
	<form class="layui-form" id="bannerForm">
		<input type="hidden" name="id" id="bannerId" />
		<div class="layui-form-item">
			    <label class="layui-form-label">商品名称</label>
			    <div class="layui-input-block">
			      <input type="text" name="title" id="bannerName" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		<div class="layui-form-item">
			    <label class="layui-form-label">商品库存</label>
			    <div class="layui-input-block">
			      <input type="text" name="num" id="bannerUrl" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		<div class="layui-form-item">
			    <label class="layui-form-label">商品价格</label>
			    <div class="layui-input-block">
			      <input type="text" name="price" id="categoryId" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		<div class="layui-form-item">
			    <label class="layui-form-label">商品条形码</label>
			    <div class="layui-input-block">
			      <input type="text" name="barcode" id="barcode" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		<div class="layui-form-item">
			    <label class="layui-form-label">商品描述</label>
			    <div class="layui-input-block">
			      <input type="text" name="sellPoint" id="sellPoint" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		<div class="layui-form-item">
			    <label class="layui-form-label">商品图</label>
			    <img style="width:230px;height:130px;" src="" id="bannerImg" name="pic">
			    <button type="button" class="layui-btn layui-btn-warm" id="uploadbannerImg">
				  <i class="layui-icon">&#xe67c;</i>上传图片
				</button>
				<div style="display:inline-block;" id="newImg"></div>
		</div>
	</form>
</div>
</div>
</div>
<script type="text/html" id="bar">
    <a class="layui-btn  layui-btn-xs layui-btn-normal" title="编辑" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-bg-red" title="刪除" lay-event="delete">刪除</a>
</script>
<script type="text/html" id="dateTpl">
    {{ layui.laytpl.fn(d.editdate) }}
</script>
<script type="text/javascript">
var table;
var layer;
var form;
var upload;
var laydate;
        layui.use(['layer', 'table','form','upload','laydate'], function ()
        {
            table = layui.table;
            layer = layui.layer;
            form =layui.form;
            upload=layui.upload;
            laydate=layui.laydate;
            layui.laytpl.fn = function (value)
            {
                //json日期格式转换为正常格式
                var date = new Date(parseInt(value.replace("/Date(", "").replace(")/", ""), 10));
                var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
                return date.getFullYear() + "-" + month + "-" + day;
            }
            var uploadInst = upload.render({
                elem: '#uploadbannerImg' //绑定元素
                ,url: 'banner/uploadBannerImg' //上传接口
                ,data:'json'
                ,done: function(res){
                  layer.msg("上传图片成功！",{icon:1,shade:0.4,time:1000});
                  var str="<img style='width:230px;height:130px;' src='"+res.url+"' /><input type='hidden' name='image' value='"+res.url+"' />";
                  $("#newImg").html(str);
                }
                ,error: function(){
                  layer.msg("图片上传失败！请重试！",{icon:5,shade:0.4,time:1000});
                }
              });
            //--------------方法渲染TABLE----------------
             table.render({
                elem: '#banner'
                , id: 'banner'
                , url: '/findTitle'
				//class="layui-table-cell laytable-cell-1-undefined laytable-cell-undefined"
                , cols: [[
                     { checkbox: true, LAY_CHECKED: false, fixed: true } //其它参数在此省略
                    ,{ field: 'id', title: '商品ID', width: 100,templet:function(d){
						return "<span class='layui-badge layui-bg-orange'>"+d.id+"</span>"
					}}
                    , { field: 'title', title: '商品名称', width: 212,style:'color:#2F4056; font-size:14px;'}
					,{field:'image', title: '商品图片', width: 120,height:100, align: 'center',templet: function(d){
					    var str="<img src='"+d.image+ "' class='img-pic' />"
							return str;
						}
					}
                    , { field: 'num', title: '商品库存', width: 130 ,style:'color:#5FB878; font-size:16px;',templet:function(d){
						return d.num+'台/件'
					}}
					, { field: 'price', title:'商品单价',style:'color:#FF5722; font-size:16px;', width: 120, align: 'center',
							templet:function(d){
								var str=d.price/100+'元';
								return str;
					} }
					, { field: 'barcode', title:'商品条形码', width: 120, align: 'center',style:'color:#01AAED; font-size:16px;' }
					, { field: 'sellPoint', title: '商品描述',width:212 ,style:'color:#2F4056; font-size:14px;'}
                   ,{ field:'status', title: '商品状态', width: 112, align: 'center',templet: function(d){
                          if(d.status==2){
							 return "<input type='checkbox' lay-filter='switchTest' name='"+d.id+"' lay-skin='switch' lay-text='上架|下架'>";
                          }else{
                        	   return "<input type='checkbox' lay-filter='switchTest' name='"+d.id+"' lay-skin='switch' lay-text='上架|下架' checked>";
                          }
                	 }
                  }, { field: 'created', title:'创建时间', width: 180, style:'color:#393D49; font-size:16px;',align: 'center',
						templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>" }
				  ,{title: '操作', fixed: 'right', width: 160, align: 'center', toolbar: '#bar'}
                ]]
				,id:'testReload'
                , page: true
                , limits: [5, 10, 15]
                , limit: 10 //默认采用10
                , done: function (res, curr, count)
				
                {
                    $("#curPageIndex").val(curr);
                }
            });
			
			//#region --------------搜索----------------
			  //根据条件查询表格数据重新加载
			  var $ = layui.$, active = {
				    reload: function(){
				    //获取用户名
				      var keyword = $('#title');
				      //执行重载
				      table.reload('testReload', {
				        page: {
				          curr: 1 //重新从第 1 页开始
				      }
				      //根据条件查询
				        ,where: {
				        	title:keyword.val()
				        }
				      });
				   }
				};
			  //点击搜索按钮根据用户名称查询
			  $('#btn1').on('click',
		          function(){
		              var type = $(this).data('type');
		              active[type] ? active[type].call(this) : '';
		          });
			  //#region --------------批量删除----------------
			  $("#delete1").click(function (){
			      var checkStatus = table.checkStatus('banner');
			      var count = checkStatus.data.length;//选中的行数
			      if (count > 0){
			          parent.layer.confirm('确定要删除所选轮播？', { icon: 3 }, function (index)
			          {
			              var data = checkStatus.data; //获取选中行的数据
			              var id = '';
			              for (var i = 0; i < data.length; i++)
			              {
			              	id += data[i].id + ",";
			              }
			              $.ajax({
			                  url: 'order/batchDelete',
			                  type: "post",
			                  data: { 'id': id },
			                  success: function (data){
			                      if (date.status==200){
			                           parent.layer.msg('删除成功', { icon: 1, shade: 0.4,anim:1, time: 1000 })
			                           $("#search").click();//重载TABLE
			                      }else{
			                           parent.layer.msg("删除失败", { icon: 5, shade: 0.4, anim:2, time: 1000 });
			                      }
			                      parent.layer.close(index);
			                  }
			              })
			          });
			      }
			      else
			          parent.layer.msg("请至少选择一条数据", { icon: 5, shade: 0.4, time: 1000 });
			  });
			
            //#endregion
			form.on('switch(switchTest)',function(data){
				var id=data.elem.name;
				var flag=data.elem.checked;
				if(flag){
					$.ajax({
						type:"post",
						url:"banner/changeBannerState",
						data:"id="+id+"&status="+2,
						success:function(data){
							if(data.status==200){
								layer.msg('上架成功！',{icon:1,shade:0.4,anim: 1,time:1000});
							}else{
								layer.msg('上架失败！请重试！',{icon:5,shade:0.4,time:1000});
							}
						}
					});
				}else{
					$.ajax({
						type:"post",
						url:"banner/changeBannerState",
						data:"Id="+id+"&status="+1,
						success:function(data){
							if(data.status==200){
								layer.msg("下架成功！",{icon:1,shade:0.4,anim: 2,time:1000});
							}else{
								layer.msg("下架失败！请重试！",{icon:5,shade:0.4,time:1000});
							}
						}
					});
				}
			});
            //工具条事件监听
            table.on('tool(banner)', function (obj)
            { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值
                var tr = obj.tr; //获得当前行 tr 的DOM对象
                if (layEvent === 'edit')
                { //编辑
                    layer.open({
                        type: 1,
                        title: '编辑商品信息',
                        shade: 0.4,  //阴影度
                        fix: false,
                        shadeClose: true,
                        maxmin: false,
                        area: ['750px;', '550px;'],    //窗体大小（宽,高）
                        content: $('#formData'),
                        success: function (layero, index)
                        {
                            var body = layer.getChildFrame('body', index); //得到子页面层的BODY
							 $("#bannerId").val(data.id);
                            $("#bannerName").val(data.title);
                            $("#bannerUrl").val(data.num);
							 $("#categoryId").val(data.price/100);
							$("#barcode").val(data.barcode);
							$("#sellPoint").val(data.sellPoint);
                            $("#bannerImg").attr("src",data.image);
                            form.render();
                            body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                        },
                        btn:['修改','取消'],
                        yes: function(index, layero){
						
                        	$.post('/editItem',$('#bannerForm').serialize(),function(data){
                                if (data.status=200)
                                {
                                    parent.layer.msg('修改商品信息成功！', { icon: 1, shade: 0.4, time: 1000 });
									window.location.reload();
                                }
                                else
                                {
                                    parent.layer.msg('修改商品信息失败！', { icon: 5, shade: 0.4, time: 1000 });
                                }
                                layer.close(index);
                                $("#newImg").html("");
                        	}); 
                        }
                    });
                }else if(layEvent === 'delete'){
                	layer.confirm('是否删除该商品？', {
                		  btn: ['确认', '取消'] //可以无限个按钮
                		  ,btn1: function(index, layero){
                			  $.ajax({
                				   type: "POST",
                				   url: "test/deleteitem",
                				   data: "id="+data.id,
                				   success: function(data){
                				     if(data.status==200){
                				    	 parent.layer.msg('删除成功', { icon: 1, shade: 0.4, time: 1000 });
											$("#search").click();
											$("#handle_status").val('')
											window.location.reload();
                				     }else{
                				    	 parent.layer.msg('删除失败', { icon: 5, shade: 0.4, time: 1000 });
										 
                				     }
                				   }
                				});
                			  $(tr).remove();
                			 layer.close(index); 
                		  }
                		});
                }
            });
        });
    </script>
</body>
</html>