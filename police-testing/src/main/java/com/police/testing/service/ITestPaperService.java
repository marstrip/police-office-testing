package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.TestPaper;
import com.police.testing.pojo.TestQuestionWithBLOBs;

import net.sf.json.JSONObject;

public interface ITestPaperService {
	/**
	 * 获取全部试卷数据
	 * @return
	 */
	public List<TestPaper> getTestPaperList();
	
	/**
	 * 生成待预览的试卷及试卷类型
	 * @param questionWithBLOBs
	 * @param testPaperType
	 */
	public String createTempTestPaper(List<TestQuestionWithBLOBs> questionWithBLOBs, String testPaperType);
	
	
	/**
	 * 根据用户操作行为更新试卷状态
	 * @param testPaperId
	 * @param operateFlag
	 * @return
	 */
	public JSONObject updateTestPaper(String testPaperId, String operateFlag, String testPaperName, String testDate, Integer testTime);
	/**
	 * 获取试卷列表集合
	 * @param testName
	 * @return
	 */
	public List<TestPaper> getList(String testName);
}
