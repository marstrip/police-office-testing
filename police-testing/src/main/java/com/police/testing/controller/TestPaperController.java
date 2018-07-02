package com.police.testing.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.police.testing.pojo.TestPaper;
import com.police.testing.pojo.TestQuestionWithBLOBs;
import com.police.testing.service.IQuestionService;
import com.police.testing.service.ITestPaperService;
import com.police.testing.tools.GetEncode;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/testPaper/")
public class TestPaperController {

	@Autowired
	private ITestPaperService testPaperService;
	@Autowired
	private IQuestionService questionService;
	/**
	 * 跳转后台试卷管理页面
	 * @param request
	 * @return
	 */
	@RequestMapping("jsp")
	public String jsp(HttpServletRequest request){
		return "background_system/test_paper/test_paper_list";
	}
	/**
	 * 跳转前台展现试卷页面
	 * @param request
	 * @return
	 */
	@RequestMapping("fronendJsp")
	public String fronendJsp(HttpServletRequest request){
		return "frontend_system/test_paper/testing_view";
	}

	/**
	 * 获取试卷列表
	 * @param request
	 * @return
	 */
	@RequestMapping("fronendList")
	@ResponseBody
	public JSONObject fronendList(HttpServletRequest request){
		JSONObject result = new JSONObject();
		//第几条记录开始
		Integer offset = Integer.valueOf(GetEncode.transcode(request.getParameter("offset")));
		Integer limit = Integer.valueOf(GetEncode.transcode(request.getParameter("limit")));
		String testName = GetEncode.transcode(request.getParameter("search"));
		List<TestPaper> list = testPaperService.getListByUser(testName, offset, limit);
		long total = testPaperService.getCount(testName, "1");
		JSONArray array = JSONArray.fromObject(list);
		Integer pageNumber = offset/limit + 1;
		result.put("page", pageNumber);
		result.put("total", total);
		result.put("rows", array);
		System.out.println(result.toString());
		return result;
	}
	
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
		Integer offset = Integer.valueOf(GetEncode.transcode(request.getParameter("offset")));
		Integer limit = Integer.valueOf(GetEncode.transcode(request.getParameter("limit")));
		String testName = GetEncode.transcode(request.getParameter("search"));
		List<TestPaper> list = testPaperService.getList(testName, offset, limit);
		long total = testPaperService.getCount(testName, null);
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
		Map<String, Object> map = testPaperService.getTestPaperById(testPaperId);
		String[] uploadFileIds = (String[]) map.get("uploadFileIds");
		TestPaper testPaper = (TestPaper) map.get("testPaper");
		List<TestQuestionWithBLOBs> list = new ArrayList<>();
		//获取不同类型题目个数
		//单选题个数
		Integer singleSelectCount = 15;
		List<TestQuestionWithBLOBs> singleSelectList = questionService.getListByQuestionTypeAndNumber(null, null, uploadFileIds, singleSelectCount, "1");
		//多选题个数
		Integer manySelectCount = 20;
		List<TestQuestionWithBLOBs> manySelectList = questionService.getListByQuestionTypeAndNumber(null, null, uploadFileIds, manySelectCount, "2");
		//判断题个数
		Integer judgeCount = 10;
		List<TestQuestionWithBLOBs> judgeList = questionService.getListByQuestionTypeAndNumber(null, null, uploadFileIds, judgeCount, "3");
		//合并集合
		list.addAll(singleSelectList);
		list.addAll(manySelectList);
		list.addAll(judgeList);
		for (int i=0; i<list.size(); i++) {
			TestQuestionWithBLOBs testQuestionWithBLOBs = list.get(i);
			testQuestionWithBLOBs.setNumber(i);
		}
		//封装jsonarray对象
		JSONArray jsonArray = JSONArray.fromObject(list);
		//封装反馈对象
		result.put("testPaperId", testPaperId);
		result.put("testPaperName", testPaper.getTestPaperName());
		result.put("testTime", testPaper.getTestTime());
		result.put("list", jsonArray);
		result.put("status", 1);
		result.put("message", "成功！");
		return result;
	}
	
	/**
	 * 删除
	 * @param request
	 * @return
	 */
	@RequestMapping("deleteData")
	@ResponseBody
	public JSONObject deleteData(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String testPaperId = GetEncode.transcode(request.getParameter("testPaperId"));
		String enable = GetEncode.transcode(request.getParameter("enable"));
		if(enable.equals("1")){
			enable = "0";
		}else if(enable.equals("0")){
			enable = "1";
		}
		Integer flag = testPaperService.deleteData(testPaperId, enable);
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
	/**
	 * 提交考试成绩
	 * @param request
	 * @return
	 */
	@RequestMapping("submitTesting")
	@ResponseBody
	public JSONObject submitTesting(HttpServletRequest request){
		//获取ip
		String ip = getIp2(request);
		JSONObject result = new JSONObject();
		String jsonStr = GetEncode.transcode(request.getParameter("json"));
		JSONObject receiveObject = JSONObject.fromObject(jsonStr);
		if(receiveObject.containsKey("testPaperId") && receiveObject.containsKey("answerList") && receiveObject.containsKey("type")){
			String testPaperId = receiveObject.getString("testPaperId");
			if(testPaperId.equals("null")){
				testPaperId = null;
			}
			String answerListStr = receiveObject.getString("answerList");
			String type = receiveObject.getString("type");
			JSONArray answerArray = JSONArray.fromObject(answerListStr);
			result = testPaperService.submitTesting(answerArray, testPaperId, ip, type);
		}else {
			result.put("status", -1);
		}
		return result;
	}
	
	
	public static String getIp2(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
            //多次反向代理后会有多个ip值，第一个ip才是真实ip
            int index = ip.indexOf(",");
            if(index != -1){
                return ip.substring(0,index);
            }else{
                return ip;
            }
        }
        ip = request.getHeader("X-Real-IP");
        if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
            return ip;
        }
        return request.getRemoteAddr();
    }
}
