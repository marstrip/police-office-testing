package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.QaSheet;
import com.police.testing.pojo.QaSheetWithBLOBs;

/**
*@author created by answer
*@date 2018年4月14日-下午2:01:09
*
**/
public interface IQaSheetService {
	
	public Integer saveData(String questionContent);
	
	public Integer updateData(String qaId, String questionContent, String questionAnswer, String qaStatus);
	
	public Integer deleteData(String qaId);
	
	public List<QaSheetWithBLOBs> getList(String questionContent);

	public QaSheetWithBLOBs getContentById(String qaId);
}

