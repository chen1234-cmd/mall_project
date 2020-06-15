package org.nzy.portal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nzy.pojo.FjnyResult;
import org.nzy.portal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	//用户登录
	@RequestMapping(value = "/user/doLogin",method = RequestMethod.POST)
	@ResponseBody
	public FjnyResult doLogin(String username, String password, HttpServletRequest request,
			HttpServletResponse response) {
				
				return userService.login(username, password, request, response);	
		
	}
	
	//用户注册
	@RequestMapping(value = "/user/doReg",method = RequestMethod.POST)
	@ResponseBody
	public FjnyResult doReg(String username, String password, String phone,
			String email, HttpServletRequest request,HttpServletResponse response) {
				return userService.doReg(username, password, phone, email, request, response);
		
	}
}
