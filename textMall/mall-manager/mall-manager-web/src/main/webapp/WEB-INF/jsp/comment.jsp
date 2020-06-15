<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>评价列表</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript" src="../layui/js/jquery.js"></script>
<script src="layui/layui.js"></script>
<style>
	.layui-table-cell{
	    height:40px;
	    line-height: 40px;
	}
</style>

</head>
<body>
	<div class="layui-fluid">
	  <div class="layui-card">
<form class="layui-form">
<div class="layui-form-item" style="margin:15px;height:30px; padding-top:30px ;" >
    	<div style="height:40px;width:80px;float:left;line-height:40px;">订单编号</div>
        <input type="text" class="layui-input" style="width:200px;float:left;" id="title" name="title" value="" lay-verify="" placeholder="请输入订单编号" autocomplete="off">
	    <div class="layui-input-inline" style="width:150px;text-align:center;" id="btn">
	       <button class="layui-btn but_  layui-btn layui-btn-normal " data-type="reload"  onclick="return false;"  id="btn1">搜索</button>
	    </div> 

</div>
</form>
<div>
    <table id="banner" lay-filter="banner"></table>
</div>
<div id="formData" style="width:350px ;display:none;padding-top:30px;">
	<form class="layui-form" id="RelyForm">
		<input type="hidden" name="id" id="id" />
	
		<div class="layui-form-item">
			    <label class="layui-form-label">回复</label>
			    <div class="layui-input-block">
			      <input type="text" name="bAssess" id="bAssess" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		
	</form>
</div>
</div>
</div>
<script type="text/html" id="bar">
    <a class="layui-btn  layui-btn-xs layui-bg-blue" title="回复" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>回复</a>
    <a class="layui-btn layui-btn-xs layui-bg-red" title="刪除" lay-event="delete"><i class="layui-icon layui-icon-delete"></i>刪除</a>
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
        layui.use(['layer', 'table','form','upload','laydate','rate'], function ()
        {
            table = layui.table;
            layer = layui.layer;
            form =layui.form;
			var rate = layui.rate;
            upload=layui.upload;
            laydate=layui.laydate;
            //--------------方法渲染TABLE----------------
             table.render({
                elem: '#banner'
                , id: 'banner'
                , url: 'http://localhost:8894/order/evaluate'
				//class="layui-table-cell laytable-cell-1-undefined laytable-cell-undefined"
                , cols: [[
                     { checkbox: true, LAY_CHECKED: false, fixed: true } //其它参数在此省略
                    ,{ field: 'id', title: 'ID', width: 80, align: 'center',fixed: true,style:'color:#2F4056; font-size:16px;'}
					, { field: 'orderid', title: '订单ID', width: 160, align: 'center',style:'color:#01AAED; font-size:16px;'}
                    , { field: 'itemid', title: '商品ID', width: 160, align: 'center',style:'color:red; font-size:16px;'}
                    , { field: 'assess', title: '买家留言', width: 150,style:'color:#FF5722; font-size:16px;' }
					,{ field: 'bAssess', title: '卖家回复', width: 150,style:'color:#5FB878; font-size:16px;' }
					, { field: 'start', title: '评分',width:230, templet:function(d){
						if(d.start==5){
							return "<i class='layui-icon' style='color:#FFB800; font-size:22px;'>&#xe67a;</i>"
							+"<i class='layui-icon' style='color:#FFB800; font-size:22px;'>&#xe67a;</i>"
							+"<i class='layui-icon' style='color:#FFB800; font-size:22px;'>&#xe67a;</i>"
							+"<i class='layui-icon' style='color:#FFB800; font-size:22px;'>&#xe67a;</i>"
							+"<i class='layui-icon' style='color:#FFB800; font-size:22px;'>&#xe67a;</i>&nbsp;&nbsp;<i style='font-style:normal; color:#FF5722; font-size:18px;'>五星</i>"
									
						}else if(d.start==4){
							return "<i class='layui-icon' style='color:#FFB800; font-size:22px;'>&#xe67a;</i>"
							+"<i class='layui-icon' style='color:#FFB800; font-size:22px;'>&#xe67a;</i>"
							+"<i class='layui-icon' style='color:#FFB800; font-size:22px;'>&#xe67a;</i>"
							+"<i class='layui-icon' style='color:#FFB800; font-size:22px;'>&#xe67a;</i>&nbsp;&nbsp;<i style='font-style:normal; font-size:18px; color:#FF5722;'>四星</i>"
						}else if(d.start==3){
							return "<i class='layui-icon' style='color:#FFB800; font-size:22px;'>&#xe67a;</i>"
							+"<i class='layui-icon' style='color:#FFB800; font-size:22px;'>&#xe67a;</i>"
							+"<i class='layui-icon' style='color:#FFB800; font-size:22px;'>&#xe67a;</i>&nbsp;&nbsp;<i style='font-style:normal; font-size:18px; color:#FF5722;'>三星</i>"
						}else if(d.start=2){
							return "<i class='layui-icon' style='color:#FFB800; font-size:22px;'>&#xe67a;</i>"
							+"<i class='layui-icon' style='color:#FFB800; font-size:22px;'>&#xe67a;</i>&nbsp;&nbsp;<i style='font-style:normal; font-size:18px; color:#FF5722;'>二星</i>"
						}else if(d.start=1){
							return "<i class='layui-icon' style='color:#FFB800;'>&#xe67a;</i>&nbsp;&nbsp;<i style='font-style:normal; font-size:18px; color:#FF5722;'>一星</i>"
						}
					} }
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
                        title: '回复信息',
                        shade: 0.4,  //阴影度
                        fix: false,
                        shadeClose: true,
                        maxmin: false,
                        area: ['400px;', '200px;'],    //窗体大小（宽,高）
                        content: $('#formData'),
                        success: function (layero, index)
                        {
                            var body = layer.getChildFrame('body', index); //得到子页面层的BODY
							 $("#id").val(data.id);
							 $('#bAssess').val();
                            form.render();
                            body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                        },
                        btn:['回复','取消'],
                        yes: function(index, layero){
						
                        	$.post('http://localhost:8894/order/Replyaccess',$('#RelyForm').serialize(),function(data){
                                if (data.status=200)
                                {
                                    parent.layer.msg('回复成功！', { icon: 1, shade: 0.4, time: 1000 });
									window.location.reload();
                                }
                                else
                                {
                                    parent.layer.msg('回复失败失败！', { icon: 5, shade: 0.4, time: 1000 });
                                }
                                layer.close(index);
                                $("#newImg").html("");
                        	}); 
                        }
                    });
                }else if(layEvent === 'delete'){
                	layer.confirm('是否删除该评价？', {
                		  btn: ['确认', '取消'] //可以无限个按钮
                		  ,btn1: function(index, layero){
                			  $.ajax({
                				   type: "POST",
                				   url: "http://localhost:8894/order/deletaccess",
                				   data: "id="+data.id,
                				   success: function(data){
                				     if(data.status==200){
                				    	 parent.layer.msg('删除成功', { icon: 1, shade: 0.4, time: 1000 });
											$("#search").click();
											$("#handle_status").val('')
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