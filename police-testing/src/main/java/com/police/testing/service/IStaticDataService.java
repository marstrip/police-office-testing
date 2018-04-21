package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.StaticDataLogin;
import com.police.testing.pojo.StaticDataQusetion;
import com.police.testing.pojo.StaticDataTestPaper;
import com.police.testing.pojo.StaticDataExam;

/**
*@author created by answer
*@date 2018年4月21日-上午12:42:55
*
**/
public interface IStaticDataService {

	public List<StaticDataLogin> staticDataLogin(String beginDate, String endDate);
	
	public List<StaticDataExam> staticDataSimulateExam(String beginDate, String endDate);

	public List<StaticDataExam> staticDataOfficialExam(String beginDate, String endDate);

	public List<StaticDataTestPaper> staticDataByTestingCountScore(String beginDate, String endDate, Integer score);

	public List<StaticDataQusetion> staticDataByQuestionFail(String answerType);
}

