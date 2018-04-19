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
import com.rabbitmq.client.AMQP.Basic.Get;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/testPaper/")
public class TestPaperController {

	@Autowired
	private ITestPaperService testPaperService;
//	/**
//	 * 跳转到试卷列表
//	 * @param request
//	 * @return
//	 */
//	@RequestMapping("jsp")
//	public String jsp(HttpServletRequest request){
//		List<TestPaper> list = testPaperService.getTestPaperList();
//		request.setAttribute("list", list);
//		return "background_system/exam/test_paper_list";
//	}
	/**
	 * 获取试卷列表
	 * @param request
	 * @return
	 */
	@RequestMapping("getList")
	@ResponseBody
	public JSONObject getList(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String testName = GetEncode.transcode(request.getParameter("testName"));
		List<TestPaper> list = testPaperService.getList(testName);
		result.put("page", 1);
		JSONArray array = JSONArray.fromObject(list);
		result.put("rows", array);
		System.out.println("json:" + result.toString());
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
