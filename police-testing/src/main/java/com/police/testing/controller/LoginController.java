package com.police.testing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.police.testing.service.IUserService;
import com.police.testing.tools.GetEncode;

@Controller
@RequestMapping("/login/")
public class LoginController {
	static Logger logger = LogManager.getLogger(LoginController.class.getName());
	@Autowired
	private IUserService userService;
    /**
	 * 登录页面初始(学生)
	 * 
	 * @param request
	 * @param response
	 * @param url
	 */
	@RequestMapping(value = "page")
	public String loginPage(HttpServletRequest request, HttpServletResponse response) {
		 return "login";
	}
	/**
	 * 用户登录
	 * @param request
	 * @return
	 */
	@RequestMapping("backgroundeSystem")
	public String login(HttpServletRequest request){
		String userName = GetEncode.transcode(request.getParameter("userName"));
		String password = GetEncode.transcode(request.getParameter("password"));
		if(StringUtils.isBlank(userName) || StringUtils.isBlank(password)){
			request.setAttribute("message", "用户名密码不能为空！");
			return "login";
		}
		String lastUrl = null;
		UsernamePasswordToken token = new UsernamePasswordToken(userName, password);  
        //获取当前的Subject  
        Subject currentUser = SecurityUtils.getSubject(); 	
        try{  
        	currentUser.login(token);  
        	lastUrl = "background_system/index";
        }catch(AuthenticationException ae){  
            //通过处理Shiro的运行时AuthenticationException就可以控制用户登录失败或密码错误时的情景  
        	ae.printStackTrace();
        	request.setAttribute("message", "用户名密码不正确！");
        	lastUrl= "login";
        }
		return lastUrl;
	}
	
	 /** 
     * 用户登出 
     */
    @RequestMapping("logout")  
    public String logout(HttpServletRequest request, HttpServletResponse response){  
         Subject currentUser = SecurityUtils.getSubject();
 		 Session session = currentUser.getSession();
 		 String userId =(String)session.getAttribute("currentUser");
 		 System.out.println("userId" + userId);
         return  "redirect:/index";  
    }
}
