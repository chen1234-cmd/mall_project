<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>退款列表</title>
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
<div class="layui-form-item" style="margin:15px;height:30px; padding-top:30px ;" >
    	<div style="height:40px;width:80px;float:left;line-height:40px;">订单编号</div>
        <input type="text" class="layui-input" style="width:200px;float:left;" id="title" name="title" value="" lay-verify="" placeholder="请输入订单编号" autocomplete="off">
	    <div class="layui-input-inline" style="width:150px;text-align:center;" id="btn">
	       <button class="layui-btn but_  layui-btn layui-btn-normal " data-type="reload"  onclick="return false;"  id="btn1">搜索</button>
	    </div> 
</div>
</form>
<div>
    <table id="refund" lay-filter="banner"></table>
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
	
    <a class="layui-btn  layui-btn-xs layui-bg-red" title="退款" lay-event="edit">退款</a>
    <a class="layui-btn layui-btn-xs" title="拒绝" lay-event="delete">拒绝</a>
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
            
            //--------------方法渲染TABLE----------------
            var tableIns = table.render({
                elem: '#refund'
                , id: 'refund'
                , url: 'http://localhost:8894/order/RefundList'
                , cols: [[
                     { checkbox: true, LAY_CHECKED: false, fixed: true } //其它参数在此省略
                    ,{ field: 'orderId', title: '订单编号', width: 120, align: 'center',fixed: true, style:'color:#01AAED; font-size:16px;'}
					,{ field: 'itemId', title: '商品编号', width: 120, align: 'center',style:'color:#009688; font-size:16px;'}
                    , { field: 'title', title: '产品名称', width: 200,style:'color:#FFB800; font-size:15px;'}
					,{field:'picPath', title: '商品图片', width: 140,height:100, align: 'center',templet: function(d){
							return "<img src='"+d.picPath+ "' class='img-pic' />" ;
						}
					}
            		, { field: 'totalFee', title:'交易金额',style:'color:red; font-size:16px;', width: 150, align: 'center',
            				templet:function(d){
            					var str=d.totalFee/100+'元';
            					return str;
            		} }
            		, { field: 'totalFee', title:'退款金额',style:'color:red; font-size:16px;', width: 150, align: 'center',
            				templet:function(d){
            					var str=d.totalFee/100+'元';
            					return str;
            		} }
            		, { field: 'num', title: '数量',width:120,align: 'center',style:'color:red; font-size:18px;'}
            	  ,{title: '操作', fixed: 'right', width: 170, align: 'center', toolbar: '#bar'}
                ]]
                , page: true
                , limits: [5, 10, 15]
                , limit: 10 //默认采用10
                , done: function (res, curr, count)
                {
                    //如果是异步请求数据方式，res即为你接口返回的信息。
                    //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                    //console.log(res);
                    //得到当前页码
                    //console.log(curr);
                    $("#curPageIndex").val(curr);
                    //得到数据总量
                    //console.log(count);
                }
            });
            //#region --------------批量删除----------------
            $("#delete").click(function ()
            {
                var checkStatus = table.checkStatus('banner');
                var count = checkStatus.data.length;//选中的行数
                if (count > 0)
                {
                    parent.layer.confirm('确定要删除所选商品？', { icon: 3 }, function (index)
                    {
                        var data = checkStatus.data; //获取选中行的数据
                        var id = '';
                        for (var i = 0; i < data.length; i++)
                        {
                        	id += data[i].id + ",";
                        }
                        $.ajax({
                            url: 'banner/batchDelete',
                            type: "post",
                            data: { 'id': id },
                            success: function (result){
                                if (result.status==200){
                                     parent.layer.msg('删除成功', { icon: 1, shade: 0.4,anim:1, time: 1000 });
                                      $("#search").click();//重载TABLE
                                }else{
                                     parent.layer.msg("删除失败", { icon: 5, shade: 0.4, anim:2, time: 1000 });
									  $("#search").click();//重载TABLE
                                }
                                parent.layer.close(index);
                            }
                        })
                    });
                }
                else
                    parent.layer.msg("请至少选择一条数据", { icon: 5, shade: 0.4, time: 1000 });
            });
			
			
            //#region --------------搜索----------------
            $("#search").click(function ()
            {
            	var word=$("#keyword").val();
               table.reload('testReload', {
                   url: 'Item/findname'
                   ,methods:"post"
                   ,request: {
                    pageName: 'page' //页码的参数名称，默认：page
                    ,limitName: 'pageSize' //每页数据量的参数名，默认：limit
                   }
                   ,where: {
                    query : word
                   }
                   ,page: {
                    curr: 1
                   }
                  });
            });
			
            //工具条事件监听
            table.on('tool(banner)', function (obj)
            { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值
                var tr = obj.tr; //获得当前行 tr 的DOM对象
                if (layEvent === 'edit')
                { //编辑
                    layer.confirm('商品是否退款？', {
                    	  btn: ['确认', '取消'] //可以无限个按钮
                    	  ,btn1: function(index, layero){
                    		  $.ajax({
                    			   type: "POST",
                    			   url: "http://localhost:8894/order/refund",
                    			   data: "orderId="+data.orderId+"&itemId="+data.itemId,
                    			   success: function(data){
                    			     if(data.status==200){
                    			    	 parent.layer.msg('退款成功', { icon: 1, shade: 0.4, time: 1000 });
                    					 $("#search").click();//重载TABLE
                    			     }else{
                    			    	 parent.layer.msg('退款失败', { icon: 5, shade: 0.4, time: 1000 });
										  $("#search").click();//重载TABLE
                    			     }
                    			   }
                    			});
                    		  $(tr).remove();
                    		 layer.close(index); 
                    	  }
                    	});
                }else if(layEvent === 'delete'){
                	layer.confirm('是否撤销退款？', {
                		  btn: ['确认', '取消'] //可以无限个按钮
                		  ,btn1: function(index, layero){
                			  $.ajax({
                				   type: "POST",
                				   url: "http://localhost:8894/order/RevokeRefund",
                				   data: "orderId="+data.orderId+"&itemId="+data.itemId,
                				   success: function(data){
                				     if(data.status==200){
                				    	 parent.layer.msg('撤销成功', { icon: 1, shade: 0.4, time: 1000 });
										  $("#search").click();//重载TABLE
                				     }else{
                				    	 parent.layer.msg('撤销失败', { icon: 5, shade: 0.4, time: 1000 });
										  $("#search").click();//重载TABLE
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