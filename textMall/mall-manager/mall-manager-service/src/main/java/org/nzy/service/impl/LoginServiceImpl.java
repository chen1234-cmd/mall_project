package org.nzy.service.impl;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.nzy.mapper.TbMenusMapper;
import org.nzy.mapper.TbRolesMapper;
import org.nzy.mapper.TbRolesMenusMapper;
import org.nzy.mapper.TbUserMapper;
import org.nzy.pojo.Menu;
import org.nzy.pojo.TbMenus;
import org.nzy.pojo.TbMenusExample;
import org.nzy.pojo.TbRoles;
import org.nzy.pojo.TbRolesExample;
import org.nzy.pojo.TbRolesMenusExample;
import org.nzy.pojo.TbRolesMenusKey;
import org.nzy.pojo.TbUser;
import org.nzy.pojo.TbUserExample;
import org.nzy.pojo.TbUserExample.Criteria;
import org.nzy.service.LoginService;
import org.nzy.utils.FjnyResult;
import org.nzy.utils.LayuiReplay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;

import com.github.pagehelper.PageHelper;
import com.mysql.fabric.xmlrpc.base.Array;
import com.sun.tools.classfile.StackMap_attribute.stack_map_frame;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {	
	@Autowired
	private TbUserMapper tbUserMapper;
	@Autowired
	private TbRolesMapper tbRolesMapper;
	@Autowired
	private TbRolesMenusMapper tbRolesMenusMapper;
	@Autowired
	private TbMenusMapper tbMenusMapper;
	//登录
	@Override
	public TbUser login(String username, String password ) {
		TbUserExample example=new TbUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		String md5DigestAsHex = DigestUtils.md5DigestAsHex(password.getBytes());
		criteria.andPasswordEqualTo(md5DigestAsHex);
		List<TbUser> list = tbUserMapper.selectByExample(example);
		if(list!= null && list.size()>0) {
			TbUser tbUser =list.get(0);
			Integer status = tbUser.getStatus();
			if(status==1) {
				Long roleId = tbUser.getRoleId();
				if(roleId!=64) {
					return tbUser;
				}
			}
		}
		return null;
	}
	/**
	 * 注册
	 */
	@Override
	public FjnyResult regist(TbUser tbUser2) {
		tbUser2.setStatus(1);
		int insert = tbUserMapper.insert(tbUser2);
		if(insert>0) {
			return FjnyResult.ok();
		}
		return FjnyResult.build(500, "注册失败");
	}
	/**
	 * 修改密码
	 */
	@Override
	public FjnyResult updatePass(Long id ,String password,String oldpass) {
		TbUserExample example =new TbUserExample();
		example.createCriteria().andIdEqualTo(id);
		List<TbUser> list = tbUserMapper.selectByExample(example);
		TbUser tbuser=list.get(0);
		String oPass = tbuser.getPassword();
		System.out.println("数据库拿出来的密码:"+oPass);
		String md5 =DigestUtils.md5DigestAsHex(oldpass.getBytes());
		System.out.println("传进来的转化MD5的密码"+md5);
		if(md5.equals(oPass)) {
			TbUser tbUser1 =new TbUser();
			String newpass=DigestUtils.md5DigestAsHex(password.getBytes());
			System.out.println("准备插入数据库的密码："+newpass);
			tbUser1.setPassword(newpass);
			tbUserMapper.updateByExampleSelective(tbUser1, example);
			return FjnyResult.ok();
		}
			return null;
	}
	
	/**
	 *	修改用户个人资料
	 */
	@Override
	public FjnyResult updateTbuser(TbUser tbUser) {
		TbUserExample example=new TbUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(tbUser.getId());
		tbUserMapper.updateByExampleSelective(tbUser, example);
		return FjnyResult.ok();
	}
	//找回密码
	@Override
	public LayuiReplay updateTbuser(String username, String phone) {
		TbUserExample example =new TbUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPhoneEqualTo(phone);
		List<TbUser> list = tbUserMapper.selectByExample(example);
		TbUser tbuser=list.get(0);
		String username2 = tbuser.getUsername();
		return LayuiReplay.ok(list);
		
	}
	//重置密码
	@Override
	public LayuiReplay upresetpass(String username,String repass, String password) {
		TbUser record =new TbUser();
		TbUserExample example=new TbUserExample();
		example.createCriteria().andUsernameEqualTo(username);
		System.out.println(username);
		System.out.println(password);
		String md5 = DigestUtils.md5DigestAsHex(password.getBytes());
		System.out.println(md5);
		record.setPassword(md5);
		tbUserMapper.updateByExampleSelective(record , example);
		return LayuiReplay.ok();
	}
	//权限
	@Override
	public List<Menu> getResource(Long roleId) {
		  TbRolesMenusExample example1=new TbRolesMenusExample();
		  example1.createCriteria().andRoleIdEqualTo(roleId);
		  List<TbRolesMenusKey> list = tbRolesMenusMapper.selectByExample(example1); 
		  List<TbMenus> tbmenu =new ArrayList(); 
		  List<Long> TbRolesMenus = new ArrayList<>();
		 for(TbRolesMenusKey TbRolesMenusKey : list) {
			 TbRolesMenus.add(TbRolesMenusKey.getMenuId()); 
		 } 
		  TbMenusExample example =new TbMenusExample(); 
		  example.createCriteria().andMenuIdIn(TbRolesMenus);
		  List<TbMenus> list2 = tbMenusMapper.selectByExample(example);
		  tbmenu.addAll(list2); 
		  List<Menu> menus = new ArrayList<>(); 
		 // Menu menu = null;
		 for (TbMenus tbMenus : tbmenu) {
			if (tbMenus.getParentId().longValue() == 0) {
				Menu menu = new Menu();
				menu.setTitle(tbMenus.getTitle());
				for (TbMenus tbmenu2 : tbmenu) {
					if(tbMenus.getMenuId().longValue() == tbmenu2.getParentId().longValue()) {
						menu.addMenu(tbmenu2);
					}
				}
				menus.add(menu);
			}
		}
	  return menus;
	}
	//权限菜单列表
	@Override
	public LayuiReplay tbMenusList(TbMenus tbMenus) {
		TbMenusExample example =new TbMenusExample();
		List<TbMenus> list = tbMenusMapper.selectByExample(example);
		return LayuiReplay.ok(list);
	}
	

}
