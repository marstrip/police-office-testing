package com.police.testing.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.police.testing.service.IQuestionService;
import com.police.testing.service.IUploadLogService;

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
		return "background_system/question/upload_question";
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
}
