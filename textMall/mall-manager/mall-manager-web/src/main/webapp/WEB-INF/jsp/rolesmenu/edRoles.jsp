<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>编辑角色</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all" />
	<style type="text/css">
		.layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
		@media(max-width:1240px){
			.layui-form-item .layui-inline{ width:100%; float:none; }
		}
	</style>
	</head>
	<body>
		<div class="layui-layer-iframe">
		<form class="layui-form" style="width: 80%; padding-top: 20px;" id="addMenu">
				<input type="hidden" name="roleId" value="${roleId }" id="roleId" />
				<!-- 权限提交隐藏域 -->
				<input type="hidden" id="m"  name="m"/>
				<div class="layui-form-item">
					<label class="layui-form-label">角色名称</label>
					<div class="layui-input-block">
						<input type="text" id="roleName" class="layui-input userName"
							lay-verify="required" placeholder="请输入角色名称" name="roleName" value="">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">角色描述</label>
					<div class="layui-input-block">
						<input type="text" id="roleRemark" class="layui-input userName"
							 placeholder="请输入角色描述" name="roleRemark" value="">
					</div>
				</div>
				<!--权限树xtree  -->
				<div class="layui-form-item">
					<label class="layui-form-label">分配权限：</label>
				  	<div id="xtree" style="width:200px;margin-left: 100px">
				  	</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="editRole">立即提交</button>
				    </div>
				</div>
		</form>
		</div>
	</body>
<script src="../layui/js/layui-xtree.js"></script>
<script src="../layui/js/jquery.js"></script>
<script src="../../../layuiadmin/layui/layui.js"></script>    
<script>
 // function getQueryVariable(variable)
	//  {
	//         var query = window.location.search.substring(1);
	//         var vars = query.split("&");
	//         for (var i=0;i<vars.length;i++) {
	//                 var pair = vars[i].split("=");
	//                 if(pair[0] == variable){return pair[1];}
	//         }
	//         return(false);
	//  }	
	//  
function getUrlParam(name) {
      var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
      var paramName = window.location.search.substr(1).match(reg); 
      if(paramName != null){
          return decodeURIComponent(paramName[2]); //decodeURIComponent 处理中文乱码
      }
      return null;
}
var table;
var layer;
var form;
var upload;
var laydate;
	layui.config({
	  base: '../../../layuiadmin/' //静态资源所在路径
	}).extend({
	  index: 'lib/index' //主入口模块
	}).use(['jquery','index','useradmin', 'table'], function(){
	 table = layui.table;
	 layer = layui.layer;
	 form =layui.form;
	 laydate=layui.laydate
	 
	 $("#roleId").val(getUrlParam("roleId"));
	 $("#roleName").val(getUrlParam("roleName"));
	 $("#roleRemark").val(getUrlParam("roleRemark"));
	 
	 var xtree = new layuiXtree({
	       elem: 'xtree'  //(必填) 放置xtree的容器id，不带#号
	       , form: form    //(必填) layui 的 from
	       , data: '/TreetbMenus'  //(必填) 数据接口，需要返回指定结构json字符串
	       , ckall: true   //启动全选功能，默认false
	       , isopen: false
	       , ckallback: function () {}//全选框状态改变后执行的回调函数
	 });
	 form.on("submit(editRole)",function(data){
	 	var list=xtree.GetChecked()
	 	//菜单id
	 	var mStr="";
	 	for(var i=0;i<list.length;i++){
	 		mStr+=list[i].value+",";
	 		if(xtree.GetParent(list[i].value)!=null){
	 			mStr+=xtree.GetParent(list[i].value).value+",";
	 			if(xtree.GetParent(xtree.GetParent(list[i].value).value)!=null){
	  				mStr+=xtree.GetParent(xtree.GetParent(list[i].value).value).value+",";
	 			}
	 		}else{
	 			mStr+=list[i].value+",";
	 		}
	 	}
	 	//去除字符串末尾的‘,’
	 	mStr=mStr.substring(0,mStr.length-1)
	 	var m=$("#m");
	 	//将权限字符串写进隐藏域
	 	m.val(mStr)
	 	//弹出loading
	 	var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
	 	var msg;
	 	$.ajax({
	         type: "POST",
	         url: "/edRoleList",
	         data:$("#addMenu").serialize(),
			 dataType:'json',
	         success:function(data){
	 			if(data.status==200){
	 				msg="添加成功";
	 			}else{
	 				msg="添加失败";
	 			}
	 		}
	     });
	 	setTimeout(function(){
	     	top.layer.close(index);
	     	top.layer.msg(msg);
	 		layer.closeAll("iframe");
	  		//刷新父页面
	  		parent.location.reload();
	     },1500);
	 	return false;
	 })
})
</script>
</html>
