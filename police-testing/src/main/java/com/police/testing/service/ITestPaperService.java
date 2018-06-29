package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.TestPaper;
import com.police.testing.pojo.TestQuestionWithBLOBs;

import net.sf.json.JSONArray;
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
	 * @param testBeginDate 
	 */
	public String createTempTestPaper(List<TestQuestionWithBLOBs> questionWithBLOBs, String testPaperType, String testPaperName,
			Integer testTime, String testDate, String testBeginDate);
	
	
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
	public List<TestPaper> getList(String testName, Integer offset, Integer limit);
	
	/**
	 * 根据试卷id获取全部试题
	 * @param testPaperId
	 * @return
	 */
	public JSONObject getTestPaperById(String testPaperId);
	/**
	 * 开始考试（模拟、正式）
	 * @param testingType
	 * @param testPaperId
	 * @return
	 */
	public Integer doTesting(String testingType, String testPaperId);

	public long getCount(String testName, String enable);
	
	public TestPaper getTestPaperObjectById(String testPaperId);

	public JSONObject submitTesting(JSONArray answerArray, String testPaperId, String ip);

	public Integer deleteData(String testPaperId, String enable);

	public List<TestPaper> getListByUser(String testName, Integer offset, Integer limit);
	/**
	 * 保存试卷和题库的对应关系
	 * @param uploadFileIds
	 * @param testDate
	 * @param testPaperName
	 * @param testTime
	 * @param testBeginDate
	 * @return
	 */
	public JSONObject savePaper(String[] uploadFileIds, String testDate, String testPaperName, Integer testTime,
			String testBeginDate);
}
