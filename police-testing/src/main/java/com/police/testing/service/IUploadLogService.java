package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.UploadFileLog;


public interface IUploadLogService {
	/**
	 * 根据上传文件名称判断文件是否被上传过
	 * @param fileName
	 * @return
	 */
	public boolean isExistFileName(String fileName);
	
	/**
	 * 根据上传时间区间查询上传记录，可以为空
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	public List<UploadFileLog> getList(String beginDate, String endDate, 
			String fileName, Integer offset, Integer limit);
	/**
	 * 获取数据总数
	 * @param beginDate
	 * @param endDate
	 * @param fileName
	 * @return
	 */
	public long getCount(String beginDate, String endDate, String fileName);
}
