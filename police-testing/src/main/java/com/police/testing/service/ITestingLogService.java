package com.police.testing.service;
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
}

