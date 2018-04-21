package com.police.testing.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dom4j.DocumentException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.police.testing.pojo.TestPaper;
import com.police.testing.pojo.TestingLog;
import com.police.testing.service.IStaticDataService;
import com.police.testing.service.ITestPaperService;
import com.police.testing.tools.ExportFile;
import com.police.testing.tools.GetEncode;

@Controller
@RequestMapping("/exportFile/")
public class ExportFileController {
	@Autowired
	private IStaticDataService staticDataService;
	@Autowired
	private ITestPaperService testPaperservice;
	/**
	 * 根据条件导出考试记录
	 * @param httpSession
	 * @param request
	 * @param response
	 * @throws DocumentException
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("exportFileByTestPaperId")
	public void ExportFileByTestPaperId(HttpSession httpSession,HttpServletRequest request, HttpServletResponse response) throws DocumentException, UnsupportedEncodingException{
		String testPaperId = GetEncode.transcode(request.getParameter("testPaperId"));
		String beginDate = GetEncode.transcode(request.getParameter("beginDate"));
		String endDate = GetEncode.transcode(request.getParameter("endDate"));
		List<TestingLog> testingLogs = staticDataService.selectTestingLogsByTestId(testPaperId, "officalExam", beginDate, endDate);
		TestPaper testPaper = testPaperservice.getTestPaperObjectById(testPaperId);
		ExportFile.exportByTestingLog(testingLogs, testPaper.getTestPaperName(), beginDate, endDate, request, response);
	}
}
