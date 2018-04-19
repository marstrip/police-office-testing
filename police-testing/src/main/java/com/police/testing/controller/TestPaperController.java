package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.police.testing.pojo.TestPaper;
import com.police.testing.service.ITestPaperService;
import com.police.testing.tools.GetEncode;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/testPaper/")
public class TestPaperController {

	@Autowired
	private ITestPaperService testPaperService;
	/**
	 * 获取试卷列表
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
		String testName = GetEncode.transcode(request.getParameter("search"));
		List<TestPaper> list = testPaperService.getList(testName, offset, limit);
		long total = testPaperService.getCount(testName);
		JSONArray array = JSONArray.fromObject(list);
		Integer pageNumber = offset/limit + 1;
		result.put("page", pageNumber);
		result.put("total", total);
		result.put("rows", array);
		return result;
	}
	/**
	 * 查看考试试卷（自学、模拟、正式）
	 * @param request
	 * @return
	 */
	@RequestMapping("viewTestPaper")
	@ResponseBody
	public JSONObject viewTestPaper(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String testPaperId = GetEncode.transcode(request.getParameter("testPaperId"));
		result = testPaperService.getTestPaperById(testPaperId);
		result.put("status", 1);
		result.put("message", "成功！");
		return result;
	}
	/**
	 * 开始考试（模拟、正式）
	 * @param request
	 * @return
	 */
	@RequestMapping("doTesting")
	@ResponseBody
	public JSONObject doTesting(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String testingType = GetEncode.transcode(request.getParameter("testingType"));
		String testPaperId = GetEncode.transcode(request.getParameter("testPaperId"));
		Integer flag = testPaperService.doTesting(testingType, testPaperId);
		if(flag == 1){
			result.put("status", flag);
			result.put("message", "成功");
		}else {
			result.put("status", flag);
			result.put("message", "失败");
		}
		return result;
	}
}
