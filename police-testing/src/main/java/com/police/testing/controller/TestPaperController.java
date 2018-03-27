package com.police.testing.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/testPaper/")
public class TestPaperController {

	@RequestMapping("jsp")
	public String jsp(){
		return "test_paper_list";
	}
	/**
	 * 批量上传试卷
	 * @param request
	 * @return
	 */
	@RequestMapping("uploadTestPaper")
	@ResponseBody
	public JSONObject uploadTestPaper(HttpServletRequest request){
		JSONObject result = new JSONObject();
		MultipartHttpServletRequest mulRequest = (MultipartHttpServletRequest) request;  
        MultipartFile file = mulRequest.getFile("uploadData");
        String filename = file.getOriginalFilename();  
        if (filename == null || "".equals(filename)){  
        	result.put("message", "上传文件为空！");
            return result;  
        }
        
		return result;
	}
}
