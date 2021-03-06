package com.police.testing.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.police.testing.dao.UploadFileLogMapper;
import com.police.testing.pojo.UploadFileLog;
import com.police.testing.service.IUploadLogService;

@Component("uploadLogService")
public class UploadLogServiceImpl implements IUploadLogService{
	@Autowired
	private UploadFileLogMapper uploadFileLogMapper;
	@Override
	public boolean isExistFileName(String fileName) {
		List<UploadFileLog> fileLogs = uploadFileLogMapper.selectByFileName(fileName);
		if(fileLogs.size() > 0){
			return true;
		}
		return false;
	}
	
	@Override
	public List<UploadFileLog> getList(String beginDate, String endDate, String fileName, Integer offset, Integer limit) {
		List<UploadFileLog> fileLogs = uploadFileLogMapper.selectByCreateDate(beginDate, endDate, fileName, offset, limit);
		return fileLogs;
	}

	@Override
	public long getCount(String beginDate, String endDate, String fileName) {
		List<UploadFileLog> fileLogs = uploadFileLogMapper.selectByCreateDate(beginDate, endDate, fileName, null, null);
		long total = fileLogs.size();
		return total;
	}

}
