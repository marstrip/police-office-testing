package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.UploadFileLog;

import net.sf.json.JSONObject;

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
	public List<UploadFileLog> getList(String beginDate, String endDate);
	
}
