package com.police.testing.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.police.testing.dao.SysUserMapper;
import com.police.testing.dao.TestPaperMapper;
import com.police.testing.dao.TestPaperQuestionMapper;
import com.police.testing.dao.TestQuestionMapper;
import com.police.testing.dao.TestingLogMapper;
import com.police.testing.pojo.SysUser;
import com.police.testing.pojo.TestPaper;
import com.police.testing.pojo.TestPaperQuestion;
import com.police.testing.pojo.TestQuestionWithBLOBs;
import com.police.testing.pojo.TestingLog;
import com.police.testing.service.ITestPaperService;
import com.police.testing.tools.SystemTools;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Component("testPaperService")
public class TestPaperServiceImpl implements ITestPaperService {
	@Autowired
	private TestPaperMapper testPaperMapper;
	@Autowired
	private TestPaperQuestionMapper testPaperQuestionMapper;
	@Autowired
	private TestQuestionMapper testQuestionMapper;
	@Autowired
	private TestingLogMapper testingLogMapper;
	@Autowired
	private SysUserMapper sysUserMapper;
	
	@Override
	public List<TestPaper> getTestPaperList() {
		return testPaperMapper.selectByTestPaperId(null);
	}

	@Override
	public String createTempTestPaper(List<TestQuestionWithBLOBs> questionWithBLOBs, String testPaperType, String testPaperName,
			Integer testTime, String testDate) {
		//生成试卷
		String testPaperId = "TEST" + UUID.randomUUID().toString();
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String userId = (String) session.getAttribute("currentUserId");
		String userName = (String) session.getAttribute("currentUserName");
		TestPaper testPaper = new TestPaper();
		testPaper.setTestPaperId(testPaperId);
		testPaper.setTestPaperName(testPaperName);
		testPaper.setTestDate(SystemTools.String2Date(testDate, "yyyy-MM-DD hh:mm:ss"));
		testPaper.setTestTime(testTime);
		Date now = new Date();
		//待预览为0，生成为1
		testPaper.setTestPaperType(testPaperType);
		testPaper.setEnable("0");
		testPaper.setCreateDate(now);
		testPaper.setUpdateDate(now);
		testPaper.setCreatorId(userId);
		testPaper.setCreatorName(userName);
		testPaperMapper.insert(testPaper);
		//生成试卷与试题对应关系
		for (int i = 0 ; i< questionWithBLOBs.size(); i++) {
			Integer number = i;
			TestQuestionWithBLOBs testQuestionWithBLOBs = questionWithBLOBs.get(i);
			TestPaperQuestion testPaperQuestion = new TestPaperQuestion();
			testPaperQuestion.setTestPaperId(testPaperId);
			testPaperQuestion.setTestQuestionsId(testQuestionWithBLOBs.getTestQuestionsId());
			testPaperQuestion.setTestQuestionsNumber(number + 1);
			testPaperQuestion.setTestPaperName(testPaperName);
			testPaperQuestionMapper.insertSelective(testPaperQuestion);
		}
		return testPaperId;
	}

	@Override
	public JSONObject updateTestPaper(String testPaperId, String operateFlag, String testPaperName, String testDate, Integer testTime) {
		//获取用户信息
 		JSONObject result = new JSONObject();
		//判断操作状态
		if(operateFlag.equals("affirm")){//确认
//			List<TestPaperQuestion> paperQuestions = testPaperQuestionMapper.selectByTestPaperId(testPaperId);
//			for (int i = 0; i < paperQuestions.size(); i++) {
//				TestPaperQuestion paperQuestion = paperQuestions.get(i);
//				
//			}
			testPaperMapper.updateEnable(testPaperId);
			result.put("status", 1);
			result.put("message", "确认成功，试卷已生成");
		}else {
			testPaperMapper.deleteByPrimaryKey(testPaperId);
			testPaperQuestionMapper.deleteByTestPaperId(testPaperId);
			result.put("status", 1);
			result.put("message", "已取消，试卷未生成");
		}
		return result;
	}

	@Override
	public List<TestPaper> getList(String testPaperName, Integer offset, Integer limit) {
		List<TestPaper> testPapers = testPaperMapper.selectByLikeTestPapaerName(testPaperName, offset, limit);
		return testPapers;
	}

