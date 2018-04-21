package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.police.testing.pojo.StaticDataLogin;
import com.police.testing.pojo.StaticDataSimulateExam;
import com.police.testing.service.IStaticDataService;
import com.police.testing.tools.GetEncode;

import net.sf.json.JSONObject;

/**
*@author created by answer
*@date 2018年4月21日-上午12:39:02
*
**/
@Controller
@RequestMapping("/staticData/")
public class StaticDataController {
	@Autowired
	private IStaticDataService staticDataService;
	
	/**
	 * 统计分析跳转页面
	 * @param request
	 * @return
	 */
	@RequestMapping("jsp")
	public String jsp(HttpServletRequest request){
		String pageName = GetEncode.transcode(request.getParameter("pageName"));
		return "background_system/static_data/" + pageName;
	}
	/**
	 * 统计分析派出所登录次数总排名
	 * @param request
	 * @return
	 */
	@RequestMapping("staticDataLogin")
	@ResponseBody
	public JSONObject staticDataLogin(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String beginDate = GetEncode.transcode(request.getParameter("beginDate"));
		String endDate = GetEncode.transcode(request.getParameter("endDate"));
		List<StaticDataLogin> dataLogins = staticDataService.staticDataLogin(beginDate, endDate);
		result.put("status", 1);
		result.put("list", dataLogins);
		return result;
	}
	/**
	 * 按照派出所分别统计模拟考试和浏览试题次数
	 * @param request
	 * @return
	 */
	@RequestMapping("staticDataSimulateExam")
	@ResponseBody
	public JSONObject staticDataSimulateExam(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String beginDate = GetEncode.transcode(request.getParameter("beginDate"));
		String endDate = GetEncode.transcode(request.getParameter("endDate"));
		List<StaticDataSimulateExam> dataSimulateExams = staticDataService.staticDataSimulateExam(beginDate, endDate);
		result.put("status", 1);
		result.put("list", dataSimulateExams);
		return result;
	}
	
	/**
	 * 按照派出所分别统计模拟考试和浏览试题次数
	 * @param request
	 * @return
	 */
	@RequestMapping("staticDataOfficialExam")
	@ResponseBody
	public JSONObject staticDataOfficialExam(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String beginDate = GetEncode.transcode(request.getParameter("beginDate"));
		String endDate = GetEncode.transcode(request.getParameter("endDate"));
		List<StaticDataSimulateExam> dataSimulateExams = staticDataService.staticDataOfficialExam(beginDate, endDate);
		result.put("status", 1);
		result.put("list", dataSimulateExams);
		return result;
	}
}

