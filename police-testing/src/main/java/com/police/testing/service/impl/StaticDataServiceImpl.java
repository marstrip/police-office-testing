package com.police.testing.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.police.testing.dao.SysLoginLogMapper;
import com.police.testing.dao.TestPaperMapper;
import com.police.testing.dao.TestPaperQuestionMapper;
import com.police.testing.dao.TestQuestionMapper;
import com.police.testing.dao.TestingLogMapper;
import com.police.testing.pojo.StaticDataLogin;
import com.police.testing.pojo.StaticDataQusetion;
import com.police.testing.pojo.StaticDataTestPaper;
import com.police.testing.pojo.StaticDataExam;
import com.police.testing.pojo.SysLoginLog;
import com.police.testing.pojo.TestPaper;
import com.police.testing.pojo.TestQuestion;
import com.police.testing.pojo.TestQuestionWithBLOBs;
import com.police.testing.pojo.TestingLog;
import com.police.testing.service.IStaticDataService;

/**
*@author created by answer
*@date 2018年4月21日-上午12:46:43
*
**/
@Component("staticDataService")
public class StaticDataServiceImpl implements IStaticDataService{
	@Autowired
	private SysLoginLogMapper sysLoginLogMapper;
	@Autowired
	private TestingLogMapper testingLogMapper;
	@Autowired
	private TestPaperMapper testPaperMapper;
	@Autowired
	private TestQuestionMapper testQuestionMapper;
	@Autowired
	private TestPaperQuestionMapper testPaperQuestionMapper;
	
	@Override
	public List<StaticDataLogin> staticDataLogin(String beginDate, String endDate) {
		List<String> departmentNames = sysLoginLogMapper.selectDistDepartmentName(beginDate, endDate);
		List<StaticDataLogin> dataLogins = new ArrayList<>();
		for (String departmentName : departmentNames) {
			List<SysLoginLog> loginLogs = sysLoginLogMapper.selectByDepartmentName(departmentName, beginDate, endDate);
			Integer count = loginLogs.size();
			StaticDataLogin dataLogin = new StaticDataLogin();
			dataLogin.setDepartmentName(departmentName);
			dataLogin.setLoginCount(count);
			dataLogins.add(dataLogin);
		}
		// 按点击数倒序
        Collections.sort(dataLogins, new Comparator<StaticDataLogin>() {
            public int compare(StaticDataLogin arg0, StaticDataLogin arg1) {
                int hits0 = arg0.getLoginCount();
                int hits1 = arg1.getLoginCount();
                if (hits1 > hits0) {
                    return 1;
                } else if (hits1 == hits0) {
                    return 0;
                } else {
                    return -1;
                }
            }
        });
		return dataLogins;
	}

	@Override
	public List<StaticDataExam> staticDataSimulateExam(String beginDate, String endDate) {
		List<String> departmentNames = testingLogMapper.selectDistDepartmentName(beginDate, endDate);
		List<StaticDataExam> simulateExams = new ArrayList<>();
		for (String departmentName : departmentNames) {
			//按照部门获取模拟考试总数
			List<TestingLog> testingLogList = testingLogMapper.selectByDepartmentNameAndType(departmentName, "simulateExam", beginDate, endDate);
			Integer simulateCount = testingLogList.size();
			List<TestingLog> viewsExamsList = testingLogMapper.selectByDepartmentNameAndType(departmentName, "viewExam", beginDate, endDate);
			Integer viewsExamCount = viewsExamsList.size();
			StaticDataExam simulateExam = new StaticDataExam();
			simulateExam.setDepartmentName(departmentName);
			simulateExam.setSimulateExamCount(simulateCount);
			simulateExam.setViewExamCount(viewsExamCount);
			simulateExam.setSumCount(simulateCount + viewsExamCount);
			simulateExams.add(simulateExam);
		}
		// 按点击数倒序
        Collections.sort(simulateExams, new Comparator<StaticDataExam>() {
            public int compare(StaticDataExam arg0, StaticDataExam arg1) {
                int hits0 = arg0.getSumCount();
                int hits1 = arg1.getSumCount();
                if (hits1 > hits0) {
                    return 1;
                } else if (hits1 == hits0) {
                    return 0;
                } else {
                    return -1;
                }
            }
        });
		return simulateExams;
	}

