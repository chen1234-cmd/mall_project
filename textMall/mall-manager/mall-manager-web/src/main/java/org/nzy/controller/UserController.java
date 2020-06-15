package org.nzy.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.nzy.pojo.China;
import org.nzy.pojo.TbMenus;
import org.nzy.pojo.TbMenusExample;
import org.nzy.pojo.TbRoles;
import org.nzy.pojo.TbUser;
import org.nzy.pojo.XtreeData;
import org.nzy.service.UserService;
import org.nzy.utils.FjnyResult;
import org.nzy.utils.LayuiReplay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.tools.javah.resources.l10n;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 查询用户列表
	 * @param page
	 * @param limit
	 * @return
	 */
	@RequestMapping("/demo/user/")
	@ResponseBody
	public LayuiReplay UserList(@RequestParam Integer page, @RequestParam Integer limit) {
		LayuiReplay layuiReplay = userService.userList(page, limit);
		System.out.println(layuiReplay);
		return layuiReplay;
	}
	/**
	 * 角色列表
	 */
	@RequestMapping("/getRoleList")
	@ResponseBody
	public LayuiReplay selRoles(Integer page,Integer limit) {
		return userService.selRoles(page,limit);
	}
	
	/**
	 * 修改用户信息
	 * url user/updateUser
	 */
	@RequestMapping("/user/updateUser")
	@ResponseBody
	public FjnyResult updateUser(TbUser tbUser,HttpSession session) {
		System.out.println("controller:修改用户信息");
		tbUser.setUpdated(new Date());
		session.removeAttribute(tbUser.getMsg());
		session.removeAttribute(tbUser.getEmail());
		session.removeAttribute(tbUser.getFace());
		session.removeAttribute(tbUser.getPhone());
		session.removeAttribute(tbUser.getSex());
		return userService.updateUser(tbUser);
	}
	/**
	 *	城市联动表
	 *url：test/china
	 */
	@RequestMapping("test/china/{id}")
	@ResponseBody
	public FjnyResult china(China china, @PathVariable int id) {
		china.setId(china.getId());
		return userService.list(china);
	}
	/**
	 * 删除用户
	 * /user/deleteUser
	 */
	@RequestMapping("/user/deleteUser")
	@ResponseBody
	public FjnyResult deleteUser(TbUser tbUser) {
		return userService.deleteUser(tbUser);
	}
	/**
	 * 用户状态
	 * /user/changeUserState
	 */
	@RequestMapping("user/changeUserState")
	@ResponseBody
	public FjnyResult changeUserState(TbUser tbUser) {
		return userService.changeUserState(tbUser);
	}
	/**
	 * 权限下拉框
	 * "user/rolse"
	 */
	@RequestMapping("user/rolse")
	@ResponseBody
	public FjnyResult rolselist(TbRoles tbRoles) {
		return userService.rolselist(tbRoles);
	}
	/**
	  *  角色列表
	 *  "roles/rolesList/"
	 */
	@RequestMapping("roles/rolesList")
	@ResponseBody
	public LayuiReplay rolesList(@RequestParam Integer page, @RequestParam Integer limit) {
		return userService.rolesList(page,limit);
	}
	/**
	 * 管理员列表
	 */
	@RequestMapping("admin/adminuserlist")
	@ResponseBody
	public LayuiReplay adminuserlist(@RequestParam Integer page, @RequestParam Integer limit) {
		return userService.adminuserlist(page,limit);
	}
	//权限树
	@RequestMapping("/TreetbMenus")
	@ResponseBody
	public List<XtreeData>TreetbMenus(){
		return userService.TreetbMenus();
	}
	//编辑权限
	@RequestMapping("/EditTbMenus")
	@ResponseBody
	public FjnyResult EditTbMenus(Long menuId,String title,String icon,String href) {
		return userService.userService(menuId,title,icon,href);
	}
	//删除权限
	@RequestMapping("/delTbmenus")
	@ResponseBody
	public FjnyResult delTbmenus(Long menuId) {
		return userService.userService(menuId);
	}
	//添加权限菜单
	@RequestMapping("/addTbmenus")
	@ResponseBody
	public FjnyResult addTbmenus(TbMenus tbMenus) {
		return userService.addTbmenus(tbMenus);
	}
	//添加角色
	@RequestMapping("/addRoleList")
	@ResponseBody
	public FjnyResult addRole(String m ,String roleName,String roleRemark) {
		return userService.addRole(m,roleName,roleRemark);
	}
	//删除角色
	@RequestMapping("/deletRole")
	@ResponseBody
	public FjnyResult deletRole(Long roleId) {
		return userService.deletRole(roleId);
	}
	//编辑角色
	@RequestMapping("/edRoleList")
	@ResponseBody
	public FjnyResult edRoleList(Long roleId,String m ,String roleName,String roleRemark) {
		FjnyResult edRoleList = userService.edRoleList(m,roleName,roleRemark,roleId);
		System.out.println("edRole:" + edRoleList.getMsg());
		return edRoleList;
	}
	//编辑菜单
	@RequestMapping("/edtMenuList")
	@ResponseBody
	public FjnyResult edtMenuList(TbMenus tbMenus) {
		 FjnyResult edtMenuList = userService.edtMenuList(tbMenus);
		 System.out.println("控制台："+edtMenuList);
		return edtMenuList;
	}
	//添加子菜单
	@RequestMapping("/addmenulist")
	@ResponseBody
	public FjnyResult addSizeMenu(TbMenus tbMenus) {
		return userService.addSizeMenu(tbMenus);
	}
}
