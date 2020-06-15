<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css">
<script src="../layui/js/jquery.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<style>
	.layui-table-cell{
	    height:50px;
	    line-height: 50px;
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
    	<!-- <div style="height:40px;width:70px;float:left;line-height:40px;">订单编号:</div>
        <input type="text" class="layui-input" style="width:250px;float:left;" id="orderIdKeyword" name="orderIdKeyword" value="" lay-verify="" placeholder="请输入订单编号" autocomplete="off">
        <div style="height:40px;width:80px;float:left;line-height:40px;">&nbsp;&nbsp;起始日期:</div> -->
		 <!-- <input type="text" class="layui-input" id="test1" style="float:left;width:100px;> -->
       <!-- <input type="text" id="startDate" name="startDate"  class="layui-input" style="float:left;width:100px;"> 
        <div style="height:40px;width:80px;float:left;line-height:40px;">&nbsp;&nbsp;结束日期:</div>
        <input type="text" id="endDate" name="endDate"  class="layui-input" style="float:left;width:100px;">
		<div style="height:40px;width:70px;float:left;line-height:40px;">&nbsp;&nbsp;订单状态:</div>
		<div class="layui-input-inline" style="width:150px;">
			<select name="orderState" id="orderState">
				<option value="">请选择订单状态</option>
				<option value="1">待付款</option>
				<option value="2">待发货</option>
				<option value="3">待收货</option>
				<option value="4">待评价</option>
				<option value="5">完成</option>
			</select>
		</div> 
	    <div class="layui-input-inline" style="width:80px;">
	        <a class="layui-btn layui-bg-orange" id="search" data-type="reload" name="search" >
	            <i class="layui-icon "></i>搜索
	        </a>
	    </div> 
	    <div class="layui-input-inline" style="width:80px;">
		     <button class="layui-btn layui-btn-normal" id="reset"  name="reset" type="reset">
		            <i class="layui-icon">&#xe669;</i>重置
		     </button>
	    </div> --> 
</div>
</form>
<div>
    <table id="orders" lay-filter="orders"></table>
</div>
	
<!-- 查看商品信息 -->
 <div id="formData" style="display:none;width:750px;padding-top:10px;">
	<form id="orderForm" class="layui-form">
		<div class="layui-form-item">
			    <label class="layui-form-label">订单编号</label>
			    <div class="layui-input-block">
			      <input type="text" name="orderId" id="orderId" style='background-color:#F8F8F8;' readonly="readonly" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		<div class="layui-form-item">
			    <label class="layui-form-label">订单总价/分</label>
			    <div class="layui-input-block">
			      <input type="text" name="payment" id="payment" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
	<!-- 	 <div class="layui-form-item">
			    <label class="layui-form-label">订单地址</label>
			    <div class="layui-input-block">
			      <input type="text" name="orderAddress" id="orderAddress" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div> -->
		<div class="layui-form-item">
			 <label class="layui-form-label">收货地址</label>

			<div class="layui-input-inline" style="width: 130px;">
				 <input type="text" name="receiverState" id="receiverState" required lay-verify="required" value="" class="layui-input" /> 
			</div>
			
			<div class="layui-input-inline" style="width: 130px;">
			 <input type="text" name="receiverCity" id="receiverCity" required lay-verify="required" value="" class="layui-input" /> 
			</div>
		
			<div class="layui-input-inline" style="width: 130px;">
			 <input type="text" name="receiverDistrict" id="receiverDistrict" required lay-verify="required" value="" class="layui-input" /> 
			</div>
			
			<div class="layui-input-inline" style="width: 209px;">
			 <input type="text" name="receiverAddress" id="orderAddress" required lay-verify="required" value="" class="layui-input" /> 
			</div>
		
		</div>
	
		<div class="layui-form-item">
			    <label class="layui-form-label">收货人</label>
			    <div class="layui-input-block">
			      <input type="text" name="receiverName" id="receiverName" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		<div class="layui-form-item">
			    <label class="layui-form-label">收货电话</label>
			    <div class="layui-input-block">
			      <input type="text" name="receiverPhone" id="receiverPhone" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
	</form>
</div> 
</div> 
</div> 
<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-xs layui-bg-orange" title="查看" lay-event="show">查看</a>
    <a class="layui-btn layui-btn-xs layui-btn-normal" title="编辑" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" title="刪除" lay-event="delete">刪除</a>
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
	var element;
        layui.use(['layer', 'table','form','upload','laydate','element'], function ()
        {
            table = layui.table;
            layer = layui.layer;
            form =layui.form;
            upload=layui.upload;
            laydate=layui.laydate;
            element=layui.element;
            layui.laytpl.fn = function (value)
            {
                //json日期格式转换为正常格式
                var date = new Date(parseInt(value.replace("/Date(", "").replace(")/", ""), 10));
                var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
                return date.getFullYear() + "-" + month + "-" + day;
            }
            var start=laydate.render({
                elem: '#startDate', //指定元素
                type: 'date',
                max: 'date',
                btns:['clear','confirm'],
                done:function(value,date){
                	endMax=end.config.max;
                	end.config.min=date;
                	end.config.min.month=date.month-1;
                }
              });
            var end=laydate.render({
                elem: '#endDate', //指定元素
                type:'date',
                max:'date',
                done:function(value,date){
                	if($.trim(value)==''){
                		var curDate=new Date();
                		date={'date':curDate.getDate(),'month':curDate.getMonth()+1,'year':curDate.getFullYear()};
                	}
                	start.config.max=date;
                	start.config.max.month=date.month-1;
                }
              });
            //--------------方法渲染TABLE----------------
            var tableIns = table.render({
                elem: '#orders'
                , id: 'orders'
                , url: 'http://localhost:8894/order/getOrder'
                , cols: [[
                     { field: 'orderId', title: '订单编号', width: 100, align: 'center',style:'color:#FF5722; font-size:15px;' }
					 ,{field:'status', title: '订单状态', width: 102, align: 'center',templet: function(d){
					       if(d.status==1){
								return "<span class='layui-badge'>未付款</span>";
					       }else if(d.status==2){
								return "<span class='layui-badge layui-bg-blue'>已付款</span>";
					       }else if(d.status==3){		
								return "<span class='layui-badge layui-bg-cyan'>待发货</span>";
					       }else if(d.status==4){
								return "<span class='layui-badge layui-bg-green'>已发货</span>";
					 		}else if(d.status==5){
					 			return "<span class=’layui-badge layui-bg-red'>交易成功</span>";
							}else if(d.status==6){
					 			return "<span class='layui-badge layui-bg-orange'>交易关闭</span>";
							}else if(d.status==7){
								return "<span class='layui-badge layui-bg-cyan'>待退款</span>";
					       }else{
					       	return "完成";
					       }
					  	}
					 }
                     , { field: 'userId', title: '下单用户', width: 100, align: 'center',style:'color:#5FB878; font-size:15px;'/* ,templet:function(d){
                    	 return d.orderUser.userName
                     	} */
                     }
                    , { field: 'createTime', title: '下单日期', width: 180,style:'color:#393D49; font-size:14px;', align: 'center',
					templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>" }
                    , { field: 'payment', title: '订单总价', width: 130, align: 'center' , style:'color:red; font-size:15px;',templet:function(d){
						var payment=d.payment/100+'元';
						return payment;
					}}
                   
				  , { field: 'createTime', title: '下单时间',style:'color:#393D49; font-size:14px;', width: 180, align: 'center',
				  templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>" }
				   , { field: 'shippingName', title: '物流名称',style:'color:#393D49; font-size:15px;', width: 120, align: 'center' ,templet:function(d){
					   if(d.status==4){
						   return "<p class=’layui-badge style='color:#01AAED;  '>"+d.shippingName+"</p>";
					   }else if(d.status==3||d.status==2||d.status==1)  {
						  return "等待"; 
					  }else if(d.status==6)  {
							  return "<p style='color:#FF5722;'>交易已关闭</p>"; 
					  
					   }else if(d.status==7)  {
						  return "<p style='color:blue;'>正在处理退款</p>"; 
					   }else if(d.status==5)  {
							  return "<p class=’layui-badge style='color:#009688;  '>交易成功</p>"; 
					  
					   }
				   } }
				   , { field: 'shippingCode', title: '快递单号', width: 120, style:'color:#2F4056; font-size:16px;', align: 'center',templet: function(d){
					  if(d.status==1){
						  return "等待付款";
					  }else if(d.status==3||d.status==2){
						  return "<button onclick='deliverOrder(\""+d.orderId+"\")' class='layui-btn layui-btn-sm layui-btn-fluid layui-bg-blue layui-btn-warm'>发货</button>";
					  }else if(d.status==4){
						  return d.shippingCode;
					  }else if(d.status==6){
						 return "<p style='color:#1E9FFF;'>交易关闭</p>"; 
					  }else if(d.status==7){
						  return "<p style='color:blue;'>正在处理退款</p>"; 
					  }else{
						  return d.shippingCode;
					  }
				}
			}
				  ,{ field: 'buyerNick', title: '买家昵称', width: 120, align: 'center',style:'color:#393D49; font-size:14px;'}
				  , { field: 'buyerRate', title: '是否评价', width: 120, align: 'center',templet:function(d){
					  if(d.buyerRate==1){
						  return "<p style='color:#FFB800'>已评价<p>";
					  }else{
						  return "<p style='color:#FF5722'>待评价<p>";
					  }
					}
				  }
				  , {title: '操作', fixed: 'right', width: 190, align: 'center', toolbar: '#bar'}
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

            //#region --------------搜索----------------
            $("#search").click(function ()
            {
            	var keyword=$("#orderIdKeyword").val();
            	var start=$("#startDate").val();
            	var end=$("#endDate").val();
            	var state=$("#orderState").val();
                tableIns.reload({
                    where: {
                    	orderIdKeyword: keyword,
                    	startDate:start,
                    	endDate:end,
                    	orderState:state
                    },page: {
                    curr: 1 //重新从第 1 页开始
                  }
                });
            });
            //#endregion

            //工具条事件监听
            table.on('tool(orders)', function (obj)
            { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值
                var tr = obj.tr; //获得当前行 tr 的DOM对象
				var status =data.status;
                if (layEvent === 'edit')
                { //编辑
                    layer.open({
                        type: 1,
                        title: '修改收货人信息',
                        shade: 0.4,  //阴影度
                        fix: false,
                        shadeClose: true,
                        maxmin: false,
                        area: ['800px;', '380px;'],    //窗体大小（宽,高）
                        content: $('#formData'),
                        success: function (layero, index)
                        {
                            var body = layer.getChildFrame('body', index); //得到子页面层的BODY
                            $("#orderId").val(data.orderId);
                            $("#payment").val(data.payment/100);
							$("#orderAddress").val(data.orderShipping.receiverAddress);
							$("#receiverDistrict").val(data.orderShipping.receiverDistrict)
							$("#receiverState").val(data.orderShipping.receiverState);
							$("#receiverCity").val(data.orderShipping.receiverCity);
                            $("#receiverName").val(data.orderShipping.receiverName);
                            $("#receiverPhone").val(data.orderShipping.receiverMobile);
                            form.render();
                            body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                        },
                        btn:['修改','取消'],
                        yes: function(index, layero){
                        	$.post('http://localhost:8894/order/updateAddressOrder',$('#orderForm').serialize(),function(data){
                                if (data.status == 200)
                                {
                                    parent.layer.msg('修改成功', { icon: 1, shade: 0.4, time: 1000 });
                                    $("#search").click();
                                    $("#handle_status").val('');
									window.location.reload();
                                }
                                else
                                {
                                    parent.layer.msg('修改失败', { icon: 5, shade: 0.4, time: 1000 });
                                }
                                layer.close(index);
                        	}); 
                        }
                    });
                }else if(layEvent=='show'){
					var str="";
					$.ajax({
						type : "post",
						url : "http://localhost:8894/order/getOrderByOrderId",
						async: false,
						data:"orderId="+data.orderId,
						dataType : "json",
						success : function(resp) {
								str = str+ "<div class='layui-collapse' lay-accordion=''>";
									var date=new Date(data.createTime).toLocaleString();
									var data1 = resp.data;
									console.log(data1)
									str = str
											+ "<div class='layui-colla-item'>"
											+ "<h2 class='layui-colla-title'>订单编号："
											+  data1.orderId
											+ "&nbsp;&nbsp;总价："
											+ data1.payment/100
											+ "元&nbsp;订单日期："+date+"</h2>"
											+ "<div class='layui-colla-content layui-show'><h4>收货人："
											
											+ data1.orderShipping.receiverName
											+ "&nbsp;&nbsp;收货地址："
											+ data1.orderShipping.receiverDistrict+'/'+data1.orderShipping.receiverCity+'/'+data1.orderShipping.receiverAddress
											+ "&nbsp;电话："+data1.orderShipping.receiverMobile+"</h4>"
											+ "<div class='layui-form'><table class='layui-table'><thead><tr><th>商品名称</th><th>价格</th><th>数量</th><th>小计</th></tr>"
											+ "</thead><tbody>";
									var arr = data1.orderItems;
									for (var t = 0; t < arr.length; t++) {
										str = str
												+ "<tr><td><a href='"
												+ "javascript:;"
												+ "'>"
												+ arr[t].title
												+ "</a></td>" + "<td>"
												+ arr[t].price/100
												+ "</td><td>"
												+ arr[t].num
												+ "台</td><td>"
												+ arr[t].price/100
												* arr[t].num + "元</td>"
												+ "</tr>";
									}
									str = str
											+ "</tbody></table></div>"
											+ "</div></div>";
								str = str + "</div>";
						}
					});
					layer.open({
					    type: 1,
					    title: '查看订单详情',
					    shade: 0.4,  //阴影度
					    fix: false,
					    shadeClose: true,
					    maxmin: false,
					    area: ['800px;', '380px;'],    //窗体大小（宽,高）
					    content: str,
					    success: function (layero, index)
					    {
					        var body = layer.getChildFrame('body', index); //得到子页面层的BODY
					        element.render();
					        body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
					    },
					    btn:['关闭页面'],
					    yes: function(index, layero){
					         layer.close(index);
					    }
					});
					
				}else if(layEvent === 'delete'){
					if(status==1||status==6||status==8){
						layer.confirm('是否删除该订单？', {
							  btn: ['确认', '取消'] //可以无限个按钮
							  ,btn1: function(index, layero){
								  $.ajax({
									   type: "POST",
									   url: "http://localhost:8894/order/deleteOrder",
									   data: "orderId="+data.orderId,
									   success: function(msg){
									     if(msg.status==200){
									    	 parent.layer.msg('删除成功', { icon: 1, shade: 0.4, time: 1000 });
											 $("#search").click();
											 $("#handle_status").val('');
									     }else{
									    	 parent.layer.msg('订单正在交易中删除失败', { icon: 5, shade: 0.4, time: 1000 });
											 $("#search").click();
											 $("#handle_status").val('');
									     }
									   }
									});
								  $(tr).remove();
								  layer.close(index);
							  }
							});
					}else{
						layer.msg("该订单不允许删除")
					}
                }else if(layEvent ==='123'){
				}
            });
        });
		
		
		
        function deliverOrder(id){
			layer.open({
			    type: 1,
			    title: '发货',
			    shade: 0.4,  //阴影度
			    fix: false,
			    shadeClose: true,
			    maxmin: false,
			    area: ['600px;', '250px;'],    //窗体大小（宽,高）
			    content: "<div style='width:500px;padding-top:15px;'><div class='layui-form-item'><label class='layui-form-label'>订单编号</label>"+
                "<div class='layui-input-block'><input type='text' name='orderId' id='orderId' style='background-color:#F8F8F8;' "+
                " readonly='readonly' required lay-verify='required' value='"+id+"' class='layui-input' /></div></div>"+
                "<div class='layui-form-item'><label class='layui-form-label'>快递单号</label><div class='layui-input-block'><input type='text' "+
                " id='shippingCode' required lay-verify='required' class='layui-input' /></div></div></div>",
			    success: function (layero, index)
			    {
			        var body = layer.getChildFrame('body', index); //得到子页面层的BODY
			        body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
			    },
			    btn:['发货','取消'],
			    yes: function(index, layero){
			    	var abc =$("#shippingCode").val();
			    	$.post('oreder/orderDeliver',{orderId:id,shippingCode:abc,shippingName:'顺丰快递'},function(msg){
			            if (msg.status == 200)
			            {
			                parent.layer.msg('发货成功', { icon: 1, shade: 0.4, time: 1000 });
			                $("#search").click();
			                $("#handle_status").val('');
							window.location.reload();
			            }
			            else
			            {
			                parent.layer.msg('发货失败', { icon: 5, shade: 0.4, time: 1000 });
			            }
			            layer.close(index);
			    	}); 
			    }
			});
			
        } 
    </script>
</body>
</html>