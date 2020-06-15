<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>tree-table</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../layui/css/common.css"/>
    <style>
        input {
            height: 33px;
            line-height: 33px;
            padding: 0 7px;
            border: 1px solid #ccc;
            border-radius: 2px;
            margin-bottom: -2px;
            outline: none;
        }

        input:focus {
            border-color: #009E94;
        }
    </style>
</head>
<body>
<div class="layui-container layui-text">
    <br><br>
    <div class="layui-btn-group">
        <button class="layui-btn layui-bg-orange" id="btn-expand">全部展开</button>
        <button class="layui-btn" id="btn-fold">全部折叠</button>
        <button class="layui-btn layui-bg-red" id="btn-refresh">刷新表格</button>
		<button class="layui-btn layui-bg-blue" id="btn-add">添加菜单</button>
    </div>

    <table id="table1" class="layui-table" lay-filter="table1"></table>
</div>
<div id="formdata1" style="width:400px;display:none;padding-top:15px;">
<form class="layui-form" id="fromdata">
		<input type="hidden" name="menuId" id="menuId" />
		<div class="layui-form-item">
			<label class="layui-form-label">菜单名</label>
			<div class="layui-input-block">
				<input type="text" id="title" class="layui-input userName"
					lay-verify="required" placeholder="请输入菜单名" name="title" value="">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">图标</label>
			<div class="layui-input-block">
				<input type="text" id="icon" class="layui-input userName"
					 placeholder="请填写图标代码" name="icon" value="">
					<label>（例：<text>&amp;#xe642;</text>）</label>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">资源路径</label>
			<div class="layui-input-block">
				<input type="text" id="href" name="href" class="layui-input userName"
					 placeholder="请输入资源路径" value="">
					<label>（<span style="color: red">*</span>例：log/logList）</label>
			</div>
		</div>
	</form>
</div>
<!--添加子菜单-->
<div id="formdata2" style="display:none;padding-top:15px;">
<form class="layui-form" style="width: 80%; padding-top: 15px;" id="addSizeMenu">
			<input type="hidden" name="parentId" value="0" id="parentId" />
			<input type="hidden" name="spread" value="false" id="spread" />
			<div class="layui-form-item">
				<label class="layui-form-label">菜单名</label>
				<div class="layui-input-block">
					<input type="text" id="title" class="layui-input userName"
						lay-verify="required" placeholder="请输入菜单名" name="title" value="">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">图标</label>
				<div class="layui-input-block">
					<input type="text" id="icon" class="layui-input userName"
						 placeholder="请填写图标代码" name="icon" value="">
						<label>（例：<text>&amp;#xe642;</text>）</label>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">资源路径</label>
				<div class="layui-input-block">
					<input type="text" id="href" name="href" class="layui-input userName"
						 placeholder="请输入资源路径" value="">
						<label>（<span style="color: red">*</span>例：log/logList）</label>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">排序</label>
				<div class="layui-input-block">
					<input type="number" id="sorting" name="sorting" class="layui-input userName"
						placeholder="排序(整数)" lay-verify="require" value="">
						<label>（<span style="color: red">*</span>例：999）</label>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">权限标识</label>
				<div class="layui-input-block">
					<input type="text" id="perms" name="perms" class="layui-input userName"
						placeholder="权限标识" value="">
					<label>（例：sys:role:list）</label>
				</div>
			</div>
	</form>
</div>
<!--添加菜单-->
<div id="formdata3" style="display:none;padding-top:15px;">
<form class="layui-form" style="width: 80%; padding-top: 15px;" id="addMenu">
			<input type="hidden" name="parentId" value="0" id="parentId" />
			<input type="hidden" name="spread" value="false" id="spread" />
			<div class="layui-form-item">
				<label class="layui-form-label">菜单名</label>
				<div class="layui-input-block">
					<input type="text" id="title" class="layui-input userName"
						lay-verify="required" placeholder="请输入菜单名" name="title" value="">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">图标</label>
				<div class="layui-input-block">
					<input type="text" id="icon" class="layui-input userName"
						 placeholder="请填写图标代码" name="icon" value="">
						<label>（例：<text>&amp;#xe642;</text>）</label>
				</div>
			</div>
			<!-- <div class="layui-form-item">
				<label class="layui-form-label">资源路径</label>
				<div class="layui-input-block">
					<input type="text" id="href" name="href" class="layui-input userName"
						 placeholder="请输入资源路径" value="">
						<label>（<span style="color: red">*</span>例：log/logList）</label>
				</div>
			</div> -->
			<div class="layui-form-item">
				<label class="layui-form-label">排序</label>
				<div class="layui-input-block">
					<input type="number" id="sorting" name="sorting" class="layui-input userName"
						placeholder="排序(整数)" lay-verify="require" value="">
						<label>（<span style="color: red">*</span>例：999）</label>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">权限标识</label>
				<div class="layui-input-block">
					<input type="text" id="perms" name="perms" class="layui-input userName"
						placeholder="权限标识" value="">
					<label>（例：sys:role:list）</label>
				</div>
			</div>
	</form>
