package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.police.testing.pojo.QaSheetWithBLOBs;
import com.police.testing.service.IQaSheetService;
import com.police.testing.tools.GetEncode;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class QaSheetController {
	@Autowired
	private IQaSheetService qaSheetService;
	
	@RequestMapping("jsp")
	public String jsp(HttpServletRequest request){
		return "background_system/case_analyze/case_list";
	}
	/**
	 * 提交案例分析
	 * @param request
	 * @return
	 */
	@RequestMapping("saveData")
	@ResponseBody
	public JSONObject saveData(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String qaContent = GetEncode.transcode(request.getParameter("qaContent"));
		Integer flag = qaSheetService.saveData(qaContent);
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
	@RequestMapping("deleteData")
	@ResponseBody
	public JSONObject deleteData(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String qaId = GetEncode.transcode(request.getParameter("qaId"));
		Integer flag = qaSheetService.deleteData(qaId);
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
	@RequestMapping("updateData")
	@ResponseBody
	public JSONObject updateData(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String qaId = GetEncode.transcode(request.getParameter("qaId"));
		String questionContent = GetEncode.transcode(request.getParameter("questionContent"));
		String questionAnswer = GetEncode.transcode(request.getParameter("questionAnswer"));
		String qaStatus = GetEncode.transcode(request.getParameter("qaStatus"));
		Integer flag = qaSheetService.updateData(qaId, questionContent, questionAnswer, qaStatus);
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
		Integer offset = Integer.valueOf(GetEncode.transcode(request.getParameter("offset"))) + 1;
		Integer limit = Integer.valueOf(GetEncode.transcode(request.getParameter("limit")));
		String questionContent = GetEncode.transcode(request.getParameter("search"));
		List<QaSheetWithBLOBs> list = qaSheetService.getList(questionContent, offset, limit);
		long total = qaSheetService.getCount(questionContent);
		JSONArray array = JSONArray.fromObject(list);
		Integer pageNumber = offset/limit + 1;
		result.put("page", pageNumber);
		result.put("total", total);
		result.put("rows", array);
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
		String qaId = GetEncode.transcode(request.getParameter("qaId"));
		QaSheetWithBLOBs bloBs = qaSheetService.getContentById(qaId);
		result.put("status", 1);
		result.put("message", "成功");
		result.put("question",bloBs.getQuestionContent());
		result.put("answer", bloBs.getQuestionAnswer());
		return result;
	}
}
