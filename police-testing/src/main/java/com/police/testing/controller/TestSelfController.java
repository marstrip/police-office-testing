package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.police.testing.pojo.TestSelf;
import com.police.testing.service.ITestSelfService;
import com.police.testing.tools.GetEncode;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/testSelf/")
public class TestSelfController {
	@Autowired
	private ITestSelfService testSelfService;
	
	@RequestMapping("jsp")
	public String jsp(HttpServletRequest request){
		return "background_system/test_self/test_self_list";
	}
	/**
	 * 提交案例分析
	 * @param request
	 * @return
	 */
	@RequestMapping("saveTestSelf")
	@ResponseBody
	public JSONObject saveTestSelf(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String testSelfName = GetEncode.transcode(request.getParameter("testSelfName"));
		String testSelfContent = GetEncode.transcode(request.getParameter("testSelfContent"));
		String testSelfType = GetEncode.transcode(request.getParameter("testSelfType"));
		String testSelfLevel = GetEncode.transcode(request.getParameter("testSelfLevel"));
		Integer flag = testSelfService.saveData(testSelfName, testSelfContent, testSelfType, testSelfLevel);
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
	 * 删除
	 * @param request
	 * @return
	 */
	@RequestMapping("deleteTestSelf")
	@ResponseBody
	public JSONObject deleteTestSelf(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String testSelfId = GetEncode.transcode(request.getParameter("testSelfId"));
		Integer flag = testSelfService.deleteData(testSelfId);
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
	 * 修改
	 * @param request
	 * @return
	 */
	@RequestMapping("updateTestSelf")
	@ResponseBody
	public JSONObject updateTestSelf(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String testSelfId = GetEncode.transcode(request.getParameter("testSelfId"));
		String testSelfName = GetEncode.transcode(request.getParameter("testSelfName"));
		String testSelfContent = GetEncode.transcode(request.getParameter("testSelfContent"));
		String testSelfType = GetEncode.transcode(request.getParameter("testSelfType"));
		String testSelfLevel = GetEncode.transcode(request.getParameter("testSelfLevel"));
		Integer flag = testSelfService.updateData(testSelfId, testSelfName, testSelfContent, testSelfType, testSelfLevel);
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
		JSONObject result = new JSONObject();//第几条记录开始
		Integer offset = Integer.valueOf(GetEncode.transcode(request.getParameter("offset")));
		Integer limit = Integer.valueOf(GetEncode.transcode(request.getParameter("limit")));
		String testSelfName = GetEncode.transcode(request.getParameter("search"));
		List<TestSelf> list = testSelfService.getList(testSelfName, offset, limit);
		long total = testSelfService.getCount(testSelfName);
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
		TestSelf testSelf = testSelfService.getContentById(qaId);
		result.put("status", 1);
		result.put("message", "成功");
		result.put("info",testSelf.getTestSelfContent());
		return result;
	}
}