</div>
<!-- 操作列 -->
<script type="text/html" id="oper-col">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-bg-orange layui-btn-xs" lay-event="add">添加</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="../layui/layui.js"></script>
<script src="../layui/js/jquery.js"></script>
<script>
    layui.config({
        base: '../layui/module/'
    }).extend({
        treetable: 'treetable-lay/treetable'
    }).use(['layer', 'form', 'table', 'treetable'], function () {
        var $ = layui.jquery;
        var table = layui.table;
		var form =layui.form;
        var layer = layui.layer;
        var treetable = layui.treetable;
		
        // 渲染表格
        var renderTable = function () {
            layer.load(2);
            $.get('/tbMenusList', function (res) {
                treetable.render({
                    treeColIndex: 1,
                    treeSpid: -1,
                    treeIdName: 'menuId',
                    treePidName: 'parentId',
                    treeDefaultClose: false,
                    treeLinkage: false,
                    elem: '#table1',
                    data: res.data,
                    page: false,
                    cols: [[
                        {type: 'numbers',title:'序号'},
                        {field: 'title', title: '菜单名称'},
                        {field: 'href', title: '资源地址'},
                        {field: 'icon', title: '图标' ,templet:function(d){
							htr='<div class="layui-icon">'+d.icon+'</div>';
							return htr;
						}},
                        {field: 'perms', title: '权限'},
                        {templet: '#oper-col', title: '操作' ,align: 'center',fixed: 'right'}
                    ]],
                    done: function () {
                        layer.closeAll('loading');
                    }
                });
            }, 'json');
        };

        renderTable();

        $('#btn-expand').click(function () {
            treetable.expandAll('#table1');
        });

        $('#btn-fold').click(function () {
            treetable.foldAll('#table1');
        });

        $('#btn-refresh').click(function () {
            renderTable();
        });
		
		$('#btn-add').click(function () {
			layer.open({
			    type: 1,
			    title: '添加菜单',
			    shade: 0.4,  //阴影度
			    fix: false,
			    shadeClose: true,
			    maxmin: false,
			    area: ['400px;', '400px;'],    //窗体大小（宽,高）
			    content: $('#formdata3'),
			    success: function (layero, index)
			    {
			        var body = layer.getChildFrame('body', index); //得到子页面层的BODY
			        form.render();
			        body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
			    },
			    btn:['添加','取消'],
			    yes: function(index, layero){
			    	$.post('/addTbmenus',$('#addMenu').serialize(),function(data){
			            if (data.status=200)
			            {
			                parent.layer.msg('添加菜单成功！', { icon: 1, shade: 0.4, time: 1000 });
							$("#search").click();
							$("#handle_status").val('');
							window.location.reload();
			            }
			            else
			            {
			                parent.layer.msg('添加菜单失败！', { icon: 5, shade: 0.4, time: 1000 });
			            }
			            layer.close(index);
			            $("#newImg").html("");
			    	}); 
			    }
			});
		});

        //监听工具条
        table.on('tool(table1)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值
            var tr = obj.tr; //获得当前行 tr 的DOM对象
			var id =data.menuId;
			var pid =data.parentId;
			var req_data =data;
            if (layEvent === 'del') {
				if(pid!=-1){
					console.log(req_data);
					layer.confirm('是否删除该功能？', {
						  btn: ['确认', '取消'] //可以无限个按钮
						  ,btn1: function(index, layero){
						  $.ajax({
						   type: "POST",
						   url: "/delTbmenus",
						   data: { 'menuId': id },
						   success: function(msg){
							 if(msg.status==200){
								 parent.layer.msg('删除成功', { icon: 1, shade: 0.4, time: 1000 });
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
				}else{
					layer.msg('权限不足');
				}
               
            } else if (layEvent === 'edit') {
				
				if(pid!=0&&pid!=-1){
					layer.open({
					    type: 1,
					    title: '编辑菜单',
					    shade: 0.4,  //阴影度
					    fix: false,
					    shadeClose: true,
					    maxmin: false,
					    area: ['500px;', '350px;'],    //窗体大小（宽,高）
					    content: $('#formdata1'),
					    success: function (layero, index)
					    {
					        var body = layer.getChildFrame('body', index); //得到子页面层的BODY
							$("#menuId").val(id);
					        $("#title").val(data.title);
							$("#icon").val(data.icon);
							$("#href").val(data.href);
					        form.render();
					        body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
					    },
					    btn:['修改','取消'],
					    yes: function(index, layero){
					    	$.post('/edtMenuList',$('#fromdata').serialize(),function(data){
					            if (data.status=200)
					            {
					                parent.layer.msg('修改信息成功！', { icon: 1, shade: 0.4, time: 1000 });
									$("#search").click();
									$("#handle_status").val('');
									window.location.reload();
					            }
					            else
					            {
					                parent.layer.msg('修改信息失败！', { icon: 5, shade: 0.4, time: 1000 });
					            }
					            layer.close(index);
					            $("#newImg").html("");
					    	}); 
					    }
					});
				}else{
					layer.msg('权限不足');
				}
               
            }else if(layEvent==='add'){
				if(pid!=0){
					layer.msg('子菜单下不能添加');
				}else{
					layer.open({
					    type: 1,
					    title: '添加子菜单',
					    shade: 0.4,  //阴影度
					    fix: false,
					    shadeClose: true,
					    maxmin: false,
					    area: ['400px;', '465px;'],    //窗体大小（宽,高）
					    content: $('#formdata2'),
					    success: function (layero, index)
					    {
					        var body = layer.getChildFrame('body', index); //得到子页面层的BODY
							$("#parentId").val(id);
					        form.render();
					        body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
					    },
					    btn:['添加','取消'],
					    yes: function(index, layero){
					    	$.post('/addmenulist',$('#addSizeMenu').serialize(),function(data){
					            if (data.status=200)
					            {
					                parent.layer.msg('添加子菜单成功！', { icon: 1, shade: 0.4, time: 1000 });
									$("#search").click();
									$("#handle_status").val('');
									window.location.reload();
					            }
					            else
					            {
					                parent.layer.msg('添加子菜单失败！', { icon: 5, shade: 0.4, time: 1000 });
					            }
					            layer.close(index);
					            $("#newImg").html("");
					    	}); 
					    }
					});
				}
			
			}
        });
    });
</script>
</body>
</html>