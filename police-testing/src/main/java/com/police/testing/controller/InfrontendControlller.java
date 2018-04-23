package com.police.testing.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.police.testing.pojo.CaseAnalyze;
import com.police.testing.pojo.CommonView;
import com.police.testing.pojo.InformNotice;
import com.police.testing.pojo.TestSelf;
import com.police.testing.service.ICaseAnalyzeService;
import com.police.testing.service.IIFormNoticeService;
import com.police.testing.service.IQaSheetService;
import com.police.testing.service.IStaticDataService;
import com.police.testing.service.ITestPaperService;
import com.police.testing.service.ITestSelfService;
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
	private IStaticDataService staticDataService;
	@Autowired
	private ITestSelfService testSelfService;
	@Autowired
	private ITestPaperService testPaperService;
	@Autowired
	private IQaSheetService qaSheetService;
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
	
	
	@RequestMapping("commonDetailJsp")
	public String commonDetail(HttpServletRequest request){
		return "frontend_system/system/common_detail";
	}
	/**
	 * 前台更多页面展示数据接口
	 * @param request
	 * @return
	 */
	@RequestMapping("commonGetList")
	@ResponseBody
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
		}else if(switchPage.equals("staticDataByQuestionFail")){
			list = staticDataService.staticDataByQuestionFail("fail", offset, limit);
			total = staticDataService.questionFailGetCount();
		}else if(switchPage.equals("testPaper")){
			list = testPaperService.getList(null, offset, limit);
			total = testPaperService.getCount(null);
		}else if(switchPage.equals("qa")){
			list = qaSheetService.getList(null, offset, limit);
			qaSheetService.getCount(null);
		} 
		JSONObject result = new JSONObject();
		JSONArray array = JSONArray.fromObject(list);
		Integer pageNumber = offset/limit + 1;
		result.put("page", pageNumber);
		result.put("total", total);
		result.put("rows", array);
		return result;
	}
	
	/**
	 * 前台更多页面展示数据接口
	 * @param request
	 * @return
	 */
	@RequestMapping("commonView")
	@ResponseBody
	public JSONObject commonView(HttpServletRequest request){
		String id = GetEncode.transcode(request.getParameter("id"));
		String switchPage = GetEncode.transcode(request.getParameter("switchPage"));
		CommonView commonView = new CommonView();
		if(switchPage.equals("caseAnalyze")){
			CaseAnalyze caseAnalyze = caseAnalyzeService.getContentById(id);
			commonView.setId(id);
			commonView.setContent(caseAnalyze.getCaseContent());
			commonView.setName(caseAnalyze.getCaseName());
			commonView.setCreatorName(caseAnalyze.getCreatorName());
			commonView.setCreateDate(caseAnalyze.getCreateDate());
		}else if(switchPage.equals("informNotice")){
			InformNotice informNotice = informNoticeService.getContentById(id);
			commonView.setId(id);
			commonView.setContent(informNotice.getInformContent());
			commonView.setName(informNotice.getInformName());
			commonView.setCreatorName(informNotice.getCreatorName());
			commonView.setCreateDate(informNotice.getCreateDate());
		}else if(switchPage.equals("testSelf")){
			TestSelf testSelf = testSelfService.getContentById(id);
			commonView.setId(id);
			commonView.setContent(testSelf.getTestSelfContent());
			commonView.setName(testSelf.getTestSelfName());
			commonView.setCreatorName(testSelf.getCreatorName());
			commonView.setCreateDate(testSelf.getCreateDate());
		} 
		JSONObject result = new JSONObject();
		result.put("status", 1);
		result.put("message", "成功");
		result.put("info", commonView);
		return result;
	}
}

