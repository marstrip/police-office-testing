package com.police.testing.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.police.testing.pojo.TestQuestionWithBLOBs;
import com.police.testing.service.IQuestionService;
import com.police.testing.service.ITestPaperService;
import com.police.testing.tools.GetEncode;
import com.police.testing.tools.SystemTools;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/testCreate/")
public class TestCreateController {
	@Autowired
	private IQuestionService questionService;
	@Autowired
	private ITestPaperService testPaperService;
	
	/**
	 * 跳转组题页面
	 * @param request
	 * @return
	 */
	@RequestMapping("jsp")
	public String jsp(HttpServletRequest request){
		return "background_system/test_creation/create";
	}
	/**
	 * 获取筛选组题范围的结果
	 * @param request
	 * @return
	 */
	@RequestMapping("searchLog")
	@ResponseBody
	public JSONObject searchLog(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String beginDate = GetEncode.transcode(request.getParameter("beginDate"));
		String endDate = GetEncode.transcode(request.getParameter("endDate"));
		String uploadFileId = GetEncode.transcode(request.getParameter("uploadFileIds"));
		String[] uploadFileIds = null;
		if(StringUtils.isNotBlank(uploadFileId)){
			uploadFileIds = uploadFileId.split(",");
		}
		List<TestQuestionWithBLOBs> testQuestionWithBLOBs = questionService.getListByCreateAndUploadLogIds(beginDate, endDate, uploadFileIds);
		//单选题个数
		Integer singleSelectCount = 0;
		//多选题个数
		Integer manySelectCount = 0;
		//判断题个数
		Integer judgeCount = 0;
		for (TestQuestionWithBLOBs question : testQuestionWithBLOBs) {
			String questionType = question.getTestQuestionType();
			if(questionType.equals("1")){
				singleSelectCount ++;
			}else if(questionType.equals("3")){
				judgeCount ++ ;
			}else if(questionType.equals("2")){
				manySelectCount ++;
			}
		}
		result.put("singleSelectCount", singleSelectCount);
		result.put("manySelectCount", manySelectCount);
		result.put("judgeCount", judgeCount);
		if(singleSelectCount >= 15 && manySelectCount >= 20 && judgeCount >= 10){
			result.put("status", 1);
		}else {
			result.put("status", -1);
		}
		return result;
	}
	/**
	 * 按照题目比例随机生成试卷
	 * @param request
	 */
	@RequestMapping("randomGenerationTestPaper")
	@ResponseBody
	public JSONObject randomGenerationTestPaper(HttpServletRequest request){
		//获取题库范围
		String beginDate = GetEncode.transcode(request.getParameter("beginDate"));
		String endDate = GetEncode.transcode(request.getParameter("endDate"));
		String uploadLogIds = GetEncode.transcode(request.getParameter("uploadFileIds"));
		String[] uploadFileIds = null;
		if(StringUtils.isNotBlank(uploadLogIds)){
			uploadFileIds = uploadLogIds.split(",");
		}
		List<TestQuestionWithBLOBs> list = new ArrayList<>();
		//获取不同类型题目个数
		//单选题个数
		Integer singleSelectCount = 15;
		List<TestQuestionWithBLOBs> singleSelectList = questionService.getListByQuestionTypeAndNumber(beginDate, endDate, uploadFileIds, singleSelectCount, "1");
		//多选题个数
		Integer manySelectCount = 20;
		List<TestQuestionWithBLOBs> manySelectList = questionService.getListByQuestionTypeAndNumber(beginDate, endDate, uploadFileIds, manySelectCount, "2");
		//判断题个数
		Integer judgeCount = 10;
		List<TestQuestionWithBLOBs> judgeList = questionService.getListByQuestionTypeAndNumber(beginDate, endDate, uploadFileIds, judgeCount, "3");
		//合并集合
		list.addAll(singleSelectList);
		list.addAll(manySelectList);
		list.addAll(judgeList);
		//testPaperName试卷名称
		String testPaperName = GetEncode.transcode(request.getParameter("testPaperName"));
		String testTime = GetEncode.transcode(request.getParameter("testTime"));
		Integer testTimeInt = 60;
		if(StringUtils.isNotBlank(testTime)){
			testTimeInt = Integer.valueOf(testTime);
		}
		String testDate = GetEncode.transcode(request.getParameter("testDate"));
		if(StringUtils.isBlank(testDate)){
			testDate = SystemTools.Time2String(new Date(), "yyyy-MM-dd hh:mm:ss");
		}
		//生成待预览试卷
		String testPaperId = testPaperService.createTempTestPaper(list, "0", testPaperName, testTimeInt, testDate);
		//封装jsonarray对象
		JSONArray jsonArray = JSONArray.fromObject(list);
		JSONObject result = new JSONObject();
		//封装反馈对象
		result.put("testPaperId", testPaperId);
		result.put("list", jsonArray);
		result.put("status", 1);
		return result;
	}
	/**
	 * 确认或者取消试卷预览
	 * @param request
	 * @return
	 */
	@RequestMapping("feedbackTestPaper")
	@ResponseBody
	public JSONObject feedbackTestPaper(HttpServletRequest request){
		String operateFlag = GetEncode.transcode(request.getParameter("operateFlag"));
		String testPaperId = GetEncode.transcode(request.getParameter("testPaperId"));
		String testDate = GetEncode.transcode(request.getParameter("testDate"));
		String testPaperName = GetEncode.transcode(request.getParameter("testPaperName"));
		Integer testTime = Integer.valueOf(GetEncode.transcode(request.getParameter("testTime")));
		JSONObject result = new JSONObject();
		if(StringUtils.isNotBlank(operateFlag)){
			result = testPaperService.updateTestPaper(testPaperId, operateFlag, testPaperName, testDate, testTime);
		}else {
			result.put("status", -1);
			result.put("message", "无操作行为");
		}
		return result;
	}
}
