package org.nzy.portal.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.nzy.common.CookieUtils;
import org.nzy.pojo.FjnyResult;
import org.nzy.pojo.TbUser;
import org.nzy.utils.HttpClientUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class OrderInterceptor implements HandlerInterceptor {

	@Value("${SSO_USER_URL}")
	private String SSO_USER_URL;
	
	@Value("${GET_USER_BY_TOKEN_URL}")
	private String GET_USER_BY_TOKEN_URL;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String cookieValue = CookieUtils.getCookieValue(request, "MALL-TOKEN");
		if(StringUtils.isBlank(cookieValue)) {
			response.sendRedirect("login.html");
			return false;
		}
		String strResult = HttpClientUtil.doGet(SSO_USER_URL+GET_USER_BY_TOKEN_URL+cookieValue);
		FjnyResult formatToPojo = FjnyResult.formatToPojo(strResult, TbUser.class);
		if(formatToPojo == null || formatToPojo.getStatus() != 200) {
			response.sendRedirect("login.html");
			return false;
		}
		
		TbUser tbUser =  (TbUser) formatToPojo.getData();
		if(tbUser == null) {
			response.sendRedirect("login.html");
			return false;
		}
		System.out.println("tbUser:"+tbUser.toString());
		request.setAttribute("tb_user", tbUser);
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
