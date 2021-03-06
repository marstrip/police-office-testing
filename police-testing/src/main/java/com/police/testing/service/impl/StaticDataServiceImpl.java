package com.police.testing.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.police.testing.dao.SysLoginLogMapper;
import com.police.testing.dao.TestPaperMapper;
import com.police.testing.dao.TestQuestionMapper;
import com.police.testing.dao.TestingLogMapper;
import com.police.testing.pojo.StaticDataLogin;
import com.police.testing.pojo.StaticDataQusetion;
import com.police.testing.pojo.StaticDataTestPaper;
import com.police.testing.pojo.StaticDataExam;
import com.police.testing.pojo.SysLoginLog;
import com.police.testing.pojo.TestPaper;
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
	
	@Override
	public List<StaticDataLogin> staticDataLogin(String beginDate, String endDate, Integer offset, Integer limit) {
		List<String> departmentNames = sysLoginLogMapper.selectDistDepartmentName(beginDate, endDate, offset, limit);
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
	public long getCount(String beginDate, String endDate) {
		List<String> departmentNames = sysLoginLogMapper.selectDistDepartmentName(beginDate, endDate, null, null);
		return departmentNames.size();
	}
	
	@Override
	public List<StaticDataExam> staticDataSimulateExam(String beginDate, String endDate, Integer offset, Integer limit) {
		List<String> departmentNames = testingLogMapper.selectDistDepartmentName(beginDate, endDate, offset, limit, null);
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
	public long staticDataSimulateExamGetCount(String beginDate, String endDate) {
		List<String> departmentNames = testingLogMapper.selectDistDepartmentName(beginDate, endDate, null, null, null);
		return departmentNames.size();
	}
	@Override
	public List<StaticDataExam> staticDataOfficialExam(String beginDate, String endDate, Integer offset, Integer limit) {
		List<String> departmentNames = testingLogMapper.selectDistDepartmentName(beginDate, endDate, offset, limit, null);
		List<StaticDataExam> simulateExams = new ArrayList<>();
		for (String departmentName : departmentNames) {
			//按照部门获取模拟考试总数
			List<TestingLog> officialList = testingLogMapper.selectByDepartmentNameAndType(departmentName, "officalExam", beginDate, endDate);
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
	public List<StaticDataExam> staticDataOfficialExamAndPaperId(String testPaperId, Integer offset, Integer limit, Integer excellentSorce, Integer passSorce) {
		List<String> departmentNames = testingLogMapper.selectDistDepartmentName(null, null, offset, limit, testPaperId);
		List<StaticDataExam> simulateExams = new ArrayList<>();
		for (String departmentName : departmentNames) {
			//按照部门获取模拟考试总数
			List<TestingLog> officialList = testingLogMapper.selectByDepartmentTypeAndPaperId(departmentName, "officalExam", testPaperId);
			Integer officialCount = officialList.size();
			Integer excellentCount = 0;
			Integer passCount = 0;
			StaticDataExam simulateExam = new StaticDataExam();
			simulateExam.setDepartmentName(departmentName);
			simulateExam.setOfficialCount(officialCount);
			//计算优秀和及格人数
			for (TestingLog testingLog : officialList) {
				Integer score = testingLog.getScore();
				//优秀人数
				if(score >= excellentSorce){
					excellentCount ++;
				}
				if(score >= passSorce){
					passCount ++;
				}
			}
			simulateExam.setExcellentCount(excellentCount);
			simulateExam.setPassCount(passCount);
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
	public long staticDataSimulateExamPaperIdGetCount(String testPaperId) {
		List<String> departmentNames = testingLogMapper.selectDistDepartmentName(null, null, null, null, testPaperId);
		return departmentNames.size();
	}
	
	@Override
	public List<StaticDataTestPaper> staticDataByTestingCountScore(String testPaperId, String beginDate, String endDate, Integer score, Integer offset, Integer limit) {
//		List<TestPaper> testPapers = testPaperMapper.selectByTestPaperId(null, offset, limit);
		List<StaticDataTestPaper> dataTestPapers = new ArrayList<>();
		List<String> departmentNames = testingLogMapper.selectDistDepartmentName(beginDate, endDate, offset, limit, null);
		for (String departmentName : departmentNames) {
			//按照部门获取模拟考试总数
			List<TestingLog> officialList = testingLogMapper.selectByTestPaperIdAndTypeAndSorce(testPaperId, "officialExam", departmentName, beginDate, endDate, score);
			StaticDataTestPaper dataTestPaper = new StaticDataTestPaper();
			dataTestPaper.setOfficialCount(officialList.size());
			dataTestPaper.setTestPaperId(testPaperId);
			dataTestPaper.setDepartmentName(departmentName);
//			dataTestPaper.setTestPaperName(testPaper.getTestPaperName());
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
	public long TestingCountScoreGetCount() {
		//从试卷表获取全部试卷
		List<TestPaper> testPapers = testPaperMapper.selectByTestPaperId(null, null, null);
		return testPapers.size();
	}

	@Override
	public List<StaticDataQusetion> staticDataByQuestionFail(String answerType, Integer offset, Integer limit) {
	  List<StaticDataQusetion> dataQusetions = new ArrayList<>();
	  List<TestQuestionWithBLOBs> testQuestionWithBLOBs = testQuestionMapper.sumQuestionFailCount(offset,limit);
	  for (int i = 0; i < testQuestionWithBLOBs.size(); i++) {
		TestQuestionWithBLOBs testQuestion = testQuestionWithBLOBs.get(i);
		StaticDataQusetion staticDataQusetion = new StaticDataQusetion();
		staticDataQusetion.setFailCount(testQuestion.getFailCount());
		staticDataQusetion.setQuestionId(testQuestion.getTestQuestionsId());
		staticDataQusetion.setQuestionName(testQuestion.getTestQuestionsName());
		dataQusetions.add(staticDataQusetion);
	}
	  return dataQusetions;
	}

	@Override
	public List<TestingLog> selectTestingLogsByTestId(String testPaperId, String testingType, String beginDate, String endDate) {
		List<TestingLog> testingLogs = testingLogMapper.selectByTestPaperIdAndTypeAndSorce(testPaperId, testingType, null, beginDate, endDate, 0);
		return testingLogs;
	}


	@Override
	public long questionFailGetCount() {
		List<TestQuestionWithBLOBs> questions = testQuestionMapper.selectByTestQuestionIds(null, null, null);
		return questions.size();
	}

}

