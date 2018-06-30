package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.TestingLog;

/**
*@author created by answer
*@date 2018年5月14日-下午11:24:41
*
**/
public interface ITestingLogService {
	/**
	 * 保存非正式考试记录
	 * @param testingType
	 * @return
	 */
	public Integer saveTestingLog(String testingType);

	public Integer deleteData(String testPaperId);

	public List<TestingLog> getList(String caseName, Integer offset, Integer limit);

	public long getCount(String caseName);
}

