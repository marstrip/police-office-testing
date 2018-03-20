package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.PageHelper;
import com.police.testing.pojo.SysLoginLog;
import com.police.testing.pojo.User;

public interface ISysLogService {
	
	public void saveOperateLog(String dataName,String uuId, String operateType);
	/**
	 * 保存接口调用日志
	 * @param operateType
	 * @param sysName
	 * @param remark
	 * @param id
	 * @return
	 */
	public Integer saveInterfaceLog(String operateType, String sysName, String remark, String id);
	/**
	 * 获取日志个数
	 * @return
	 */
	public Integer getCountData(String beginDate, String endDate, 
			String userId, String organizationId, String departmentId, String operateType);
	/**
	 * 保存登录日志
	 * @param user
	 */
	public void saveLoginLog(User user);
	/**
	 * 获取登录日志个数
	 * @return
	 */
	public Long getLoginCount();
	/**
	 * 获取页面列表数据
	 * @param page
	 * @return
	 */
	public List<SysLoginLog> getLoginList(PageHelper page);
	/**
	 * 
	 * @param createDate
	 * @param fileName
	 * @return
	 */
	public String checkOperateRemark(String createDate, String fileName, String operateType);
}