	@Override
	public List<StaticDataExam> staticDataOfficialExam(String beginDate, String endDate) {
		List<String> departmentNames = testingLogMapper.selectDistDepartmentName(beginDate, endDate);
		List<StaticDataExam> simulateExams = new ArrayList<>();
		for (String departmentName : departmentNames) {
			//按照部门获取模拟考试总数
			List<TestingLog> officialList = testingLogMapper.selectByDepartmentNameAndType(departmentName, "officialExam", beginDate, endDate);
			Integer officialCount = officialList.size();
			StaticDataExam simulateExam = new StaticDataExam();
			simulateExam.setDepartmentName(departmentName);
			simulateExam.setOfficialCount(officialCount);
			simulateExams.add(simulateExam);
		}
		// 按点击数倒序
        Collections.sort(simulateExams, new Comparator<StaticDataExam>() {
            public int compare(StaticDataExam arg0, StaticDataExam arg1) {
                int hits0 = arg0.getOfficialCount();
                int hits1 = arg1.getOfficialCount();
                if (hits1 > hits0) {
                    return 1;
                } else if (hits1 == hits0) {
                    return 0;
                } else {
                    return -1;
                }
            }
        });
		return simulateExams;
	}

	@Override
	public List<StaticDataTestPaper> staticDataByTestingCountScore(String beginDate, String endDate, Integer score) {
		//从试卷表获取全部试卷
		List<TestPaper> testPapers = testPaperMapper.selectByTestPaperId(null);
		List<StaticDataTestPaper> dataTestPapers = new ArrayList<>();
		for (TestPaper testPaper : testPapers) {
			String testPaperId = testPaper.getTestPaperId();
			//按照部门获取模拟考试总数
			List<TestingLog> officialList = testingLogMapper.selectByTestPaperIdAndTypeAndSorce(testPaperId, "officialExam", beginDate, endDate, score);
			StaticDataTestPaper dataTestPaper = new StaticDataTestPaper();
			dataTestPaper.setOfficialCount(officialList.size());
			dataTestPaper.setTestPaperId(testPaperId);
			dataTestPaper.setTestPaperName(testPaper.getTestPaperName());
			dataTestPapers.add(dataTestPaper);
		}
		// 按点击数倒序
        Collections.sort(dataTestPapers, new Comparator<StaticDataTestPaper>() {
            public int compare(StaticDataTestPaper arg0, StaticDataTestPaper arg1) {
                int hits0 = arg0.getOfficialCount();
                int hits1 = arg1.getOfficialCount();
                if (hits1 > hits0) {
                    return 1;
                } else if (hits1 == hits0) {
                    return 0;
                } else {
                    return -1;
                }
            }
        });
		return dataTestPapers;
	}

	@Override
	public List<StaticDataQusetion> staticDataByQuestionFail(String answerType) {
		List<TestQuestionWithBLOBs> questions = testQuestionMapper.selectByTestQuestionIds(null);
		List<StaticDataQusetion> dataQusetions = new ArrayList<>();
		for (TestQuestionWithBLOBs testQuestion : questions) {
			String testQuestionId = testQuestion.getTestQuestionsId();
			Integer failCount = testPaperQuestionMapper.sumQuestionFailCount(testQuestionId);
			Integer rightCount = testPaperQuestionMapper.sumQuestionRightCount(testQuestionId);
			StaticDataQusetion dataQusetion = new StaticDataQusetion();
			dataQusetion.setFailCount(failCount);
			dataQusetion.setRightCount(rightCount);
			dataQusetion.setQuestionId(testQuestionId);
			dataQusetion.setQuestionName(testQuestion.getTestQuestionsName());
			dataQusetions.add(dataQusetion);
		}
		if(answerType.equals("right")){
			// 按点击数倒序
	        Collections.sort(dataQusetions, new Comparator<StaticDataQusetion>() {
	            public int compare(StaticDataQusetion arg0, StaticDataQusetion arg1) {
	                int hits0 = arg0.getRightCount();
	                int hits1 = arg1.getRightCount();
	                if (hits1 > hits0) {
	                    return 1;
	                } else if (hits1 == hits0) {
	                    return 0;
	                } else {
	                    return -1;
	                }
	            }
	        });
		}else if(answerType.equals("fail")){
			// 按点击数倒序
	        Collections.sort(dataQusetions, new Comparator<StaticDataQusetion>() {
	            public int compare(StaticDataQusetion arg0, StaticDataQusetion arg1) {
	                int hits0 = arg0.getFailCount();
	                int hits1 = arg1.getFailCount();
	                if (hits1 > hits0) {
	                    return 1;
	                } else if (hits1 == hits0) {
	                    return 0;
	                } else {
	                    return -1;
	                }
	            }
	        });
		}
		return dataQusetions;
	}
}

