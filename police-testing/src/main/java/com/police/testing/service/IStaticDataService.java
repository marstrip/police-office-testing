package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.StaticDataLogin;
import com.police.testing.pojo.StaticDataQusetion;
import com.police.testing.pojo.StaticDataTestPaper;
import com.police.testing.pojo.TestingLog;
import com.police.testing.pojo.StaticDataExam;

/**
*@author created by answer
*@date 2018年4月21日-上午12:42:55
*
**/
public interface IStaticDataService {

	public List<StaticDataLogin> staticDataLogin(String beginDate, String endDate, Integer offset, Integer limit);
	
	public List<StaticDataExam> staticDataSimulateExam(String beginDate, String endDate, Integer offset, Integer limit);

	public List<StaticDataExam> staticDataOfficialExam(String beginDate, String endDate, Integer offset, Integer limit);

	public List<StaticDataTestPaper> staticDataByTestingCountScore(String beginDate, String endDate, Integer score, Integer offset, Integer limit);

	public List<StaticDataQusetion> staticDataByQuestionFail(String answerType, Integer offset, Integer limit);

	public List<TestingLog> selectTestingLogsByTestId(String testPaperId, String testingType, String beginDate, String endDate);

	public long getCount(String beginDate, String endDate);

	public long staticDataSimulateExamGetCount(String beginDate, String endDate);

	public long TestingCountScoreGetCount();

	public long questionFailGetCount();
}

