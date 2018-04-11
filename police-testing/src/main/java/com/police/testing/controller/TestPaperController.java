package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.police.testing.pojo.TestPaper;
import com.police.testing.service.ITestPaperService;

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
}
