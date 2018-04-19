package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.InformNotice;

/**
*@author created by answer
*@date 2018年4月19日-上午9:33:22
*
**/
public interface IIFormNoticeService {
	
	public Integer saveData(String informName, String informContent);
	
	public Integer updateData(String informId, String informName, String informContent);
	
	public Integer deleteData(String informId);
	
	public List<InformNotice> getList(String informName, Integer offset, Integer limit);
	
	public String getContentById(String informId);

	public long getCount(String inFormName);

}

