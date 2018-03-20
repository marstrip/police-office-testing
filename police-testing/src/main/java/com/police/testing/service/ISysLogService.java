package com.police.testing.service;

import com.police.testing.pojo.User;

public interface ISysLogService {
	/**
	 * 保存登录日志
	 * @param user
	 */
	public void saveLoginLog(User user);
}
