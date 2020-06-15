package org.nzy.service.impl;

import javax.annotation.Resource;

import org.nzy.pojo.TbUser;
import org.nzy.service.ShowUserService;
import org.nzy.mapper.TbUserMapper;
import org.springframework.stereotype.Service;

@Service
public class ShowUserServiceImpl implements ShowUserService {

	@Resource
	private TbUserMapper bUserMapper;
	
	@Override
	public TbUser showUserById(Long id) {
		TbUser tbUser=bUserMapper.selectByPrimaryKey(id);
		return tbUser;
	}

}
