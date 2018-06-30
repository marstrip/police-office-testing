package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.police.testing.pojo.TestingLog;
import com.police.testing.service.ITestingLogService;
import com.police.testing.tools.GetEncode;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
*@author created by answer
*@date 2018年7月1日-上午12:06:05
*
**/
@Controller
@RequestMapping("/testingLog/")
public class TestingLogController {
	@Autowired
	private ITestingLogService testingLogService;
	
	@RequestMapping("jsp")
	public String jsp(HttpServletRequest request){
		return "background_system/test_paper/test_log_list";
	}
	 
	/**
	 * 删除案例分析
	 * @param request
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public JSONObject deleteCase(HttpServletRequest request){
		JSONObject result = new JSONObject();
//		String testPaperId = GetEncode.transcode(request.getParameter("testPaperId"));
//		String userId = GetEncode.transcode(request.getParameter("userId"));
		String autoId = GetEncode.transcode(request.getParameter("autoId"));
		Integer flag = testingLogService.deleteData(autoId);
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
	 * 获取数据列表
	 * @param request
	 * @return
	 */
	@RequestMapping("getList")
	@ResponseBody
	public JSONObject getList(HttpServletRequest request){
		JSONObject result = new JSONObject();
		//第几条记录开始
		Integer offset = Integer.valueOf(GetEncode.transcode(request.getParameter("offset")));
		Integer limit = Integer.valueOf(GetEncode.transcode(request.getParameter("limit")));
		String userId = GetEncode.transcode(request.getParameter("search"));
		List<TestingLog> list = testingLogService.getList(userId, offset, limit);
		long total = testingLogService.getCount(userId);
		JSONArray array = JSONArray.fromObject(list);
		Integer pageNumber = offset/limit + 1;
		result.put("page", pageNumber);
		result.put("total", total);
		result.put("rows", array);
		return result;
	}
	 
}

