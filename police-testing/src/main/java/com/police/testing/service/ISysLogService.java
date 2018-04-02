package com.police.testing.service;

import com.police.testing.pojo.SysUser;

public interface ISysLogService {
	/**
	 * 保存登录日志
	 * @param user
	 */
	public void saveLoginLog(SysUser user);
}
