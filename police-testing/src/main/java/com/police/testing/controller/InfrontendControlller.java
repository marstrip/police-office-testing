package com.police.testing.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
*@author created by answer
*@date 2018年4月22日-下午3:14:31
*
**/
@Controller
@RequestMapping("/infrontend/")
public class InfrontendControlller {
	/**
	 * 课件超市
	 * @param request
	 * @return
	 */
	@RequestMapping("superMarketJsp")
	public String superMarketJsp(HttpServletRequest request){
		return "frontend_system/system/super_market";
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("tjExamResultJsp")
	public String tjExamResultJsp(HttpServletRequest request){
		return "frontend_system/system/tj_exam_result";
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("bjCommonJsp")
	public String bjCommonJsp(HttpServletRequest request){
		return "frontend_system/system/tj_common";
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("forumJsp")
	public String forumJsp(HttpServletRequest request){
		return "frontend_system/system/forum";
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("wrongListJsp")
	public String wrongListJsp(HttpServletRequest request){
		return "frontend_system/system/wrong_list";
	}
}

