package org.nzy.service;


import java.util.List;

import org.nzy.pojo.China;
import org.nzy.pojo.TbMenus;
import org.nzy.pojo.TbRoles;
import org.nzy.pojo.TbUser;
import org.nzy.pojo.XtreeData;
import org.nzy.utils.FjnyResult;
import org.nzy.utils.LayuiReplay;


public interface UserService {
	LayuiReplay userList(Integer page, Integer limit);

	FjnyResult updateUser(TbUser tbUser); //修改用户信息

	FjnyResult list(China china);//查询省份

	FjnyResult deleteUser(TbUser tbUser);//删除用户

	FjnyResult changeUserState(TbUser tbUser); //修改用户状态

	List<TbRoles> selRoles();
	LayuiReplay selRoles(Integer page, Integer limit); //查询角色

	FjnyResult rolselist(TbRoles tbRoles);	//查询权限

	LayuiReplay rolesList(Integer page, Integer limit);//查询角色列表

	LayuiReplay adminuserlist(Integer page, Integer limit); //管理员列表

	FjnyResult userService(Long menuId, String title, String icon, String href);//编辑权限

	FjnyResult userService(Long menuId);//删除权限

	FjnyResult addTbmenus(TbMenus tbMenus);//添加权限菜单

	List<XtreeData> TreetbMenus();//权限树

	FjnyResult addRole(String m, String roleName, String roleRemark); //添加角色

	FjnyResult deletRole(Long roleId); //删除角色

	FjnyResult edRoleList(String m, String roleName, String roleRemark, Long roleId); //编辑角色

	FjnyResult edtMenuList(TbMenus tbMenus); //编辑菜单

	FjnyResult addSizeMenu(TbMenus tbMenus); //添加子菜单
	
	
}
