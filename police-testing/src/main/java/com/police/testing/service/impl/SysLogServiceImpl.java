package com.police.testing.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.police.testing.dao.SysLoginLogMapper;
import com.police.testing.pojo.SysLoginLog;
import com.police.testing.pojo.User;
import com.police.testing.service.ISysLogService;

@Component("sysLogService")
public class SysLogServiceImpl implements ISysLogService{
	@Autowired
	private SysLoginLogMapper sysLoginLogMapper;
	
	 
	@Transactional
	public void saveLoginLog(User user) {
		SysLoginLog record = new SysLoginLog();
		record.setDepartmentId(user.getDepartmentId());
		record.setDepartmentName(user.getDepartmentName());
		record.setLoginTime(new Date());
		record.setOrganizationId(user.getOrganizationId());
		record.setOrganizationName(user.getOrganizationName());
		record.setUserMail(user.getLoginName());
		record.setUserName(user.getUserName());
		record.setUserStatus(user.getUserStatus());
		sysLoginLogMapper.insert(record);
	}

}
