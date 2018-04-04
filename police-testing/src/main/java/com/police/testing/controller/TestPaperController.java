package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.police.testing.pojo.TestPaper;
import com.police.testing.service.ITestPaperService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/testPaper/")
public class TestPaperController {

	@Autowired
	private ITestPaperService testPaperService;
	/**
	 * 跳转到试卷列表
	 * @param request
	 * @return
	 */
	@RequestMapping("jsp")
	public String jsp(HttpServletRequest request){
		List<TestPaper> list = testPaperService.getTestPaperList();
		request.setAttribute("list", list);
		return "background_system/exam/test_paper_list";
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
        MultipartFile file = mulRequest.getFile("uploadFile");
        String fileName = file.getOriginalFilename();  
        if (fileName == null || "".equals(fileName)){  
        	result.put("message", "上传文件为空！");
            return result;  
        }
        testPaperService.saveFileData(file, fileName);
		return result;
	}
}
