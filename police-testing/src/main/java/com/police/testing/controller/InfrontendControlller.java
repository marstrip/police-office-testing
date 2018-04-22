package com.police.testing.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.police.testing.service.ICaseAnalyzeService;
import com.police.testing.service.IIFormNoticeService;
import com.police.testing.service.IQaSheetService;
import com.police.testing.service.IStaticDataService;
import com.police.testing.tools.GetEncode;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
*@author created by answer
*@date 2018年4月22日-下午3:14:31
*
**/
@Controller
@RequestMapping("/infrontend/")
public class InfrontendControlller {
	@Autowired
	private ICaseAnalyzeService caseAnalyzeService;
	@Autowired
	private IIFormNoticeService informNoticeService;
	@Autowired
	private IQaSheetService qaSheetService;
	@Autowired
	private IStaticDataService staticDataService;
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
	/**
	 * 前台更多页面展示数据接口
	 * @param request
	 * @return
	 */
	@RequestMapping("commonGetList")
	public JSONObject commonGetList(HttpServletRequest request){
		Integer offset = Integer.valueOf(GetEncode.transcode(request.getParameter("offset")));
		Integer limit = Integer.valueOf(GetEncode.transcode(request.getParameter("limit")));
		String search = GetEncode.transcode(request.getParameter("search"));
		String switchPage = GetEncode.transcode(request.getParameter("switchPage"));
		List<?> list = new ArrayList<>();
		long total = 0l;
		if(switchPage.equals("caseAnalyze")){
			list = caseAnalyzeService.getList(search, offset, limit);
			total = caseAnalyzeService.getCount(search);
		}else if(switchPage.equals("informNotice")){
			list = informNoticeService.getList(search, offset, limit);
			total = informNoticeService.getCount(search);
		}else if(switchPage.equals("staticDataLogin")){
			list = staticDataService.staticDataLogin(null, null, offset, limit);
			total = staticDataService.getCount(null, null);
		}else if(switchPage.equals("staticDataSimulateExam")){
			list = staticDataService.staticDataSimulateExam(null, null, offset, limit);
			total = staticDataService.staticDataSimulateExamGetCount(null, null);
		}else if(switchPage.equals("staticDataOfficialExam")){
			list = staticDataService.staticDataOfficialExam(null, null, offset, limit);
			total = staticDataService.staticDataSimulateExamGetCount(null, null);
		}
		JSONObject result = new JSONObject();
		JSONArray array = JSONArray.fromObject(list);
		Integer pageNumber = offset/limit + 1;
		result.put("page", pageNumber);
		result.put("total", total);
		result.put("rows", array);
		return result;
	}
}

