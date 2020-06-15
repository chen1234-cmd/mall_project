package org.nzy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.nzy.pojo.TbMenus;


public interface AdminMenusMapper {
	@Select("SELECT m.menu_id as menuId,"
			+ "m.title,m.icon,m.href,m.spread,"
			+ "m.parent_id as parentId,"
			+ "m.perms FROM tb_roles_menus r LEFT JOIN tb_menus m ON r.menu_id "
			+ "= m.menu_id WHERE r.role_id = #{0} order by sorting desc")
	List<TbMenus> getMenus(Long roleId);
}
