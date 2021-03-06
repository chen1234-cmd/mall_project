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
	
</style>
</head>
<body>
	

			  <form class="layui-form">
			  <div class="layui-form-item" style="margin:15px;height:30px; padding-top:30px ;" >
			  	    	<div style="height:40px;width:80px;float:left;line-height:40px;">订单编号</div>
			  	        <input type="text" class="layui-input" style="width:200px;float:left;" id="title" name="title" value="" lay-verify="" placeholder="请输入订单编号" autocomplete="off">
			  		    <div class="layui-input-inline" style="width:150px;text-align:center;" id="btn">
			  		       <button class="layui-btn but_  layui-btn layui-btn-normal " data-type="reload"  onclick="return false;"  id="btn1">搜索</button>
			  		    </div> 
			 </div>
			 </form>
<!-- 	<fieldset class="layui-elem-field layui-field-title" id="zdytitle">
		<legend>广告位置</legend>
	</fieldset> -->
<!-- <form class="layui-form">
<div class="layui-form-item" style="margin:15px;height:30px;">
    	
        <input type="text" class="layui-input" style="display:inline-block;width:250px;float:left;" id="keyword" name="keyword" value="" lay-verify="" placeholder="搜索" autocomplete="off">
	    <div class="layui-input-inline" style="width:150px;text-align:center;">
	        <a class="layui-btn" id="search" data-type="reload" name="search">
	            <i class="layui-icon"></i>搜索
	        </a>
	    </div> 
	    <div style="float:left;width:380px;height:40px;">
	    	<!-- <div class="layui-input-inline" style="width:100px;margin-right:20px;">
		     	<a class="layui-btn layui-btn-normal" id="add" name="add">
		            <i class="layui-icon">&#xe654;</i>添加广告
		        </a>
		    </div> -->
		<!--    <div class="layui-input-inline" style="width:100px;">
		     	<a class="layui-btn layui-btn-normal" id="delete" name="delete">
		            <i class="layui-icon">&#x1006;</i>批量删除
		        </a>
		    </div>
    	</div>
</div>
</form> --> 
<div>
    <table id="type" lay-filter="type"></table>
</div>
<div id="formData" style="width:300px;display:none;padding-top:15px;">
	<form class="layui-form" id="typeForm">
		<input type="hidden" name="id" id="typeId" />
		<div class="layui-form-item">
			    <label class="layui-form-label">广告位置</label>
			    <div class="layui-input-block">
			      <input type="text" name="name" id="typeName" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
	</form>
</div>
<div id="addData" style="width:300px;display:none;padding-top:15px;">
	<form class="layui-form" id="addTypeForm">
		<div class="layui-form-item">
			    <label class="layui-form-label">广告名称</label>
			    <div class="layui-input-block">
			      <input type="text" name="typeName" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
	</form>
</div>

<script type="text/html" id="bar">
    <!-- <a class="layui-btn layui-btn-xs layui-btn-normal" title="编辑" lay-event="edit">编辑</a> -->
    <a class="layui-btn layui-btn-xs layui-bg-red" title="刪除" lay-event="delete">刪除</a>
</script>
<script type="text/html" id="dateTpl">
    {{ layui.laytpl.fn(d.editdate) }}
