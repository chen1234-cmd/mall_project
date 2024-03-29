package org.nzy.rest.service;

import org.nzy.pojo.FjnyResult;
import org.nzy.pojo.TbUser;

public interface UserLoginService {
	//登录
	FjnyResult login(String username,String password);
	//获取用户缓存
	FjnyResult getUserByToken(String token);
	//注册
//	FjnyResult doReg(String username, String password, String phone, String email);
	FjnyResult doReg(TbUser tbUser);
	//修改密码
	FjnyResult updatePass(Long id, String password, String oldpass);
	
	
	
}
