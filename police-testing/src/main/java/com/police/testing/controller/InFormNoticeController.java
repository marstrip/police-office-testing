package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.police.testing.pojo.InformNotice;
import com.police.testing.service.IIFormNoticeService;
import com.police.testing.tools.GetEncode;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
*@author created by answer
*@date 2018年4月19日-上午9:31:31
*
**/
@Controller
@RequestMapping("/informNotice/")
public class InFormNoticeController {
	@Autowired
	private IIFormNoticeService informNoticeService;
	
	@RequestMapping("jsp")
	public String jsp(HttpServletRequest request){
		return "background_system/inform_notice/inform_list";
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
		String inFormName = GetEncode.transcode(request.getParameter("inFormName"));
		String inFormContent = GetEncode.transcode(request.getParameter("inFormContent"));
		Integer flag = informNoticeService.saveData(inFormName, inFormContent);
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
	public JSONObject deleteCase(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String informId = GetEncode.transcode(request.getParameter("informId"));
		Integer flag = informNoticeService.deleteData(informId);
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
	public JSONObject updateCase(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String informId = GetEncode.transcode(request.getParameter("informId"));
		String informName = GetEncode.transcode(request.getParameter("informName"));
		String informContent = GetEncode.transcode(request.getParameter("informContent"));
		Integer flag = informNoticeService.updateData(informId, informName, informContent);
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
		//第几条记录开始
		Integer offset = Integer.valueOf(GetEncode.transcode(request.getParameter("offset"))) + 1;
		Integer limit = Integer.valueOf(GetEncode.transcode(request.getParameter("limit")));
		String inFormName = GetEncode.transcode(request.getParameter("search"));
		List<InformNotice> list = informNoticeService.getList(inFormName, offset, limit);
		long total = informNoticeService.getCount(inFormName);
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
		String informId = GetEncode.transcode(request.getParameter("informId"));
		String informContent = informNoticeService.getContentById(informId);
		result.put("status", 1);
		result.put("message", "成功");
		result.put("info", informContent);
		return result;
	}
}

