package com.police.testing.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.police.testing.dao.SysLoginLogMapper;
import com.police.testing.dao.TestingLogMapper;
import com.police.testing.pojo.StaticDataLogin;
import com.police.testing.pojo.StaticDataSimulateExam;
import com.police.testing.pojo.SysLoginLog;
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
	public List<StaticDataSimulateExam> staticDataSimulateExam(String beginDate, String endDate) {
		List<String> departmentNames = testingLogMapper.selectDistDepartmentName(beginDate, endDate);
		List<StaticDataSimulateExam> simulateExams = new ArrayList<>();
		for (String departmentName : departmentNames) {
			//按照部门获取模拟考试总数
			List<TestingLog> testingLogList = testingLogMapper.selectByDepartmentNameAndType(departmentName, "simulateExam", beginDate, endDate);
			Integer simulateCount = testingLogList.size();
			List<TestingLog> viewsExamsList = testingLogMapper.selectByDepartmentNameAndType(departmentName, "viewExam", beginDate, endDate);
			Integer viewsExamCount = viewsExamsList.size();
			StaticDataSimulateExam simulateExam = new StaticDataSimulateExam();
			simulateExam.setDepartmentName(departmentName);
			simulateExam.setSimulateExamCount(simulateCount);
			simulateExam.setViewExamCount(viewsExamCount);
			simulateExam.setSumCount(simulateCount + viewsExamCount);
			simulateExams.add(simulateExam);
		}
		// 按点击数倒序
        Collections.sort(simulateExams, new Comparator<StaticDataSimulateExam>() {
            public int compare(StaticDataSimulateExam arg0, StaticDataSimulateExam arg1) {
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
	public List<StaticDataSimulateExam> staticDataOfficialExam(String beginDate, String endDate) {
		
		return null;
	}

}