	@Override
	public JSONObject getTestPaperById(String testPaperId) {
		TestPaper testPaper = testPaperMapper.selectByPrimaryKey(testPaperId);
		List<TestPaperQuestion> testPaperQuestions = testPaperQuestionMapper.selectByTestPaperId(testPaperId);
		List<String> testQuestionIds = new ArrayList<>();
		Map<String, Integer> testQuestionAndNumber = new HashMap<>(); 
		String testPaperName = null;
		if(testPaperQuestions.size() > 0){
			testPaperName = testPaperQuestions.get(0).getTestPaperName();
			for (TestPaperQuestion testPaperQuestion : testPaperQuestions) {
				testQuestionIds.add(testPaperQuestion.getTestQuestionsId());
				testQuestionAndNumber.put(testPaperQuestion.getTestQuestionsId(),testPaperQuestion.getTestQuestionsNumber());
			}
		}
		//获取试题
		List<TestQuestionWithBLOBs> resultList = testQuestionMapper.selectByTestQuestionIds(testQuestionIds);
		for (TestQuestionWithBLOBs testQuestionWithBLOBs : resultList) {
			String testQuestionId = testQuestionWithBLOBs.getTestQuestionsId();
			Integer number = testQuestionAndNumber.get(testQuestionId);
			testQuestionWithBLOBs.setNumber(number);
		}
		JSONObject result = new JSONObject();
		result.put("testTime",testPaper.getTestTime());
		result.put("testPaperName", testPaperName);
		result.put("list", resultList);
		return result;
	}

	@Override
	public Integer doTesting(String testingType, String testPaperId) {
		//获取当前考试用户信息
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String userId = (String) session.getAttribute("currentUserId");
		SysUser user = sysUserMapper.findByLoginName(userId, "1");
		String departmentId = user.getDepartmentId();
		String departmentName = user.getDepartmentName();
		TestingLog testingLog = new TestingLog();
		testingLog.setDepartmentId(departmentId);
		testingLog.setDepartmentName(departmentName);
		testingLog.setTestingType(testingType);
		testingLog.setTestPaperId(testPaperId);
		testingLog.setUserId(userId);
		testingLog.setUserName(user.getUserName());
		return testingLogMapper.insert(testingLog);
	}

	@Override
	public long getCount(String testName) {
		List<TestPaper> testPapers = testPaperMapper.selectByLikeTestPapaerName(testName, null, null);
		return testPapers.size();
	}

	@Override
	public TestPaper getTestPaperObjectById(String testPaperId) {
		TestPaper testPaper = testPaperMapper.selectByPrimaryKey(testPaperId);
		return testPaper;
	}

	@Override
	public Integer submitTesting(JSONArray answerArray, String testPaperId) {
		Integer sorce = 0;
		for (Object object : answerArray) {
			JSONObject jsonObject = JSONObject.fromObject(object);
			if(jsonObject.containsKey("testQusetionId") && jsonObject.containsKey("answer") && jsonObject.containsKey("questionType")){
				String questionType = jsonObject.getString("questionType");
				String testQuestionsId = jsonObject.getString("testQuestionId");
				TestQuestionWithBLOBs testQuestionWithBLOBs = testQuestionMapper.selectByPrimaryKey(testQuestionsId);
				String rightAnswer = null;
				if(testQuestionWithBLOBs != null){
					rightAnswer = testQuestionWithBLOBs.getCorrectAnswer();
				}
				String userAnswer = jsonObject.getString("answer");
				//判断答案是否一致
				if(StringUtils.isNotBlank(rightAnswer) && userAnswer.equals(rightAnswer)){
					//做题正确
					testPaperQuestionMapper.updateRightCount(testPaperId, testQuestionsId);
					if(StringUtils.isNotBlank(questionType) && questionType.equals("1")){
						sorce = sorce+2;
					}else if(questionType.equals("2")){
						sorce = sorce+3;
					}else if(questionType.equals("3")){
						sorce = sorce+1;
					}
				}else {
					//做题错误
					testPaperQuestionMapper.updateFailCount(testPaperId, testQuestionsId);
				}
			}
		}
		//保存分数
		
		return sorce;
	}
	
}
