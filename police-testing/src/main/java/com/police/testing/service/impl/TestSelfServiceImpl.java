package com.police.testing.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.police.testing.dao.TestSelfMapper;
import com.police.testing.pojo.TestSelf;
import com.police.testing.service.ITestSelfService;

/**
*@author created by answer
*@date 2018年4月14日-下午8:11:25
*
**/
@Component("testSelfService")
public class TestSelfServiceImpl implements ITestSelfService{
	@Autowired
	private TestSelfMapper testSelfMapper;
	
	@Override
	public Integer saveData(String testSelfName, String testSelfContent, String testSelfType, String testSelfLevel) {
		// TODO Auto-generated method stub
		String testSelfId = "TS" + UUID.randomUUID().toString().replace("-", "");
		TestSelf self = new TestSelf();
		self.setTestSelfId(testSelfId);
		self.setTestSelfName(testSelfName);
		self.setTestSelfContent(testSelfContent);
		self.setTestSelfLevel(testSelfLevel);
		self.setTestSelfType(testSelfType);
		self.setCreateDate(new Date());
		self.setEnable("1");
		return testSelfMapper.insert(self);
	}

	@Override
	public Integer updateData(String testSelfId, String testSelfName, String testSelfContent, String testSelfType,
			String testSelfLevel) {
		// TODO Auto-generated method stub
		TestSelf self = testSelfMapper.selectByPrimaryKey(testSelfId);
		self.setTestSelfName(testSelfName);
		self.setTestSelfContent(testSelfContent);
		self.setTestSelfLevel(testSelfLevel);
		self.setTestSelfType(testSelfType);
		self.setUpdateDate(new Date());
		return testSelfMapper.updateByPrimaryKeySelective(self);
	}

	@Override
	public Integer deleteData(String testSelfId) {
		// TODO Auto-generated method stub
		TestSelf self = new TestSelf();
		self.setTestSelfId(testSelfId);
		self.setEnable("0");
		return testSelfMapper.updateByPrimaryKeySelective(self);
	}

	@Override
	public List<TestSelf> getList(String testSelfName, Integer offset, Integer limit) {
		return testSelfMapper.selectByLikeTestSelfName(testSelfName, offset, limit);
	}

	@Override
	public TestSelf getContentById(String testSelfId) {
		TestSelf testSelf = testSelfMapper.selectByPrimaryKey(testSelfId);
		return testSelf;
	}

	@Override
	public long getCount(String testSelfName) {
		List<TestSelf> selfs = testSelfMapper.selectByLikeTestSelfName(testSelfName, null, null);
		return selfs.size();
	}

}

