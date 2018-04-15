package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.TestSelf;

/**
*@author created by answer
*@date 2018年4月14日-下午8:08:33
*
**/
public interface ITestSelfService {

	public Integer saveData(String testSelfName, String testSelfContent, String testSelfType, String testSelfLevel);
	
	public Integer updateData(String testSelfId, String testSelfName, String testSelfContent, String testSelfType, String testSelfLevel);
	
	public Integer deleteData(String testSelfId);
	
	public List<TestSelf> getList(String testSelfName);
}

