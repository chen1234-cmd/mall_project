/** layuiAdmin.std-v1.0.0 LPPL License By http://www.layui.com/admin/ */ ;
layui.define(["table", "form"], function(e) {
	var t = layui.$,
		i = layui.table;
	layui.form;
	i.render({
		elem: "#LAY-user-manage",
		url: layui.setter.base + "json/useradmin/webuser.js",
		cols: [
			[{
				type: "checkbox",
				fixed: "left"
			}, {
				field: "id",
				width: 100,
				title: "ID",
				sort: !0
			}, {
				field: "username",
				title: "用户名",
				minWidth: 100
			}, {
				field: "avatar",
				title: "头像",
				width: 100,
				templet: "#imgTpl"
			}, {
				field: "phone",
				title: "手机"
			}, {
				field: "email",
				title: "邮箱"
			}, {
				field: "sex",
				width: 80,
				title: "性别"
			}, {
				field: "ip",
				title: "IP"
			}, {
				field: "jointime",
				title: "加入时间",
				sort: !0
			}, {
				title: "操作",
				width: 150,
				align: "center",
				fixed: "right",
				toolbar: "#table-useradmin-webuser"
			}]
		],
		page: !0,
		limit: 30,
		height: "full-220",
		text: "对不起，加载出现异常！"
	}), i.on("tool(LAY-user-manage)", function(e) {
		e.data;
		if ("del" === e.event) layer.prompt({
			formType: 1,
			title: "敏感操作，请验证口令"
		}, function(t, i) {
			layer.close(i), layer.confirm("真的删除行么", function(t) {
				e.del(), layer.close(t)
			})
		});
		else if ("edit" === e.event) {
			t(e.tr);
			layer.open({
				type: 2,
				title: "编辑用户",
				content: "../../../views/user/user/userform.html",
				maxmin: !0,
				area: ["500px", "450px"],
				btn: ["确定", "取消"],
				yes: function(e, t) {
					var l = window["layui-layer-iframe" + e],
						r = "LAY-user-front-submit",
						n = t.find("iframe").contents().find("#" + r);
					l.layui.form.on("submit(" + r + ")", function(t) {
						t.field;
						i.reload("LAY-user-front-submit"), layer.close(e)
					}), n.trigger("click")
				},
				success: function(e, t) {}
			})
		}
	}), i.render({
		elem: "#LAY-user-back-manage",
		url: layui.setter.base + "json/useradmin/mangadmin.js",
		cols: [
			[{
				type: "checkbox",
				fixed: "left"
			}, {
				field: "id",
				width: 80,
				title: "ID",
				sort: !0
			}, {
				field: "loginname",
				title: "登录名"
			}, {
				field: "telphone",
				title: "手机"
			}, {
				field: "email",
				title: "邮箱"
			}, {
				field: "role",
				title: "角色"
			}, {
				field: "jointime",
				title: "加入时间",
				sort: !0
			}, {
				field: "check",
				title: "审核状态",
				templet: "#buttonTpl",
				minWidth: 80,
				align: "center"
			}, {
				title: "操作",
				width: 150,
				align: "center",
				fixed: "right",
				toolbar: "#table-useradmin-admin"
			}]
		],
		text: "对不起，加载出现异常！"
	}), i.on("tool(LAY-user-back-manage)", function(e) {
		e.data;
		if ("del" === e.event) layer.prompt({
			formType: 1,
			title: "敏感操作，请验证口令"
		}, function(t, i) {
			layer.close(i), layer.confirm("确定删除此管理员？", function(t) {
				console.log(e), e.del(), layer.close(t)
			})
		});
		else if ("edit" === e.event) {
			t(e.tr);
			layer.open({
				type: 2,
				title: "编辑角色",
				content: "edRoles",
				area: ["420px", "420px"],
				btn: ["确定", "取消"],
				yes: function(e, t) {
					var l = window["layui-layer-iframe" + e],
						r = "LAY-user-back-submit",
						n = t.find("iframe").contents().find("#" + r);
					l.layui.form.on("submit(" + r + ")", function(t) {
						t.field;
						i.reload("LAY-user-front-submit"), layer.close(e)
					}), n.trigger("click")
				},
				success: function(e, t) {}
			})
		}
	}), i.render({
		elem: "#LAY-user-back-role",
		url: "roles/rolesList",
		cols: [
			[{
				type: "checkbox",
				fixed: "left"
			}, {
				field: "roleId",
				width: 80,
				title: "ID",
				sort: !0
			}, {
				field: "roleName",
				title: "角色名"
			}, {
				field: "roleRemark",
				title: "具体描述"
			}, {
				title: "操作",
				width: 150,
				align: "center",
				fixed: "right",
				toolbar: "#table-useradmin-admin"
			}]
		],
		text: "对不起，加载出现异常！"
	}), i.on("tool(LAY-user-back-role)", function(e) {
		e.data;
		if ("del" === e.event) {
			layer.confirm('是否删除该角色？', {
				  btn: ['确认', '取消'] //可以无限个按钮
				  ,btn1: function(index, layero){
					  $.ajax({
						   type: "POST",
						   url: "/deletRole1",
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
		else if ("edit" === e.event) {
			t(e.tr);
			layer.open({
				type: 2,
				title: "编辑角色",
				content: "edRoles",
				area: ["480px", "550px"],
				success: function(e, t) {}
			})
		}
	}), e("useradmin", {})
});
