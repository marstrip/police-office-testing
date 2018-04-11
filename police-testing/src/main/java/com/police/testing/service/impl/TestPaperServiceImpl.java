package com.police.testing.service.impl;


import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.police.testing.dao.TestPaperMapper;
import com.police.testing.dao.TestPaperQuestionMapper;
import com.police.testing.pojo.TestPaper;
import com.police.testing.pojo.TestPaperQuestion;
import com.police.testing.pojo.TestQuestionWithBLOBs;
import com.police.testing.service.ITestPaperService;
import com.police.testing.tools.SystemTools;

import net.sf.json.JSONObject;

@Component("testPaperService")
public class TestPaperServiceImpl implements ITestPaperService {
	@Autowired
	private TestPaperMapper testPaperMapper;
	@Autowired
	private TestPaperQuestionMapper testPaperQuestionMapper;

	@Override
	public List<TestPaper> getTestPaperList() {
		return testPaperMapper.selectByTestPaperId(null);
	}

	@Override
	public String createTempTestPaper(List<TestQuestionWithBLOBs> questionWithBLOBs, String testPaperType) {
		//生成试卷
		String testPaperId = UUID.randomUUID().toString();
		TestPaper testPaper = new TestPaper();
		testPaper.setTestPaperId(testPaperId);
		//待预览为0，生成为1
		testPaper.setTestPaperType(testPaperType);
		testPaper.setEnable("0");
		testPaperMapper.insert(testPaper);
		//生成试卷与试题对应关系
		for (int i = 0 ; i< questionWithBLOBs.size(); i++) {
			TestQuestionWithBLOBs testQuestionWithBLOBs = questionWithBLOBs.get(i);
			TestPaperQuestion testPaperQuestion = new TestPaperQuestion();
			testPaperQuestion.setTestPaperId(testPaperId);
			testPaperQuestion.setTestQuestionsId(testQuestionWithBLOBs.getTestQuestionsId());
			testPaperQuestion.setTestQuestionsNumber(i++);
			testPaperQuestionMapper.insert(testPaperQuestion);
		}
		return testPaperId;
	}

	@Override
	public JSONObject updateTestPaper(String testPaperId, String operateFlag, String testPaperName, String testDate, Integer testTime) {
		//获取用户信息
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String userId =(String)session.getAttribute("currentUser");
		String userName = (String)session.getAttribute("currentUserName");
		JSONObject result = new JSONObject();
		//判断操作状态
		if(operateFlag.equals("affirm")){//确认
			TestPaper testPaper = testPaperMapper.selectByPrimaryKey(testPaperId);
			testPaper.setTestPaperName(testPaperName);
			testPaper.setCreateDate(new Date());
			testPaper.setEnable("1");
			testPaper.setTestPaperType("1");
			testPaper.setCreatorId(userId);
			testPaper.setCreatorName(userName);
			testPaper.setTestDate(SystemTools.String2Date(testDate, "yyyy-MM-DD hh:mm:ss"));
			testPaper.setTestTime(testTime);
			testPaperMapper.updateByPrimaryKey(testPaper);
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

}
