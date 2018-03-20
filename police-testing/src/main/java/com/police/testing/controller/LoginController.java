package com.police.testing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.police.testing.service.IUserService;

@Controller 
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
	@RequestMapping(value = "/login/page")
	public String loginPage(HttpServletRequest request, HttpServletResponse response) {
		 return "login";
	}
	
	 /** 
     * 用户登出 
     */
    @RequestMapping("/logout")  
    public String logout(HttpServletRequest request, HttpServletResponse response){  
         Subject currentUser = SecurityUtils.getSubject();
 		 Session session = currentUser.getSession();
 		 String userId =(String)session.getAttribute("currentUser");
 		 System.out.println("userId" + userId);
         return  "redirect:/index";  
    }
}
