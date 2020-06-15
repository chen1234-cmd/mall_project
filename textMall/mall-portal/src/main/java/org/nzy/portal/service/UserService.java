package org.nzy.portal.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nzy.pojo.FjnyResult;

public interface UserService {
	//用户登录
	FjnyResult login(String username,String password,
			HttpServletRequest request,HttpServletResponse response);
	//用户注册
		FjnyResult doReg(String username, String password, String phone,
				String email, HttpServletRequest request,HttpServletResponse response);
}
