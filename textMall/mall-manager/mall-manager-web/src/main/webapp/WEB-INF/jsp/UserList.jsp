<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript" src="/layui/js/jquery.js"></script>
<script src="layui/layui.js"></script>
</head>
<style>
	.layui-table-cell{
	    height:50px;
	    line-height: 50px;
	}
	
</style>
<body>
	<div class="layui-fluid">
		  <div class="layui-card">
<form class="layui-form">
<div class="layui-form-item" style="margin:15px;height:30px; padding-top:15px;" >
    	<div style="height:40px;width:80px;float:left;line-height:40px;">用户名</div>
        <input type="text" class="layui-input" style="width:200px;float:left;" id="title" name="title" value="" lay-verify="" placeholder="请输入用户名" autocomplete="off">
	    <div class="layui-input-inline" style="width:150px;text-align:center;" id="btn">
	       <button class="layui-btn but_  layui-btn layui-bg-orange " data-type="reload"  onclick="return false;"  id="btn1">搜索</button>
	    </div> 
	 
</div>
</form>
<div>
    <table id="users" lay-filter="users"></table>
</div>

 <!--修改密码-->
<div id="form1" style="width:400px heigh;display:none;padding-top:50px;">
       <div class="layui-row">
           <form class="layui-form" id="form1">
				<input type="hidden" name="id" id="UserId1" />
               <div class="layui-form-item">
                   <label for="L_pass" class="layui-form-label">
                       <span class="x-red">*</span>新密码</label>
                   <div class="layui-input-inline">
                       <input type="password" id="newpassword" name="password" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                   <div class="layui-form-mid layui-word-aux"> 6到16个字符</div></div>
               <div class="layui-form-item">
                   <label for="L_repass" class="layui-form-label">
                       <span class="x-red">*</span>确认密码</label>
                   <div class="layui-input-inline">
                       <input type="password" id="newpassword1" name="password" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
               </div>
           </form>
       </div>
   </div>
	
<div id="formData" style="width:700px;display:none;padding-top:15px;">
	<form class="layui-form" id="userForm">
		<input type="hidden" name="id" id="userId" />
		<div class="layui-form-item">
			    <label class="layui-form-label">用户名</label>
			    <div class="layui-input-block">
			      <input type="text" name="username" id="userName" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		<div class="layui-form-item">
			    <label class="layui-form-label">手机号码</label>
			    <div class="layui-input-block">
			      <input type="text" name="phone" id="userphone" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		<div class="layui-form-item">
			    <label class="layui-form-label">邮箱号码</label>
			    <div class="layui-input-block">
			      <input type="text" name="email" id="useremail" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		<div class="layui-form-item" pane="">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-block userSex" id="sex">
				<input type="radio" name="sex" value="男" title="男" checked="">
				<input type="radio" name="sex" value="女" title="女">
				<input type="radio" name="sex" value="保密" title="保密">
			</div>
		</div>
		<div class="layui-form-item" lay-filter="test" >
				<label class="layui-form-label">分配权限</label> 
			<div class="layui-input-inline"> 
			   <select name="roleId" id="province" lay-filter="province"  lay-verify="required" lay-search="" style="width: 30px;">
				 <option value="">请选择</option>
			   </select>
			</div>
			</div>
		<div class="layui-form-item">
			    <label class="layui-form-label">用户头像</label>
			    <img style="width:160px;height:110px;" src="" id="userImg" name="face">
			    <button type="button" class="layui-btn layui-btn-warm" id="uploadUserImg">
				  <i class="layui-icon">&#xe67c;</i>上传图片
				</button>
				<div style="display:inline-block;" id="newImg"></div>
		</div>
	</form>
