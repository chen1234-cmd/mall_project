package org.nzy.sso.controller;

import org.nzy.pojo.FjnyResult;
import org.nzy.sso.service.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserLoginController {

	@Autowired
	private UserLoginService userLoginService;

	//用户登录
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	@ResponseBody
	public FjnyResult login(String username,String password) {
		
		return userLoginService.login(username, password);
				
	}
	
	//获取用户缓存
	@RequestMapping(value = "/token/{token}")
	@ResponseBody
	public FjnyResult getUserByToken(@PathVariable String token) {
		
		return userLoginService.getUserByToken(token);
				
	}
	
	//用户注册
	@RequestMapping(value = "/regist",method = RequestMethod.POST)
	@ResponseBody
	public FjnyResult doReg(String username, String password,
			String phone, String email) {
		return userLoginService.doReg(username, password,phone,email);		
	}
	
	 @RequestMapping(value ="/updatePass",method = RequestMethod.POST)
	 @ResponseBody
	public FjnyResult updatePass(Long id,String password ,String oldpass ) {
		return userLoginService.updatePass(id,password,oldpass);
	}
}
