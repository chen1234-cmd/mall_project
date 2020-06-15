package org.nzy.portal.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nzy.common.CookieUtils;
import org.nzy.pojo.FjnyResult;
import org.nzy.portal.service.UserService;
import org.nzy.utils.HttpClientUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
@Service
public class UserServiceImpl implements UserService {
	
	@Value("${SSO_USER_URL}")
	private String SSO_USER_URL;
	
	@Value("${USER_LOGIN_URL}")
	private String USER_LOGIN_URL;

	@Value("${USER_REGIST_URL}")
	private String USER_REGIST_URL;
	
	@Override
	public FjnyResult login(String username, String password, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("url:"+SSO_USER_URL+USER_LOGIN_URL);
		Map<String, String> param = new HashMap<String, String>();
		param.put("username", username);
		param.put("password", password);
		String doPost = HttpClientUtil.doPost(SSO_USER_URL+USER_LOGIN_URL, param );
		System.out.println("doPost:"+doPost);
		FjnyResult fjnyResult = FjnyResult.format(doPost);
		//判断，如果成功，加入cookie。如果失败直接返回
		if(fjnyResult.getStatus() != 200) {
			return fjnyResult;
		}
		String token = (String) fjnyResult.getData();
		//将token保存到cookie里面
		CookieUtils.setCookie(request, response, "MALL-TOKEN", token);
		return fjnyResult;
	}

	@Override
	public FjnyResult doReg(String username, String password, String phone, 
			String email, HttpServletRequest request,HttpServletResponse response) {
		System.out.println("url:"+SSO_USER_URL+USER_LOGIN_URL);
		Map<String, String> param = new HashMap<String, String>();
		param.put("username", username);
		param.put("password", password);
		param.put("phone", phone);
		param.put("email", email);
		try {
			String doPost = HttpClientUtil.doPost(SSO_USER_URL+USER_REGIST_URL, param );
			System.out.println("doPost:"+doPost);
			FjnyResult fjnyResult = FjnyResult.format(doPost);
			
			if(fjnyResult.getStatus() != 200) {
				return FjnyResult.build(500, "错误");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return FjnyResult.build(500, "注册失败");
		}
		return FjnyResult.ok();
	}

}
