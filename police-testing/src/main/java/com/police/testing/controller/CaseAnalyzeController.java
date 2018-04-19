package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.police.testing.pojo.CaseAnalyze;
import com.police.testing.service.ICaseAnalyzeService;
import com.police.testing.tools.GetEncode;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
*@author created by answer
*@date 2018年4月14日-上午10:02:39
*
**/
@Controller
@RequestMapping("/caseAnalyze/")
public class CaseAnalyzeController {

	@Autowired
	private ICaseAnalyzeService caseAnalyzeService;
	
	@RequestMapping("jsp")
	public String jsp(HttpServletRequest request){
		return "background_system/case_analyze/case_list";
	}
	/**
	 * 提交案例分析
	 * @param request
	 * @return
	 */
	@RequestMapping("saveCase")
	@ResponseBody
	public JSONObject saveCase(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String caseName = GetEncode.transcode(request.getParameter("caseName"));
		String caseContent = GetEncode.transcode(request.getParameter("caseContent"));
		String caseType = GetEncode.transcode(request.getParameter("caseType"));
		Integer flag = caseAnalyzeService.saveData(caseName, caseContent, caseType);
		if(flag == 1){
			result.put("status", flag);
			result.put("message", "保存成功");
		}else {
			result.put("status", flag);
			result.put("message", "保存失败");
		}
		return result;
	}
	/**
	 * 删除案例分析
	 * @param request
	 * @return
	 */
	@RequestMapping("deleteCase")
	@ResponseBody
	public JSONObject deleteCase(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String caseId = GetEncode.transcode(request.getParameter("caseId"));
		Integer flag = caseAnalyzeService.deleteData(caseId);
		if(flag == 1){
			result.put("status", flag);
			result.put("message", "删除成功");
		}else {
			result.put("status", flag);
			result.put("message", "删除失败");
		}
		return result;
	}
	
	/**
	 * 修改案例
	 * @param request
	 * @return
	 */
	@RequestMapping("updateCase")
	@ResponseBody
	public JSONObject updateCase(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String caseId = GetEncode.transcode(request.getParameter("caseId"));
		String caseName = GetEncode.transcode(request.getParameter("caseName"));
		String caseContent = GetEncode.transcode(request.getParameter("caseContent"));
		String caseType = GetEncode.transcode(request.getParameter("caseType"));
		Integer flag = caseAnalyzeService.updateData(caseId, caseName, caseContent, caseType);
		if(flag == 1){
			result.put("status", flag);
			result.put("message", "更新成功");
		}else {
			result.put("status", flag);
			result.put("message", "更新失败");
		}
		return result;
	}
	/**
	 * 获取数据列表
	 * @param request
	 * @return
	 */
	@RequestMapping("getList")
	@ResponseBody
	public JSONObject getList(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String caseName = GetEncode.transcode(request.getParameter("caseName"));
		List<CaseAnalyze> list = caseAnalyzeService.getList(caseName);
		result.put("page", 1);
		JSONArray array = JSONArray.fromObject(list);
		result.put("rows", array);
		System.out.println("json:" + result.toString());
		return result;
	}
	
	/**
	 * 预览单个数据
	 * @param request
	 * @return
	 */
	@RequestMapping("view")
	@ResponseBody
	public JSONObject view(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String caseId = GetEncode.transcode(request.getParameter("caseId"));
		String caseContent = caseAnalyzeService.getContentById(caseId);
		result.put("status", 1);
		result.put("message", "成功");
		result.put("info", caseContent);
		return result;
	}
}

