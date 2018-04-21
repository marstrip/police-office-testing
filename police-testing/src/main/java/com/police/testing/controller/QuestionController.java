package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.police.testing.pojo.CaseAnalyze;
import com.police.testing.pojo.TestQuestionWithBLOBs;
import com.police.testing.service.IQuestionService;
import com.police.testing.service.IUploadLogService;
import com.police.testing.tools.GetEncode;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Controller
@RequestMapping("/question/")
public class QuestionController {
	@Autowired
	private IQuestionService questionService;
	@Autowired
	private IUploadLogService uploadLogService;
	/**
	 * 跳转到试卷列表
	 * @param request
	 * @return
	 */
	@RequestMapping("jsp")
	public String jsp(HttpServletRequest request){
		return "background_system/question/question_list";
	}
	/**
	 * 批量上传试卷
	 * @param request
	 * @return
	 */
	@RequestMapping("uploadQuestion")
	@ResponseBody
	public JSONObject uploadQuestion(HttpServletRequest request){
		JSONObject result = new JSONObject();
		MultipartHttpServletRequest mulRequest = (MultipartHttpServletRequest) request;  
        MultipartFile file = mulRequest.getFile("uploadFile");
        //上传文件名称
        String fileName = file.getOriginalFilename();  
        //文件名查重
        if (fileName == null || "".equals(fileName)){
        	result.put("status", -1);
        	result.put("message", "上传文件为空！");
            return result;  
        }
        //查看文件名是否被上传过
        boolean isExistFlag = uploadLogService.isExistFileName(fileName);
        if(isExistFlag){
        	result.put("status", -1);
        	result.put("message", "存在文件名为“" + fileName +"”的文件存在上传记录，请修改文件名再次上传！");
            return result;  
        }
        result = questionService.saveQuestionByWord(file, fileName);
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
		String questionName = GetEncode.transcode(request.getParameter("search"));
		List<TestQuestionWithBLOBs> list = questionService.getList(questionName, offset, limit);
		long total = questionService.getCount(questionName);
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
		String testQuestionsId = GetEncode.transcode(request.getParameter("testQuestionsId"));
		TestQuestionWithBLOBs questionWithBLOBs = questionService.getContentById(testQuestionsId);
		result.put("status", 1);
		result.put("message", "成功");
		result.put("info", questionWithBLOBs);
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
		String testQuestionsId = GetEncode.transcode(request.getParameter("testQuestionsId"));
		Integer flag = questionService.deleteData(testQuestionsId);
		if(flag == 1){
			result.put("status", flag);
			result.put("message", "删除成功");
		}else {
			result.put("status", flag);
			result.put("message", "删除失败");
		}
		return result;
	}
}
