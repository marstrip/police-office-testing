package com.police.testing.service.impl;

import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.police.testing.dao.SysUserMapper;
import com.police.testing.dao.TestingLogMapper;
import com.police.testing.pojo.SysUser;
import com.police.testing.pojo.TestPaper;
import com.police.testing.pojo.TestingLog;
import com.police.testing.service.ITestingLogService;

/**
*@author created by answer
*@date 2018年5月14日-下午11:24:58
*
**/
@Component("testingLogService")
public class TestingLogServiceImpl implements ITestingLogService{
	
	@Autowired
	private TestingLogMapper testingLogMapper;
	@Autowired
	private SysUserMapper sysUserMapper;
	@Override
	public Integer saveTestingLog(String testingType) {
		//用户信息
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String userId = (String) session.getAttribute("currentUserId");
		SysUser user = sysUserMapper.findByLoginName(userId, "1");
		String departmentName = null;
		String departmentId = null;
		String userName = null;
		if(user != null){
			departmentName = user.getDepartmentName();
			departmentId = user.getDepartmentId();
			userName = user.getUserName();
		}
		TestingLog testingLog = new TestingLog();
		testingLog.setCreateDate(new Date());
		testingLog.setDepartmentId(departmentId);
		testingLog.setDepartmentName(departmentName);
		testingLog.setScore(0);
		testingLog.setTestingType(testingType);
//		TestPaper testPaper = testPaperMapper.selectByPrimaryKey(testPaperId);
//		String testPaperName = null;
//		if(testPaper != null){
//			testPaperName = testPaper.getTestPaperName();
//		}
//		testingLog.setTestPaperId(testPaperId);
//		testingLog.setTestPaperName(testPaperName);
		testingLog.setUserId(userId);
		testingLog.setUserName(userName);
		return testingLogMapper.insert(testingLog);
	}

}

