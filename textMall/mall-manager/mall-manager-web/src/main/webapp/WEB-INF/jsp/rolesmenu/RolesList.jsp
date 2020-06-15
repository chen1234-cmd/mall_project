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
<link rel="stylesheet" href="../layui/css/layui.css">
<script type="text/javascript" src="../layui/js/jquery.js"></script>
<script src="../layui/layui.js"></script>
  <link rel="stylesheet" href="../../../layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-fluid">   
    <div class="layui-card">
      <div class="layui-form layui-card-header layuiadmin-card-header-auto">
        <div class="layui-form-item">
          <div class="layui-inline">
            角色筛选
          </div>
          <div class="layui-inline">
            <select name="rolename" lay-filter="LAY-user-adminrole-type">
              <option value="-1">全部角色</option>
              <option value="0">管理员</option>
              <option value="1">超级管理员</option>
              <option value="2">纠错员</option>
              <option value="3">采购员</option>
              <option value="4">推销员</option>
              <option value="5">运营人员</option>
              <option value="6">编辑</option>
            </select>
          </div>
        </div>
      </div>
      <div class="layui-card-body">
        <div style="padding-bottom: 10px;">
          <button class="layui-btn layuiadmin-btn-role" id="add" >添加</button>
        </div>
		<div>
			<table id="users" lay-filter="users"></table>
		</div>
        <script type="text/html" id="bar">
          <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
          <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete"><i class="layui-icon layui-icon-delete"></i>删除</a>
        </script>
      </div>
    </div>
  </div>
<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-xs layui-btn-normal" title="编辑" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs" title="刪除" lay-event="delete">刪除</a>
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
           
            //--------------方法渲染TABLE----------------
            var tableIns = table.render({
                elem: '#users'
                , id: 'users'
                , url: '/roles/rolesList'
                , cols: [[
                    { checkbox: true, LAY_CHECKED: false ,fixed: true } //其它参数在此省略
                    , { field: 'roleId', title: '角色ID', width: 440, align: 'center' }
                    , { field: 'roleName', title: '角色名称',width: 340,  align: 'center'}
                    , { field: 'roleRemark', title: '角色描述', width: 340,align: 'center' }
                    ,{title: '操作', fixed: 'right', toolbar: '#bar',width:150}
                ]]
				, id:'testReload'
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
			
           
            //工具条事件监听
            table.on('tool(users)', function (obj)
            { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值
                var tr = obj.tr; //获得当前行 tr 的DOM对象
                if (layEvent === 'edit')
                { //编辑
                    var index = layui.layer.open({
                    	type: 2 //此处以iframe举例
                    	   ,title: '编辑菜单'
                    	   ,area: ['400px', '400px']
                    	   ,shade: 0
                    	   ,maxmin: true
                    	   ,content: 'edRoles?roleId='+data.roleId+"&roleName="+data.roleName+"&roleRemark="+data.roleRemark
                    	   ,zIndex: layer.zIndex //重点1
                    	   ,success: function(layero,index){
                    	   }
                    })
                }else if(layEvent === 'delete'){
                	layer.confirm('是否删除该菜单？', {
                		  btn: ['确认', '取消'] //可以无限个按钮
                		  ,btn1: function(index, layero){
                			  $.ajax({
                				   type: "POST",
                				   url: "/deletRole",
                				   data: "roleId="+data.roleId,
                				   success: function(msg){
                				     if(msg.status==200){
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
			$("#add").click(function(){
				var index = layui.layer.open({
					type: 2 //此处以iframe举例
					       ,title: '添加角色'
					       ,area: ['450px', '450px']
					       ,shade: 0
					       ,maxmin: true
					       ,content: 'addRole'
						   ,success: function (layero, index)
						   {
							   var body = layer.getChildFrame('body', index); //得到子页面层的BODY
							   body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
						   }
					       ,zIndex: layer.zIndex //重点1
					       ,success: function(layero){
					         layer.setTop(layero); //重点2
					       }
				})
			
			});
        });
    </script>
</body>
</html>