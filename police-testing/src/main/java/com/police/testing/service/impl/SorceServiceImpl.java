package com.police.testing.service.impl;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.police.testing.dao.TestingLogMapper;
import com.police.testing.pojo.TestingLog;
import com.police.testing.service.ISorceService;

/**
*@author created by answer
*@date 2018年5月5日-下午10:51:57
*
**/
@Component("sorceService")
public class SorceServiceImpl implements ISorceService{
	@Autowired
	private TestingLogMapper testingLogMapper;
	
	@Override
	public List<TestingLog> getSorcesByUserId(Integer offset, Integer limit) {
		//用户信息
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String userId = (String) session.getAttribute("currentUserId");
		List<TestingLog> testingLogs = testingLogMapper.selectByUserIdAndType(userId, "officalExam", offset, limit);
		return testingLogs;
	}

	@Override
	public long getCount() {
		//用户信息
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String userId = (String) session.getAttribute("currentUserId");
		List<TestingLog> testingLogs = testingLogMapper.selectByUserIdAndType(userId, "officalExam", null, null);
		return testingLogs.size();
	}
}