</div>
</div>
</div>
<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-xs layui-btn-normal" title="编辑" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
<!-- 	<a class="layui-btn layui-btn-xs layui-btn layui-btn-warm" title="修改密码" lay-event="update">密码</a> -->
    <a class="layui-btn layui-btn-xs layui-btn layui-btn-sm layui-btn-danger" title="刪除" lay-event="delete"><i class="layui-icon layui-icon-delete"></i>刪除</a>
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
                elem: '#uploadUserImg' //绑定元素
                ,url: 'banner/uploadBannerImg' //上传接口
                ,data:'json'
                ,done: function(res){
                  layer.msg("上传图片成功！",{icon:1,time:2000});
                  var str="<img style='width:160px;height:110px;' src='"+res.url+"' /><input type='hidden' name='face' value='"+res.url+"' />";
                  $("#newImg").html(str);
                }
                ,error: function(){
                  layer.msg("图片上传失败！请重试！",{icon:5,time:2000});
                }
              });
            //--------------方法渲染TABLE----------------
            var tableIns = table.render({
                elem: '#users'
                , id: 'users'
                , url: '/demo/user/'
                ,width:1346
                , cols: [[
					  { checkbox: true, LAY_CHECKED: false ,fixed: true } //其它参数在此省略
					  , {field:'face', title: '用户头像', width: 130, align: 'center',templet: function(d){
					                  	   		var str="<img  style='width:120px;height:50px;' src='"+d.face+"';onclick='openImg(face)'  />";
					       	return str;
					  		}
					  }
                    , { field: 'id', title: '用户ID', width: 100, align: 'center' }
					, { field: 'msg', title: '角色', width: 130, 
						templet:function(d){
							if(msg = null){
								return "普通用户";
							}
								return d.msg;
							}
					  }
                    , { field: 'username', title: '用户名', width: 140, align: 'center'}
					
                    , { field: 'phone', title: '用户电话', width: 170, align: 'center' }
                    , { field: 'email', title: '用户邮箱', width: 220, align: 'center' }
					, { field: 'created', title: '创建时间', width: 220, align: 'center',
						templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
					
                   ,  { field:'status', title: '用户状态', width: 128, align: 'center',templet: function(d){
                          if(d.status==2){
                        	  return "<input type='checkbox' lay-filter='switchTest' name='"+d.id+"' lay-skin='switch' lay-text='正常|禁用'>";
                          }else{
                        	  return "<input type='checkbox' lay-filter='switchTest' name='"+d.id+"' lay-skin='switch' lay-text='正常|禁用' checked>";
                          }
                	 }
                   } ,{title: '操作', fixed: 'right', width: 180, align: 'center', toolbar: '#bar'}
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
                var checkStatus = table.checkStatus('users');
                var count = checkStatus.data.length;//选中的行数
                if (count > 0)
                {
                    parent.layer.confirm('确定要删除所选商品？', { icon: 3 }, function (index)
                    {
                        var data = checkStatus.data; //获取选中行的数据
                        var batchId = '';
                        for (var i = 0; i < data.length; i++)
                        {
                        	batchId += data[i].userId + ",";
                        }
                        $.ajax({
                            url: 'user/batchDelete',
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
						url:"user/changeUserState",
						data:"id="+id+"&status="+2,
						success:function(data){
							if(data.status==200){
								layer.msg('解禁用户成功！',{icon:1,time:2000});
							}else{
								layer.msg('解禁用户失败！请重试！',{icon:5,time:2000});
							}
						}
					});
				}else{
					$.ajax({
						type:"post",
						url:"user/changeUserState",
						data:"id="+id+"&status="+1,
						success:function(data){
							if(data.status==200){
								layer.msg("禁用用户成功！",{icon:1,time:2000});
							}else{
								layer.msg("禁用用户失败！请重试！",{icon:5,time:2000});
							}
						}
					});
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
                    layer.open({
                        type: 1,
                        title: '编辑用户信息',
                        shade: 0.4,  //阴影度
                        fix: false,
                        shadeClose: true,
                        maxmin: false,
                        area: ['750px;', '500px;'],    //窗体大小（宽,高）
                        content: $('#formData'),
                        success: function (layero, index)
                        {
                            var body = layer.getChildFrame('body', index); //得到子页面层的BODY
							$("#userId").val(data.id);
                            $("#userphone").val(data.phone);
                            $("#userName").val(data.username);
							$("#useremail").val(data.email);
							$("#sex").val(data.sex);
                            $("#userImg").attr("src",data.face);
                            form.render();
                            body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                        },
                        btn:['修改','取消'],
                        yes: function(index, layero){
                        	$.post('user/updateUser',$('#userForm').serialize(),function(data){
                                if (data.status ==200 )
                                {
                                    parent.layer.msg('修改用户信息成功！', { icon: 1, shade: 0.4, time: 1000 });
                                    $("#search").click();
                                    $("#handle_status").val('');
                                }
                                else
                                {
                                    parent.layer.msg('修改用户信息失败！', { icon: 5, shade: 0.4, time: 1000 });
                                }
                                layer.close(index);
                                $("#newImg").html("");
                        	}); 
                        }
                    });
                }else if(layEvent ==='update'){
					layer.open({
					    type: 1,
					    title: '修改密码',
					    shade: 0.4,  //阴影度
					    fix: false,
					    shadeClose: true,
					    maxmin: false,
					    area: ['400px;', '300px;'],    //窗体大小（宽,高）
					    content: $('#form1'),
					    success: function (layero, index)
					    {
					        var body = layer.getChildFrame('body', index); //得到子页面层的BODY
							$("#UserId1").val(data.id);
					        form.render();
					        body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
					    },
					    btn:['修改','取消'],
					    yes: function(index, layero){
					    	$.post('user/updateUser',$('#form1').serialize(),function(data){
					            if (data.status ==200 )
					            {
					                parent.layer.msg('修改密码成功！', { icon: 1, shade: 0.4, time: 1000 });
					                $("#search").click();
					                $("#handle_status").val('');
					            }
					            else
					            {
					                parent.layer.msg('修改密码失败！', { icon: 5, shade: 0.4, time: 1000 });
					            }
					            layer.close(index);
					            $("#newImg").html("");
					    	}); 
					    }
					});
					
				}else if(layEvent === 'delete'){
                	layer.confirm('是否删除该用户？', {
                		  btn: ['确认', '取消'] //可以无限个按钮
                		  ,btn1: function(index, layero){
                			  $.ajax({
                				   type: "POST",
                				   url: "user/deleteUser",
                				   data: "id="+data.id,
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
			function openImg(face) {
			    if (face) {
			        layer.open({
			            type: 1,
			            title: ['头像展示'],
			            skin: 'layui-layer-rim', //加上边框
			            area: ['400px', '400px'], //宽高
			            content: '<img src="' + d.face + '" height="557px" width="600px">'
			        });
			    } else {
			        layer.open({
			            type: 1,
			            title: ['该用户还没有上传头像~', 'font-size: 18px;'],
			            skin: 'layui-layer-rim', //加上边框
			        });
			    }
			}
			
			layui.use(['form','layer','jquery'],function(){
			  //异步加载下拉框数据
			  $.get("user/rolse",function (data) {
				  console.log(data.data);
			    if(!data.status==200){
			      layer.msg(data.msg)
			    }else{
			      var $html = "";
			      if(data.data != null) {
			        $.each(data.data, function (index, item) {
			          $html += "<option  value='" + item.roleId + "'>" + item.roleName + "</option>";
			        });
			        $("#province").append($html);
			        //append后必须从新渲染
			        form.render('select');
			      }
			    }
			  });
			});
			
        });
		
    </script>
</body>
</html>