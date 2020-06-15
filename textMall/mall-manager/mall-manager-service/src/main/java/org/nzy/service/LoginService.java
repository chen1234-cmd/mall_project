package org.nzy.service;

import java.util.List;

import org.nzy.pojo.Menu;
import org.nzy.pojo.TbMenus;
import org.nzy.pojo.TbUser;
import org.nzy.utils.FjnyResult;
import org.nzy.utils.LayuiReplay;

public interface LoginService {
	TbUser login(String username, String password); //登录
	
	FjnyResult regist(TbUser tbUser);//注册

	FjnyResult updateTbuser(TbUser tbUser); //修改登录个人资料

	LayuiReplay updateTbuser(String username, String phone); //找回密码

	List<Menu> getResource(Long roleId); //权限查询

	LayuiReplay tbMenusList(TbMenus tbMenus); //权限列表

	LayuiReplay upresetpass(String repass, String password,String username); //重置密码

	FjnyResult updatePass(Long id, String password, String oldpass);//修改密码

	
}
