package org.nzy.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nzy.pojo.Menu;
import org.nzy.pojo.TbMenus;
import org.nzy.pojo.TbUser;
import org.nzy.service.LoginService;
import org.nzy.utils.FjnyResult;
import org.nzy.utils.LayuiReplay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
/***
 * 登录功能 注册
 * @author 34675
 *
 */
@Controller
public class LoginController {
	
	 @Autowired
	 private LoginService loginService; 
	 @RequestMapping(value="/login",method=RequestMethod.POST)
	 @ResponseBody
	 public FjnyResult login(String verification ,String username,String password,
		HttpSession session,HttpServletRequest request ) {
		String kaptchaExpected =(String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		 System.out.println(verification + "," + kaptchaExpected);  
		 if(verification.equals(kaptchaExpected)) {
			 TbUser tbUser= loginService.login(username,password);
			 if(tbUser!=null) {
				 tbUser.setPassword(null);
				 List<Menu> resource = loginService.getResource(tbUser.getRoleId()); 
				 session.setAttribute("USER_SESSION",tbUser);
				 session.setAttribute("TbRolesMenusKey", resource);
				 return FjnyResult.ok();
			 }
		 }
		 return FjnyResult.build(500, "验证码错误");
	 }
	 /**
	  * 注册
	  */
	 
	 @RequestMapping(value="/test/addUser",method=RequestMethod.POST)
	 @ResponseBody
	 public FjnyResult regist(TbUser tbUser) {
		TbUser tbUser2 = new TbUser();
		tbUser2.setUsername(tbUser.getUsername());
		 String md5pwd = DigestUtils.md5DigestAsHex(tbUser.getPassword().getBytes());
		 tbUser2.setPassword(md5pwd);
		 tbUser2.setPhone(tbUser.getPhone());
		 tbUser2.setEmail(tbUser.getEmail());
		 tbUser2.setFace(tbUser.getFace());
		 tbUser2.setSex(tbUser.getFace());
		 tbUser2.setRoleId(tbUser.getRoleId());
		 tbUser.setCreated(new Date());
		 tbUser.setUpdated(new Date());
		 return loginService.regist(tbUser2);
		 
	 }
	 @RequestMapping("/error")
	 public String error() {
		 	
		 return "error";
	 }
	 /**
	  *用户登录后 修改登录密码
	 *admin/updatePass
	 */
	 @RequestMapping("user/updatePass")
	 @ResponseBody
		public FjnyResult updatePass(Long id,String password ,String oldpass ) {
			return loginService.updatePass(id,password,oldpass);
		}
	 	/**
		 * 修改用户资料
		 * /test/updateTbuser
		 */
		@RequestMapping("/admin/test/updateTbuser")
		@ResponseBody
		public FjnyResult updateTbuser(TbUser tbUser) {
			tbUser.setUpdated(new Date());
			return loginService.updateTbuser(tbUser);
		}
	//退出登录
	@RequestMapping("/SingOut")
	@ResponseBody
	public FjnyResult SingOut(HttpSession session){
		session.invalidate();
		return FjnyResult.ok();
	}
	//找回密码
	@RequestMapping("/userforget")
	@ResponseBody
	public LayuiReplay forget(String username,String phone,HttpServletRequest request,String verification) {
		String kaptchaExpected =(String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		 System.out.println(verification + "," + kaptchaExpected);  
		if(verification.equals(kaptchaExpected)) {
			return loginService.updateTbuser(username,phone);
		}
		return null;
	}
	//重置密码
	@RequestMapping("/resetpass")
	@ResponseBody
	public LayuiReplay resetpass(String username,String password ,String repass){
		return loginService.upresetpass(username,repass,password);
	}
	//权限菜单列表
	@RequestMapping("/tbMenusList")
	@ResponseBody
	public LayuiReplay tbMenusList(TbMenus tbMenus){
		return loginService.tbMenusList(tbMenus);
	}
}
