package com.police.testing.service.impl;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
import com.police.testing.pojo.TestingResult;
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
		return testPaperMapper.selectByTestPaperId(null, null, null);
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
		testPaper.setTestDate(SystemTools.String2Date(testDate, "yyyy-MM-dd hh:mm:ss"));
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
			testPaperMapper.updateEnable(testPaperId, "1");
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
		List<TestQuestionWithBLOBs> resultList = testQuestionMapper.selectByTestQuestionIds(testQuestionIds,null,null);
		for (TestQuestionWithBLOBs testQuestionWithBLOBs : resultList) {
			String testQuestionId = testQuestionWithBLOBs.getTestQuestionsId();
			Integer number = testQuestionAndNumber.get(testQuestionId);
			testQuestionWithBLOBs.setNumber(number);
		}
		// 按点击数倒序
        Collections.sort(resultList, new Comparator<TestQuestionWithBLOBs>() {
            public int compare(TestQuestionWithBLOBs arg0, TestQuestionWithBLOBs arg1) {
                int hits0 = arg0.getNumber();
                int hits1 = arg1.getNumber();
                if (hits1 < hits0) {
                    return 1;
                } else if (hits1 == hits0) {
                    return 0;
                } else {
                    return -1;
                }
            }
        });
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
		testingLog.setCreateDate(new Date());
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
	public JSONObject submitTesting(JSONArray answerArray, String testPaperId) {
		JSONObject result = new JSONObject();
		//初始分数为0
		Integer score = 0;
		//遍历提交答题结果
		List<TestingResult> testingResults = new ArrayList<>();
		for (Object object : answerArray) {
			TestingResult testingResult = new TestingResult();
			JSONObject jsonObject = JSONObject.fromObject(object);
			//判断数据是否存在
			if(jsonObject.containsKey("testQuestionsId") && jsonObject.containsKey("answer") && jsonObject.containsKey("testQuestionType")){
				String questionType = jsonObject.getString("testQuestionType");//题目类型
				String testQuestionsId = jsonObject.getString("testQuestionsId");//试题ID
				TestQuestionWithBLOBs testQuestionWithBLOBs = testQuestionMapper.selectByPrimaryKey(testQuestionsId);//获取题目对象用于获取答案
				String rightAnswer = null;
				if(testQuestionWithBLOBs != null){
					rightAnswer = testQuestionWithBLOBs.getCorrectAnswer();
				}
				String userAnswer = jsonObject.getString("answer");//用户提交的答案
				testingResult.setRightAnswer(rightAnswer);
				testingResult.setTestQuestionsId(testQuestionsId);
				//判断答案是否一致
				if(StringUtils.isNotBlank(rightAnswer) && userAnswer.equals(rightAnswer)){
					//做题正确，在试卷试题关系表中记录正确一次用于统计分析
					testPaperQuestionMapper.updateRightCount(testPaperId, testQuestionsId);
					testingResult.setCorrectFlag(1);
					if(StringUtils.isNotBlank(questionType)){
						if(questionType.equals("1")){//单选题
							score = score+2;
						}else if(questionType.equals("2")){//多选题
							score = score+3;
						}else if(questionType.equals("3")){//判断题
							score = score+1;
						}	
					}
				}else {
					//做题错误，在试题试卷关系表中记录错误一次用于统计分析
					testPaperQuestionMapper.updateFailCount(testPaperId, testQuestionsId);
					testingResult.setCorrectFlag(0);
				}
			}
			testingResults.add(testingResult);
		}
		//---------------------------------------保存分数-----------------------------
		//用户信息
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String userId = (String) session.getAttribute("currentUserId");
		SysUser user = sysUserMapper.findByLoginName(userId, "1");
		String departmentName = null;
		String departmentId = null;
		String userName = null;
		if(user != null){
			departmentName = user.getDepartmentName();
			departmentId = user.getDepartmentId();
			userName = user.getUserName();
		}
		TestingLog testingLog = new TestingLog();
		testingLog.setCreateDate(new Date());
		testingLog.setDepartmentId(departmentId);
		testingLog.setDepartmentName(departmentName);
		testingLog.setScore(score);
		testingLog.setTestingType("officalExam");
		testingLog.setTestPaperId(testPaperId);
		testingLog.setUserId(userId);
		testingLog.setUserName(userName);
		testingLogMapper.insert(testingLog);
		result.put("score", score);
		result.put("testingResult", testingResults);
		return result;
	}

	@Override
	public Integer deleteData(String testPaperId, String enable) {
		return testPaperMapper.updateEnable(testPaperId, enable);
	}

	@Override
	public List<TestPaper> getListByUser(String testPaperName, Integer offset, Integer limit) {
		//获取用户信息
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String userId = (String) session.getAttribute("currentUserId");
		//获取试卷列表
		List<TestPaper> testPapers = testPaperMapper.selectByLikeTestPapaerName(testPaperName, offset, limit);
		for (TestPaper testPaper : testPapers) {
			String testPaperId = testPaper.getTestPaperId();
			String testDateStr = testPaper.getTestDate();
			Date testDate = SystemTools.String2Date(testDateStr, "yyyy-MM-dd hh:mm:ss");
			Date now = new Date();
			List<TestingLog> testingLogs = testingLogMapper.selectByTestPaperIdAndUserId(testPaperId, userId);
			if(testingLogs.size() > 0){//试卷被考试过
				testPaper.setFlagExam("0");
			}else if(testDate.getTime() < now.getTime()){
				testPaper.setFlagExam("0");
			}else {
				testPaper.setFlagExam("1");
			}
		}
		return testPapers;
	}
	
}