</script>
<script type="text/javascript">
var table;
var layer;
var form;
        layui.use(['layer', 'table','form'], function ()
        {
            table = layui.table;
            layer = layui.layer;
            form =layui.form;
            //--------------方法渲染TABLE----------------
            var tableIns = table.render({
                elem: '#type'
                , id: 'type'
                , url: 'test/category'
                ,width:790
                , cols: [[
                     { checkbox: true, LAY_CHECKED: false } //其它参数在此省略
                     ,{ field: 'id', title: '对应的类型编号', width: 130, align: 'center' }
					 ,{ field: 'parentId', title: '父类目ID', width: 100, align: 'center' }
                     , { field: 'name', title: '类型名称', width: 300, align: 'center'}
					 ,{ field:'status', title: '广告状态', width: 112, align: 'center',templet: function(d){
                          if(d.typeState==1){
                        	  return "<input type='checkbox' lay-filter='switchTest' name='"+d.status+"' lay-skin='switch' lay-text='禁用|正常'>";
                          }else{
                        	  return "<input type='checkbox' lay-filter='switchTest' name='"+d.status+"' lay-skin='switch' lay-text='正常|禁用' checked>";
                          }
                	 }
                  },{title: '操作', fixed: 'right',  align: 'center', toolbar: '#bar'}
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
            $("#add").click(function(){
            	layer.open({
                    type: 1,
                    title: '增加商品分类信息',
                    shade: 0.4,  //阴影度
                    fix: false,
                    shadeClose: true,
                    maxmin: false,
                    area: ['400px;', '200px;'],    //窗体大小（宽,高）
                    content: $('#addData'),
                    success: function (layero, index)
                    {
                        var body = layer.getChildFrame('body', index); //得到子页面层的BODY
                        form.render();
                        body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                    },
                    btn:['添加','取消'],
                    yes: function(index, layero){
                    	$.post('goodsType/addGoodsType',$('#addTypeForm').serialize(),function(data){
                            if (data == 'success')
                            {
                                parent.layer.msg('添加分类信息成功！', { icon: 1, shade: 0.4, time: 1000 });
                                $("#search").click();
                            }
                            else
                            {
                                parent.layer.msg('添加分类信息失败！', { icon: 5, shade: 0.4, time: 1000 });
                            }
                            layer.close(index);
                    	}); 
                    }
                });
            });
            //#region --------------批量删除----------------
            $("#delete").click(function ()
            {
                var checkStatus = table.checkStatus('type');
                var count = checkStatus.data.length;//选中的行数
                if (count > 0)
                {
                    parent.layer.confirm('确定要删除所选分类？', { icon: 3 }, function (index)
                    {
                        var data = checkStatus.data; //获取选中行的数据
                        var batchId = '';
                        for (var i = 0; i < data.length; i++)
                        {
                        	batchId += data[i].typeId + ",";
                        }
                        $.ajax({
                            url: 'goodsType/batchDelete',
                            type: "post",
                            data: { 'batchId': batchId },
                            success: function (result){
                                if (result=="success"){
                                     parent.layer.msg('删除成功', { icon: 1, shade: 0.4, time: 1000 })
                                     $("#search").click();//重载TABLE
                                }else{
                                     parent.layer.msg("删除失败", { icon: 5, shade: [0.4], time: 1000 });
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
                tableIns.reload({
                    where: {
                    	keyword: word
                    },page: {
                    curr: 1 //重新从第 1 页开始
                  }
                });
            });
            //#endregion
			form.on('switch(switchTest)',function(data){
				var id=data.elem.name;
				var flag=data.elem.checked;
				if(flag){
					$.ajax({
						type:"post",
						url:"goodsType/changeTypeState",
						data:"id="+id+"&status="+2,
						success:function(data){
							if(data.status==200){
								layer.msg('禁用广告成功！',{icon:1,time:2000});
							}else{
								layer.msg('禁用广告失败！请重试！',{icon:5,time:2000});
							}
						}
					});
				}else{
					$.ajax({
						type:"post",
						url:"goodsType/changeTypeState",
						data:"id="+id+"&status="+1,
						success:function(data){
							if(data.status==200){
								layer.msg("启用广告成功！",{icon:1,time:2000});
							}else{
								layer.msg("启用广告失败！请重试！",{icon:5,time:2000});
							}
						}
					});
				}
			});
            //工具条事件监听
            table.on('tool(type)', function (obj)
            { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值
                var tr = obj.tr; //获得当前行 tr 的DOM对象
                if (layEvent === 'edit')
                { //编辑
                    layer.open({
                        type: 1,
                        title: '编辑商品分类信息',
                        shade: 0.4,  //阴影度
                        fix: false,
                        shadeClose: true,
                        maxmin: false,
                        area: ['400px;', '200px;'],    //窗体大小（宽,高）
                        content: $('#formData'),
                        success: function (layero, index)
                        {
                            var body = layer.getChildFrame('body', index); //得到子页面层的BODY
                            $("#typeId").val(data.typeId);
                            $("#typeName").val(data.typeName);
                            form.render();
                            body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                        },
                        btn:['修改','取消'],
                        yes: function(index, layero){
                        	$.post('goodsType/updateGoodsType',$('#typeForm').serialize(),function(data){
                                if (data == 'success')
                                {
                                    parent.layer.msg('修改分类信息成功！', { icon: 1, shade: 0.4, time: 1000 });
                                    $("#search").click();
                                    $("#handle_status").val('');
                                }
                                else
                                {
                                    parent.layer.msg('修改分类信息失败！', { icon: 5, shade: 0.4, time: 1000 });
                                }
                                layer.close(index);
                        	}); 
                        }
                    });
                }else if(layEvent === 'delete'){
                	layer.confirm('是否删除该分类？', {
                		  btn: ['确认', '取消'] //可以无限个按钮
                		  ,btn1: function(index, layero){
                			  $.ajax({
                				   type: "POST",
                				   url: "goodsType/deleteGoodsType",
                				   data: "typeId="+data.typeId,
                				   success: function(msg){
                				     if(msg=='success'){
                				    	 parent.layer.msg('删除成功', { icon: 1, shade: 0.4, time: 1000 });
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