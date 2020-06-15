package org.nzy.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.nzy.mapper.ChinaMapper;
import org.nzy.mapper.TbMenusMapper;
import org.nzy.mapper.TbRolesMapper;
import org.nzy.mapper.TbRolesMenusMapper;
import org.nzy.mapper.TbUserMapper;
import org.nzy.pojo.China;
import org.nzy.pojo.ChinaExample;
import org.nzy.pojo.Menu;
import org.nzy.pojo.TbItem;
import org.nzy.pojo.TbMenus;
import org.nzy.pojo.TbMenusExample;
import org.nzy.pojo.TbRoles;
import org.nzy.pojo.TbRolesExample;
import org.nzy.pojo.TbRolesMenusExample;
import org.nzy.pojo.TbRolesMenusKey;
import org.nzy.pojo.TbUser;
import org.nzy.pojo.TbUserExample;
import org.nzy.pojo.TbUserExample.Criteria;
import org.nzy.pojo.XtreeData;
import org.nzy.service.UserService;
import org.nzy.utils.FjnyResult;
import org.nzy.utils.LayuiReplay;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class UserServiceImpl implements UserService {

	
	Long limits = (long) 10;
	@Resource
	private TbUserMapper tbUserMapper;
	@Resource
	private ChinaMapper chinaMapper;
	@Resource 
	private TbRolesMapper tbRolesMapper;
	@Resource
	private TbRolesMenusMapper tbRolesMenusMapper;
	@Resource
	private TbMenusMapper tbMenusMapper;
	@Override
	/**
	 * 查询用户列表
	 */
	public LayuiReplay userList(Integer page, Integer limit) {
		PageHelper.startPage(page, limit);
		TbUserExample example=new TbUserExample();
		List<TbUser> list = tbUserMapper.selectByExample(example);
		for (TbUser tbUser : list) {
			List<TbRoles> roles = selRoles();
			for (TbRoles tbRoles : roles) {
				if(tbRoles.getRoleId()==tbUser.getRoleId()) {
					tbUser.setMsg(tbRoles.getRoleName());
				}
			}
		}
		return LayuiReplay.ok(list);
	}
	/**
	 * 封装一下tbroles
	 */
	@Override
	public List<TbRoles> selRoles() {
		TbRolesExample example = new TbRolesExample();
		List<TbRoles> list = tbRolesMapper.selectByExample(example);
		return list;
	}
	/**
	 * 修改用户信息
	 */
	@Override
	public FjnyResult updateUser(TbUser tbUser) {
		TbUserExample example =new TbUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(tbUser.getId());
		int selective = tbUserMapper.updateByExampleSelective(tbUser, example);
		return FjnyResult.ok(selective);
	}
	/**
	 * 查询全国城市
	 */
	@Override
	public FjnyResult list(China china) {
		ChinaExample example=new ChinaExample();
		ChinaExample.Criteria criteria = example.createCriteria();
		criteria.andPidEqualTo(china.getId());
		List<China> list = chinaMapper.selectByExample(example);
		return FjnyResult.ok(list);
	}
	/**
	 * 删除用户
	 */
	@Override
	public FjnyResult deleteUser(TbUser tbUser) {
		tbUserMapper.deleteByPrimaryKey(tbUser.getId());
		return FjnyResult.ok();
	}
	/**
	 * 用户状态
	 */
	@Override
	public FjnyResult changeUserState(TbUser tbUser) {
		TbUserExample example=new TbUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(tbUser.getId());
		int status = tbUser.getStatus();
		if(status==1) {
			tbUser.setStatus(2);
			tbUserMapper.updateByExampleSelective(tbUser, example);
		}else {
			tbUser.setStatus(1);
			tbUserMapper.updateByExampleSelective(tbUser, example);
		}
		return FjnyResult.ok();
	}
	@Override
	public LayuiReplay selRoles(Integer page, Integer limit) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 查询权限下拉框
	 */
	@Override
	public FjnyResult rolselist(TbRoles tbRoles) {
		TbRolesExample example=new TbRolesExample();
		List<TbRoles> list = tbRolesMapper.selectByExample(example);
		return FjnyResult.ok(list);
	}
	/**
	 * 查询管理员列表
	 */
	@Override
	public LayuiReplay rolesList(Integer page, Integer limit) {
		PageHelper.startPage(page, limit);
		TbRolesExample example=new TbRolesExample();
		List<TbRoles> list = tbRolesMapper.selectByExample(example);
		return LayuiReplay.ok(list);
	}
	/**
	 * 查询管理员列表
	 */
	@Override
	public LayuiReplay adminuserlist(Integer page, Integer limit) {
		PageHelper.startPage(page, limit);
		TbUserExample example=new TbUserExample();
		Criteria criteria = example.createCriteria();
		List<TbUser> list2 = tbUserMapper.selectByExample(example);
		TbUser tbUser=list2.get(0);
		Long roleId = tbUser.getRoleId();
		if (roleId!=64) {
			criteria.andRoleIdEqualTo(roleId);
			List<TbUser> list = tbUserMapper.selectByExample(example);
			return LayuiReplay.ok(list);
		}
		return null;
	}
	//编辑权限
	@Override
	public FjnyResult userService(Long menuId,String title, String icon, String href) {
		TbMenus record =new TbMenus();
		TbMenusExample example =new TbMenusExample();
		example.createCriteria().andMenuIdEqualTo(menuId);
		tbMenusMapper.updateByExampleSelective(record , example);
		return FjnyResult.ok();
	}
	//删除权限
	@Override
	public FjnyResult userService(Long menuId) {
		TbMenusExample example=new TbMenusExample();
		example.createCriteria().andMenuIdEqualTo(menuId);
		tbMenusMapper.deleteByExample(example);
		return FjnyResult.ok();
	}
	//添加权限菜单
	@Override
	public FjnyResult addTbmenus(TbMenus tbMenus) {
		TbMenusExample example =new TbMenusExample();
		tbMenusMapper.insertSelective(tbMenus);
		return FjnyResult.ok();
	}
	//权限树
	@Override
	public List<XtreeData> TreetbMenus() {
		  List<TbMenus> list2 = tbMenusMapper.selectByExample(new TbMenusExample());
		  List<XtreeData> xTrees  = new ArrayList<XtreeData>();
		 for (TbMenus tbMenus : list2) {
			if (tbMenus.getParentId().longValue() == 0) {
				XtreeData menu = new XtreeData();
				menu.setTitle(tbMenus.getTitle());
				menu.setChecked(false);
				menu.setValue(tbMenus.getMenuId().toString());
				//menu.setValue(tbMenus.getHref());
				menu.setMenuId(tbMenus.getMenuId());
				for (TbMenus tbmenu2 : list2) {
					if(tbMenus.getMenuId().longValue() == tbmenu2.getParentId().longValue()) {
						XtreeData xTreeData = new XtreeData();
						xTreeData.setTitle(tbmenu2.getTitle());
						xTreeData.setChecked(false);
						xTreeData.setValue(tbmenu2.getMenuId().toString());
						//xTreeData.setMenuId(tbmenu2.getMenuId());
						menu.addXtree(xTreeData );
					}
				}
				xTrees.add(menu);
			}
		}
	  return xTrees;
	}
	//添加角色	
	@Override
	public FjnyResult addRole(String m, String roleName, String roleRemark) {
		TbRoles record=new TbRoles();
		record.setRoleName(roleName);
		record.setRoleRemark(roleRemark);
		tbRolesMapper.insertSelective(record);
		TbRolesExample example=new TbRolesExample();
		example.createCriteria().andRoleNameEqualTo(roleName);
		List<TbRoles> list = tbRolesMapper.selectByExample(example);
		Long roleId = list.get(0).getRoleId();
		TbRolesMenusKey tbRole =new TbRolesMenusKey();
		tbRole.setMenuId((long) 0);
		tbRole.setRoleId(roleId);
		//插入第二张表
		String[] menuIds = m.split(",");
		for (String menuId : menuIds) {
			Long long1 = Long.valueOf(menuId);
			TbRolesMenusExample example1= new TbRolesMenusExample();
			example1.createCriteria().andMenuIdEqualTo(long1).andRoleIdEqualTo(roleId);
			List<TbRolesMenusKey> TbRolesList = tbRolesMenusMapper.selectByExample(example1);
			TbRolesMenusKey record1 =new TbRolesMenusKey();
			record1.setRoleId(roleId);
			record1.setMenuId(long1);
			if(TbRolesList.size()>0) {
				System.out.println("重复不添加");
			}else {
				tbRolesMenusMapper.insert(record1);
			}
			
		}
		
		return FjnyResult.ok();
	}
	//删除角色
	@Override
	public FjnyResult deletRole(Long roleId) {
		TbRolesExample example=new TbRolesExample();
		example.createCriteria().andRoleIdEqualTo(roleId);
		tbRolesMapper.deleteByExample(example);
		//删除tbRolesMenusMapper
		TbRolesMenusExample example1=new TbRolesMenusExample();
		example1.createCriteria().andRoleIdEqualTo(roleId);
		tbRolesMenusMapper.deleteByExample(example1);
		return FjnyResult.ok();
	}
	//编辑角色
	@Override
	public FjnyResult edRoleList(String m, String roleName, String roleRemark, Long roleId) {
		
		try {
			TbRolesMenusExample example =new TbRolesMenusExample();
			example .createCriteria().andRoleIdEqualTo(roleId);
			tbRolesMenusMapper.deleteByExample(example);
			
			//更新tbRoles
			TbRoles record=new TbRoles();
			record.setRoleId(roleId);
			record.setRoleName(roleName);
			record.setRoleRemark(roleRemark);
			tbRolesMapper.updateByPrimaryKey(record);
			
			List<String> list = new ArrayList<>();
			//插入第二张表
			String[] menuIds = m.split(",");
			for(String menuId : menuIds) {
				String long1 = menuId;
				list.add(long1);
			}
			List<String> afterHashSetList = delRepeat(list);
			for (int i = 0; i < afterHashSetList.size(); i++) {
	    		TbRolesMenusKey record1 =new TbRolesMenusKey();
				record1.setRoleId(roleId);
				record1.setMenuId(Long.parseLong(afterHashSetList.get(i)));
				tbRolesMenusMapper.insert(record1);
				}
			System.out.println("edRoleList===================");
			return FjnyResult.ok();
			
		} catch (Exception e) {
			System.out.println("service"+e.getMessage());
			return FjnyResult.build(500, "添加失败:" + e.getMessage());
		}
	}
	//编辑菜单
	@Override
	public FjnyResult edtMenuList(TbMenus tbMenus) {
		System.out.println("tnMenus:" + tbMenus.toString());
//		TbMenusExample example=new TbMenusExample();
//		example.createCriteria().andMenuIdEqualTo(tbMenus.getMenuId());
		int updateByExampleSelective = tbMenusMapper.updateByPrimaryKeySelective(tbMenus);
		if(updateByExampleSelective>0) {
			return FjnyResult.ok();
		}
		return FjnyResult.build(500, "添加失败");
	}
	//添加子菜单
	@Override
	public FjnyResult addSizeMenu(TbMenus tbMenus) {
		tbMenusMapper.insert(tbMenus);
		return FjnyResult.ok();
	}
	
	public  List<String> delRepeat(List<String> list) {
		  List<String> listNew = new ArrayList<String>();
		  for (String str : list) {
		       if (!listNew.contains(str)) {
		           listNew.add(str);
		       }
		   }
		  return listNew ;
	}

}
