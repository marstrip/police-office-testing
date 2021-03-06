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
import com.police.testing.dao.TestPaperUploadMapper;
import com.police.testing.dao.TestQuestionMapper;
import com.police.testing.dao.TestingLogMapper;
import com.police.testing.pojo.SysUser;
import com.police.testing.pojo.TestPaper;
import com.police.testing.pojo.TestPaperQuestion;
import com.police.testing.pojo.TestPaperUpload;
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
	@Autowired
	private TestPaperUploadMapper testPaperUploadMapper;
	@Override
	public List<TestPaper> getTestPaperList() {
		return testPaperMapper.selectByTestPaperId(null, null, null);
	}

	@Override
	public String createTempTestPaper(List<TestQuestionWithBLOBs> questionWithBLOBs, String testPaperType, String testPaperName,
			Integer testTime, String testDate, String testBeginDate) {
		//生成试卷
		String testPaperId = "TEST" + UUID.randomUUID().toString();
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String userId = (String) session.getAttribute("currentUserId");
		String userName = (String) session.getAttribute("currentUserName");
		TestPaper testPaper = new TestPaper();
		testPaper.setTestPaperId(testPaperId);
		testPaper.setTestPaperName(testPaperName);
		testPaper.setBeginDate(SystemTools.String2Date(testBeginDate, "yyyy-MM-dd hh:mm:ss"));
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
		List<TestPaper> testPapers = testPaperMapper.selectByLikeTestPapaerName(testPaperName, null, offset, limit);
		return testPapers;
	}

	@Override
	public Map<String, Object> getTestPaperById(String testPaperId) {
		TestPaper testPaper = testPaperMapper.selectByPrimaryKey(testPaperId);
		List<TestPaperUpload> testPaperUploads = testPaperUploadMapper.selectUploadIdsByTestPaperId(testPaperId);
		String[] uploadFileIds = new String[testPaperUploads.size()];
		for (int i=0; i<testPaperUploads.size(); i++) {
			TestPaperUpload testPaperUpload = testPaperUploads.get(i);
			String uploadFileId = testPaperUpload.getUploadFileId();
			uploadFileIds[i] = uploadFileId;
			
		}
		Map<String, Object> result = new HashMap<>();
		result.put("uploadFileIds", uploadFileIds);
		result.put("testPaper", testPaper);
		return result;
//		List<TestPaperQuestion> testPaperQuestions = testPaperQuestionMapper.selectByTestPaperId(testPaperId);
//		List<String> testQuestionIds = new ArrayList<>();
//		Map<String, Integer> testQuestionAndNumber = new HashMap<>(); 
//		String testPaperName = null;
//		if(testPaperQuestions.size() > 0){
//			testPaperName = testPaperQuestions.get(0).getTestPaperName();
//			for (TestPaperQuestion testPaperQuestion : testPaperQuestions) {
//				testQuestionIds.add(testPaperQuestion.getTestQuestionsId());
//				testQuestionAndNumber.put(testPaperQuestion.getTestQuestionsId(),testPaperQuestion.getTestQuestionsNumber());
//			}
//		}
//		//获取试题
//		List<TestQuestionWithBLOBs> resultList = testQuestionMapper.selectByTestQuestionIds(testQuestionIds,null,null);
//		for (TestQuestionWithBLOBs testQuestionWithBLOBs : resultList) {
//			String testQuestionId = testQuestionWithBLOBs.getTestQuestionsId();
//			Integer number = testQuestionAndNumber.get(testQuestionId);
//			testQuestionWithBLOBs.setNumber(number);
//		}
//		// 按点击数倒序
//        Collections.sort(resultList, new Comparator<TestQuestionWithBLOBs>() {
//            public int compare(TestQuestionWithBLOBs arg0, TestQuestionWithBLOBs arg1) {
//                int hits0 = arg0.getNumber();
//                int hits1 = arg1.getNumber();
//                if (hits1 < hits0) {
//                    return 1;
//                } else if (hits1 == hits0) {
//                    return 0;
//                } else {
//                    return -1;
//                }
//            }
//        });
//		result.put("testTime",testPaper.getTestTime());
//		result.put("testPaperName", testPaper.getTestPaperName());
//		result.put("list", resultList);
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
	public long getCount(String testName, String enable) {
		List<TestPaper> testPapers = testPaperMapper.selectByLikeTestPapaerName(testName, enable, null, null);
		return testPapers.size();
	}

	@Override
	public TestPaper getTestPaperObjectById(String testPaperId) {
		TestPaper testPaper = testPaperMapper.selectByPrimaryKey(testPaperId);
		return testPaper;
	}

	@Override
	public JSONObject submitTesting(JSONArray answerArray, String testPaperId, String ip, String type) {
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
		JSONObject result = new JSONObject();
		if(type.equals("officalExam")){
			//判断本次考试是否提交过答案
			List<TestingLog> testingLogs = testingLogMapper.selectByTestPaperIdAndUserId(testPaperId, userId, "officalExam");
			if(testingLogs.size() > 0){
				result.put("status", -1);
				result.put("code", 501);
				result.put("message", "已提交过答案，请勿再次提交！");
				return result;
			}
		}
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
					testQuestionMapper.updateRightCount(testQuestionsId);
//					testPaperQuestionMapper.updateRightCount(testPaperId, testQuestionsId);
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
					testQuestionMapper.updateFailCount(testQuestionsId);
//					testPaperQuestionMapper.updateFailCount(testPaperId, testQuestionsId);
					testingResult.setCorrectFlag(0);
				}
			}
			testingResults.add(testingResult);
		}
		if(StringUtils.isNotBlank(testPaperId) && !testPaperId.equals("null")){
			//---------------------------------------保存分数-----------------------------
			TestingLog testingLog = new TestingLog();
			testingLog.setCreateDate(new Date());
			testingLog.setDepartmentId(departmentId);
			testingLog.setDepartmentName(departmentName);
			testingLog.setScore(score);
			testingLog.setTestingType("officalExam");
			testingLog.setIp(ip);
			TestPaper testPaper = testPaperMapper.selectByPrimaryKey(testPaperId);
			String testPaperName = null;
			if(testPaper != null){
				testPaperName = testPaper.getTestPaperName();
			}
			testingLog.setTestPaperId(testPaperId);
			testingLog.setTestPaperName(testPaperName);
			testingLog.setUserId(userId);
			testingLog.setUserName(userName);
			testingLogMapper.insert(testingLog);
		}
		result.put("status", 1);
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
		List<TestPaper> testPapers = testPaperMapper.selectByLikeTestPapaerName(testPaperName, "1", offset, limit);
		List<TestPaper> resultTestPapers = new ArrayList<>();
		for (TestPaper testPaper : testPapers) {
			String testPaperId = testPaper.getTestPaperId();
			String testDateStr = testPaper.getTestDate();
			String testBeginDateStr = testPaper.getBeginDate();
			Date testDate = SystemTools.String2Date(testDateStr, "yyyy-MM-dd hh:mm:ss");
			Date testBeginDate = SystemTools.String2Date(testBeginDateStr, "yyyy-MM-dd hh:mm:ss");
			Date now = new Date();
			List<TestingLog> testingLogs = testingLogMapper.selectByTestPaperIdAndUserId(testPaperId, userId, null);
			if(testingLogs.size() > 0){//试卷被考试过
				testPaper.setFlagExam("3");
			}else if(testDate.getTime() < now.getTime()){
				testPaper.setFlagExam("0");
			}else if(testBeginDate.getTime() > now.getTime()){
				testPaper.setFlagExam("2");
			}else {
				testPaper.setFlagExam("1");
			}
			resultTestPapers.add(testPaper);
		}
		return resultTestPapers;
	}

	@Override
	public JSONObject savePaper(String[] uploadFileIds, String testDate, String testPaperName, Integer testTime,
			String testBeginDate) {
		//生成试卷
		String testPaperId = "TEST" + UUID.randomUUID().toString();
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String userId = (String) session.getAttribute("currentUserId");
		String userName = (String) session.getAttribute("currentUserName");
		TestPaper testPaper = new TestPaper();
		testPaper.setTestPaperId(testPaperId);
		testPaper.setTestPaperName(testPaperName);
		testPaper.setBeginDate(SystemTools.String2Date(testBeginDate, "yyyy-MM-dd hh:mm:ss"));
		testPaper.setTestDate(SystemTools.String2Date(testDate, "yyyy-MM-dd hh:mm:ss"));
		testPaper.setTestTime(testTime);
		Date now = new Date();
		//待预览为0，生成为1
		testPaper.setTestPaperType("1");
		testPaper.setEnable("1");
		testPaper.setCreateDate(now);
		testPaper.setUpdateDate(now);
		testPaper.setCreatorId(userId);
		testPaper.setCreatorName(userName);
		testPaperMapper.insert(testPaper);
		//生成对应关系
		for (int i = 0; i < uploadFileIds.length; i++) {
			String uploadFileId = uploadFileIds[i];
			TestPaperUpload testPaperUpload = new TestPaperUpload();
			testPaperUpload.setCreateDate(new Date());
			testPaperUpload.setTestPaperId(testPaperId);
			testPaperUpload.setUploadFileId(uploadFileId);
			testPaperUpload.setTestPaperName(testPaperName);
			testPaperUploadMapper.insert(testPaperUpload);
		}
		JSONObject result = new JSONObject();
		result.put("status", 1);
		result.put("message", "保存成功！");
		return result;
	}

    @Override
    public JSONObject immediatelyTest(String testPaperId) {
        JSONObject result = new JSONObject();
        String beginDateStr = SystemTools.Time2String(new Date(), "yyyy-MM-dd 00:00:00");
        System.out.printf("当前设置的开始时间：" + beginDateStr);
        String endDateStr = SystemTools.Time2String(new Date(), "yyyy-MM-dd 23:59:59");
        System.out.printf("当前设置的结束时间：" + endDateStr);
        int flag = testPaperMapper.updateBeginDate(beginDateStr, endDateStr, testPaperId);
        if (flag == 1){
            result.put("status", 1);
            result.put("message", "设置成功，当前系统时间为" + SystemTools.Time2String(new Date()));
        }else {
            result.put("status", -1);
            result.put("message", "设置失败，当前系统时间为" + SystemTools.Time2String(new Date()));
        }
	    return result;
    }

    @Override
    public JSONObject stopTest(String testPaperId) {
        JSONObject result = new JSONObject();
        Date yesterday = SystemTools.subDay(new Date(), -1);
        String beginDateStr = SystemTools.Time2String(yesterday, "yyyy-MM-dd 00:00:00");
        System.out.printf("当前设置的开始时间：" + beginDateStr);
        String endDateStr = SystemTools.Time2String(yesterday, "yyyy-MM-dd 23:59:59");
        System.out.printf("当前设置的结束时间：" + endDateStr);
        int flag = testPaperMapper.updateBeginDate(beginDateStr, endDateStr, testPaperId);
        if (flag == 1){
            result.put("status", 1);
            result.put("message", "设置成功，当前系统时间为" + SystemTools.Time2String(new Date()));
        }else {
            result.put("status", -1);
            result.put("message", "设置失败，当前系统时间为" + SystemTools.Time2String(new Date()));
        }
        return result;
    }
}
