package com.police.testing.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.police.testing.dao.SysLoginLogMapper;
import com.police.testing.pojo.StaticDataLogin;
import com.police.testing.pojo.SysLoginLog;
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
		return dataLogins;
	}

}

